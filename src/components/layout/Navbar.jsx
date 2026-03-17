import { Link } from "react-router-dom";

export default function Navbar() {
  return (
    <nav className="navbar">
      <div className="navbar-container">
        <Link to="/" className="navbar-brand">
          Travel Jabs
        </Link>
        <ul className="nav-menu">
          <li className="nav-item">
            <Link to="/" className="nav-link">
              Dashboard
            </Link>
          </li>
          <li className="nav-item">
            <Link to="/clinics" className="nav-link">
              Clinics
            </Link>
          </li>
          <li className="nav-item">
            <Link to="/patients" className="nav-link">
              Patients
            </Link>
          </li>
          <li className="nav-item">
            <Link to="/appointments" className="nav-link">
              Appointments
            </Link>
          </li>
          <li className="nav-item">
            <Link to="/vaccines" className="nav-link">
              Vaccines
            </Link>
          </li>
          <li className="nav-item">
            <Link to="/staff" className="nav-link">
              Staff
            </Link>
          </li>
          <li className="nav-item">
            <Link to="/login" className="nav-link">
              Login
            </Link>
          </li>
        </ul>
      </div>
    </nav>
  );
}
