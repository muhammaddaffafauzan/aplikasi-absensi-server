import User from "../models/UsersModel.js";




export const verifyUser = async (req, res, next) =>{
    if(!req.session.userId){
        return res.status(401).json({msg: "Mohon login ke Akun Anda"});
    }
    const user = await User.findOne({
        where: {
          uuid: req.session.userId
        }
  });
  if(!user) return res.status(404).json({msg: "user tidak ditemukan"});
  req.userId = user.id; 
  req.role = user.role;
  next();
}

export const adminOnly = async (req, res, next) =>{
    if(!req.session.userId){
        return res.status(401).json({msg: "Mohon login ke Akun Anda"});
    }
    const user = await User.findOne({
        where: {
          uuid: req.session.userId
        }
  });
  if(!user) return res.status(404).json({msg: "user tidak ditemukan"});
  if(user.role !== "admin") return res.status(403).json({msg: "Akses terlarang"});
  
  next();
}