//
//  VaccinesListView.swift
//  MediCareApp
//
//  List of vaccines
//

import SwiftUI

struct VaccinesListView: View {
    @State private var vaccines: [Vaccine] = []
    @State private var isLoading = false
    
    var body: some View {
        NavigationView {
            ZStack {
                if isLoading {
                    ProgressView()
                } else if vaccines.isEmpty {
                    VStack(spacing: 12) {
                        Image(systemName: "heart.fill")
                            .font(.system(size: 48))
                            .foregroundColor(AppTheme.muted)
                        Text("No vaccines")
                            .font(AppFonts.headline)
                            .foregroundColor(AppTheme.muted)
                    }
                } else {
                    List(vaccines) { vaccine in
                        NavigationLink(destination: VaccineDetailView(vaccine: vaccine)) {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(vaccine.name)
                                    .font(AppFonts.headline)
                                    .foregroundColor(AppTheme.darkBackground)
                                Text(vaccine.manufacturer)
                                    .font(AppFonts.caption1)
                                    .foregroundColor(AppTheme.muted)
                            }
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Vaccines")
            .onAppear { fetchVaccines() }
        }
    }
    
    private func fetchVaccines() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            isLoading = false
        }
    }
}

struct VaccineDetailView: View {
    let vaccine: Vaccine
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
                DetailRow(label: "Name", value: vaccine.name)
                DetailRow(label: "Manufacturer", value: vaccine.manufacturer)
                DetailRow(label: "Dosing Schedule", value: vaccine.dosingSchedule)
                Text("Description")
                    .font(AppFonts.caption1)
                    .foregroundColor(AppTheme.muted)
                Text(vaccine.description)
                    .font(AppFonts.body)
                    .foregroundColor(AppTheme.darkBackground)
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
    VaccinesListView()
}
