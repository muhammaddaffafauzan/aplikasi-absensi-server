import Employee from "../models/EmployeesModel.js";
import path from "path";
import User from "../models/UsersModel.js";

export const getEmployee = async(req, res)=>{
    try {
        let response;
        if(req.role === "admin"){
            response = await Employee.findAll({
                include: [{
                    model: User
                }]
            });
        }else{
            response = await Employee.findAll({
                where: {
                    userId: req.userId
                },
                include: [{
                    model: User
                }]
            });
        }
        res.status(200).json(response);
    } catch (error) {
        console.log(error)
    }
}

export const getEmployeeById = async(req, res)=>{
    try {
        let response;
        if(req.role === "admin", "user"){
            response = await Employee.findOne({
                include: [{
                    model: User
                }],
                where:{
                    uuid : req.params.id
                }
            });
        }else{
            response = await Employee.findOne({
                where: {
                    uuid: req.params.id,
                    userId: req.userId
                },
                include: [{
                    model: User
                }]
            });
        }
        res.json(response);
    } catch (error) {
        console.log(error)
    }
}

export const saveEmployee = async(req, res)=>{
    if(req.files === null) return res.status(400).json({msg: "No File Uploaded"});
    const nip = req.body.nip;
    const name = req.body.nama;
    const tmp = req.body.tmp_tgl_lahir;
    const jk = req.body.jenis_kelamin;
    const agama = req.body.agama;
    const alamat = req.body.alamat;
    const hp = req.body.no_hp;
    const jabatan = req.body.jabatan;
    const user = req.body.userId

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
          await Employee.create({
           nip: nip, nama: name, tmp_tgl_lahir: tmp, jenis_kelamin: jk, agama: agama, alamat: alamat, no_hp: hp, jabatan: jabatan, image: fileName, url: url, userId: user
        });
       
        res.status(201).json({msg: "Employee Created Successfully"});
    } catch (error) {
        console.log(error)
    }
}

// export const updatePropertis = async(req, res)=>{
//     const property = await Property.findOne({
//         where:{
//             id : req.params.id
//         }
//     });
//     if(!property) return res.status(404).json({msg: "No data Found"});
//     let fileName = "";
//     if(req.files === null){
//         fileName = property.image;
//     }else{
//         const file = req.files.file;
//         const fileSize = file.data.length;
//         const ext = path.extname(file.name);
//         const fileName = file.md5 + ext;
//         const allowedType = ['.png', '.jpg', 'jpeg'];

//         if(!allowedType.includes(ext.toLocaleLowerCase())) return res.status(422).json({msg: "Invalid Image"});
//         if(fileSize > 5000000) return res.status(422).json({msg: "Image must be less than 5MB"});
        
//         const filepath = `./public/images/${property.image}`;
//         fs.unlinkSync(filepath);    

//         file.mv(`./public/images/${fileName}`, (err)=>{
//             if(err) return res.status(500).json({msg: err.message});
//         });
//     }
//     const name = req.body.title;
//     const url = `${req.protocol}://${req.get("host")}/images/${fileName}`;
//     try {
//         await Property.update({name: name, image: fileName, url: url},{
//             where:{
//                 id: req.params.id
//             }
//         });
//         res.status(200).json({msg: "Product Updated successfully"});
//     } catch (error) {
//         console.log(error.message)
//     }
// }

export const deleteEmployee = async(req, res)=>{
        const employee = await Employee.findOne({
            where:{
                uuid : req.params.id
            }
        });
        if(!employee) return res.status(404).json({msg: "No data Found"});
        try {
           
            await Employee.destroy({
                where:{
                    id : employee.id
                }
            });
            res.status(200).json({msg: "Employee Deleted Successfully"})
        } catch (error) {
            console.log(error)
        }
   
}