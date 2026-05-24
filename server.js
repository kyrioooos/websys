const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');

const app = express();
app.use(cors());
app.use(express.json());

const db = mysql.createPool({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'student_table',
    waitForConnections: true,
    connectionLimit: 10
}).promise();

app.get('/api/students', async (req, res) => {
    try {
        const [students] = await db.execute("SELECT * FROM student");

        const totalStudents = students.length;
        const activeStudents = students.filter(s => s.IsActive == 1).length;
        const inactiveStudents = totalStudents - activeStudents;

        res.json({
            metrics: {
                total: totalStudents,
                active: activeStudents,
                inactive: inactiveStudents,
                activePercentage: totalStudents > 0 ? Math.round((activeStudents / totalStudents) * 100) : 0
            },
            data: students
        });
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: "Backend failed to read database data rows." });
    }
});

app.post('/api/students', async (req, res) => {
    const { studentNum, fn, ln, mail, year, semester, status } = req.body;
    const isActiveValue = status === 'Active' ? 1 : 0;

    try {
        const query = `
            INSERT INTO student (StudentNumber, FirstName, LastName, Email, YearLevel, Semester, IsActive) 
            VALUES (?, ?, ?, ?, ?, ?, ?)
        `;
        await db.execute(query, [studentNum, fn, ln, mail, year, semester, isActiveValue]);
        res.status(201).json({ message: "Student record added successfully!" });
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: "Failed to write data into student table columns." });
    }
});

app.put('/api/students/:id/toggle', async (req, res) => {
    const studentId = req.params.id;
    try {
        const [student] = await db.execute("SELECT IsActive FROM student WHERE StudentID = ?", [studentId]);
        if (student.length === 0) {
            return res.status(404).json({ error: "Student not found" });
        }

        const newStatus = student[0].IsActive === 1 ? 0 : 1;
        await db.execute("UPDATE student SET IsActive = ? WHERE StudentID = ?", [newStatus, studentId]);
        res.json({ message: "Status shifted successfully." });
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: "Database state transition execution breakdown." });
    }
});

app.delete('/api/students/:id', async (req, res) => {
    const studentId = req.params.id;
    try {
        await db.execute("DELETE FROM student WHERE StudentID = ?", [studentId]);
        res.json({ message: "Student record dropped successfully!" });
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: "Database line termination process failure." });
    }
});

const PORT = 5000;
app.listen(PORT, () => {
    console.log(`Backend server successfully handling student module routes on port ${PORT}`);
});