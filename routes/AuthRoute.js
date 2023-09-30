import express from "express";
import {Login, logout, Me} from "../controllers/AuthController.js";
import { verifyToken } from "../middleware/AuthUser.js";
const router = express.Router();

// router.get('/api/v1/auth/token', token);
router.get('/api/v1/auth/me', verifyToken, Me);
router.post('/api/v1/auth/login', verifyToken, Login);
router.delete('/api/v1/auth/logout', verifyToken, logout);

export default router;