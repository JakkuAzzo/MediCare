// API Configuration
const BASE_URL = import.meta.env.VITE_API_URL || "http://localhost:3000/api";

export default BASE_URL;

// Helper to include auth token in requests
export function getAuthHeaders() {
  const token = localStorage.getItem("authToken");
  return {
    "Content-Type": "application/json",
    ...(token && { Authorization: `Bearer ${token}` })
  };
}
