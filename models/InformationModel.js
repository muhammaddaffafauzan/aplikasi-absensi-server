import { Sequelize } from "sequelize";
import db from "../config/Database.js";
import User from "./UsersModel.js";

const {DataTypes} = Sequelize;

const Information = db.define('Information',{
    userId:{
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

User.hasMany(Information);
Information.belongsTo(User, {foreignKey: 'userId'});


export default Information;    
