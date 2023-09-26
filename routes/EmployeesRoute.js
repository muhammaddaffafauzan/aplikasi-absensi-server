import express from "express";
import {
    getEmployee,
    getEmployeeById,
    saveEmployee,
    deleteEmployee
} from "../controllers/EmployeesController.js"
import { verifyUser } from "../middleware/AuthUser.js";
const router = express.Router();

router.get('/api/v1/employee', verifyUser, getEmployee);
router.get('/api/v1/employee/:id', verifyUser, getEmployeeById);
router.post('/api/v1/employee/create', verifyUser, saveEmployee);
router.delete('/api/v1/employee/delete/:id', verifyUser, deleteEmployee);

export default router;