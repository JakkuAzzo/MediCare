# Travel Jabs Frontend

A React-based frontend for the Travel Jabs vaccination management system. This application provides user interfaces for managing clinics, patients, appointments, vaccines, and staff.

## Project Structure

```
src/
  assets/              - Static assets (images, icons, etc.)
  components/
    common/            - Reusable UI components (buttons, badges, messages)
    layout/            - Layout components (Navbar, Layout wrapper)
    forms/             - Form components (PatientForm, AppointmentForm, etc.)
    tables/            - Table components for displaying data
  pages/               - Page components (Dashboard, Clinics, Patients, etc.)
  services/            - API service layer (clinicService, patientService, etc.)
  data/                - Mock data for development
  utils/               - Utility functions
  App.jsx              - Main app routing configuration
  main.jsx             - React entry point with Router setup
  index.css            - Global styles
```

## Getting Started

### Prerequisites

- Node.js (v16 or higher)
- npm or yarn

### Installation

1. Install dependencies:

```bash
npm install
```

2. Start the development server:

```bash
npm run dev
```

The application will open at `http://localhost:5173`.

### Build for Production

```bash
npm run build
```

### Format Code

```bash
npm run format
```

## Features Implemented

### Pages

- **Dashboard** - Overview and navigation hub
- **Clinics** - View and search clinics
- **Patients** - Create, read, update, delete patient records
- **Appointments** - Schedule and manage appointments
- **Vaccines** - Manage vaccine information
- **Staff** - View staff members
- **Login** - Authentication placeholder
- **404 NotFound** - Error page

### Components

#### Common Components
- `LoadingMessage` - Loading indicator
- `ErrorMessage` - Error display
- `SearchBar` - Search functionality
- `SortSelect` - Sorting dropdown
- `DeleteButton` - Deletion action
- `StatusBadge` - Status indicator

#### Forms
- `PatientForm` - Create/edit patients
- `AppointmentForm` - Create/edit appointments
- `VaccineForm` - Create/edit vaccines

#### Tables
- `ClinicTable` - Display clinics
- `PatientTable` - Display patients
- `AppointmentTable` - Display appointments
- `VaccineTable` - Display vaccines
- `StaffTable` - Display staff

### API Endpoints (Service Layer)

The application includes service files that support the following operations:

#### Clinics
- GET `/api/clinics` - List all clinics
- GET `/api/clinics/:id` - Get clinic details
- POST `/api/clinics` - Create clinic
- PUT `/api/clinics/:id` - Update clinic
- DELETE `/api/clinics/:id` - Delete clinic

#### Patients
- GET `/api/patients` - List all patients
- GET `/api/patients/:id` - Get patient details
- POST `/api/patients` - Create patient
- PUT `/api/patients/:id` - Update patient
- DELETE `/api/patients/:id` - Delete patient

#### Appointments
- GET `/api/appointments` - List all appointments
- GET `/api/appointments/:id` - Get appointment details
- POST `/api/appointments` - Create appointment
- PUT `/api/appointments/:id` - Reschedule appointment
- DELETE `/api/appointments/:id` - Cancel appointment

#### Vaccines
- GET `/api/vaccines` - List all vaccines
- GET `/api/vaccines/:id` - Get vaccine details
- POST `/api/vaccines` - Add vaccine
- PUT `/api/vaccines/:id` - Update vaccine
- DELETE `/api/vaccines/:id` - Delete vaccine

#### Staff
- GET `/api/staff` - List all staff
- GET `/api/staff/:id` - Get staff details
- POST `/api/staff` - Add staff member
- PUT `/api/staff/:id` - Update staff member
- DELETE `/api/staff/:id` - Delete staff member

## Development

### Routing

All routes are configured in `App.jsx` using React Router v6:

- `/` - Dashboard
- `/clinics` - Clinics list
- `/patients` - Patients list
- `/patients/new` - Create patient
- `/patients/:id/edit` - Edit patient
- `/appointments` - Appointments list
- `/appointments/new` - Schedule appointment
- `/appointments/:id/edit` - Reschedule appointment
- `/vaccines` - Vaccines list
- `/vaccines/new` - Add vaccine
- `/vaccines/:id/edit` - Edit vaccine
- `/staff` - Staff list
- `/login` - Login page

### Using Mock Data

During development, if the API is unavailable, the service files can be configured to return mock data from the `src/data/` directory:

```javascript
// Example: patientService.js
import patients from "../data/patients";

export async function getPatients() {
  return Promise.resolve(patients);
}
```

To switch between real API and mock data, update the service implementations.

## Styling

Global styles are defined in `src/index.css` and include:

- Typography
- Navigation bar styling
- Button styles
- Form styles
- Table styles
- Status messages (loading, error, success)
- Responsive design utilities

### Color Scheme

- Primary: `#3498db` (Blue)
- Danger: `#e74c3c` (Red)
- Background: `#f5f5f5` (Light Gray)
- Text: `#333` (Dark Gray)

## Code Quality

### Prettier

The project uses Prettier for code formatting with the following configuration:

- Semicolons enabled
- Double quotes for strings
- No trailing commas

Run formatting with: `npm run format`

## User Stories Covered

### Phase 1 - Foundation
- As a Patient, I want to search for clinics
- As a Manager, I want to create patient accounts
- As a Manager, I want to edit patient information
- As a Manager, I want to delete patient accounts

### Phase 2 - Appointments & Vaccines
- As a Patient, I want to book appointments
- As a Manager, I want to reschedule appointments
- As a Manager, I want to cancel appointments
- As a Manager, I want to manage vaccines

### Phase 3 - Staff Management
- As a Clinician, I want to view assigned appointments
- As a Manager, I want to manage staff information

## Technology Stack

- **React** 18.2.0 - UI library
- **Vite** 5.0+ - Build tool and dev server
- **React Router DOM** 6.20+ - Client-side routing
- **Fetch API** - HTTP requests (built-in browser API)
- **Prettier** 3.1+ - Code formatter

## Future Enhancements

- [ ] Authentication system
- [ ] Protected routes
- [ ] Advanced search/filtering
- [ ] Appointment reminders
- [ ] Staff availability calendar
- [ ] Vaccination history tracking
- [ ] Reporting and analytics
- [ ] Multi-language support
- [ ] Accessibility improvements

## GitHub

Repository: `travelJabs-frontend`

Make sure to:
1. Keep the repository private
2. Add `G.Jones@kingston.ac.uk` as a collaborator
3. Regular commits with clear messages
4. Follow the branch naming conventions

## Contact

For questions or issues, refer to the Travel Jabs API documentation or contact the development team.
