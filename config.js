var mysql = require('mysql')

exports.DB_CONN = mysql.createConnection({
    host:"localhost",
    user:"root",
    database:"qr_atttendance"
})