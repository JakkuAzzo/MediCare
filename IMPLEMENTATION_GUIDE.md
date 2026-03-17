# Frontend-Backend Integration: Phase-by-Phase Implementation Guide

This guide provides exact code implementations for integrating the React frontend with the Travel Jabs backend. Follow each phase in order.

---

## Phase 1: Setup & Authentication (COMPLETED ✓)

### What's Already Done

- ✓ API configuration (`src/config/api.js`)
- ✓ AuthContext with login/logout (`src/context/AuthContext.jsx`)
- ✓ ProtectedRoute wrapper (`src/components/ProtectedRoute.jsx`)
- ✓ LoginPage functional form
- ✓ Navbar with logout button
- ✓ All service files updated with auth headers
- ✓ Environment configuration files

### Next Step

Verify backend API is running and test login at `http://localhost:5173/login`

---

## Phase 2: Clinics Page (First User Story)

**User Story:** _As a Patient, I want to search for clinics, so that I can find a convenient location._

### Step 1: Update ClinicsPage.jsx

Replace the current ClinicsPage with this implementation:

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
        (clinic.name &&
          clinic.name.toLowerCase().includes(term.toLowerCase())) ||
        (clinic.location &&
          clinic.location.toLowerCase().includes(term.toLowerCase())) ||
        (clinic.ClinicName &&
          clinic.ClinicName.toLowerCase().includes(term.toLowerCase())) ||
        (clinic.ClinicAddress &&
          clinic.ClinicAddress.toLowerCase().includes(term.toLowerCase()))
    );
    setFilteredClinics(filtered);
  };

  if (loading) return <LoadingMessage />;
  if (error) return <ErrorMessage message={error} />;

  return (
    <div className="page">
      <h1>Clinics</h1>
      <p>Search for clinics to find a convenient location for vaccination</p>

      <SearchBar
        placeholder="Search by clinic name or location..."
        onSearch={handleSearch}
      />

      {filteredClinics.length === 0 && searchTerm && (
        <p
          className="text-center"
          style={{ marginTop: "2rem", color: "#7f8c8d" }}
        >
          No clinics found matching "{searchTerm}"
        </p>
      )}

      <ClinicTable clinics={filteredClinics} />
    </div>
  );
}
```

### Step 2: Update ClinicTable.jsx

Replace with this to display real data:

```javascript
export default function ClinicTable({ clinics, onEdit, onDelete }) {
  return (
    <table className="table">
      <thead>
        <tr>
          <th>Clinic Name</th>
          <th>Address</th>
          <th>Phone</th>
          <th>Email</th>
        </tr>
      </thead>
      <tbody>
        {clinics.length === 0 ? (
          <tr>
            <td colSpan="4" style={{ textAlign: "center" }}>
              No clinics available
            </td>
          </tr>
        ) : (
          clinics.map((clinic) => (
            <tr key={clinic.ClinicID || clinic.id}>
              <td>{clinic.ClinicName || clinic.name}</td>
              <td>{clinic.ClinicAddress || clinic.location}</td>
              <td>{clinic.ClinicPhone || clinic.phone || "N/A"}</td>
              <td>{clinic.ClinicEmail || clinic.email || "N/A"}</td>
            </tr>
          ))
        )}
      </tbody>
    </table>
  );
}
```

### Testing Phase 2

1. Start backend: `npm start` (in backend directory)
2. Start frontend: `npm run dev`
3. Login with test credentials
4. Navigate to /clinics
5. Search for clinics by name or location
6. Verify data loads from API

---

## Phase 3: Patient CRUD (Second User Story)

**User Stories:**

- _As a Manager, I want to create patient accounts_
- _As a Manager, I want to edit patient information_
- _As a Manager, I want to delete patient accounts_

### Step 1: Update PatientsPage.jsx

```javascript
import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import LoadingMessage from "../components/common/LoadingMessage";
import ErrorMessage from "../components/common/ErrorMessage";
import PatientTable from "../components/tables/PatientTable";
import { getPatients, deletePatient } from "../services/patientService";

export default function PatientsPage() {
  const [patients, setPatients] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [deleteError, setDeleteError] = useState(null);
  const navigate = useNavigate();

  useEffect(() => {
    loadPatients();
  }, []);

  async function loadPatients() {
    try {
      setLoading(true);
      setError(null);
      const data = await getPatients();
      setPatients(data);
    } catch (err) {
      setError(err.message);
    } finally {
      setLoading(false);
    }
  }

  async function handleDelete(id) {
    if (!window.confirm("Are you sure you want to delete this patient?")) {
      return;
    }

    try {
      setDeleteError(null);
      await deletePatient(id);
      setPatients(patients.filter((p) => (p.PatientID || p.id) !== id));
    } catch (err) {
      setDeleteError(err.message);
    }
  }

  if (loading) return <LoadingMessage />;
  if (error) return <ErrorMessage message={error} />;

  return (
    <div className="page">
      <div
        style={{
          display: "flex",
          justifyContent: "space-between",
          alignItems: "center"
        }}
      >
        <h1>Patients</h1>
        <button
          onClick={() => navigate("/patients/new")}
          className="btn btn-primary"
        >
          + Add Patient
        </button>
      </div>

      {deleteError && <ErrorMessage message={deleteError} />}

      <PatientTable patients={patients} onDelete={handleDelete} />
    </div>
  );
}
```

### Step 2: Update PatientFormPage.jsx

```javascript
import { useEffect, useState } from "react";
import { useParams, useNavigate } from "react-router-dom";
import LoadingMessage from "../components/common/LoadingMessage";
import ErrorMessage from "../components/common/ErrorMessage";
import PatientForm from "../components/forms/PatientForm";
import {
  getPatientById,
  createPatient,
  updatePatient
} from "../services/patientService";

export default function PatientFormPage({ mode }) {
  const { id } = useParams();
  const navigate = useNavigate();
  const [patient, setPatient] = useState(null);
  const [loading, setLoading] = useState(mode === "edit");
  const [error, setError] = useState(null);
  const [isSaving, setIsSaving] = useState(false);

  useEffect(() => {
    if (mode === "edit" && id) {
      loadPatient();
    }
  }, [id, mode]);

  async function loadPatient() {
    try {
      setLoading(true);
      setError(null);
      const data = await getPatientById(id);
      // Map backend field names to form field names
      setPatient({
        PatientID: data.PatientID,
        PatientFirstname: data.PatientFirstname,
        PatientLastname: data.PatientLastname,
        PatientAddress: data.PatientAddress,
        PatientPostcode: data.PatientPostcode,
        Patientage: data.Patientage
      });
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
        await createPatient(formData);
        navigate("/patients");
      } else {
        await updatePatient(id, formData);
        navigate("/patients");
      }
    } catch (err) {
      setError(err.message);
      setIsSaving(false);
    }
  }

  if (loading) return <LoadingMessage />;

  return (
    <div className="page">
      <h1>{mode === "create" ? "Add New Patient" : "Edit Patient"}</h1>
      {error && <ErrorMessage message={error} />}
      <PatientForm
        patient={patient}
        onSubmit={handleSubmit}
        isLoading={isSaving}
      />
    </div>
  );
}
```

### Step 3: Update PatientForm.jsx

```javascript
import { useState, useEffect } from "react";

export default function PatientForm({
  patient = null,
  onSubmit,
  isLoading = false
}) {
  const [formData, setFormData] = useState({
    PatientFirstname: "",
    PatientLastname: "",
    PatientAddress: "",
    PatientPostcode: "",
    Patientage: ""
  });
  const [validationErrors, setValidationErrors] = useState({});

  useEffect(() => {
    if (patient) {
      setFormData(patient);
    }
  }, [patient]);

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData((prev) => ({
      ...prev,
      [name]: value
    }));
    // Clear error for this field
    if (validationErrors[name]) {
      setValidationErrors((prev) => ({
        ...prev,
        [name]: null
      }));
    }
  };

  const validateForm = () => {
    const errors = {};
    if (!formData.PatientFirstname?.trim()) {
      errors.PatientFirstname = "First name is required";
    }
    if (!formData.PatientLastname?.trim()) {
      errors.PatientLastname = "Last name is required";
    }
    if (formData.Patientage) {
      const age = parseInt(formData.Patientage);
      if (isNaN(age) || age < 0 || age > 150) {
        errors.Patientage = "Age must be between 0 and 150";
      }
    }
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
        <label htmlFor="PatientFirstname">First Name *</label>
        <input
          type="text"
          id="PatientFirstname"
          name="PatientFirstname"
          value={formData.PatientFirstname}
          onChange={handleChange}
          className={validationErrors.PatientFirstname ? "error" : ""}
          required
        />
        {validationErrors.PatientFirstname && (
          <span className="error-text">
            {validationErrors.PatientFirstname}
          </span>
        )}
      </div>

      <div className="form-group">
        <label htmlFor="PatientLastname">Last Name *</label>
        <input
          type="text"
          id="PatientLastname"
          name="PatientLastname"
          value={formData.PatientLastname}
          onChange={handleChange}
          className={validationErrors.PatientLastname ? "error" : ""}
          required
        />
        {validationErrors.PatientLastname && (
          <span className="error-text">{validationErrors.PatientLastname}</span>
        )}
      </div>

      <div className="form-group">
        <label htmlFor="PatientAddress">Address</label>
        <input
          type="text"
          id="PatientAddress"
          name="PatientAddress"
          value={formData.PatientAddress}
          onChange={handleChange}
        />
      </div>

      <div className="form-group">
        <label htmlFor="PatientPostcode">Postcode</label>
        <input
          type="text"
          id="PatientPostcode"
          name="PatientPostcode"
          value={formData.PatientPostcode}
          onChange={handleChange}
        />
      </div>

      <div className="form-group">
        <label htmlFor="Patientage">Age</label>
        <input
          type="number"
          id="Patientage"
          name="Patientage"
          value={formData.Patientage}
          onChange={handleChange}
          className={validationErrors.Patientage ? "error" : ""}
          min="0"
          max="150"
        />
        {validationErrors.Patientage && (
          <span className="error-text">{validationErrors.Patientage}</span>
        )}
      </div>

      <button type="submit" className="btn btn-primary" disabled={isLoading}>
        {isLoading ? "Saving..." : "Save Patient"}
      </button>
    </form>
  );
}
```

### Step 4: Update PatientTable.jsx

```javascript
import { Link } from "react-router-dom";

export default function PatientTable({ patients, onDelete }) {
  return (
    <table className="table">
      <thead>
        <tr>
          <th>Name</th>
          <th>Address</th>
          <th>Postcode</th>
          <th>Age</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>
        {patients.length === 0 ? (
          <tr>
            <td colSpan="5" style={{ textAlign: "center" }}>
              No patients found
            </td>
          </tr>
        ) : (
          patients.map((patient) => (
            <tr key={patient.PatientID || patient.id}>
              <td>
                {patient.PatientFirstname} {patient.PatientLastname}
              </td>
              <td>{patient.PatientAddress || "N/A"}</td>
              <td>{patient.PatientPostcode || "N/A"}</td>
              <td>{patient.Patientage || "N/A"}</td>
              <td>
                <Link
                  to={`/patients/${patient.PatientID || patient.id}/edit`}
                  className="btn btn-sm btn-primary"
                >
                  Edit
                </Link>
                <button
                  onClick={() => onDelete(patient.PatientID || patient.id)}
                  className="btn btn-sm btn-delete"
                >
                  Delete
                </button>
              </td>
            </tr>
          ))
        )}
      </tbody>
    </table>
  );
}
```

### Testing Phase 3

1. Navigate to /patients
2. Click "Add Patient" button
3. Fill form and submit (test POST)
4. Edit a patient (test PUT)
5. Delete a patient (test DELETE)
6. Verify all data changes reflect on the server

---

## Phase 4: Appointments CRUD

**User Stories:**

- _As a Patient, I want to book appointments_
- _As a Manager, I want to reschedule appointments_
- _As a Manager, I want to cancel appointments_

### Implementation Pattern

Follow the same pattern as Phase 3 (Patients):

1. **AppointmentsPage.jsx** - List with delete handler
2. **AppointmentFormPage.jsx** - Create/edit with lifecycle
3. **AppointmentForm.jsx** - Form with validation
4. **AppointmentTable.jsx** - Display with actions

### Key Differences for Appointments

**Form needs dropdowns for:**

- PatientID (fetch patients list)
- ClinicID (fetch clinics list)
- StaffID (fetch staff list)
- AppointmentStatusID (fixed list: Scheduled, Completed, Cancelled)

**Example dropdown implementation:**

```javascript
const [patients, setPatients] = useState([]);
const [clinics, setClinics] = useState([]);
const [staff, setStaff] = useState([]);

useEffect(() => {
  // Load dropdown options
  loadDropdownData();
}, []);

async function loadDropdownData() {
  try {
    const [patientsData, clinicsData, staffData] = await Promise.all([
      getPatients(),
      getClinics(),
      getStaff()
    ]);
    setPatients(patientsData);
    setClinics(clinicsData);
    setStaff(staffData);
  } catch (err) {
    // handle error
  }
}
```

---

## Phase 5: Vaccine CRUD

Follow the same pattern as Patient CRUD.

**Fields:**

- VaccineName (text, required)
- VaccineCost (number, optional)

---

## Phase 6: Staff View

Just show the list, no form needed (unless updates are required later).

---

## Backend Field Name Mapping

If backend uses different field names, create a mapping utility:

```javascript
// src/utils/fieldMapper.js

export const fieldMappings = {
  // Backend field -> Frontend field
  clinic: {
    ClinicID: "id",
    ClinicName: "name",
    ClinicAddress: "location"
  },
  patient: {
    PatientID: "id",
    PatientFirstname: "firstName",
    PatientLastname: "lastName"
  },
  appointment: {
    AppointmentID: "id",
    AppointmentDatetime: "dateTime"
  }
};

export function mapFromBackend(data, entityType) {
  const mapping = fieldMappings[entityType];
  if (!mapping) return data;

  const mapped = { ...data };
  Object.entries(mapping).forEach(([backendKey, frontendKey]) => {
    if (backendKey in data && frontendKey !== backendKey) {
      mapped[frontendKey] = data[backendKey];
      delete mapped[backendKey];
    }
  });
  return mapped;
}
```

---

## Error Handling Best Practices

### HTTP Status Codes

```javascript
async function apiCall(promise) {
  try {
    const response = await promise;

    if (!response.ok) {
      const errorData = await response.json().catch(() => ({}));
      const message = errorData.message || `Error: ${response.statusText}`;

      if (response.status === 401) {
        // Redirect to login
        localStorage.removeItem("authToken");
        window.location.href = "/login";
      } else if (response.status === 403) {
        throw new Error("You don't have permission to perform this action");
      } else if (response.status === 404) {
        throw new Error("Resource not found");
      } else if (response.status === 400) {
        throw new Error("Invalid request: " + message);
      } else if (response.status >= 500) {
        throw new Error("Server error. Please try again later.");
      }

      throw new Error(message);
    }

    return response.json();
  } catch (error) {
    throw error;
  }
}
```

---

## Testing Checklist

### Phase 2 (Clinics)

- [ ] Can load clinic list
- [ ] Can search by name
- [ ] Can search by location
- [ ] Search filters update in real-time
- [ ] Empty state displays correctly

### Phase 3 (Patients)

- [ ] Can load patient list
- [ ] Can create patient with valid data
- [ ] Form validation prevents invalid submissions
- [ ] Can edit existing patient
- [ ] Can delete patient with confirmation
- [ ] Changes persist on page reload

### Phase 4 (Appointments)

- [ ] Can load appointment list
- [ ] Dropdown lists populated correctly
- [ ] Can create appointment with valid data
- [ ] Can reschedule appointment
- [ ] Can cancel appointment
- [ ] Validations prevent future-date/past-date errors

---

## Deployment Checklist

Before deploying to production:

- [ ] Update `.env.production` with real API URL
- [ ] Test all CRUD operations with production API
- [ ] Verify logout clears auth token
- [ ] Check error messages are user-friendly
- [ ] Run `npm run build` and verify dist folder
- [ ] Test loading states on slow networks
- [ ] Verify responsive design on mobile

---

## Common Issues & Solutions

### Issue: 401 Unauthorized on API calls

**Solution:** Check that auth token is being sent in Authorization header

```javascript
const token = localStorage.getItem("authToken");
console.log("Token:", token); // Debug
```

### Issue: CORS errors

**Solution:** Ensure backend has CORS enabled for frontend URL:

```
Allow-Origin: http://localhost:5173
Allow-Credentials: true
```

### Issue: Form field names don't match backend

**Solution:** Create field mapping in service layer:

```javascript
// Before sending to API
const mappedData = {
  PatientFirstname: formData.firstName,
  PatientLastname: formData.lastName
};
```

---

## Next Steps After All Phases

1. Add toast notifications for success/error messages
2. Implement pagination for large lists
3. Add sort/filter functionality to tables
4. Implement role-based features (clinician vs manager views)
5. Add appointment reminder notifications
6. Implement vaccination history tracking
