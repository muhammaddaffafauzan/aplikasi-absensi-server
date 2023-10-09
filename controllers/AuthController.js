import User from "../models/UsersModel.js";
import argon2 from "argon2";
import jwt from "jsonwebtoken";

export const Login = async (req, res) =>{
    const user = await User.findOne({
        where: {
          email: req.body.email
        }
  });
  if(!user) return res.status(404).json({msg: "user tidak ditemukan"});
  const match = await argon2.verify(user.password, req.body.password);
  if(!match) return res.status(400).json({msg: "Wrong password"});
  req.session.userId = user.uuid;
  const uuid = user.id;
  const name = user.name;
  const email = user.email;
  const role = user.role;
  res.status(200).json({uuid, name, email, role});
}

export const Me = async(req, res) => {  
    if(!req.session.userId){
        return res.status(401).json({msg: "Mohon login ke Akun Anda"});
    }
    const user = await User.findOne({
        attributes: [ 'uuid', 'name', 'email', 'role', 'refresh_token'],
        where: {
          uuid: req.session.userId
        }
  });
  if(!user) return res.status(404).json({msg: "user tidak ditemukan"});
  res.status(200).json(user);
}

// export const token = async(req, res) => {
//   try {
//     const refreshtoken = req.cookies.refreshtoken;
//     if(!refreshtoken) return res.sendStatus(401);
//     const user =  await User.findAll({
//       where: {
//         refresh_token: refreshtoken
//       }
//     });
//     if(!user[0]) return res.sendStatus(401);
//     jwt.verify(refreshtoken, process.env.REFRESH_TOKEN_SECRET, (err, decoded) => {
//       if(err) return res.sendStatus(403);
//       const userId = user[0].uuid;
//       const name = user[0].name;
//       const email = user[0].email;
//       const accesstoken = jwt.sign({userId, name, email}, process.env.ACCESS_TOKEN_SECRET);
//       res.json({ accesstoken });
//     })
//   } catch (error) {
//     console.log(error.message);
//   }
// }

export const logout = (req, res) => {
    req.session.destroy((err)=>{
        if(err) return res.status(400).json({msg: "Tidak dapat logout"});
        res.status(200).json({msg: "Anda telah Logout"})
    });
}