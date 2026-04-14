//
//  AppointmentsListView.swift
//  MediCareApp
//
//  List of appointments
//

import SwiftUI

struct AppointmentsListView: View {
    @State private var appointments: [Appointment] = []
    @State private var isLoading = false
    @State private var errorMessage: String?
    
    var body: some View {
        NavigationView {
            VStack {
                if isLoading {
                    ProgressView()
                } else if let error = errorMessage {
                    VStack(spacing: 12) {
                        Image(systemName: "exclamationmark.circle.fill")
                            .font(.title)
                            .foregroundColor(AppTheme.danger)
                        Text(error)
                            .foregroundColor(AppTheme.muted)
                    }
                    .frame(maxHeight: .infinity, alignment: .center)
                } else if appointments.isEmpty {
                    VStack(spacing: 12) {
                        Image(systemName: "calendar")
                            .font(.system(size: 48))
                            .foregroundColor(AppTheme.muted)
                        Text("No appointments")
                            .font(AppFonts.headline)
                            .foregroundColor(AppTheme.muted)
                        NavigationLink(destination: AppointmentFormView()) {
                            Text("Schedule One")
                                .font(AppFonts.footnote)
                                .foregroundColor(AppTheme.primary)
                        }
                    }
                    .frame(maxHeight: .infinity, alignment: .center)
                } else {
                    List {
                        ForEach(appointments) { appointment in
                            NavigationLink(destination: AppointmentDetailView(appointment: appointment)) {
                                AppointmentRow(appointment: appointment)
                            }
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Appointments")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: AppointmentFormView(), label: {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(AppTheme.primary)
                    })
                }
            }
            .onAppear {
                fetchAppointments()
            }
        }
    }
    
    private func fetchAppointments() {
        isLoading = true
        // Add API call here
        // For now, using mock data
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            isLoading = false
        }
    }
}

struct AppointmentRow: View {
    let appointment: Appointment
    
    var statusColor: Color {
        switch appointment.status.lowercased() {
        case "completed":
            return AppTheme.success
        case "scheduled":
            return AppTheme.primary
        case "cancelled":
            return AppTheme.danger
        default:
            return AppTheme.muted
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Appointment")
                        .font(AppFonts.caption1)
                        .foregroundColor(AppTheme.muted)
                    Text(appointment.appointmentDate)
                        .font(AppFonts.headline)
                        .foregroundColor(AppTheme.darkBackground)
                }
                Spacer()
                StatusBadge(status: appointment.status, color: statusColor)
            }
        }
        .padding(.vertical, 8)
    }
}

struct AppointmentDetailView: View {
    let appointment: Appointment
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Button(action: { presentationMode.wrappedValue.dismiss() }) {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("Back")
                    }
                    .foregroundColor(AppTheme.primary)
                }
                Spacer()
            }
            
            VStack(alignment: .leading, spacing: 12) {
                DetailRow(label: "Date", value: appointment.appointmentDate)
                DetailRow(label: "Status", value: appointment.status)
                DetailRow(label: "Patient ID", value: appointment.patientId)
                DetailRow(label: "Clinic ID", value: appointment.clinicId)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(8)
            
            Spacer()
        }
        .padding()
        .background(AppTheme.lightBackground)
        .navigationBarHidden(true)
    }
}

struct DetailRow: View {
    let label: String
    let value: String
    
    var body: some View {
        HStack {
            Text(label)
                .font(AppFonts.caption1)
                .foregroundColor(AppTheme.muted)
            Spacer()
            Text(value)
                .font(AppFonts.footnote)
                .foregroundColor(AppTheme.darkBackground)
        }
    }
}

#Preview {
    AppointmentsListView()
}
