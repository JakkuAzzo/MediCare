import express from "express";
import {
  getAllClinics,
  getClinicById,
  createClinic,
  updateClinic,
  deleteClinic
} from "../controllers/clinicController.js";

const router = express.Router();

router.get("/", getAllClinics);
router.get("/:id", getClinicById);
router.post("/", createClinic);
router.put("/:id", updateClinic);
router.delete("/:id", deleteClinic);

export default router;
