import { Sequelize } from "sequelize";
import db from "../config/Database.js";

const {DataTypes} = Sequelize;

const Company = db.define('Company',{
    nama: DataTypes.STRING,
    lokasi: DataTypes.STRING,
    jam_buka: DataTypes.TIME,
    jam_tutup: DataTypes.TIME,
    status:{
        type: DataTypes.BOOLEAN,
        defaultValue: false,
    },
},{
    freezeTableName: true
});


export default Company;