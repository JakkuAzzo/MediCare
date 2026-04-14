//
//  AppTheme.swift
//  MediCareApp
//
//  Color scheme matching the web app
//

import SwiftUI

struct AppTheme {
    // Primary Colors
    static let primary = Color(red: 52/255, green: 152/255, blue: 219/255) // #3498db
    static let primaryDark = Color(red: 41/255, green: 128/255, blue: 185/255) // #2980b9
    
    // Dark Colors
    static let darkBackground = Color(red: 44/255, green: 62/255, blue: 80/255) // #2c3e50
    static let darkText = Color(red: 51/255, green: 51/255, blue: 51/255) // #333
    
    // Light Colors
    static let lightBackground = Color(red: 245/255, green: 245/255, blue: 245/255) // #f5f5f5
    static let lightText = Color(red: 236/255, green: 240/255, blue: 241/255) // #ecf0f1
    
    // Status Colors
    static let success = Color(red: 46/255, green: 204/255, blue: 113/255) // #2ecc71
    static let successLight = Color(red: 213/255, green: 244/255, blue: 230/255) // #d5f4e6
    static let danger = Color(red: 231/255, green: 76/255, blue: 60/255) // #e74c3c
    static let warning = Color(red: 241/255, green: 196/255, blue: 15/255) // #f1c40f
    static let info = Color(red: 52/255, green: 152/255, blue: 219/255) // #3498db
    
    // Neutral Colors
    static let neutral = Color(red: 149/255, green: 165/255, blue: 166/255) // #95a5a6
    static let border = Color(red: 236/255, green: 240/255, blue: 241/255) // #ecf0f1
    static let muted = Color(red: 127/255, green: 140/255, blue: 141/255) // #7f8c8d
    
    // Gradient
    static let loginGradient = LinearGradient(
        gradient: Gradient(colors: [
            Color(red: 102/255, green: 126/255, blue: 234/255), // #667eea
            Color(red: 118/255, green: 75/255, blue: 162/255) // #764ba2
        ]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}

struct AppFonts {
    static let largeTitle = Font.system(size: 32, weight: .bold)
    static let title1 = Font.system(size: 28, weight: .bold)
    static let title2 = Font.system(size: 22, weight: .bold)
    static let title3 = Font.system(size: 20, weight: .semibold)
    static let headline = Font.system(size: 17, weight: .semibold)
    static let body = Font.system(size: 17, weight: .regular)
    static let callout = Font.system(size: 16, weight: .regular)
    static let subheadline = Font.system(size: 15, weight: .regular)
    static let footnote = Font.system(size: 13, weight: .regular)
    static let caption1 = Font.system(size: 12, weight: .regular)
    static let caption2 = Font.system(size: 11, weight: .regular)
}
