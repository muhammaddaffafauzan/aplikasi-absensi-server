import express from "express";
import {
    getPosition,
    getPositionByid,
    createPosition,
    updatePosition,
    deletePosition
} from "../controllers/PositionController.js";
import { adminOnly, verifyUser, verifyToken } from "../middleware/AuthUser.js";
const router = express.Router();

router.get('/api/v1/employee/position/get', verifyUser, adminOnly, getPosition);
router.get('/api/v1/employee/position/:id', verifyUser, adminOnly, getPositionByid);
router.post('/api/v1/employee/position/create', verifyUser, adminOnly, verifyToken, createPosition);
router.patch('/api/v1/employee/position/update/:id', verifyUser, adminOnly, verifyToken, updatePosition);
router.delete('/api/v1/employee/position/delete/:id', verifyUser, adminOnly, verifyToken, deletePosition);

export default router;