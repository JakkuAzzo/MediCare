import { Routes, Route } from "react-router-dom";
import Layout from "./components/layout/Layout";
import DashboardPage from "./pages/DashboardPage";
import ClinicsPage from "./pages/ClinicsPage";
import PatientsPage from "./pages/PatientsPage";
import PatientFormPage from "./pages/PatientFormPage";
import AppointmentsPage from "./pages/AppointmentsPage";
import AppointmentFormPage from "./pages/AppointmentFormPage";
import VaccinesPage from "./pages/VaccinesPage";
import VaccineFormPage from "./pages/VaccineFormPage";
import StaffPage from "./pages/StaffPage";
import LoginPage from "./pages/LoginPage";
import NotFoundPage from "./pages/NotFoundPage";

export default function App() {
  return (
    <Routes>
      <Route path="/" element={<Layout />}>
        <Route index element={<DashboardPage />} />
        <Route path="clinics" element={<ClinicsPage />} />
        <Route path="patients" element={<PatientsPage />} />
        <Route
          path="patients/new"
          element={<PatientFormPage mode="create" />}
        />
        <Route
          path="patients/:id/edit"
          element={<PatientFormPage mode="edit" />}
        />
        <Route path="appointments" element={<AppointmentsPage />} />
        <Route
          path="appointments/new"
          element={<AppointmentFormPage mode="create" />}
        />
        <Route
          path="appointments/:id/edit"
          element={<AppointmentFormPage mode="edit" />}
        />
        <Route path="vaccines" element={<VaccinesPage />} />
        <Route
          path="vaccines/new"
          element={<VaccineFormPage mode="create" />}
        />
        <Route
          path="vaccines/:id/edit"
          element={<VaccineFormPage mode="edit" />}
        />
        <Route path="staff" element={<StaffPage />} />
        <Route path="login" element={<LoginPage />} />
        <Route path="*" element={<NotFoundPage />} />
      </Route>
    </Routes>
  );
}
