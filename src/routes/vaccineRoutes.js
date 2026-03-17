import express from "express";
import {
  getAllVaccines,
  getVaccineById,
  createVaccine,
  updateVaccine,
  deleteVaccine
} from "../controllers/vaccineController.js";
import { validateVaccine } from "../validators/vaccineValidator.js";

const router = express.Router();

router.get("/", getAllVaccines);
router.get("/:id", getVaccineById);
router.post("/", validateVaccine, createVaccine);
router.put("/:id", validateVaccine, updateVaccine);
router.delete("/:id", deleteVaccine);

export default router;
