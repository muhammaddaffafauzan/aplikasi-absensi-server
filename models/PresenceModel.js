import { Sequelize } from "sequelize";
import db from "../config/Database.js";
import User from "./UsersModel.js";

const {DataTypes} = Sequelize;

const Presence = db.define('Presence',{
    userId:{
        type: DataTypes.INTEGER,
        allowNull: false,
        validate: {
            notEmpty: true
        }
    },
    tgl_absen: DataTypes.DATE,
    masuk: DataTypes.TIME,
    pulang: DataTypes.TIME,
    image: DataTypes.STRING,
    url: DataTypes.STRING,
},{
    freezeTableName:true
});

User.hasMany(Presence);
Presence.belongsTo(User, {foreignKey: 'userId'});

export default Presence;    
