const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");
const { DB_CONN } = require("./config");
const { Router } = require("express");
const app = express();

const PORT = 4001;

app.use(cors({ origin: "*" }));
app.use(
  bodyParser.urlencoded({
    extended: true,
  })
);
app.use(bodyParser.json());

app.get("/", (req, res) => {
  res.send("hello irah");
});
app.post("/register", (req, res) => {
  const firstname = req.body.firstname;
  const middlename = req.body.middlename;
  const lastname = req.body.lastname;
  const email = req.body.email;
  const password = req.body.password;

  let sql =
    "INSERT INTO instructors (firstname, middlename, lastname, email, password) VALUES(?,?,?,?,?)";

  DB_CONN.query(
    sql,
    [firstname, middlename, lastname, email, password],
    (err, result) => {
      if (err) {
        console.log(err);
        return res.sendStatus(500);
      }
      console.log(result);
      if (result.insertId)
        return res.send({ success: true, msg: "Registration Success!" });
      return res.send({ success: false, msg: "Registration Failed!" });
    }
  );
});
app.post("/login", (req, res) => {
  const email = req.body.email;
  const password = req.body.password;

  console.log("login data:", { email, password });
  const sql = "SELECT * FROM instructors WHERE email = ?";

  DB_CONN.query(sql, email, (err, result) => {
    if (err) {
      console.log(err);
      return res.sendStatus(500);
    }
    if (result.length === 0)
      return res.send({ success: false, msg: "wrong email" });

    if (result[0].password !== password)
      return res.send({ success: false, msg: "Password Incorrect!" });

    return res.send({ success: true, msg: "Login Success!", data: result[0] });
  });
});
app.post("/deleteStudent", (req, res) => {
  const studentId = req.body.studentId;

  let sql = "DELETE FROM students WHERE student_id = ?";

  DB_CONN.query(sql, studentId, (err, result) => {
    if (err) {
      res.send({ success: false });
      throw err;
    }
    res.send({ success: true });
  });
});
app.post("/deleteClass", (req, res) => {
  const id = req.body.id;
  console.log(id);

  let sql = "DELETE FROM subjects WHERE id = ?";

  DB_CONN.query(sql, id, (err, result) => {
    if (err) {
      res.send({ success: false });
      throw err;
    }
    console.log(result);
    res.send({ success: true });
  });
});
app.post("/unenroll", (req, res) => {
  const classId = req.body.classId;
  const studentId = req.body.studentId;

  let sql = "DELETE FROM classes WHERE course_number = ? and student_id = ?";

  DB_CONN.query(sql, [classId, studentId], (err, result) => {
    if (err) {
      res.send({ success: false });
      throw err;
    }
    console.log(result);
    res.send({ success: true });
  });
});
app.get("/getSubjects/:email", (req, res) => {
  const email = req.params.email;

  const sql =
    "SELECT subjects.*, instructors.firstname, instructors.middlename, instructors.lastname FROM subjects INNER JOIN instructors ON subjects.instructor = instructors.email WHERE subjects.instructor = ? GROUP BY subjects.id";
  DB_CONN.query(sql, email, (err, result) => {
    if (err) {
      console.log(err);
      res.sendStatus(500);
    }
    console.log(result);
    res.send(result);
  });
});
app.get("/getClasses/:email/:classId", (req, res) => {
  const email = req.params.email;
  const classId = req.params.classId

  const sql = 'SELECT CONCAT(students.course , " ", students.year, " ", students.section )as yearsection FROM students INNER JOIN classes ON students.student_id = classes.student_id INNER JOIN subjects on classes.course_number = subjects.course_number WHERE classes.course_number = ? AND subjects.instructor = ? GROUP BY yearsection';
  DB_CONN.query(sql, [classId,email], (err, result) => {
    if (err) {
      console.log(err);
      res.sendStatus(500);
    }
    console.log(result);
    res.send(result);
  });
});
app.post("/addClass", (req, res) => {
  const courseNumber = req.body.courseNumber;
  const courseTitle = req.body.courseTitle;
  const semester = req.body.semester;
  const schoolYear = req.body.schoolYear;
  const email = req.body.email;

  let sql =
    "INSERT INTO subjects (course_title, course_number, semester, school_year, instructor) VALUES(?,?,?,?,?)";

  DB_CONN.query(
    sql,
    [courseTitle, courseNumber, semester, schoolYear, email],
    (err1, result) => {
      if (err1) {
        console.log(err1);
        return res.send({ success: false, msg: "Error adding class" });
      }
      console.log(result);
      let classSql =
        " SELECT subjects.*, instructors.firstname, instructors.middlename, instructors.lastname FROM subjects INNER JOIN instructors ON subjects.instructor = instructors.email WHERE subjects.id = ?  GROUP BY subjects.id";

      DB_CONN.query(classSql, [result.insertId], (err, result1) => {
        if (err) {
          console.log(err);
          return res.send({ success: false, msg: "Database error" });
        }
        res.send({ success: true, data: result1[0] });
      });
    }
  );
});
app.post("/editClass/:id", (req, res) => {
  const courseNumber = req.body.courseNumber;
  const courseTitle = req.body.courseTitle;
  const semester = req.body.semester;
  const schoolYear = req.body.schoolYear;
  const email = req.body.email;

  const id = req.params.id;

  let sql =
    "UPDATE subjects SET course_title=?, course_number=?, semester=?, school_year=?, instructor=? WHERE id=?";

  DB_CONN.query(
    sql,
    [courseTitle, courseNumber, semester, schoolYear, email, id],
    (err1, result) => {
      if (err1) {
        res.send({ succes: false });
        throw err1;
      }
      res.send({ success: true });
    }
  );
});
app.post("/getAttendanceToday", (req, res) => {
  const classId = req.body.classId;
  sql =
    "SELECT students.* FROM `attendance` INNER JOIN students ON students.student_id = attendance.student_id WHERE attendance.course_id = ?";
  DB_CONN.query(sql, classId, (err, result) => {
    if (err) {
      console.log(err);
      res.sendStatus(500);
    }
    console.log(" result", result);
    res.send(result);
  });
});

app.post("/addStudent", (req, res) => {
  const firstname = req.body.firstname;
  const course = req.body.course;
  const year = req.body.year;
  const section = req.body.section;
  const id = req.body.studentId.toUpperCase();
  const middlename = req.body.middlename;
  const lastname = req.body.lastname;
  const gender = req.body.gender;

  let sql =
    "INSERT INTO students (student_id, firstname, middlename, lastname,gender, course, year, section) VALUES(?,?,?,?,?,?,?,?)";

  DB_CONN.query(
    sql,
    [id, firstname, middlename, lastname, gender, course, year, section],
    (err, result) => {
      if (err) {
        console.log(err);
        if (err.errno === 1062)
          return res.send({ success: false, code: "duplicate" });
        return res.send({ success: false, msg: "Error adding student" });
      }
      console.log(result);
      if (result.insertId) return res.send({ success: true, code: "" });
      res.send({ success: false, code: "" });
    }
  );
});
app.post("/getStudents", (req, res) => {
  const classId = req.body.classId;

  const sql =
    "SELECT students.* FROM students INNER JOIN classes ON classes.student_id = students.student_id WHERE classes.course_number = ?";
  DB_CONN.query(sql, classId, (err, result) => {
    if (err) {
      console.log(err);
      res.sendStatus(500);
    }
    console.log(result);
    res.send(result);
  });
});
app.post("/getAllStudents", (req, res) => {
  const classId = req.body.classId;

  const sql = "SELECT * FROM students";
  DB_CONN.query(sql, (err, result) => {
    if (err) {
      console.log(err);
      res.sendStatus(500);
    }
    console.log(result);
    res.send(result);
  });
});
app.get("/searchStudent/:toSearch", (req, res) => {
  const toSearch = "%" + req.params.toSearch + "%";

  const sql =
    'SELECT CONCAT(firstname , " ", middlename, " ", lastname )as fullname, student_id, course, year, section FROM `students` WHERE CONCAT(firstname , " ", middlename, " ", lastname) LIKE ?';
  DB_CONN.query(sql, toSearch, (err, result) => {
    if (err) {
      console.log(err);
      res.sendStatus(500);
    }
    console.log(result);
    res.send(result);
  });
});
app.post("/enroll", (req, res) => {
  const studentId = req.body.studentId;
  const classId = req.body.classId;

  const checkEnrolled =
    "SELECT * FROM classes WHERE course_number = ? AND student_id = ?";
  DB_CONN.query(checkEnrolled, [classId, studentId], (err, result) => {
    if (err) {
      console.log(err);
      return res.send({ success: false, msg: "Error" });
    }
    if (result.length > 0) {
      return res.send({ succes: false, code: 11 });
    }
    const sql = "INSERT INTO classes(course_number, student_id) VALUES(?,?)";

    DB_CONN.query(sql, [classId, studentId], (err1, result1) => {
      if (err1) {
        console.log(err1);
        return res.send({ success: false, msg: "Error" });
      }
      console.log(result1);
      return res.send({ success: true });
    });
  });

});
app.post("/checkAttendace", (req, res) => {
  const studentId = req.body.id;
  const classId = req.body.classId;
  console.log(studentId, classId);

  function formatDate(date) {
    var d = new Date(date),
      month = "" + (d.getMonth() + 1),
      day = "" + d.getDate(),
      year = d.getFullYear();

    if (month.length < 2) month = "0" + month;
    if (day.length < 2) day = "0" + day;

    return [year, month, day].join("-");
  }

  const dateNow = new Date();
  const dateString = formatDate(dateNow);
  console.log(dateString);

  let checkDup =
    "SELECT * FROM attendance WHERE date ? AND student_id = ? AND course_id = ?";

  DB_CONN.query(checkDup,[dateString,studentId, classId],(dupErr, dupResult)=>{
    if (dupErr) {
      res.sendStatus(500);
      throw err
    }
    if(dupResult.length > 0)return res.send({succes:false, code:11})
    let sql =
    "SELECT * FROM students INNER JOIN classes on students.student_id = classes.student_id WHERE classes.course_number = ? AND classes.student_id = ?";

  DB_CONN.query(sql, [classId, studentId], (err, result) => {
    if (err) {
      res.sendStatus(500);
      throw err
    }
    if (result.length === 0)
      return res.send({ success: false, msg: "no data" });
    sql = "INSERT INTO attendance (date, course_id, student_id) VALUES (?,?,?)";

    DB_CONN.query(sql, [dateString, classId, studentId], (err1, result1) => {
      if (err) {
        res.sendStatus(500);
        throw err1
      }
    });
    return res.send({ success: true, result });
  });
  })

  
});

app.post("/getAttendance", (req, res) => {
  const classId = req.body.classId;

  const sql =
    "SELECT date_format(date, '%m-%d-%Y') as date, COUNT(student_id) as present  FROM attendance WHERE course_id = ? GROUP BY date ORDER BY date";

  DB_CONN.query(sql, classId, (err, result) => {
    if (err) {
      console.log(err);
      return res.send({ success: false, msg: "Database Error" });
    }
    console.log(result);
    res.send(result);
  });
});
app.post("/getClassAttendance", (req, res) => {
  const classId = req.body.classId;
  const yearSection = req.body.yearSection

  const sql =
    'SELECT date_format(date, "%m-%d-%Y") as date, COUNT(students.student_id) as present,CONCAT(students.course , " ", students.year, " ", students.section )as yearsection  FROM attendance INNER JOIN students on attendance.student_id = students.student_id WHERE attendance.course_id = ?  AND CONCAT(students.course , " ", students.year, " ", students.section ) = ? GROUP BY attendance.date ORDER BY attendance.date';

  DB_CONN.query(sql, [classId, yearSection], (err, result) => {
    if (err) {
      console.log(err);
      return res.send({ success: false, msg: "Database Error" });
    }
    console.log(result);
    res.send(result);
  });
});
app.post("/attendanceDetails", (req, res) => {
  const date = req.body.date;
  const classId = req.body.classId

  console.log(classId)
  const sql =
    "SELECT students.* FROM students INNER JOIN attendance ON students.student_id = attendance.student_id WHERE date_format(attendance.date, '%m-%d-%Y') = ? AND course_id = ?";
  DB_CONN.query(sql, [date,classId], (err, result) => {
    if (err) {
      console.log(err);
      return res.send({ success: false, msg: "Database Error" });
    }
    console.log(result);
    res.send(result);
  });
});
app.post("/classAttendanceDetails", (req, res) => {
  const date = req.body.date;
  const classId = req.body.classId
  const yearSection = req.body.yearSection

  console.log(classId)
  const sql =
    "SELECT students.* FROM students INNER JOIN attendance ON students.student_id = attendance.student_id WHERE date_format(attendance.date, '%m-%d-%Y') = ? AND course_id = ? AND CONCAT(students.course , ' ', students.year, ' ', students.section ) = ?";
  DB_CONN.query(sql, [date,classId,yearSection], (err, result) => {
    if (err) {
      console.log(err);
      return res.send({ success: false, msg: "Database Error" });
    }
    console.log(result);
    res.send(result);
  });
});
app.listen(PORT, () => {
  console.log("Server is running in port" + PORT);
});

module.exports = app;
