# MediCare iOS App

A SwiftUI-based iOS application for travel vaccination management, built to match the web application design system.

## Features

- **Authentication**: Login and signup functionality
- **Dashboard**: Quick overview of appointments, patients, clinics, and vaccines
- **Appointments**: Schedule, view, and manage appointments
- **Patients**: Add and manage patient information
- **Vaccines**: Browse available vaccines
- **Profile**: User profile and account management

## Design System

### Colors
- **Primary**: #3498db (Blue)
- **Primary Dark**: #2980b9
- **Dark Background**: #2c3e50
- **Success**: #2ecc71 (Green)
- **Danger**: #e74c3c (Red)
- **Warning**: #f1c40f (Yellow)
- **Light Background**: #f5f5f5
- **Neutral**: #95a5a6

### Typography
- Uses system fonts (San Francisco) for consistency with iOS
- Headlines: Semibold weights
- Body text: Regular weights

## Project Structure

```
MediCareApp/
├── MediCareAppApp.swift          # App entry point
├── Theme/
│   └── AppTheme.swift            # Design system (colors, fonts)
├── Services/
│   └── APIService.swift          # API communication & models
├── ViewModels/
│   └── AuthViewModel.swift       # Authentication state
├── Views/
│   ├── Authentication/
│   │   ├── LoginView.swift
│   │   └── SignupView.swift
│   ├── Dashboard/
│   │   └── DashboardView.swift
│   ├── Appointments/
│   │   └── AppointmentsListView.swift
│   ├── Patients/
│   │   └── PatientsListView.swift
│   ├── Vaccines/
│   │   └── VaccinesListView.swift
│   ├── Profile/
│   │   └── ProfileView.swift
│   ├── Forms/
│   │   ├── AppointmentFormView.swift
│   │   └── PatientFormView.swift
│   ├── Components/
│   │   ├── FormField.swift
│   │   └── StatusBadge.swift
│   └── MainTabView.swift         # Main navigation
└── Info.plist                    # App configuration
```

## Getting Started

### Prerequisites
- Xcode 13 or later
- iOS 14.0 or later
- Swift 5.5+

### Installation

1. Open the project in Xcode
2. Update the API base URL in `Services/APIService.swift`:
   ```swift
   private let baseURL = "http://your-backend-url:3000"
   ```
3. Build and run the app on a simulator or device

### Configuration

#### API Endpoint
Update the base URL in `APIService.swift` to point to your backend server:

```swift
private let baseURL = "http://localhost:3000" // Update for production
```

#### Deployment
For production deployment:
- Update the API URL to use HTTPS
- Configure proper security policies
- Update bundle identifier and signing certificates

## API Integration

The app uses `Combine` and `URLSession` to communicate with the backend. All API requests go through the `APIService` singleton.

### Authentication Flow
1. User logs in with email/password
2. Backend returns JWT token
3. Token is stored in UserDefaults
4. Token is sent with all subsequent requests via Authorization header

### Available Endpoints

- **POST** `/auth/login` - User login
- **POST** `/auth/signup` - User registration
- **POST** `/auth/logout` - User logout
- **GET** `/appointments` - List appointments
- **POST** `/appointments` - Create appointment
- **PUT** `/appointments/:id` - Update appointment
- **DELETE** `/appointments/:id` - Delete appointment
- **GET** `/patients` - List patients
- **POST** `/patients` - Create patient
- **PUT** `/patients/:id` - Update patient
- **DELETE** `/patients/:id` - Delete patient
- **GET** `/vaccines` - List vaccines
- **POST** `/vaccines` - Create vaccine
- **PUT** `/vaccines/:id` - Update vaccine
- **DELETE** `/vaccines/:id` - Delete vaccine
- **GET** `/clinics` - List clinics
- **POST** `/clinics` - Create clinic
- **PUT** `/clinics/:id` - Update clinic
- **DELETE** `/clinics/:id` - Delete clinic

## Features to Implement

- [ ] Real API integration for all operations
- [ ] Search and filtering functionality
- [ ] Push notifications for appointments
- [ ] Offline support with local caching
- [ ] Map integration for clinic locations
- [ ] Document/report generation
- [ ] Multi-language support
- [ ] Dark mode support

## Development

### Adding a New View
1. Create a new file in the appropriate Views subdirectory
2. Use the `AppTheme` for consistent styling
3. Use `FormField` component for form inputs
4. Use `StatusBadge` for status indicators

### Adding API Endpoints
1. Add models in `APIService.swift`
2. Add request method in `APIService` class
3. Use `@Published` properties in ViewModels
4. Call from views using the ViewModel

## Testing

Currently implements mock data. To test with real API:
1. Update backend URL
2. Ensure backend is running
3. Use real credentials to test authentication
4. Replace mock data calls with actual API calls

## Known Issues

- Mock data is being used - replace with real API calls
- Date components need proper formatting
- Need to implement proper error handling and user feedback

## Future Improvements

- Implement caching for better performance
- Add animated transitions
- Create custom app icons and launch screen
- Add support for biometric authentication
- Implement dark mode
- Add localization support
- Create iPad-specific layouts

## License

Copyright 2026 MediCare. All rights reserved.

## Support

For issues or questions, please contact the development team.
