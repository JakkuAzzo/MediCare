//
//  ProfileView.swift
//  MediCareApp
//
//  User profile view
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @State private var showAlert = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Avatar
                VStack(spacing: 12) {
                    Image(systemName: "person.circle.fill")
                        .font(.system(size: 64))
                        .foregroundColor(AppTheme.primary)
                    
                    Text(authViewModel.currentUser?.name ?? "User")
                        .font(AppFonts.title2)
                        .foregroundColor(AppTheme.darkBackground)
                    
                    Text(authViewModel.currentUser?.email ?? "")
                        .font(AppFonts.subheadline)
                        .foregroundColor(AppTheme.muted)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.white)
                .cornerRadius(12)
                
                // Profile Details
                VStack(alignment: .leading, spacing: 16) {
                    DetailRow(label: "Role", value: authViewModel.currentUser?.role.capitalized ?? "N/A")
                    Divider()
                    DetailRow(label: "Account Status", value: "Active")
                }
                .padding()
                .background(Color.white)
                .cornerRadius(12)
                
                // Actions
                VStack(spacing: 12) {
                    /*
                    Button(action: {}) {
                        HStack {
                            Image(systemName: "key.fill")
                            Text("Change Password")
                            Spacer()
                            Image(systemName: "chevron.right")
                                .font(.caption)
                        }
                        .padding()
                        .background(AppTheme.lightBackground)
                        .foregroundColor(AppTheme.darkBackground)
                        .cornerRadius(8)
                    }
                    */
                    
                    Button(action: {
                        showAlert = true
                    }) {
                        HStack {
                            Image(systemName: "arrow.right.square.fill")
                            Text("Logout")
                            Spacer()
                            Image(systemName: "chevron.right")
                                .font(.caption)
                        }
                        .padding()
                        .background(Color(AppTheme.danger).opacity(0.1))
                        .foregroundColor(AppTheme.danger)
                        .cornerRadius(8)
                    }
                    .alert("Logout", isPresented: $showAlert) {
                        Button("Cancel", role: .cancel) { }
                        Button("Logout", role: .destructive) {
                            authViewModel.logout()
                        }
                    } message: {
                        Text("Are you sure you want to logout?")
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(12)
                
                Spacer()
            }
            .padding()
            .background(AppTheme.lightBackground)
            .navigationTitle("Profile")
        }
    }
}

#Preview {
    ProfileView()
        .environmentObject(AuthViewModel())
}
