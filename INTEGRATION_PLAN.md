# Travel Jabs Frontend-Backend Integration Plan

## Overview

This document outlines the exact integration strategy between the React frontend and the Travel Jabs backend API. It covers service layer configuration, page component updates, form submission handlers, navigation flows, and authentication.

---

## 1. API Endpoint Mapping & Configuration

### Expected Backend API Structure

Based on the service layer already created, the backend should expose these endpoints:

#### Clinics API

```
GET    /api/clinics              - List all clinics
GET    /api/clinics/:id          - Get clinic by ID
POST   /api/clinics              - Create clinic
PUT    /api/clinics/:id          - Update clinic
DELETE /api/clinics/:id          - Delete clinic
```

#### Patients API

```
GET    /api/patients             - List all patients
GET    /api/patients/:id         - Get patient by ID
POST   /api/patients             - Create patient
PUT    /api/patients/:id         - Update patient
DELETE /api/patients/:id         - Delete patient
```

#### Appointments API

```
GET    /api/appointments         - List all appointments
GET    /api/appointments/:id     - Get appointment by ID
POST   /api/appointments         - Create appointment
PUT    /api/appointments/:id     - Update/reschedule appointment
DELETE /api/appointments/:id     - Cancel/delete appointment
```

#### Vaccines API

```
GET    /api/vaccines             - List all vaccines
GET    /api/vaccines/:id         - Get vaccine by ID
POST   /api/vaccines             - Create vaccine
PUT    /api/vaccines/:id         - Update vaccine
DELETE /api/vaccines/:id         - Delete vaccine
```

#### Staff API

```
GET    /api/staff                - List all staff
GET    /api/staff/:id            - Get staff by ID
POST   /api/staff                - Create staff member
PUT    /api/staff/:id            - Update staff member
DELETE /api/staff/:id            - Delete staff member
```

#### Authentication API

```
POST   /api/auth/login           - User login (returns JWT token)
POST   /api/auth/logout          - User logout
GET    /api/auth/me              - Get current user
POST   /api/auth/register        - User registration (optional)
```

---

## 2. Service Layer Configuration

### Base URL Configuration

Create `src/config/api.js`:

```javascript
// Production: use environment variable or relative path
// Development: use localhost backend
const BASE_URL = import.meta.env.VITE_API_URL || "http://localhost:3000/api";
export default BASE_URL;
```

### Environment Variables (.env files)

Create `.env` for development:

```
VITE_API_URL=http://localhost:3000/api
```

Create `.env.production` for production:

```
VITE_API_URL=https://api.traveljabs.com/api
```

### Service Layer Update Pattern

All service files follow this pattern:

```javascript
import BASE_URL from "../config/api";

// Include auth token in requests
function getAuthHeader() {
  const token = localStorage.getItem("authToken");
  return {
    "Content-Type": "application/json",
    ...(token && { Authorization: `Bearer ${token}` })
  };
}

// Example function
export async function getPatients() {
  const response = await fetch(`${BASE_URL}/patients`, {
    method: "GET",
    headers: getAuthHeader()
  });

  if (!response.ok) {
    if (response.status === 401) {
      // Token expired or unauthorized
      localStorage.removeItem("authToken");
      window.location.href = "/login";
    }
    throw new Error(`Failed to fetch patients: ${response.statusText}`);
  }

  return response.json();
}
```

---

## 3. State Management & Lifecycle

### Page Component Pattern

All data pages follow this pattern:

```javascript
import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import LoadingMessage from "../components/common/LoadingMessage";
import ErrorMessage from "../components/common/ErrorMessage";
import * as entityService from "../services/entityService";

export default function EntityPage() {
  const [data, setData] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const navigate = useNavigate();

  useEffect(() => {
    loadData();
  }, []);

  async function loadData() {
    try {
      setLoading(true);
      setError(null);
      const result = await entityService.getAll();
      setData(result);
    } catch (err) {
      setError(err.message);
    } finally {
      setLoading(false);
    }
  }

  async function handleDelete(id) {
    if (!window.confirm("Are you sure?")) return;

    try {
      await entityService.delete(id);
      setData(data.filter((item) => item.id !== id));
    } catch (err) {
      setError(err.message);
    }
  }

  if (loading) return <LoadingMessage />;
  if (error) return <ErrorMessage message={error} />;

  return (
    <div className="page">
      <h1>Entities</h1>
      <button
        onClick={() => navigate("/entity/new")}
        className="btn btn-primary"
      >
        Add New
      </button>
      {/* Table component with data and onDelete handler */}
    </div>
  );
}
```

---

## 4. Form Submission Handlers

### Form Page Pattern

All form pages follow this pattern:

```javascript
import { useEffect, useState } from "react";
import { useParams, useNavigate } from "react-router-dom";
import EntityForm from "../components/forms/EntityForm";
import LoadingMessage from "../components/common/LoadingMessage";
import ErrorMessage from "../components/common/ErrorMessage";
import * as entityService from "../services/entityService";

export default function EntityFormPage({ mode }) {
  const { id } = useParams();
  const navigate = useNavigate();
  const [entity, setEntity] = useState(null);
  const [loading, setLoading] = useState(mode === "edit");
  const [error, setError] = useState(null);
  const [isSaving, setIsSaving] = useState(false);

  useEffect(() => {
    if (mode === "edit" && id) {
      loadEntity();
    }
  }, [id, mode]);

  async function loadEntity() {
    try {
      setLoading(true);
      const result = await entityService.getById(id);
      setEntity(result);
    } catch (err) {
      setError(err.message);
    } finally {
      setLoading(false);
    }
  }

  async function handleSubmit(formData) {
    try {
      setIsSaving(true);
      setError(null);

      if (mode === "create") {
        await entityService.create(formData);
        navigate("/entity");
      } else {
        await entityService.update(id, formData);
        navigate("/entity");
      }
    } catch (err) {
      setError(err.message);
      setIsSaving(false);
    }
  }

  if (loading) return <LoadingMessage />;

  return (
    <div className="page">
      <h1>{mode === "create" ? "Add Entity" : "Edit Entity"}</h1>
      {error && <ErrorMessage message={error} />}
      <EntityForm
        entity={entity}
        onSubmit={handleSubmit}
        isLoading={isSaving}
      />
    </div>
  );
}
```

### Form Component Pattern

All forms follow this pattern:

```javascript
import { useState, useEffect } from "react";
import ErrorMessage from "../common/ErrorMessage";

export default function EntityForm({
  entity = null,
  onSubmit,
  isLoading = false
}) {
  const [formData, setFormData] = useState({
    field1: "",
    field2: "",
    field3: ""
  });
  const [validationErrors, setValidationErrors] = useState({});

  useEffect(() => {
    if (entity) {
      setFormData(entity);
    }
  }, [entity]);

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData((prev) => ({
      ...prev,
      [name]: value
    }));
    // Clear validation error for this field
    if (validationErrors[name]) {
      setValidationErrors((prev) => ({
        ...prev,
        [name]: null
      }));
    }
  };

  const validateForm = () => {
    const errors = {};
    if (!formData.field1) errors.field1 = "Field1 is required";
    if (!formData.field2) errors.field2 = "Field2 is required";
    return errors;
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    const errors = validateForm();

    if (Object.keys(errors).length > 0) {
      setValidationErrors(errors);
      return;
    }

    onSubmit(formData);
  };

  return (
    <form onSubmit={handleSubmit} className="form">
      <div className="form-group">
        <label htmlFor="field1">Field 1</label>
        <input
          type="text"
          id="field1"
          name="field1"
          value={formData.field1}
          onChange={handleChange}
          className={validationErrors.field1 ? "error" : ""}
        />
        {validationErrors.field1 && (
          <span className="error-text">{validationErrors.field1}</span>
        )}
      </div>

      <button type="submit" className="btn btn-primary" disabled={isLoading}>
        {isLoading ? "Saving..." : "Save"}
      </button>
    </form>
  );
}
```

---

## 5. Navigation Flows

### Complete User Journey Map

#### Clinic Search Flow (First User Story)

```
Dashboard
  → [Click "Clinics"]
  → ClinicsPage (GET /api/clinics)
  → Display ClinicTable
  → [Add Search Bar] Filter results
```

#### Patient Management Flow (Second User Story)

```
Dashboard
  → [Click "Patients"]
  → PatientsPage (GET /api/patients)
  → Display PatientTable with [Edit] [Delete] buttons

Create Patient:
  → [Click "Add Patient"]
  → PatientFormPage (mode="create")
  → PatientForm submits (POST /api/patients)
  → Navigate back to PatientsPage

Edit Patient:
  → [Click Edit on table]
  → PatientFormPage (mode="edit", id=:id)
  → Load patient (GET /api/patients/:id)
  → PatientForm submits (PUT /api/patients/:id)
  → Navigate back to PatientsPage

Delete Patient:
  → [Click Delete on table]
  → Confirm dialog
  → DELETE /api/patients/:id
  → Refresh PatientsPage
```

#### Appointment Management Flow

```
Dashboard
  → [Click "Appointments"]
  → AppointmentsPage (GET /api/appointments)
  → Display AppointmentTable with [Reschedule] [Cancel] buttons

Schedule Appointment:
  → [Click "Schedule Appointment"]
  → AppointmentFormPage (mode="create")
  → AppointmentForm with patient/clinic/staff dropdowns
  → Submit (POST /api/appointments)
  → Navigate to AppointmentsPage

Reschedule Appointment:
  → [Click Reschedule on table]
  → AppointmentFormPage (mode="edit", id=:id)
  → Load appointment (GET /api/appointments/:id)
  → AppointmentForm submits (PUT /api/appointments/:id)
  → Navigate to AppointmentsPage

Cancel Appointment:
  → [Click Cancel on table]
  → Confirm dialog
  → DELETE /api/appointments/:id
  → Refresh table
```

#### Vaccine Management Flow

```
Dashboard
  → [Click "Vaccines"]
  → VaccinesPage (GET /api/vaccines)
  → Display VaccineTable with [Edit] [Delete] buttons

Add Vaccine:
  → [Click "Add Vaccine"]
  → VaccineFormPage (mode="create")
  → VaccineForm submits (POST /api/vaccines)
  → Navigate to VaccinesPage

Edit Vaccine:
  → [Click Edit on table]
  → VaccineFormPage (mode="edit", id=:id)
  → Load vaccine (GET /api/vaccines/:id)
  → VaccineForm submits (PUT /api/vaccines/:id)
  → Navigate to VaccinesPage

Delete Vaccine:
  → [Click Delete on table]
  → Confirm dialog
  → DELETE /api/vaccines/:id
  → Refresh table
```

#### Staff View Flow

```
Dashboard
  → [Click "Staff"]
  → StaffPage (GET /api/staff)
  → Display StaffTable
  → [Future: Assign to appointment, View availability]
```

---

## 6. Authentication Implementation

### Authentication Flow

#### Login

```
1. User navigates to /login
2. LoginPage renders LoginForm
3. User enters credentials
4. LoginForm POSTs to /api/auth/login
5. Backend returns { token, user }
6. Frontend stores token in localStorage
7. Redirect to Dashboard
```

#### Session Check

```
1. App loads
2. Check if authToken in localStorage
3. If yes: Verify token with GET /api/auth/me
4. If no/invalid: Redirect to /login
5. Store user info in context/state
6. Include token in all API requests (Bearer token)
```

#### Logout

```
1. User clicks logout (in navbar)
2. POST /api/auth/logout (optional backend cleanup)
3. Remove token from localStorage
4. Clear user state
5. Redirect to /login
```

### Implementation Approach

#### Step 1: Create Authentication Context

Create `src/context/AuthContext.jsx`:

```javascript
import { createContext, useState, useEffect } from "react";

export const AuthContext = createContext();

export function AuthProvider({ children }) {
  const [user, setUser] = useState(null);
  const [loading, setLoading] = useState(true);
  const [authError, setAuthError] = useState(null);

  // Check auth on mount
  useEffect(() => {
    checkAuth();
  }, []);

  async function checkAuth() {
    const token = localStorage.getItem("authToken");
    if (!token) {
      setLoading(false);
      return;
    }

    try {
      const response = await fetch("http://localhost:3000/api/auth/me", {
        headers: {
          Authorization: `Bearer ${token}`
        }
      });

      if (response.ok) {
        setUser(await response.json());
      } else {
        localStorage.removeItem("authToken");
      }
    } catch (err) {
      console.error("Auth check failed:", err);
      localStorage.removeItem("authToken");
    } finally {
      setLoading(false);
    }
  }

  async function login(email, password) {
    try {
      setAuthError(null);
      const response = await fetch("http://localhost:3000/api/auth/login", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ email, password })
      });

      if (!response.ok) {
        throw new Error("Login failed");
      }

      const data = await response.json();
      localStorage.setItem("authToken", data.token);
      setUser(data.user);
      return data;
    } catch (err) {
      setAuthError(err.message);
      throw err;
    }
  }

  async function logout() {
    try {
      const token = localStorage.getItem("authToken");
      if (token) {
        await fetch("http://localhost:3000/api/auth/logout", {
          method: "POST",
          headers: { Authorization: `Bearer ${token}` }
        });
      }
    } catch (err) {
      console.error("Logout request failed:", err);
    } finally {
      localStorage.removeItem("authToken");
      setUser(null);
    }
  }

  return (
    <AuthContext.Provider value={{ user, loading, authError, login, logout }}>
      {children}
    </AuthContext.Provider>
  );
}

export function useAuth() {
  const context = useContext(AuthContext);
  if (!context) {
    throw new Error("useAuth must be used within AuthProvider");
  }
  return context;
}
```

#### Step 2: Create Protected Route Component

Create `src/components/ProtectedRoute.jsx`:

```javascript
import { Navigate } from "react-router-dom";
import { useAuth } from "../context/AuthContext";
import LoadingMessage from "./common/LoadingMessage";

export default function ProtectedRoute({ children }) {
  const { user, loading } = useAuth();

  if (loading) return <LoadingMessage />;
  if (!user) return <Navigate to="/login" replace />;

  return children;
}
```

#### Step 3: Update App.jsx with Auth

```javascript
import { Routes, Route, Navigate } from "react-router-dom";
import { AuthProvider, useAuth } from "./context/AuthContext";
import ProtectedRoute from "./components/ProtectedRoute";
import Layout from "./components/layout/Layout";
import LoginPage from "./pages/LoginPage";
// ... import other pages

function AppContent() {
  const { loading } = useAuth();

  if (loading) return <div>Loading...</div>;

  return (
    <Routes>
      <Route path="/login" element={<LoginPage />} />

      <Route
        path="/"
        element={
          <ProtectedRoute>
            <Layout />
          </ProtectedRoute>
        }
      >
        <Route index element={<DashboardPage />} />
        <Route path="clinics" element={<ClinicsPage />} />
        <Route path="patients" element={<PatientsPage />} />
        {/* ... other protected routes */}
      </Route>

      <Route path="*" element={<Navigate to="/" replace />} />
    </Routes>
  );
}

export default function App() {
  return (
    <AuthProvider>
      <AppContent />
    </AuthProvider>
  );
}
```

---

## 7. Error Handling & Edge Cases

### HTTP Error Codes Handling

```javascript
async function handleApiCall(promise) {
  try {
    return await promise;
  } catch (error) {
    if (error.status === 401) {
      // Unauthorized - redirect to login
      localStorage.removeItem("authToken");
      window.location.href = "/login";
    } else if (error.status === 403) {
      // Forbidden - user doesn't have permission
      throw new Error("You don't have permission to perform this action");
    } else if (error.status === 404) {
      // Not found
      throw new Error("Resource not found");
    } else if (error.status === 500) {
      // Server error
      throw new Error("Server error. Please try again later.");
    } else {
      throw error;
    }
  }
}
```

### Validation Rules

**Patients:**

- First name: required, min 2 chars
- Last name: required, min 2 chars
- Age: optional, min 0, max 150
- Email: optional, valid email format

**Appointments:**

- Date/Time: required, must be in future
- Patient ID: required, must exist
- Clinic ID: required, must exist
- Status: required, valid status

**Vaccines:**

- Name: required, min 2 chars
- Cost: optional, min 0, decimal up to 2 places

---

## 8. Implementation Checklist

### Phase 1: Setup & Auth

- [ ] Create `src/config/api.js` with BASE_URL
- [ ] Create `.env` and `.env.production` files
- [ ] Update all service files with auth headers
- [ ] Create `src/context/AuthContext.jsx`
- [ ] Create `src/components/ProtectedRoute.jsx`
- [ ] Create `src/pages/LoginPage.jsx`
- [ ] Update `src/main.jsx` with AuthProvider
- [ ] Update `src/App.jsx` with ProtectedRoute

### Phase 2: Clinics (First User Story)

- [ ] Update `ClinicsPage.jsx` with lifecycle and service calls
- [ ] Add search functionality to `SearchBar`
- [ ] Update `ClinicTable.jsx` with real data binding
- [ ] Test GET /api/clinics

### Phase 3: Patient CRUD (Second User Story)

- [ ] Update `PatientsPage.jsx` with lifecycle and delete handler
- [ ] Update `PatientFormPage.jsx` with create/edit logic
- [ ] Update `PatientForm.jsx` with validation and fields
- [ ] Update `PatientTable.jsx` with real data binding
- [ ] Test POST /api/patients
- [ ] Test PUT /api/patients/:id
- [ ] Test DELETE /api/patients/:id

### Phase 4: Appointment CRUD

- [ ] Update `AppointmentsPage.jsx` with lifecycle and delete handler
- [ ] Update `AppointmentFormPage.jsx` with create/edit logic
- [ ] Update `AppointmentForm.jsx` with dropdown fields (Patient, Clinic, Staff)
- [ ] Update `AppointmentTable.jsx` with real data binding
- [ ] Test POST /api/appointments
- [ ] Test PUT /api/appointments/:id
- [ ] Test DELETE /api/appointments/:id

### Phase 5: Vaccine CRUD

- [ ] Update `VaccinesPage.jsx` with lifecycle and delete handler
- [ ] Update `VaccineFormPage.jsx` with create/edit logic
- [ ] Update `VaccineForm.jsx` with validation
- [ ] Update `VaccineTable.jsx` with real data binding
- [ ] Test POST /api/vaccines
- [ ] Test PUT /api/vaccines/:id
- [ ] Test DELETE /api/vaccines/:id

### Phase 6: Staff View & Enhancement

- [ ] Update `StaffPage.jsx` with lifecycle
- [ ] Update `StaffTable.jsx` with real data binding
- [ ] [Optional] Add staff assignment to appointments

### Phase 7: Polish & Testing

- [ ] End-to-end testing of all user stories
- [ ] Error message improvements
- [ ] Loading state feedback
- [ ] Success notifications
- [ ] Form validation messages

---

## 9. Code Examples

### Example: Updating ClinicsPage

```javascript
import { useEffect, useState } from "react";
import LoadingMessage from "../components/common/LoadingMessage";
import ErrorMessage from "../components/common/ErrorMessage";
import SearchBar from "../components/common/SearchBar";
import ClinicTable from "../components/tables/ClinicTable";
import { getClinics } from "../services/clinicService";

export default function ClinicsPage() {
  const [clinics, setClinics] = useState([]);
  const [filteredClinics, setFilteredClinics] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [searchTerm, setSearchTerm] = useState("");

  useEffect(() => {
    loadClinics();
  }, []);

  async function loadClinics() {
    try {
      setLoading(true);
      setError(null);
      const data = await getClinics();
      setClinics(data);
      setFilteredClinics(data);
    } catch (err) {
      setError(err.message);
    } finally {
      setLoading(false);
    }
  }

  const handleSearch = (term) => {
    setSearchTerm(term);
    const filtered = clinics.filter(
      (clinic) =>
        clinic.name.toLowerCase().includes(term.toLowerCase()) ||
        clinic.location.toLowerCase().includes(term.toLowerCase())
    );
    setFilteredClinics(filtered);
  };

  if (loading) return <LoadingMessage />;
  if (error) return <ErrorMessage message={error} />;

  return (
    <div className="page">
      <h1>Clinics</h1>
      <p>Search for clinics to find a convenient location</p>
      <SearchBar
        placeholder="Search by name or location..."
        onSearch={handleSearch}
      />
      <ClinicTable clinics={filteredClinics} />
    </div>
  );
}
```

---

## 10. Environment Setup

### Development Server Requirements

Ensure backend is running on:

```
http://localhost:3000
```

With CORS enabled to accept requests from:

```
http://localhost:5173
```

### Testing the Integration

```bash
# Terminal 1: Start backend
cd ../traveljabs-backend
npm start

# Terminal 2: Start frontend
cd /workspaces/travelJabs-frontend
npm run dev
```

Then navigate to `http://localhost:5173` and test the flows.

---

## 11. Switching Between Mock Data and Real API

### During Development

All service files include this pattern:

```javascript
// To use mock data, comment out the API call and uncomment:
// import patients from "../data/patients";
// export async function getPatients() {
//   return Promise.resolve(patients);
// }

// To use real API, use:
export async function getPatients() {
  const response = await fetch(`${BASE_URL}/patients`);
  // ... handle response
}
```

To switch globally, update `src/config/api.js`:

```javascript
const USE_MOCK_DATA = true; // Set to false for real API
export { USE_MOCK_DATA };
```

---

## Next Steps

1. **Review backend API** - Verify endpoint paths match this plan
2. **Adjust field names** - Update service calls and forms if backend uses different field names
3. **Implement Phase 1** - Auth and setup
4. **Implement Phase 2** - Clinics page
5. **Test thoroughly** - Each phase before moving to next
6. **Deploy** - Once all phases complete
