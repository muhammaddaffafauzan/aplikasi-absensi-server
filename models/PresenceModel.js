import { Sequelize } from "sequelize";
import db from "../config/Database.js";
import Employee from "./EmployeesModel.js";

const {DataTypes} = Sequelize;

const Presence = db.define('Presence',{
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
    url: DataTypes.STRING,
},{
    freezeTableName:true
});

Employee.hasMany(Presence);
Presence.belongsTo(Employee, {foreignKey: 'employeeId'});


    db.sync()
  .then(() => {
    console.log('Tabel berhasil dibuat.');
  })
  .catch((error) => {
    console.error('Gagal membuat tabel:', error);
  });

export default Presence;    
