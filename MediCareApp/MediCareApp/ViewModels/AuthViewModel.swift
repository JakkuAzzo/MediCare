//
//  AuthViewModel.swift
//  MediCareApp
//
//  Manages authentication state and user session
//

import Foundation
import Combine

class AuthViewModel: ObservableObject {
    @Published var isAuthenticated = false
    @Published var currentUser: User?
    @Published var errorMessage: String?
    @Published var isLoading = false
    
    private var cancellables = Set<AnyCancellable>()
    private let apiService = APIService.shared
    private let userDefaults = UserDefaults.standard
    
    init() {
        checkAuthStatus()
    }
    
    func login(email: String, password: String) {
        isLoading = true
        errorMessage = nil
        
        apiService.login(email: email, password: password)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] completion in
                    self?.isLoading = false
                    if case .failure(let error) = completion {
                        self?.errorMessage = error.localizedDescription
                    }
                },
                receiveValue: { [weak self] response in
                    self?.userDefaults.set(response.token, forKey: "authToken")
                    self?.currentUser = response.user
                    self?.isAuthenticated = true
                }
            )
            .store(in: &cancellables)
    }
    
    func signup(name: String, email: String, password: String, role: String = "user") {
        isLoading = true
        errorMessage = nil
        
        let signupRequest = SignupRequest(name: name, email: email, password: password, role: role)
        
        apiService.signup(userData: signupRequest)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] completion in
                    self?.isLoading = false
                    if case .failure(let error) = completion {
                        self?.errorMessage = error.localizedDescription
                    }
                },
                receiveValue: { [weak self] response in
                    if response.success {
                        self?.errorMessage = nil
                        // Automatically log in after signup
                        self?.login(email: email, password: password)
                    }
                }
            )
            .store(in: &cancellables)
    }
    
    func logout() {
        apiService.logout()
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { [weak self] in
                    self?.userDefaults.removeObject(forKey: "authToken")
                    self?.currentUser = nil
                    self?.isAuthenticated = false
                }
            )
            .store(in: &cancellables)
    }
    
    private func checkAuthStatus() {
        if let token = userDefaults.string(forKey: "authToken") {
            // Could verify token with backend here
            isAuthenticated = true
        } else {
            isAuthenticated = false
        }
    }
}
