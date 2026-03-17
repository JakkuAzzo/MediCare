import express from "express";
import cors from "cors";
import dotenv from "dotenv";

import clinicRoutes from "./routes/clinicRoutes.js";
import patientRoutes from "./routes/patientRoutes.js";
import appointmentRoutes from "./routes/appointmentRoutes.js";
import staffRoutes from "./routes/staffRoutes.js";
import vaccineRoutes from "./routes/vaccineRoutes.js";

dotenv.config();

const app = express();

app.use(
  cors({
    origin: process.env.FRONTEND_URL || "http://localhost:5173"
  })
);

app.use(express.json());

app.get("/api/health", (req, res) => {
  res.json({ message: "Travel Jabs API is running" });
});

app.use("/api/clinics", clinicRoutes);
app.use("/api/patients", patientRoutes);
app.use("/api/appointments", appointmentRoutes);
app.use("/api/staff", staffRoutes);
app.use("/api/vaccines", vaccineRoutes);

export default app;
