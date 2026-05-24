const API_URL = 'http://localhost:5000/api/students';

// READ (R): Fetch data rows and calculate dashboard cards
async function loadDashboardData() {
    try {
        const response = await fetch(API_URL);
        const result = await response.json();

        if (response.ok) {
            document.getElementById('statTotal').innerText = result.metrics.total;
            document.getElementById('statActive').innerText = result.metrics.active;
            document.getElementById('statInactive').innerText = result.metrics.inactive;
            document.getElementById('statActivePct').innerText = `${result.metrics.activePercentage}% of total enrolled`;

            const tbody = document.getElementById('studentTableBody');
            tbody.innerHTML = '';

            result.data.forEach(student => {
                const statusBadge = student.IsActive == 1 
                    ? '<span style="color: green; font-weight: bold;">Active</span>' 
                    : '<span style="color: red; font-weight: bold;">Inactive</span>';
                let semesterText = student.Semester;
                if (student.Semester == 1) semesterText = '1st';
                if (student.Semester == 2) semesterText = '2nd';

                const row = `
                <tr style="border-bottom: 1px solid #f0f0f0;">
                    <td style="padding: 10px;">${student.StudentID}</td>
                    <td style="padding: 10px; font-family: monospace;">${student.StudentNumber}</td>
                    <td style="padding: 10px;">${student.FirstName} ${student.LastName}</td>
                    <td style="padding: 10px;">${student.Email}</td>
                    <td style="padding: 10px;">${student.YearLevel}</td>
                    <td style="padding: 10px;">${semesterText}</td>
                    <td style="padding: 10px;">${statusBadge}</td>
                    <td style="padding: 10px;">
                        <button onclick="toggleStatus(${student.StudentID})" style="background: #ffc107; border: none; padding: 5px 8px; border-radius: 4px; cursor: pointer; margin-right: 5px; font-size: 12px; font-weight: bold;">Toggle Status</button>
                        <button onclick="deleteStudent(${student.StudentID})" style="background: #dc3545; color: white; border: none; padding: 5px 8px; border-radius: 4px; cursor: pointer; font-size: 12px; font-weight: bold;">Delete</button>
                    </td>
                </tr>
                `;
                tbody.innerHTML += row;
            });
        } 
    } catch (error) {
        console.error("Frontend could not reach the API:", error);
    }
}

// CREATE (C): Handle new database record form submissions
document.getElementById('studentForm').addEventListener('submit', async (e) => {
    e.preventDefault();

    const formData = {
        studentNum: document.getElementById('studentNum').value,
        fn: document.getElementById('fn').value,
        ln: document.getElementById('ln').value,
        mail: document.getElementById('mail').value,
        year: document.getElementById('year').value,
        semester: document.getElementById('semester').value,
        status: document.getElementById('status').value
    };

    try {
        const response = await fetch(API_URL, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(formData)
        });

        const result = await response.json();
        if (response.ok) {
            alert(result.message);
            document.getElementById('studentForm').reset();
            loadDashboardData(); 
        } else {
            alert("Error: " + result.error);
        }
    } catch (error) {
        alert("Frontend couldn't talk to backend.");
    }
});

// UPDATE (U): Request an item active/inactive state change
async function toggleStatus(id) {
    try {
        const response = await fetch(`${API_URL}/${id}/toggle`, { method: 'PUT' });
        const result = await response.json();
        if (response.ok) {
            loadDashboardData(); 
        } else {
            alert(result.error);
        }
    } catch (error) {
        alert("Error changing status.");
    }
}

// DELETE (D): Request database clean drop row removal
async function deleteStudent(id) {
    if (confirm("Are you sure you want to permanently delete this student record?")) {
        try {
            const response = await fetch(`${API_URL}/${id}`, { method: 'DELETE' });
            const result = await response.json();
            if (response.ok) {
                alert(result.message);
                loadDashboardData(); 
            } else {
                alert(result.error);
            }
        } catch (error) {
            alert("Error deleting student.");
        }
    }
}

window.addEventListener('DOMContentLoaded', loadDashboardData);