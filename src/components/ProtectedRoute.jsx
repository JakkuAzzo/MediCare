import { Navigate } from "react-router-dom";
import { useAuth } from "../context/AuthContext";
import LoadingMessage from "./common/LoadingMessage";

export default function ProtectedRoute({ children }) {
  const { user, loading } = useAuth();

  if (loading) {
    return (
      <div className="page">
        <LoadingMessage />
      </div>
    );
  }

  if (!user) {
    return <Navigate to="/login" replace />;
  }

  return children;
}
