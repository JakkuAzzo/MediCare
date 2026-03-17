import { useState } from "react";
import { useNavigate, Link } from "react-router-dom";
import ErrorMessage from "../components/common/ErrorMessage";

export default function ForgotPasswordPage() {
  const [email, setEmail] = useState("");
  const [error, setError] = useState(null);
  const [success, setSuccess] = useState(false);
  const [isLoading, setIsLoading] = useState(false);
  const navigate = useNavigate();

  const handleSubmit = async (e) => {
    e.preventDefault();
    setError(null);
    setSuccess(false);

    if (!email) {
      setError("Please enter your email address");
      return;
    }

    try {
      setIsLoading(true);
      // Call forgot password endpoint (adjust URL based on your backend)
      const response = await fetch(
        "http://localhost:3000/api/auth/forgot-password",
        {
          method: "POST",
          headers: {
            "Content-Type": "application/json"
          },
          body: JSON.stringify({ email })
        }
      );

      if (!response.ok) {
        const data = await response.json();
        throw new Error(
          data.message || `Request failed: ${response.statusText}`
        );
      }

      setSuccess(true);
      setEmail("");
      // Optionally redirect after a delay
      setTimeout(() => {
        navigate("/login");
      }, 3000);
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
        <p className="login-subtitle">Reset Password</p>

        {error && <ErrorMessage message={error} />}

        {success ? (
          <div className="success-message">
            <p>✓ Password reset instructions sent to your email!</p>
            <p className="text-muted">
              Check your inbox for a link to reset your password.
            </p>
            <p className="text-muted">Redirecting to login in 3 seconds...</p>
          </div>
        ) : (
          <form onSubmit={handleSubmit} className="form">
            <p className="form-help-text">
              Enter your email address and we'll send you instructions to reset
              your password.
            </p>

            <div className="form-group">
              <label htmlFor="email">Email Address</label>
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

            <button
              type="submit"
              className="btn btn-primary btn-block"
              disabled={isLoading}
            >
              {isLoading ? "Sending..." : "Send Reset Link"}
            </button>
          </form>
        )}

        <div className="auth-links">
          <p>
            <Link to="/login">← Back to Login</Link>
          </p>
          <p>
            Don't have an account? <Link to="/signup">Sign up here</Link>
          </p>
        </div>
      </div>
    </div>
  );
}
