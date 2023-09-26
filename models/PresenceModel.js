import { Sequelize } from "sequelize";
import db from "../config/Database.js";
import Employee from "./EmployeesModel.js";


const {DataTypes} = Sequelize;

const Presence = db.define('Employee_Presence',{
    uuid:{
        type: DataTypes.STRING,
        defaultValue: DataTypes.UUIDV4,
        allowNull: false,
        validate: {
            notEmpty: true
        }
    },
    employeeId:{
        type: DataTypes.INTEGER,
        allowNull: false,
        validate: {
            notEmpty: true
        }
    },
    tgl_absen: DataTypes.STRING,
    masuk: DataTypes.STRING,
    pulang: DataTypes.STRING,
    image: DataTypes.STRING,
    url: DataTypes.STRING
},{
    freezeTableName:true
});

Employee.hasMany(Presence);
Presence.belongsTo(Employee, {foreignKey: 'employeeId'})

export default Presence;    
