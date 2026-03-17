import express from "express";
import {
  getAllAppointments,
  getAppointmentById,
  createAppointment,
  updateAppointment,
  deleteAppointment
} from "../controllers/appointmentController.js";
import { validateAppointment } from "../validators/appointmentValidator.js";

const router = express.Router();

router.get("/", getAllAppointments);
router.get("/:id", getAppointmentById);
router.post("/", validateAppointment, createAppointment);
router.put("/:id", validateAppointment, updateAppointment);
router.delete("/:id", deleteAppointment);

export default router;
