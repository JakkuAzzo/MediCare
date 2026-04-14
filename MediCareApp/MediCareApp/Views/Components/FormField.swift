//
//  FormField.swift
//  MediCareApp
//
//  Reusable form field component
//

import SwiftUI

struct FormField: View {
    let label: String
    let placeholder: String
    @Binding var text: String
    var isSecure: Bool = false
    var keyboardType: UIKeyboardType = .default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(label)
                .font(AppFonts.caption1)
                .foregroundColor(AppTheme.muted)
            
            if isSecure {
                SecureField(placeholder, text: $text)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .padding(12)
                    .background(Color.white)
                    .cornerRadius(8)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(AppTheme.border, lineWidth: 1))
            } else {
                TextField(placeholder, text: $text)
                    .keyboardType(keyboardType)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .padding(12)
                    .background(Color.white)
                    .cornerRadius(8)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(AppTheme.border, lineWidth: 1))
            }
        }
    }
}

#Preview {
    VStack {
        FormField(label: "Email", placeholder: "your@email.com", text: .constant(""))
        FormField(label: "Password", placeholder: "Enter password", text: .constant(""), isSecure: true)
    }
    .padding()
}
