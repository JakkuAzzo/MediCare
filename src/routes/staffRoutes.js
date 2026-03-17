import express from "express";
import {
  getAllStaff,
  getStaffById,
  createStaff,
  updateStaff,
  deleteStaff
} from "../controllers/staffController.js";
import { validateStaff } from "../validators/staffValidator.js";

const router = express.Router();

router.get("/", getAllStaff);
router.get("/:id", getStaffById);
router.post("/", validateStaff, createStaff);
router.put("/:id", validateStaff, updateStaff);
router.delete("/:id", deleteStaff);

export default router;
