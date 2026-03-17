import { Routes, Route, Navigate } from "react-router-dom";
import { useAuth } from "./context/AuthContext";
import ProtectedRoute from "./components/ProtectedRoute";
import LoadingMessage from "./components/common/LoadingMessage";
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
import SignupPage from "./pages/SignupPage";
import ForgotPasswordPage from "./pages/ForgotPasswordPage";
import NotFoundPage from "./pages/NotFoundPage";

function AppContent() {
  const { loading } = useAuth();

  if (loading) {
    return (
      <div className="page">
        <LoadingMessage />
      </div>
    );
  }

  return (
    <Routes>
      <Route path="/login" element={<LoginPage />} />
      <Route path="/signup" element={<SignupPage />} />
      <Route path="/forgot-password" element={<ForgotPasswordPage />} />

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
        <Route path="*" element={<NotFoundPage />} />
      </Route>

      <Route path="*" element={<Navigate to="/login" replace />} />
    </Routes>
  );
}

export default function App() {
  return <AppContent />;
}
