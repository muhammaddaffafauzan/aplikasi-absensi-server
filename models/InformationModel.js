import { Sequelize } from "sequelize";
import db from "../config/Database.js";
import Employee from "./EmployeesModel.js";


const {DataTypes} = Sequelize;

const Information = db.define('Employee_Information',{
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
    keterangan: DataTypes.STRING,
    alasan: DataTypes.STRING,
    image: DataTypes.STRING,
    url: DataTypes.STRING
},{
    freezeTableName:true
});

Employee.hasMany(Information);
Information.belongsTo(Employee, {foreignKey: 'employeeId'})

export default Information;    
