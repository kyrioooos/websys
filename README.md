# WEB SYSTEMS AND TECHNOLOGIES: FINAL PROJECT DOCUMENTATION

**Module Focus: Relational Student CRUD Management System**

---

## 1. Project Overview

* **Original Project Title:** CLASS SCHEDULER SYSTEM WITH RECOMMENDER ENGINE
* **Original Authors/Source:**<br>
  Asia, Annie Rose M.<br>
  Bitare, John Reymar M.<br>
  Nebres, Ma. Gella Rose V.<br>
  Saavedra, Kierzhan Ric H.
* **Module Scope:** 
* **Rationale:** 

---

## 2. Technology Stack

* **Frontend Framework:** Vanilla JavaScript (ES6+ Asynchronous DOM manipulation)
* **Styling:** Native CSS3 (utilizing CSS Grid layout architecture)
* **Backend Framework:** Node.js with Express.js application routing middleware
* **Database:** MySQL 8.0 relational database engine (managed via XAMPP phpMyAdmin)
* **Additional Libraries:**
  * `cors`: Handles Cross-Origin Resource Sharing security protocols between frontend and backend environments.
  * `mysql2`: High-performance asynchronous MySQL connector pool utility utilizing Promises.

---

## 3. Database Design

This module implements a normalized **One-to-Many ($1:\infty$) relationship**. A single academic class block can contain many registered students, while an individual student can be assigned to exactly one class block.

Below is the Entity-Relationship Diagram for the student registration module showing the relationship link:

![Entity Relationship Diagram](ERD.jpeg)

### Table Structure Specifications

#### Table A: `block`
* `BlockID`: **INT(11)** | *Primary Key* | Auto-Increment anchor.
* `CourseID`: **INT(11)** | Foreign reference tracking structural programs.
* `BlockName`: **VARCHAR(100)** | e.g., "BSIT 1-A", "BSCS 2-A".
* `YearLevel`: **INT(11)** | Digital curriculum tracker layer.
* `Semester`: **VARCHAR(20)** | e.g., "1st", "2nd".
* `AcademicYear`: **YEAR(4)** | Standard institutional calendar footprint.
* `MaxStudents`: **INT(11)** | Classroom size threshold index.
* `IsActive`: **TINYINT(1)** | Binary switch status tracker.

#### Table B: `student`
* `StudentID`: **INT(11)** | *Primary Key* | System internal identifier.
* `BlockID`: **INT(11)** | *Foreign Key* | Connects directly to `block.BlockID` with `CASCADE` index rules.
* `StudentNumber`: **VARCHAR(20)** | Unique alpha-numeric tracking sequence.
* `FirstName`: **VARCHAR(50)** | Legal text entry parameter.
* `LastName`: **VARCHAR(50)** | Surname tracking entry parameter.
* `Email`: **VARCHAR(100)** | Validated university endpoint address.
* `IsActive`: **TINYINT(1)** | Current registration presence flag.

---

## 4. Module Features

This section describes how the application implements each CRUD (Create, Read, Update, Delete) operation to handle student tracking data.

### Create (C) — Add New Student
* **Feature Description:** Allows administrators to register a new student profile into the system using a dedicated input form. Instead of manually typing year levels and semesters, the system provides a dynamic, real-time dropdown connected directly to the `block` table database rows.
* **Form Validation Rules:**
  * All fields (`Student Number`, `First Name`, `Last Name`, `Email Address`, `Class Block`, and `Status`) use the native browser `required` attribute to prevent partial or empty submissions.
  * The `Email` input field validates that data follows a standard corporate text template string structure (e.g., `name@student.edu`) before allowing submission.
  * The selected block maps directly to its unique database integer primary key (`BlockID`), preventing invalid structural assignments.
* **Error Handling:** If a user tries to submit an duplicate primary entry or if the backend database disconnects, the Express server intercepts the failure and returns a clean `500 Internal Server Error` message alert via browser alert boxes rather than crashing the system frontend loop.

### Read (R) — Master Roster & Live Analytics Dashboard
* **Feature Description:** Dynamically fetches and displays all registered student rows from the database inside a responsive data grid layout. It also computes real-time summary indicators inside top-level metric card displays.
* **Relational Database Integration:** Rather than pulling un-normalized flat records, the backend runs a SQL `INNER JOIN` query to combine tables on the fly:
  ```sql
  SELECT s.StudentID, s.StudentNumber, s.FirstName, s.LastName, s.Email, s.IsActive, b.BlockName, b.YearLevel, b.Semester 
  FROM student s 
  INNER JOIN block b ON s.BlockID = b.BlockID;

## 6. Individual Reflection

This section contains the mandatory individual project reflections for each team member.

---

### 👤 Member 1: Brizuela, Atasha Karene B.

* **What was the most difficult part of interpreting the original author's logic?** 

* **What technical challenges did you face during recreation?** 

* **How would you improve this module further?** 

---

### 👤 Member 2: Miranda, Shane S.

* **What was the most difficult part of interpreting the original author's logic?**
  The most difficult part of interpreting the original authors' logic was that they did not include students in their system; however, the architectural system handles classrooms, timeslots, and majors.

* **What technical challenges did you face during recreation?**
  The technical challeneges I faced during the recreation was implementing the JavaScript in managing asynchronous data synchronization across multiple backend endpoints while maintaining a smooth single-page interface.

* **How would you improve this module further?**
  I would improve this module further by adding an 'export pdf' in the system, so that administrators can extract data cleanly and for archiving.

---

### 👤 Member 3: Non, Cyra Mae M.

* **What was the most difficult part of interpreting the original author's logic?** 

* **What technical challenges did you face during recreation?**

* **How would you improve this module further?** 
