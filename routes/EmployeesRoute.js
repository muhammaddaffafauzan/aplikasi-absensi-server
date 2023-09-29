import express from "express";
import {
    getEmployee,
    getEmployeeById,
    saveEmployeeAndUser,
    deleteEmployee
} from "../controllers/EmployeesController.js"
import { verifyUser, verifyToken, adminOnly } from "../middleware/AuthUser.js";
const router = express.Router();

router.get('/api/v1/employee', verifyUser, verifyToken, getEmployee);
router.get('/api/v1/employee/:id', verifyUser, verifyToken, getEmployeeById);
router.post('/api/v1/employee/user/create', adminOnly, verifyUser, saveEmployeeAndUser);
router.delete('/api/v1/employee/delete/:id', adminOnly, verifyUser, deleteEmployee);

export default router;