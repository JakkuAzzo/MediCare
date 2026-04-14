//
//  MediCareAppApp.swift
//  MediCareApp
//
//  Main application entry point
//

import SwiftUI

@main
struct MediCareAppApp: App {
    @StateObject var authViewModel = AuthViewModel()
    
    var body: some Scene {
        WindowGroup {
            if authViewModel.isAuthenticated {
                MainTabView()
                    .environmentObject(authViewModel)
            } else {
                LoginView()
                    .environmentObject(authViewModel)
            }
        }
    }
}
