const express = require('express')
const bodyParser = require("body-parser")
const cors = require("cors")
const { DB_CONN } = require('./config')
const { Router } = require('express')
const app = express()

const PORT = 4001

app.use(cors({origin:"*"}))
app.use(bodyParser.urlencoded({
    extended:true
}))
app.use(bodyParser.json())

app.get("/", (req, res)=>{
    res.send("hello irah")
})

app.post("/login", (req, res)=>{
    const email = req.body.email
    const password = req.body.password

    console.log("login data:",{email, password})
    const sql = "SELECT * FROM accounts WHERE email = ?"

    DB_CONN.query(sql,email,(err, result)=>{
        if(err){
            console.log(err)
            return res.sendStatus(500)
        }
        if(result.length === 0)return res.send({success:false, msg:"wrong email"})
        
        if(result[0].password !== password)return res.send({success:false, msg:"Password Incorrect!"})

        return res.send({success:true, msg:"Login Success!"})

    })
})
app.get("/getClasses", (req, res)=>{

    const sql = "SELECT * FROM class"
    DB_CONN.query(sql, (err, result)=>{
        if(err){
            console.log(err)
            res.sendStatus(500)
        }
        console.log(result)
        res.send(result)
    })
})
app.post("/addClass", (req, res)=>{
    const courseNum = req.body.courseNum
    const courseTitle = req.body.courseTitle
    const firstname = req.body.firstname
    const middlename = req.body.middlename
    const lastname = req.body.lastname

    let sql1 = "INSERT INTO instructors(firstname, middlename, lastname) VALUES(?,?,?)"

    DB_CONN.query(sql1,[firstname, middlename, lastname],(err, result)=>{
        if(err){
            console.log(err)
            res.send(500)
        }
        if(!result.insertId)return res.send({success:false, msg:"Error adding class"})

        let sql = "INSERT INTO class (course_title, course_number, instructor) VALUES(?,?,?)"

        DB_CONN.query(sql, [courseNum, courseTitle, result.insertId], (err1, result1)=>{
            if(err1) {
                console.log(err1)
                return res.send({success:false, msg:"Error adding class"})
            }
            console.log(result)
            res.send({success:true, msg:"Class added"})
        })

    })

})

app.post("/addStudent", (req, res)=>{
    const id = req.body.id
    const firstname = req.body.firstname
    const yearSection = req.body.yearSection
    const classId = req.body.classId
    const middlename = req.body.middlename
    const lastname = req.body.lastname
    
    let sql = "INSERT INTO students (student_id, firstname, middlename, lastname, year_section, class_id) VALUES(?,?,?,?,?,?)"

    DB_CONN.query(sql, [id, firstname, middlename, lastname, yearSection, classId], (err, result)=>{
        if(err) {
            console.log(err)
            return res.send({success:false, msg:"Error adding student"})
        }
        console.log(result)
        res.send({success:true, msg:"Student added"})
    })
})
app.post("/getStudents", (req, res)=>{
    const classId = req.body.classId

    const sql = "SELECT * FROM students WHERE class_id = ?"
    DB_CONN.query(sql,classId, (err, result)=>{
        if(err){
            console.log(err)
            res.sendStatus(500)
        }
        console.log(result)
        res.send(result)
    })
})
app.listen(PORT,()=>{
    console.log("Server is running in port"+PORT)
})

module.exports = app