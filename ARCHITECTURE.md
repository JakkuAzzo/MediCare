# Travel Jabs Frontend-Backend Architecture & Quick Reference

## System Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                    TRAVEL JABS FRONTEND                      │
│                  (React + Vite + React Router)               │
├─────────────────────────────────────────────────────────────┤
│                                                               │
│  ┌─────────────────────────┐      ┌──────────────────────┐   │
│  │  AuthContext            │      │  Route Protection    │   │
│  │  - login()              │      │  - ProtectedRoute    │   │
│  │  - logout()             │      │  - useAuth hook      │   │
│  │  - user state           │      │  - redirects         │   │
│  └─────────────────────────┘      └──────────────────────┘   │
│                │                           │                  │
│                └────────────┬───────────────┘                  │
│                             │                                  │
│  ┌──────────────────────────▼─────────┐                       │
│  │      Pages (11 components)          │                       │
│  │  - Dashboard, Clinics, Patients,    │                       │
│  │  - Appointments, Vaccines, Staff    │                       │
│  │  - Forms for create/edit            │                       │
│  └──────────────────────────┬─────────┘                       │
│                             │                                  │
│  ┌──────────────────────────▼─────────┐                       │
│  │   Service Layer (APIcalls)          │                       │
│  │  - clinicService.js                 │                       │
│  │  - patientService.js                │                       │
│  │  - appointmentService.js            │                       │
│  │  - vaccineService.js                │                       │
│  │  - staffService.js                  │                       │
│  │                                     │                       │
│  │  All include:                       │                       │
│  │  - getAuthHeaders() for JWT tokens  │                       │
│  │  - Error handling (401, 403, 500)   │                       │
│  │  - Consistent error messages        │                       │
│  └──────────────────────────┬─────────┘                       │
│                             │                                  │
│  ┌──────────────────────────▼─────────┐                       │
│  │      API Configuration              │                       │
│  │  (src/config/api.js)                │                       │
│  │                                     │                       │
│  │  BASE_URL:                          │                       │
│  │  - Dev: http://localhost:3000/api   │                       │
│  │  - Prod: https://api.traveljabs.com │                       │
│  └──────────────────────────┬─────────┘                       │
│                             │                                  │
└─────────────────────────────┼──────────────────────────────────┘
                              │
                    ┌─────────▼────────┐
                    │   HTTPS/CORS     │
                    │   Bearer Token   │
                    │   in Headers     │
                    └─────────┬────────┘
                              │
┌─────────────────────────────▼──────────────────────────────────┐
│                  TRAVEL JABS BACKEND API                       │
│                  (Node.js + Express + MySQL)                   │
├──────────────────────────────────────────────────────────────┤
│                                                                │
│  ┌─────────────────────────┐     ┌──────────────────────────┐ │
│  │  Auth Routes            │     │  Entity Routes           │ │
│  │  POST   /auth/login     │     │  GET    /clinics         │ │
│  │  POST   /auth/logout    │     │  POST   /clinics         │ │
│  │  GET    /auth/me        │     │  PUT    /clinics/:id     │ │
│  │  POST   /auth/register  │     │  DELETE /clinics/:id     │ │
│  └─────────────────────────┘     │                          │ │
│                                  │  [+ similar for:         │ │
│                                  │   patients, appointments, │ │
│                                  │   vaccines, staff ]      │ │
│                                  └──────────────────────────┘ │
│                                                                │
│  ┌──────────────────────────────────────────────────────────┐ │
│  │  Database Connection & Models                             │ │
│  │  - Patient Model      (PatientID, PatientFirstname, ...)  │ │
│  │  - Clinic Model       (ClinicID, ClinicName, ...)        │ │
│  │  - Appointment Model  (AppointmentID, ...)               │ │
│  │  - Vaccine Model      (VaccineID, VaccineName, ...)      │ │
│  │  - Staff Model        (StaffID, StaffRole, ...)          │ │
│  │  - User Model         (UserID, Email, Password hash)      │ │
│  └──────────────────────────────────────────────────────────┘ │
│                                                                │
│  ┌──────────────────────────────────────────────────────────┐ │
│  │  MySQL Database                                           │ │
│  │  - Stores all patient, clinic, appointment data           │ │
│  └──────────────────────────────────────────────────────────┘ │
│                                                                │
└────────────────────────────────────────────────────────────────┘
```

---

## Data Flow Examples

### Login Flow

```
User inputs credentials
     ↓
LoginForm.handleSubmit()
     ↓
AuthContext.login(email, password)
     ↓
POST /api/auth/login {email, password}
     ↓
Backend verifies credentials
     ↓
Returns {token, user}
     ↓
Frontend stores token in localStorage
     ↓
AuthContext updates user state
     ↓
ProtectedRoute allows access to app
     ↓
User redirected to Dashboard
```

### List Patients Flow

```
User navigates to /patients
     ↓
PatientsPage renders
     ↓
useEffect calls loadPatients()
     ↓
patientService.getPatients()
     ↓
GET /api/patients (with Bearer token in header)
     ↓
Backend queries MySQL
     ↓
Returns array of patient objects
     ↓
Frontend updates state: setPatients(data)
     ↓
PatientTable component receives data
     ↓
Renders <tr> for each patient
```

### Create Patient Flow

```
User navigates to /patients/new
     ↓
PatientFormPage renders with mode="create"
     ↓
User fills form: firstName, lastName, age, etc.
     ↓
User clicks Save button
     ↓
PatientForm.handleSubmit(formData)
     ↓
Validates data locally
     ↓
patientService.createPatient(formData)
     ↓
POST /api/patients {PatientFirstname, PatientLastname, ...}
     ↓
Backend validates & inserts into MySQL
     ↓
Returns created patient object with PatientID
     ↓
Frontend navigates to /patients
     ↓
Page reloads list showing new patient
```

### Delete Patient Flow

```
User clicks Delete button on row
     ↓
PatientTable.onDelete(patientId)
     ↓
Browser shows confirm dialog
     ↓
User confirms
     ↓
patientService.deletePatient(patientId)
     ↓
DELETE /api/patients/:id (with Bearer token)
     ↓
Backend deletes from MySQL
     ↓
Returns 200 OK response
     ↓
Frontend removes from state: setPatients(filtered)
     ↓
Table updates and patient row disappears
```

---

## Field Mapping Reference

### Clinics

| Frontend | Backend       | Type   | Required |
| -------- | ------------- | ------ | -------- |
| id       | ClinicID      | number | ✓        |
| name     | ClinicName    | string | ✓        |
| location | ClinicAddress | string | ✓        |
| phone    | ClinicPhone   | string |          |
| email    | ClinicEmail   | string |          |

### Patients

| Frontend  | Backend          | Type   | Required |
| --------- | ---------------- | ------ | -------- |
| id        | PatientID        | number | ✓        |
| firstName | PatientFirstname | string | ✓        |
| lastName  | PatientLastname  | string | ✓        |
| address   | PatientAddress   | string |          |
| postcode  | PatientPostcode  | string |          |
| age       | Patientage       | number |          |

### Appointments

| Frontend  | Backend              | Type     | Required |
| --------- | -------------------- | -------- | -------- |
| id        | AppointmentID        | number   | ✓        |
| dateTime  | AppointmentDatetime  | datetime | ✓        |
| patientId | AppointmentPatientID | number   | ✓        |
| clinicId  | AppointmentClinicID  | number   | ✓        |
| staffId   | AppointmentStaffID   | number   |          |
| statusId  | AppointmentStatusID  | number   |          |

### Vaccines

| Frontend | Backend     | Type    | Required |
| -------- | ----------- | ------- | -------- |
| id       | VaccineID   | number  | ✓        |
| name     | VaccineName | string  | ✓        |
| cost     | VaccineCost | decimal |          |

### Staff

| Frontend  | Backend        | Type   | Required |
| --------- | -------------- | ------ | -------- |
| id        | StaffID        | number | ✓        |
| firstName | StaffFirstname | string | ✓        |
| lastName  | StaffLastname  | string | ✓        |
| role      | StaffRole      | string |          |

---

## API Endpoint Reference

### Authentication Endpoints

```
POST   /api/auth/login
  Request: {email, password}
  Response: {token, user: {id, email, name}}

POST   /api/auth/logout
  Headers: Authorization: Bearer {token}
  Response: {success: true}

GET    /api/auth/me
  Headers: Authorization: Bearer {token}
  Response: {id, email, name, role}

POST   /api/auth/register (optional)
  Request: {email, password, name}
  Response: {token, user}
```

### Clinic Endpoints

```
GET    /api/clinics
  Response: [{ClinicID, ClinicName, ClinicAddress, ...}, ...]

GET    /api/clinics/:id
  Response: {ClinicID, ClinicName, ...}

POST   /api/clinics
  Request: {ClinicName, ClinicAddress, ClinicPhone, ...}
  Response: {ClinicID, ClinicName, ...}

PUT    /api/clinics/:id
  Request: {ClinicName, ClinicAddress, ...}
  Response: {ClinicID, ...}

DELETE /api/clinics/:id
  Response: {success: true}
```

### Patient Endpoints

```
GET    /api/patients
  Response: [{PatientID, PatientFirstname, PatientLastname, ...}, ...]

GET    /api/patients/:id
  Response: {PatientID, PatientFirstname, ...}

POST   /api/patients
  Request: {PatientFirstname, PatientLastname, PatientAddress, Patientage}
  Response: {PatientID, ...}

PUT    /api/patients/:id
  Request: {PatientFirstname, PatientLastname, ...}
  Response: {PatientID, ...}

DELETE /api/patients/:id
  Response: {success: true}
```

_(Similar patterns for appointments, vaccines, staff)_

---

## Environment Configuration

### Development (.env)

```
VITE_API_URL=http://localhost:3000/api
```

### Production (.env.production)

```
VITE_API_URL=https://api.traveljabs.com/api
```

### Access in Code

```javascript
const baseUrl = import.meta.env.VITE_API_URL;
// Dev: http://localhost:3000/api
// Prod: https://api.traveljabs.com/api
```

---

## Authentication Token Management

### Storage

- **Location:** localStorage
- **Key:** authToken
- **Format:** JWT Bearer token
- **Lifetime:** Set by backend (typically 24h or 7d)

### Sending with Requests

```javascript
// All requests include:
headers: {
  "Authorization": "Bearer eyJhbGciOiJIUzI1NiIs..."
}
```

### Logout

```javascript
1. Remove from localStorage: localStorage.removeItem("authToken")
2. Clear user state: setUser(null)
3. Redirect to /login
4. Automatic redirect by ProtectedRoute
```

### Token Expiration

```
If 401 Unauthorized response:
1. Remove token from localStorage
2. Redirect to /login
3. User must login again
```

---

## Error Handling

### Response Status Codes

| Code | Meaning      | Frontend Action           |
| ---- | ------------ | ------------------------- |
| 200  | Success      | Use response data         |
| 201  | Created      | Show success message      |
| 400  | Bad Request  | Show validation error     |
| 401  | Unauthorized | Redirect to /login        |
| 403  | Forbidden    | Show permission error     |
| 404  | Not Found    | Show "resource not found" |
| 500  | Server Error | Show "try again later"    |

### Error Message Format

```javascript
try {
  const data = await getPatients();
  setPatients(data);
} catch (err) {
  // err.message comes from backend or network
  setError(err.message);
  // Display to user in <ErrorMessage />
}
```

---

## Testing Quick Checklist

### Test Each Phase

```
Phase 2: Clinics
[ ] Login successful
[ ] /clinics page loads
[ ] Clinic list displays from API
[ ] Search filters results
[ ] No errors in console

Phase 3: Patients
[ ] Can create patient (POST)
[ ] Can read patient list (GET)
[ ] Can edit patient (PUT)
[ ] Can delete patient (DELETE)
[ ] All changes persist

Phase 4: Appointments
[ ] Create with dropdown selection
[ ] Reschedule existing
[ ] Cancel with confirmation

Phase 5: Vaccines
[ ] Full CRUD operations

Phase 6: Staff
[ ] List displays correctly
```

---

## Common Backend Requirements

### CRUD Response Format

```json
// List endpoint
{
  "data": [{...}, {...}],
  "count": 50
}

// Single endpoint
{
  "data": {...}
}

// Error response
{
  "error": true,
  "message": "Validation failed"
}
```

### CORS Configuration Required

```
Access-Control-Allow-Origin: http://localhost:5173 (dev)
Access-Control-Allow-Origin: https://traveljabs.com (prod)
Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS
Access-Control-Allow-Headers: Content-Type, Authorization
Access-Control-Allow-Credentials: true
```

### JWT Token Verification

- Backend must verify Bearer token in Authorization header
- Return 401 if token invalid or expired
- Include user info in GET /auth/me endpoint

---

## Quick Setup Commands

```bash
# Frontend
cd /workspaces/travelJabs-frontend
npm install
npm run dev              # http://localhost:5173

# Backend (in separate terminal)
cd /workspaces/traveljabs-backend
npm install
npm start                # http://localhost:3000

# Format code
npm run format

# Build for production
npm run build
```

---

## Debugging Tips

### Check Login Token

```javascript
// In browser console
console.log(localStorage.getItem("authToken"));
```

### Monitor API Calls

```javascript
// Open DevTools Network tab
// Filter by XHR/Fetch
// Check Authorization header: "Bearer ..."
```

### Verify User State

```javascript
// In component
const { user } = useAuth();
console.log("Current user:", user);
```

### Test API Endpoint Directly

```bash
# Get clinics
curl -H "Authorization: Bearer TOKEN" \
  http://localhost:3000/api/clinics

# Create patient
curl -X POST http://localhost:3000/api/patients \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer TOKEN" \
  -d '{"PatientFirstname":"John","PatientLastname":"Doe"}'
```
