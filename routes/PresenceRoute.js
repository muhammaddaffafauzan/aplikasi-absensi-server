import express from "express";
import {
    getPresence,
    getAllPresenceByUserId,
    savePresence,
    outPresence,
    deletePresence
} from "../controllers/PresenceController.js";
import { verifyUser, verifyToken, adminOnly } from "../middleware/AuthUser.js";
const router = express.Router();

router.get('/api/v1/employee/presence/get', verifyUser, getPresence);
router.get('/api/v1/employee/presence/:userId', verifyUser, adminOnly, getAllPresenceByUserId);
router.post('/api/v1/employee/presence/in', verifyUser, verifyToken, savePresence);
router.patch('/api/v1/employee/presence/out', verifyUser, verifyToken, outPresence);
router.delete('/api/v1/employee/presence/delete/:id', verifyUser, verifyToken, adminOnly, deletePresence);

export default router;