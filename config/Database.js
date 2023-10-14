import { Sequelize } from "sequelize";

const db = new Sequelize({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME,
    waitForConnections: true,
    connectionLimit: 10,
    queuelimit: 0,
});

export default db;