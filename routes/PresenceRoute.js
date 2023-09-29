import express from "express";
import {
    getPresence,
    getPresenceById,
    savePresence,
    outPresence,
    deletePresence
} from "../controllers/PresenceController.js";
import { verifyUser } from "../middleware/AuthUser.js";
const router = express.Router();

router.get('/api/v1/employee/presence/get', verifyUser, getPresence);
router.get('/api/v1/employee/presence/:id', verifyUser, getPresenceById);
router.post('/api/v1/employee/presence/in', verifyUser, savePresence);
router.patch('/api/v1/employee/presence/out', verifyUser, outPresence);
router.delete('/api/v1/employee/presence/delete/:id', verifyUser, deletePresence);

export default router;