//
//  MainTabView.swift
//  MediCareApp
//
//  Main navigation with tabs for the app
//

import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            // Dashboard
            DashboardView()
                .tabItem {
                    Label("Dashboard", systemImage: "house.fill")
                }
                .tag(0)
            
            // Appointments
            AppointmentsListView()
                .tabItem {
                    Label("Appointments", systemImage: "calendar")
                }
                .tag(1)
            
            // Patients
            PatientsListView()
                .tabItem {
                    Label("Patients", systemImage: "person.2.fill")
                }
                .tag(2)
            
            // Vaccines
            VaccinesListView()
                .tabItem {
                    Label("Vaccines", systemImage: "heart.fill")
                }
                .tag(3)
            
            // Profile
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
                .tag(4)
        }
        .accentColor(AppTheme.primary)
    }
}

#Preview {
    MainTabView()
        .environmentObject(AuthViewModel())
}
