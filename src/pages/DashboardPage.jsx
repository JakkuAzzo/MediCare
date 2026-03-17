import { useAuth } from "../context/AuthContext";
import { Link } from "react-router-dom";

export default function DashboardPage() {
  const { user } = useAuth();

  return (
    <div className="page">
      <h1>Welcome to Travel Jabs</h1>
      {user && (
        <p className="subtitle">
          Hello {user.name || user.email}, welcome back!
        </p>
      )}

      <div className="dashboard-grid">
        <div className="dashboard-card">
          <h3>🏥 Clinics</h3>
          <p>Search and find convenient clinic locations</p>
          <Link to="/clinics" className="btn btn-primary">
            View Clinics
          </Link>
        </div>

        <div className="dashboard-card">
          <h3>👥 Patients</h3>
          <p>Manage patient accounts and information</p>
          <Link to="/patients" className="btn btn-primary">
            Manage Patients
          </Link>
        </div>

        <div className="dashboard-card">
          <h3>📅 Appointments</h3>
          <p>Schedule and manage vaccination appointments</p>
          <Link to="/appointments" className="btn btn-primary">
            View Appointments
          </Link>
        </div>

        <div className="dashboard-card">
          <h3>💉 Vaccines</h3>
          <p>View and manage vaccine information</p>
          <Link to="/vaccines" className="btn btn-primary">
            View Vaccines
          </Link>
        </div>

        <div className="dashboard-card">
          <h3>👨‍⚕️ Staff</h3>
          <p>View and manage staff members</p>
          <Link to="/staff" className="btn btn-primary">
            View Staff
          </Link>
        </div>
      </div>

      <div className="dashboard-info">
        <h2>Quick Stats</h2>
        <p>
          Use the navigation above to access different sections of the system.
        </p>
        <p className="text-muted">
          Vaccination management made simple and efficient.
        </p>
      </div>
    </div>
  );
}
