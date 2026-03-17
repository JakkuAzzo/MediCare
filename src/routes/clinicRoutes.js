import express from "express";
import {
  getAllClinics,
  getClinicById,
  createClinic,
  updateClinic,
  deleteClinic
} from "../controllers/clinicController.js";
import { validateClinic } from "../validators/clinicValidator.js";

const router = express.Router();

router.get("/", getAllClinics);
router.get("/:id", getClinicById);
router.post("/", validateClinic, createClinic);
router.put("/:id", validateClinic, updateClinic);
router.delete("/:id", deleteClinic);

export default router;
