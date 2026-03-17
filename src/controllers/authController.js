import bcrypt from "bcryptjs";
import crypto from "node:crypto";
import jwt from "jsonwebtoken";
import * as authModel from "../models/authModel.js";

const RESET_TOKEN_TTL_MINUTES = Number(process.env.RESET_TOKEN_TTL_MINUTES || 60);
const JWT_SECRET = process.env.AUTH_JWT_SECRET || "traveljabs-dev-secret";
const JWT_EXPIRES_IN = process.env.AUTH_JWT_EXPIRES_IN || "7d";

function getBearerToken(req) {
  const authHeader = req.headers.authorization || "";
  if (!authHeader.startsWith("Bearer ")) {
    return null;
  }
  return authHeader.slice("Bearer ".length);
}

export async function signup(req, res) {
  try {
    await authModel.ensureUsersTable();

    const email = req.body.email.toLowerCase().trim();
    const firstName = req.body.firstName.trim();
    const lastName = req.body.lastName.trim();

    const existingUser = await authModel.findUserByEmail(email);

    if (existingUser) {
      return res.status(409).json({ message: "An account with this email already exists" });
    }

    const passwordHash = await bcrypt.hash(req.body.password, 10);

    const createdUser = await authModel.createUser({
      email,
      passwordHash,
      firstName,
      lastName
    });

    return res.status(201).json({
      message: "Signup successful",
      user: createdUser
    });
  } catch (error) {
    console.error("Signup error:", error);
    return res.status(500).json({ message: "Failed to create account" });
  }
}

export async function forgotPassword(req, res) {
  try {
    await authModel.ensureUsersTable();

    const email = req.body.email.toLowerCase().trim();
    const user = await authModel.findUserByEmail(email);

    if (user) {
      const resetToken = crypto.randomBytes(32).toString("hex");
      const resetTokenExpiresAt = new Date(Date.now() + RESET_TOKEN_TTL_MINUTES * 60 * 1000);

      await authModel.savePasswordResetToken({
        userId: user.UserID,
        resetToken,
        resetTokenExpiresAt
      });
    }

    return res.status(200).json({
      message:
        "If an account with this email exists, password reset instructions have been sent."
    });
  } catch (error) {
    console.error("Forgot password error:", error);
    return res.status(500).json({ message: "Failed to process forgot password request" });
  }
}

export async function login(req, res) {
  try {
    await authModel.ensureUsersTable();

    const email = req.body.email.toLowerCase().trim();
    const user = await authModel.findUserByEmail(email);

    if (!user) {
      return res.status(401).json({ message: "Invalid email or password" });
    }

    const isPasswordValid = await bcrypt.compare(req.body.password, user.PasswordHash);

    if (!isPasswordValid) {
      return res.status(401).json({ message: "Invalid email or password" });
    }

    const token = jwt.sign({ userId: user.UserID }, JWT_SECRET, {
      expiresIn: JWT_EXPIRES_IN
    });

    return res.json({
      token,
      user: {
        UserID: user.UserID,
        Email: user.Email,
        FirstName: user.FirstName,
        LastName: user.LastName,
        CreatedAt: user.CreatedAt
      }
    });
  } catch (error) {
    console.error("Login error:", error);
    return res.status(500).json({ message: "Login failed" });
  }
}

export async function me(req, res) {
  try {
    const token = getBearerToken(req);

    if (!token) {
      return res.status(401).json({ message: "Unauthorized" });
    }

    const payload = jwt.verify(token, JWT_SECRET);
    const user = await authModel.findUserById(payload.userId);

    if (!user) {
      return res.status(401).json({ message: "Unauthorized" });
    }

    return res.json(user);
  } catch (error) {
    return res.status(401).json({ message: "Unauthorized" });
  }
}

export async function logout(req, res) {
  return res.status(200).json({ message: "Logged out" });
}
