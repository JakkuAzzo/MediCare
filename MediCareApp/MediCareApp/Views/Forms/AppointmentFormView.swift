//
//  AppointmentFormView.swift
//  MediCareApp
//
//  Form to create and edit appointments
//

import SwiftUI

struct AppointmentFormView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var patientId = ""
    @State private var clinicId = ""
    @State private var vaccineId = ""
    @State private var appointmentDate = Date()
    @State private var status = "scheduled"
    @State private var showDatePicker = false
    @State private var isSaving = false
    @State private var errorMessage: String?
    
    var isFormValid: Bool {
        !patientId.isEmpty && !clinicId.isEmpty && !vaccineId.isEmpty
    }
    
    var body: some View {
        VStack {
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
            .padding()
            
            ScrollView {
                VStack(spacing: 20) {
                    Text("Create Appointment")
                        .font(AppFonts.title2)
                        .foregroundColor(AppTheme.darkBackground)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    if let error = errorMessage {
                        HStack {
                            Image(systemName: "exclamationmark.circle.fill")
                            Text(error)
                        }
                        .foregroundColor(.white)
                        .padding()
                        .background(AppTheme.danger)
                        .cornerRadius(8)
                    }
                    
                    FormField(label: "Patient ID", placeholder: "Enter patient ID", text: $patientId)
                    FormField(label: "Clinic ID", placeholder: "Enter clinic ID", text: $clinicId)
                    FormField(label: "Vaccine ID", placeholder: "Enter vaccine ID", text: $vaccineId)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Appointment Date")
                            .font(AppFonts.caption1)
                            .foregroundColor(AppTheme.muted)
                        
                        Button(action: { showDatePicker.toggle() }) {
                            HStack {
                                Image(systemName: "calendar")
                                    .foregroundColor(AppTheme.primary)
                                Text(DateFormatter.localizedString(from: appointmentDate, dateStyle: .medium, timeStyle: .short))
                                Spacer()
                            }
                            .padding(12)
                            .background(Color.white)
                            .cornerRadius(8)
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(AppTheme.border, lineWidth: 1))
                            .foregroundColor(AppTheme.darkBackground)
                        }
                        
                        if showDatePicker {
                            DatePicker("Select Date", selection: $appointmentDate, displayedComponents: [.date, .hourAndMinute])
                                .datePickerStyle(.graphical)
                                .padding()
                                .background(AppTheme.lightBackground)
                                .cornerRadius(8)
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Status")
                            .font(AppFonts.caption1)
                            .foregroundColor(AppTheme.muted)
                        
                        Picker("Status", selection: $status) {
                            Text("Scheduled").tag("scheduled")
                            Text("Completed").tag("completed")
                            Text("Cancelled").tag("cancelled")
                        }
                        .pickerStyle(.segmented)
                    }
                    
                    Button(action: {
                        isSaving = true
                        // Add API call here
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            isSaving = false
                            presentationMode.wrappedValue.dismiss()
                        }
                    }) {
                        if isSaving {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        } else {
                            Text("Create Appointment")
                                .font(AppFonts.headline)
                                .foregroundColor(.white)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(12)
                    .background(AppTheme.primary)
                    .cornerRadius(8)
                    .disabled(!isFormValid || isSaving)
                    .opacity(isFormValid ? 1 : 0.6)
                }
                .padding(20)
            }
        }
        .background(AppTheme.lightBackground)
        .navigationBarHidden(true)
    }
}

#Preview {
    AppointmentFormView()
}
