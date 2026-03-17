import { useState } from "react";
import { useNavigate, Link, useSearchParams } from "react-router-dom";
import { useAuth } from "../context/AuthContext";
import ErrorMessage from "../components/common/ErrorMessage";

export default function LoginPage() {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState(null);
  const [isLoading, setIsLoading] = useState(false);
  const [searchParams] = useSearchParams();
  const { login } = useAuth();
  const navigate = useNavigate();
  const signupSuccess = searchParams.get("signup") === "success";

  const handleSubmit = async (e) => {
    e.preventDefault();
    setError(null);

    if (!email || !password) {
      setError("Please enter both email and password");
      return;
    }

    try {
      setIsLoading(true);
      await login(email, password);
      navigate("/");
    } catch (err) {
      setError(err.message);
    } finally {
      setIsLoading(false);
    }
  };

  return (
    <div className="login-container">
      <div className="login-box">
        <h1>Travel Jabs</h1>
        <p className="login-subtitle">Vaccination Management System</p>

        {signupSuccess && (
          <div className="success-message">
            <p>
              ✓ Account created successfully! Please log in with your
              credentials.
            </p>
          </div>
        )}

        {error && <ErrorMessage message={error} />}

        <form onSubmit={handleSubmit} className="form">
          <div className="form-group">
            <label htmlFor="email">Email</label>
            <input
              type="email"
              id="email"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              placeholder="Enter your email"
              disabled={isLoading}
              required
            />
          </div>

          <div className="form-group">
            <label htmlFor="password">Password</label>
            <input
              type="password"
              id="password"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              placeholder="Enter your password"
              disabled={isLoading}
              required
            />
          </div>

          <button
            type="submit"
            className="btn btn-primary btn-block"
            disabled={isLoading}
          >
            {isLoading ? "Logging in..." : "Login"}
          </button>
        </form>

        <div className="auth-links">
          <p>
            <Link to="/forgot-password">Forgot Password?</Link>
          </p>
          <p>
            Don't have an account? <Link to="/signup">Sign up here</Link>
          </p>
        </div>

        <p className="login-footer">
          Demo credentials: Use your registered account to login
        </p>
      </div>
    </div>
  );
}
