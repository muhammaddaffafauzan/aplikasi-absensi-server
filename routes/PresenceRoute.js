import express from "express";
import {
    getPresence,
    getPresenceById,
    savePresence,
    updatePresence,
    deletePresence
} from "../controllers/PresenceController.js";
import { verifyUser } from "../middleware/AuthUser.js";
const router = express.Router();

router.get('/api/v1/employee/presence', verifyUser, getPresence);
router.get('/api/v1/employee/presence/:id', verifyUser, getPresenceById);
router.post('/api/v1/employee/presence/save', verifyUser, savePresence);
router.patch('/api/v1/employee/presence/update/:id', verifyUser, updatePresence);
router.delete('/api/v1/employee/presence/delete/:id', verifyUser, deletePresence);

export default router;