//
//  PatientFormView.swift
//  MediCareApp
//
//  Form to create and edit patients
//

import SwiftUI

struct PatientFormView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var phone = ""
    @State private var dateOfBirth = Date()
    @State private var showDatePicker = false
    @State private var isSaving = false
    @State private var errorMessage: String?
    
    var isFormValid: Bool {
        !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty && !phone.isEmpty
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
                    Text("Add Patient")
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
                    
                    FormField(label: "First Name", placeholder: "John", text: $firstName)
                    FormField(label: "Last Name", placeholder: "Doe", text: $lastName)
                    FormField(label: "Email", placeholder: "john@example.com", text: $email, keyboardType: .emailAddress)
                    FormField(label: "Phone", placeholder: "+1 (555) 000-0000", text: $phone, keyboardType: .phonePad)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Date of Birth")
                            .font(AppFonts.caption1)
                            .foregroundColor(AppTheme.muted)
                        
                        Button(action: { showDatePicker.toggle() }) {
                            HStack {
                                Image(systemName: "calendar")
                                    .foregroundColor(AppTheme.primary)
                                Text(DateFormatter.localizedString(from: dateOfBirth, dateStyle: .medium, timeStyle: .none))
                                Spacer()
                            }
                            .padding(12)
                            .background(Color.white)
                            .cornerRadius(8)
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(AppTheme.border, lineWidth: 1))
                            .foregroundColor(AppTheme.darkBackground)
                        }
                        
                        if showDatePicker {
                            DatePicker("Select Date", selection: $dateOfBirth, displayedComponents: [.date])
                                .datePickerStyle(.graphical)
                                .padding()
                                .background(AppTheme.lightBackground)
                                .cornerRadius(8)
                        }
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
                            Text("Add Patient")
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
    PatientFormView()
}
