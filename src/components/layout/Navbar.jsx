import { Link, useNavigate } from "react-router-dom";
import { useAuth } from "../../context/AuthContext";

export default function Navbar() {
  const { user, logout } = useAuth();
  const navigate = useNavigate();

  const handleLogout = async () => {
    await logout();
    navigate("/login");
  };

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
          {user && (
            <li className="nav-item">
              <span className="nav-user">
                {user.name || user.email || "User"}
              </span>
            </li>
          )}
          <li className="nav-item">
            {user ? (
              <button onClick={handleLogout} className="nav-link btn-logout">
                Logout
              </button>
            ) : (
              <Link to="/login" className="nav-link">
                Login
              </Link>
            )}
          </li>
        </ul>
      </div>
    </nav>
  );
}
