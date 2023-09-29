import express from "express";
import { 
  getUsers,
  getUsersById,
  createUsers,
  updateUsers,
  deleteUsers
 } from "../controllers/UsersController.js";
import { verifyUser, adminOnly, verifyToken } from "../middleware/AuthUser.js";
const router = express.Router();

router.get('/api/v1/users', adminOnly, verifyUser, verifyToken, getUsers);
router.get('/api/v1/users/:id', adminOnly, verifyUser, verifyToken, getUsersById);
router.post('/api/v1/users/add', adminOnly, verifyUser,verifyToken,  createUsers);
router.patch('/api/v1/users/update/:id', adminOnly, verifyUser, verifyToken, updateUsers);
router.delete('/api/v1/users/destroy/:id', adminOnly, verifyUser, verifyToken, deleteUsers);

export default router;