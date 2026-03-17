import express from "express";
import {
	signup,
	forgotPassword,
	login,
	me,
	logout
} from "../controllers/authController.js";
import {
	validateSignup,
	validateForgotPassword,
	validateLogin
} from "../validators/authValidator.js";

const router = express.Router();

router.post("/signup", validateSignup, signup);
router.post("/forgot-password", validateForgotPassword, forgotPassword);
router.post("/login", validateLogin, login);
router.get("/me", me);
router.post("/logout", logout);

export default router;
