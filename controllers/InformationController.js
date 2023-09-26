import Information from "../models/InformationModel.js";
import path from "path";

export const getInformation = async(req, res)=>{
    try {
        let response;
        if(req.role === "admin"){
            response = await Information.findAll({
                include: [{
                    model: Information
                }]
            });
        }else{
            response = await Information.findAll({
                where: {
                    employeeId: req.employeeId
                },
                include: [{
                    model: Information
                }]
            });
        }
       res.status(200).json(response)
    } catch (error) {
        console.log(error)
    }
}

export const getInformationById = async(req, res) =>{
    try {
        const response = await Information.findOne({
              where: {
                id: req.params.id
              }
        });
        res.status(200).json(response);
    } catch (error) {
        res.status(500).json({msg: error.message});
    }
}

export const sendInformation = async(req, res) =>{
    if(req.files === null) return res.status(400).json({msg: "No File Uploaded"});
    const empId = req.body.employeeId;
    const ket = req.body.keterangan;
    const als = req.body.alasan;

    const file = req.files.file;
    const fileSize = file.data.length;
    const ext = path.extname(file.name);
    const fileName = file.md5 + ext;
    const url = `${req.protocol}://${req.get("host")}/images/${fileName}`;
    const allowedType = ['.png', '.jpg', 'jpeg'];

    if(!allowedType.includes(ext.toLocaleLowerCase())) return res.status(422).json({msg: "Invalid Image"});
    if(fileSize > 5000000) return res.status(422).json({msg: "Image must be less than 5MB"});
    
 
    file.mv(`./public/images/${fileName}`, async(err)=>{
        if(err) return res.status(500).json({msg: err.message});
    });
    try {
          await Information.create({
          employeeId: empId, keterangan: ket, alasan: als, image: fileName, url: url
        }); 
       
        res.status(201).json({msg: "Information send Successfully"});
    } catch (error) {
        console.log(error)
    }
}

export const deleteInformation = (req, res) =>{

}