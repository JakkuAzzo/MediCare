//
//  SignupView.swift
//  MediCareApp
//
//  User registration screen
//

import SwiftUI

struct SignupView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var authViewModel: AuthViewModel
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var showPassword = false
    @State private var role = "user"
    
    let roles = ["user", "admin", "staff"]
    
    var isFormValid: Bool {
        !name.isEmpty && !email.isEmpty && !password.isEmpty &&
        password == confirmPassword && password.count >= 6
    }
    
    var body: some View {
        ZStack {
            AppTheme.lightBackground
                .ignoresSafeArea()
            
            VStack {
                // Header
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
                        // Title
                        VStack(spacing: 8) {
                            Text("Create Account")
                                .font(AppFonts.title2)
                                .foregroundColor(AppTheme.darkBackground)
                            
                            Text("Join MediCare today")
                                .font(AppFonts.subheadline)
                                .foregroundColor(AppTheme.muted)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        // Error Message
                        if let error = authViewModel.errorMessage {
                            HStack {
                                Image(systemName: "exclamationmark.circle.fill")
                                Text(error)
                            }
                            .foregroundColor(.white)
                            .padding()
                            .background(AppTheme.danger)
                            .cornerRadius(8)
                        }
                        
                        // Name Field
                        FormField(label: "Full Name", placeholder: "John Doe", text: $name)
                        
                        // Email Field
                        FormField(label: "Email", placeholder: "your@email.com", text: $email)
                            .textInputAutocapitalization(.never)
                            .disableAutocorrection(true)
                        
                        // Role Selection
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Role")
                                .font(AppFonts.caption1)
                                .foregroundColor(AppTheme.muted)
                            
                            Picker("Role", selection: $role) {
                                ForEach(roles, id: \.self) { role in
                                    Text(role.capitalized).tag(role)
                                }
                            }
                            .pickerStyle(.segmented)
                        }
                        
                        // Password Field
                        FormField(label: "Password", placeholder: "Enter password", text: $password, isSecure: true)
                        
                        // Confirm Password Field
                        FormField(label: "Confirm Password", placeholder: "Confirm password", text: $confirmPassword, isSecure: true)
                        
                        // Password Requirements
                        if password.count > 0 && password.count < 6 {
                            HStack(spacing: 8) {
                                Image(systemName: "exclamationmark.circle.fill")
                                    .foregroundColor(AppTheme.warning)
                                Text("Password must be at least 6 characters")
                                    .font(AppFonts.footnote)
                                    .foregroundColor(AppTheme.warning)
                            }
                            .padding()
                                    .background(AppTheme.warning.opacity(0.1))
                            .cornerRadius(8)
                        }
                        
                        if password != confirmPassword && !confirmPassword.isEmpty {
                            HStack(spacing: 8) {
                                Image(systemName: "exclamationmark.circle.fill")
                                    .foregroundColor(AppTheme.danger)
                                Text("Passwords do not match")
                                    .font(AppFonts.footnote)
                                    .foregroundColor(AppTheme.danger)
                            }
                            .padding()
                                    .background(AppTheme.danger.opacity(0.1))
                            .cornerRadius(8)
                        }
                        
                        // Signup Button
                        Button(action: {
                            authViewModel.signup(name: name, email: email, password: password, role: role)
                        }) {
                            if authViewModel.isLoading {
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                            } else {
                                Text("Create Account")
                                    .font(AppFonts.headline)
                                    .foregroundColor(.white)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding(12)
                        .background(AppTheme.primary)
                        .cornerRadius(8)
                        .disabled(!isFormValid || authViewModel.isLoading)
                        .opacity(isFormValid ? 1 : 0.6)
                    }
                    .padding(20)
                }
            }
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.white)
                    .shadow(radius: 4)
                    .padding()
            )
        }
    }
}

#Preview {
    NavigationView {
        SignupView()
            .environmentObject(AuthViewModel())
    }
}
