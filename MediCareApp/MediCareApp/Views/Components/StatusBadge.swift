//
//  StatusBadge.swift
//  MediCareApp
//
//  Reusable status badge component
//

import SwiftUI

struct StatusBadge: View {
    let status: String
    let color: Color
    
    var body: some View {
        Text(status.capitalized)
            .font(AppFonts.caption2)
            .foregroundColor(color)
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(color.opacity(0.15))
            .cornerRadius(12)
    }
}

#Preview {
    HStack(spacing: 12) {
        StatusBadge(status: "scheduled", color: AppTheme.primary)
        StatusBadge(status: "completed", color: AppTheme.success)
        StatusBadge(status: "cancelled", color: AppTheme.danger)
    }
    .padding()
}
