//
//  LoginView.swift
//  MediCareApp
//
//  User login screen
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @State private var email = ""
    @State private var password = ""
    @State private var showPassword = false
    
    var body: some View {
        ZStack {
            AppTheme.loginGradient
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                VStack(spacing: 20) {
                    // Logo/Title
                    VStack(spacing: 8) {
                        Image(systemName: "heart.circle.fill")
                            .font(.system(size: 48))
                            .foregroundColor(AppTheme.primary)
                        
                        Text("MediCare")
                            .font(AppFonts.title1)
                            .foregroundColor(AppTheme.darkBackground)
                        
                        Text("Travel Vaccination Management")
                            .font(AppFonts.caption1)
                            .foregroundColor(AppTheme.muted)
                    }
                    .padding(.bottom, 20)
                    
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
                    
                    // Email Field
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Email")
                            .font(AppFonts.caption1)
                            .foregroundColor(AppTheme.muted)
                        
                        TextField("your@email.com", text: $email)
                            .textInputAutocapitalization(.never)
                            .disableAutocorrection(true)
                            .padding(12)
                            .background(Color.white)
                            .cornerRadius(8)
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(AppTheme.border, lineWidth: 1))
                    }
                    
                    // Password Field
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Password")
                            .font(AppFonts.caption1)
                            .foregroundColor(AppTheme.muted)
                        
                        HStack {
                            if showPassword {
                                TextField("Password", text: $password)
                                    .textInputAutocapitalization(.never)
                                    .disableAutocorrection(true)
                            } else {
                                SecureField("Password", text: $password)
                            }
                            
                            Button(action: { showPassword.toggle() }) {
                                Image(systemName: showPassword ? "eye.slash" : "eye")
                                    .foregroundColor(AppTheme.muted)
                            }
                        }
                        .padding(12)
                        .background(Color.white)
                        .cornerRadius(8)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(AppTheme.border, lineWidth: 1))
                    }
                    
                    // Login Button
                    Button(action: {
                        authViewModel.login(email: email, password: password)
                    }) {
                        if authViewModel.isLoading {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        } else {
                            Text("Sign In")
                                .font(AppFonts.headline)
                                .foregroundColor(.white)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(12)
                    .background(AppTheme.primary)
                    .cornerRadius(8)
                    .disabled(authViewModel.isLoading || email.isEmpty || password.isEmpty)
                    
                    // Signup Link
                    NavigationLink(destination: SignupView()) {
                        Text("Don't have an account? Sign up")
                            .font(AppFonts.footnote)
                            .foregroundColor(.white)
                            .underline()
                    }
                }
                .padding(24)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 8)
                .padding(20)
                
                Spacer()
            }
        }
        .navigationViewStyle(.stack)
    }
}

#Preview {
    NavigationView {
        LoginView()
            .environmentObject(AuthViewModel())
    }
}
