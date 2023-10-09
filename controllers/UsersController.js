import User from "../models/UsersModel.js";
import argon2 from "argon2";


export const getUsers = async(req, res) => {
    try {
        let response;
        if(req.role === 'admin')
        { 
            response = await User.findAll({
            attributes: ['id','uuid', 'name', 'email', 'role']
        });
    }else{
       console.log(error.message)
    }
        res.status(200).json(response);
    } catch (error) {
        res.status(500).json({msg: error.message});
    }
}
export const getUsersById = async(req, res) => {
    try {
        const response = await User.findOne({
            attributes: ['uuid', 'name', 'email', 'role'],
              where: {
                uuid: req.params.id
              }
        });
        res.status(200).json(response);
    } catch (error) {
        res.status(500).json({msg: error.message});
    }
}
export const createUsers = async(req, res) => {
    const {name, email, password, confPassword, role} = req.body;
    if(password !== confPassword) return res.status(400).json({msg: "Password dan ConfirmPassword Tidak Cocok"});
    const hashPassword = await argon2.hash(password);
    try {
        await User.create({
            name: name,
            email: email,
            password: hashPassword,
            role: 'admin'
        });
        res.status(201).json({msg: "register berhasil"})
    } catch (error) {
        res.status(400).json({msg: error.message});
    }
}
export const updateUsers = async(req, res) => {
    const user = await User.findOne({
          where: {
            uuid: req.params.id
          }
    });
    if(!user) return res.status(404).json({msg: "user tidak ditemukan"});
    const {name, email, password, confPassword, role} = req.body;
    let hashPassword;
    if (password === "" || password === null) {
        hashPassword = user.pas
    }else{
        hashPassword = await argon2.hash(password);
    }
    if(password !== confPassword) return res.status(400).json({msg: "Password dan ConfirmPassword Tidak Cocok"});
    try {
        await User.update({
            name: name,
            email: email,
            password: hashPassword,
            role: 'admin'
        },{
            where: {
               id: user.id
            }
        });
        res.status(200).json({msg: "Users Updated"})
    } catch (error) {
        res.status(400).json({msg: error.message});
    }
}
export const deleteUsers = async(req, res) => {
    const user = await User.findOne({
        where: {
          uuid: req.params.id
        }
  });
  if(!user) return res.status(404).json({msg: "user tidak ditemukan"});
  try {
      await User.destroy({
          where: {
             id: user.id
          }
      });
      res.status(200).json({msg: "Users deleted"})
  } catch (error) {
      res.status(400).json({msg: error.message});
  }
}