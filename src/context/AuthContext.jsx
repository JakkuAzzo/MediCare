import { createContext, useContext, useState, useEffect } from "react";
import BASE_URL from "../config/api.js";

export const AuthContext = createContext();

export function AuthProvider({ children }) {
  const [user, setUser] = useState(null);
  const [loading, setLoading] = useState(true);
  const [authError, setAuthError] = useState(null);

  // Check authentication status on app load
  useEffect(() => {
    checkAuth();
  }, []);

  async function checkAuth() {
    const token = localStorage.getItem("authToken");
    if (!token) {
      setLoading(false);
      return;
    }

    try {
      const response = await fetch(`${BASE_URL}/auth/me`, {
        method: "GET",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${token}`
        }
      });

      if (response.ok) {
        const userData = await response.json();
        setUser(userData);
      } else {
        // Token invalid or expired
        localStorage.removeItem("authToken");
        setUser(null);
      }
    } catch (err) {
      console.error("Auth check failed:", err);
      localStorage.removeItem("authToken");
      setUser(null);
    } finally {
      setLoading(false);
    }
  }

  async function login(email, password) {
    try {
      setAuthError(null);
      const response = await fetch(`${BASE_URL}/auth/login`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json"
        },
        body: JSON.stringify({ email, password })
      });

      if (!response.ok) {
        const errorData = await response.json().catch(() => ({}));
        throw new Error(
          errorData.message || "Login failed. Please check your credentials."
        );
      }

      const data = await response.json();
      localStorage.setItem("authToken", data.token);
      setUser(data.user || data);
      return data;
    } catch (err) {
      setAuthError(err.message);
      throw err;
    }
  }

  async function logout() {
    try {
      const token = localStorage.getItem("authToken");
      if (token) {
        await fetch(`${BASE_URL}/auth/logout`, {
          method: "POST",
          headers: {
            Authorization: `Bearer ${token}`,
            "Content-Type": "application/json"
          }
        }).catch((err) => console.error("Logout request failed:", err));
      }
    } finally {
      localStorage.removeItem("authToken");
      setUser(null);
      setAuthError(null);
    }
  }

  return (
    <AuthContext.Provider value={{ user, loading, authError, login, logout }}>
      {children}
    </AuthContext.Provider>
  );
}

export function useAuth() {
  const context = useContext(AuthContext);
  if (!context) {
    throw new Error("useAuth must be used within AuthProvider");
  }
  return context;
}
