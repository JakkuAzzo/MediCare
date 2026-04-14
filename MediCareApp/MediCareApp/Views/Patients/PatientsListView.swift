//
//  PatientsListView.swift
//  MediCareApp
//
//  List of patients
//

import SwiftUI

struct PatientsListView: View {
    @State private var patients: [Patient] = []
    @State private var isLoading = false
    
    var body: some View {
        NavigationView {
            ZStack {
                if isLoading {
                    ProgressView()
                } else if patients.isEmpty {
                    VStack(spacing: 12) {
                        Image(systemName: "person.2")
                            .font(.system(size: 48))
                            .foregroundColor(AppTheme.muted)
                        Text("No patients")
                            .font(AppFonts.headline)
                            .foregroundColor(AppTheme.muted)
                        NavigationLink(destination: PatientFormView()) {
                            Text("Add One")
                                .font(AppFonts.footnote)
                                .foregroundColor(AppTheme.primary)
                        }
                    }
                } else {
                    List(patients) { patient in
                        NavigationLink(destination: PatientDetailView(patient: patient)) {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("\(patient.firstName) \(patient.lastName)")
                                    .font(AppFonts.headline)
                                    .foregroundColor(AppTheme.darkBackground)
                                Text(patient.email)
                                    .font(AppFonts.caption1)
                                    .foregroundColor(AppTheme.muted)
                            }
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Patients")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: PatientFormView(), label: {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(AppTheme.primary)
                    })
                }
            }
            .onAppear { fetchPatients() }
        }
    }
    
    private func fetchPatients() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            isLoading = false
        }
    }
}

struct PatientDetailView: View {
    let patient: Patient
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
                DetailRow(label: "First Name", value: patient.firstName)
                DetailRow(label: "Last Name", value: patient.lastName)
                DetailRow(label: "Email", value: patient.email)
                DetailRow(label: "Phone", value: patient.phone)
                DetailRow(label: "DOB", value: patient.dateOfBirth)
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

#Preview {
    PatientsListView()
}
