//
//  APIService.swift
//  MediCareApp
//
//  Handles all API requests to the backend
//

import Foundation
import Combine

class APIService {
    static let shared = APIService()
    
    // Update this to match your backend URL
    private let baseURL = "http://localhost:3000" // Change for production
    
    private init() {}
    
    // MARK: - Authentication
    
    func login(email: String, password: String) -> AnyPublisher<LoginResponse, APIError> {
        let endpoint = "\(baseURL)/auth/login"
        let loginRequest = LoginRequest(email: email, password: password)
        
        return request(endpoint, method: "POST", body: loginRequest)
    }
    
    func signup(userData: SignupRequest) -> AnyPublisher<SignupResponse, APIError> {
        let endpoint = "\(baseURL)/auth/signup"
        return request(endpoint, method: "POST", body: userData)
    }
    
    func logout() -> AnyPublisher<Void, APIError> {
        let endpoint = "\(baseURL)/auth/logout"
        let publisher: AnyPublisher<EmptyResponse, APIError> = request(endpoint, method: "POST", body: EmptyRequest())
        return publisher
            .map { _ in }
            .eraseToAnyPublisher()
    }
    
    // MARK: - Clinics
    
    func fetchClinics() -> AnyPublisher<[Clinic], APIError> {
        let endpoint = "\(baseURL)/clinics"
        return request(endpoint, method: "GET")
    }
    
    func createClinic(_ clinic: CreateClinicRequest) -> AnyPublisher<Clinic, APIError> {
        let endpoint = "\(baseURL)/clinics"
        return request(endpoint, method: "POST", body: clinic)
    }
    
    func updateClinic(_ id: String, _ clinic: CreateClinicRequest) -> AnyPublisher<Clinic, APIError> {
        let endpoint = "\(baseURL)/clinics/\(id)"
        return request(endpoint, method: "PUT", body: clinic)
    }
    
    func deleteClinic(_ id: String) -> AnyPublisher<Void, APIError> {
        let endpoint = "\(baseURL)/clinics/\(id)"
        let publisher: AnyPublisher<EmptyResponse, APIError> = request(endpoint, method: "DELETE", body: EmptyRequest())
        return publisher
            .map { _ in }
            .eraseToAnyPublisher()
    }
    
    // MARK: - Patients
    
    func fetchPatients() -> AnyPublisher<[Patient], APIError> {
        let endpoint = "\(baseURL)/patients"
        return request(endpoint, method: "GET")
    }
    
    func createPatient(_ patient: CreatePatientRequest) -> AnyPublisher<Patient, APIError> {
        let endpoint = "\(baseURL)/patients"
        return request(endpoint, method: "POST", body: patient)
    }
    
    func updatePatient(_ id: String, _ patient: CreatePatientRequest) -> AnyPublisher<Patient, APIError> {
        let endpoint = "\(baseURL)/patients/\(id)"
        return request(endpoint, method: "PUT", body: patient)
    }
    
    func deletePatient(_ id: String) -> AnyPublisher<Void, APIError> {
        let endpoint = "\(baseURL)/patients/\(id)"
        let publisher: AnyPublisher<EmptyResponse, APIError> = request(endpoint, method: "DELETE", body: EmptyRequest())
        return publisher
            .map { _ in }
            .eraseToAnyPublisher()
    }
    
    // MARK: - Appointments
    
    func fetchAppointments() -> AnyPublisher<[Appointment], APIError> {
        let endpoint = "\(baseURL)/appointments"
        return request(endpoint, method: "GET")
    }
    
    func createAppointment(_ appointment: CreateAppointmentRequest) -> AnyPublisher<Appointment, APIError> {
        let endpoint = "\(baseURL)/appointments"
        return request(endpoint, method: "POST", body: appointment)
    }
    
    func updateAppointment(_ id: String, _ appointment: CreateAppointmentRequest) -> AnyPublisher<Appointment, APIError> {
        let endpoint = "\(baseURL)/appointments/\(id)"
        return request(endpoint, method: "PUT", body: appointment)
    }
    
    func deleteAppointment(_ id: String) -> AnyPublisher<Void, APIError> {
        let endpoint = "\(baseURL)/appointments/\(id)"
        let publisher: AnyPublisher<EmptyResponse, APIError> = request(endpoint, method: "DELETE", body: EmptyRequest())
        return publisher
            .map { _ in }
            .eraseToAnyPublisher()
    }
    
    // MARK: - Vaccines
    
    func fetchVaccines() -> AnyPublisher<[Vaccine], APIError> {
        let endpoint = "\(baseURL)/vaccines"
        return request(endpoint, method: "GET")
    }
    
    func createVaccine(_ vaccine: CreateVaccineRequest) -> AnyPublisher<Vaccine, APIError> {
        let endpoint = "\(baseURL)/vaccines"
        return request(endpoint, method: "POST", body: vaccine)
    }
    
    func updateVaccine(_ id: String, _ vaccine: CreateVaccineRequest) -> AnyPublisher<Vaccine, APIError> {
        let endpoint = "\(baseURL)/vaccines/\(id)"
        return request(endpoint, method: "PUT", body: vaccine)
    }
    
    func deleteVaccine(_ id: String) -> AnyPublisher<Void, APIError> {
        let endpoint = "\(baseURL)/vaccines/\(id)"
        let publisher: AnyPublisher<EmptyResponse, APIError> = request(endpoint, method: "DELETE", body: EmptyRequest())
        return publisher
            .map { _ in }
            .eraseToAnyPublisher()
    }
    
    // MARK: - Generic Request Method
    
    private func request<T: Decodable>(_ urlString: String, method: String, body: Encodable? = nil) -> AnyPublisher<T, APIError> {
        guard let url = URL(string: urlString) else {
            return Fail(error: APIError.invalidURL).eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Add token if available
        if let token = UserDefaults.standard.string(forKey: "authToken") {
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        
        if let body = body {
            do {
                request.httpBody = try JSONEncoder().encode(body)
            } catch {
                return Fail(error: APIError.encodingError).eraseToAnyPublisher()
            }
        }
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw APIError.invalidResponse
                }
                
                guard (200...299).contains(httpResponse.statusCode) else {
                    throw APIError.httpError(httpResponse.statusCode)
                }
                
                do {
                    return try JSONDecoder().decode(T.self, from: data)
                } catch {
                    throw APIError.decodingError
                }
            }
            .mapError { error in
                if let apiError = error as? APIError {
                    return apiError
                }
                return APIError.networkError(error)
            }
            .eraseToAnyPublisher()
    }
}

// MARK: - API Models

enum APIError: LocalizedError {
    case invalidURL
    case invalidResponse
    case httpError(Int)
    case encodingError
    case decodingError
    case networkError(Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .invalidResponse:
            return "Invalid response from server"
        case .httpError(let statusCode):
            return "HTTP Error: \(statusCode)"
        case .encodingError:
            return "Failed to encode request"
        case .decodingError:
            return "Failed to decode response"
        case .networkError(let error):
            return "Network error: \(error.localizedDescription)"
        }
    }
}

// MARK: - Request/Response Models

struct LoginRequest: Codable {
    let email: String
    let password: String
}

struct LoginResponse: Codable {
    let token: String
    let user: User
}

struct SignupRequest: Codable {
    let name: String
    let email: String
    let password: String
    let role: String
}

struct SignupResponse: Codable {
    let success: Bool
    let message: String
}

struct User: Codable, Identifiable {
    let id: String
    let name: String
    let email: String
    let role: String
}

struct Clinic: Codable, Identifiable {
    let id: String
    let name: String
    let address: String
    let phone: String
    let email: String
}

struct CreateClinicRequest: Codable {
    let name: String
    let address: String
    let phone: String
    let email: String
}

struct Patient: Codable, Identifiable {
    let id: String
    let firstName: String
    let lastName: String
    let dateOfBirth: String
    let email: String
    let phone: String
}

struct CreatePatientRequest: Codable {
    let firstName: String
    let lastName: String
    let dateOfBirth: String
    let email: String
    let phone: String
}

struct Appointment: Codable, Identifiable {
    let id: String
    let patientId: String
    let clinicId: String
    let vaccineId: String
    let appointmentDate: String
    let status: String
}

struct CreateAppointmentRequest: Codable {
    let patientId: String
    let clinicId: String
    let vaccineId: String
    let appointmentDate: String
    let status: String
}

struct Vaccine: Codable, Identifiable {
    let id: String
    let name: String
    let description: String
    let manufacturer: String
    let dosingSchedule: String
}

struct CreateVaccineRequest: Codable {
    let name: String
    let description: String
    let manufacturer: String
    let dosingSchedule: String
}

struct EmptyResponse: Codable {}

struct EmptyRequest: Codable {}
