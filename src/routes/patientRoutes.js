import express from "express";
import {
  getAllPatients,
  getPatientById,
  createPatient,
  updatePatient,
  deletePatient
} from "../controllers/patientController.js";
import { validatePatient } from "../validators/patientValidator.js";

const router = express.Router();

router.get("/", getAllPatients);
router.get("/:id", getPatientById);
router.post("/", validatePatient, createPatient);
router.put("/:id", validatePatient, updatePatient);
router.delete("/:id", deletePatient);

export default router;
