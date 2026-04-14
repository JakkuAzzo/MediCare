//
//  User.swift
//  MediCareApp
//
//  User model for authentication and profile
//

import Foundation

struct User: Codable, Identifiable {
    let id: String
    let name: String
    let email: String
    let role: String  // user, admin, staff, guest
    let createdAt: Date
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case email
        case role
        case createdAt
    }
}

struct LoginRequest: Codable {
    let email: String
    let password: String
}

struct SignupRequest: Codable {
    let name: String
    let email: String
    let password: String
    let role: String
}

struct AuthResponse: Codable {
    let success: Bool
    let user: User?
    let token: String?
    let message: String?
}

struct LoginResponse: Codable {
    let token: String
    let user: User
}
