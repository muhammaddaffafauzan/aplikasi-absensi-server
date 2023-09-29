import express from "express";
import {
    getCompany,
    createCompany,
    updateCompany
} from "../controllers/CompanyController.js";
import { adminOnly, verifyUser } from "../middleware/AuthUser.js";
const router = express.Router();

router.get('/api/v1/employee/company/get', verifyUser, adminOnly, getCompany);
router.post('/api/v1/employee/company/create', verifyUser, adminOnly,createCompany);
router.patch('/api/v1/employee/company/update/:id', verifyUser, adminOnly, updateCompany);

export default router;