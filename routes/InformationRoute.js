import express from "express";
import {
    getInformation,
    getInformationById,
    sendInformation,
    deleteInformation
} from "../controllers/InformationController.js";
import { verifyUser, verifyToken, adminOnly } from "../middleware/AuthUser.js";
const router = express.Router();

router.get('/api/v1/employee/information', verifyUser, verifyToken, getInformation);
router.get('/api/v1/employee/information/:id', verifyUser, verifyToken, getInformationById);
router.post('/api/v1/employee/information/send', verifyUser, verifyToken, sendInformation);
router.delete('/api/v1/employee/information/delete/:id', verifyUser, verifyToken, adminOnly, deleteInformation);

export default router;