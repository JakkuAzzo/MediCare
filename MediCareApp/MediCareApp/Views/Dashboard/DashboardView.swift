//
//  DashboardView.swift
//  MediCareApp
//
//  Main dashboard with overview information
//

import SwiftUI

struct DashboardView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                VStack(alignment: .leading, spacing: 8) {
                    Text("Welcome back!")
                        .font(AppFonts.headline)
                        .foregroundColor(AppTheme.muted)
                    
                    Text(authViewModel.currentUser?.name ?? "User")
                        .font(AppFonts.title2)
                        .foregroundColor(AppTheme.darkBackground)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(AppTheme.primary)
                .foregroundColor(.white)
                
                ScrollView {
                    VStack(spacing: 16) {
                        // Quick Stats
                        HStack(spacing: 12) {
                            StatCard(
                                title: "Appointments",
                                value: "12",
                                icon: "calendar",
                                color: AppTheme.primary
                            )
                            
                            StatCard(
                                title: "Patients",
                                value: "28",
                                icon: "person.2",
                                color: AppTheme.success
                            )
                        }
                        
                        HStack(spacing: 12) {
                            StatCard(
                                title: "Clinics",
                                value: "5",
                                icon: "cross.circle",
                                color: AppTheme.warning
                            )
                            
                            StatCard(
                                title: "Vaccines",
                                value: "15",
                                icon: "heart.circle",
                                color: AppTheme.danger
                            )
                        }
                        
                        Divider()
                            .padding(.vertical, 8)
                        
                        // Quick Actions
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Quick Actions")
                                .font(AppFonts.headline)
                                .foregroundColor(AppTheme.darkBackground)
                            
                            NavigationLink(destination: AppointmentFormView()) {
                                HStack {
                                    Image(systemName: "plus.circle")
                                        .foregroundColor(AppTheme.primary)
                                    Text("Schedule Appointment")
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .font(.caption)
                                }
                                .padding()
                                .background(AppTheme.lightBackground)
                                .cornerRadius(8)
                                .foregroundColor(AppTheme.darkBackground)
                            }
                            
                            NavigationLink(destination: PatientFormView()) {
                                HStack {
                                    Image(systemName: "person.badge.plus")
                                        .foregroundColor(AppTheme.success)
                                    Text("Add Patient")
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .font(.caption)
                                }
                                .padding()
                                .background(AppTheme.lightBackground)
                                .cornerRadius(8)
                                .foregroundColor(AppTheme.darkBackground)
                            }
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        
                        Spacer()
                    }
                    .padding()
                }
            }
            .navigationTitle("Dashboard")
        }
    }
}

struct StatCard: View {
    let title: String
    let value: String
    let icon: String
    let color: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: icon)
                    .font(.title2)
                    .foregroundColor(color)
                Spacer()
            }
            
            Text(value)
                .font(AppFonts.title2)
                .foregroundColor(AppTheme.darkBackground)
            
            Text(title)
                .font(AppFonts.caption1)
                .foregroundColor(AppTheme.muted)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 2)
    }
}

#Preview {
    DashboardView()
        .environmentObject(AuthViewModel())
}
