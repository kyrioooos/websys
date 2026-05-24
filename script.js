const API_URL = 'http://localhost:5000/api/students';

let studentsCache = [];

async function loadBlockDropdown() {
    try {
        const response = await fetch('http://localhost:5000/api/blocks');
        const blocks = await response.json();
        
        const blockSelect = document.getElementById('blockId');
        blockSelect.innerHTML = ''; 
        
        blocks.forEach(block => {
            const option = `<option value="${block.BlockID}">${block.BlockName}</option>`;
            blockSelect.innerHTML += option;
        });
        
        const courseFilter = document.getElementById('filterCourse');
        if (courseFilter) {
            courseFilter.innerHTML = '<option>All courses</option>';
            blocks.forEach(block => {
                const opt = document.createElement('option');
                opt.value = block.BlockName;
                opt.textContent = block.BlockName;
                courseFilter.appendChild(opt);
            });
        }
    } catch (error) {
        console.error("Could not populate blocks dropdown dynamically:", error);
    }
}

async function loadDashboardData() {
    try {
        const response = await fetch(API_URL);
        const result = await response.json();

        if (response.ok) {
            document.getElementById('statTotal').innerText = result.metrics.total;
            document.getElementById('statActive').innerText = result.metrics.active;
            document.getElementById('statInactive').innerText = result.metrics.inactive;
            document.getElementById('statActivePct').innerText = `${result.metrics.activePercentage}% of total enrolled`;

            studentsCache = result.data || [];
            populateYearFilter(studentsCache);
            renderTable(studentsCache);
        }
    } catch (error) {
        console.error("Frontend could not reach the API:", error);
    }
}

function populateYearFilter(data){
    const yearFilter = document.getElementById('filterYear');
    if (!yearFilter) return;
    const years = Array.from(new Set(data.map(s => s.YearLevel).filter(Boolean))).sort();
    yearFilter.innerHTML = '<option>All years</option>' + years.map(y => `<option value="${y}">${y}</option>`).join('');
}

function renderTable(data){
    const tbody = document.getElementById('studentTableBody');
    tbody.innerHTML = '';
    data.forEach(student => {
        const statusBadge = student.IsActive == 1 
            ? '<span style="color: green; font-weight: bold;">Active</span>' 
            : '<span style="color: red; font-weight: bold;">Inactive</span>';

        let semesterText = student.Semester;
        if (student.Semester == '1st' || student.Semester == '1') semesterText = '1st';
        if (student.Semester == '2nd' || student.Semester == '2') semesterText = '2nd';

        const row = `
        <tr style="border-bottom: 1px solid #f0f0f0;">
            <td style="padding: 10px;">${student.StudentID}</td>
            <td style="padding: 10px; font-family: monospace;">${student.StudentNumber}</td>
            <td style="padding: 10px;">${student.FirstName || ''}</td>
            <td style="padding: 10px;">${student.MiddleName || ''}</td>
            <td style="padding: 10px;">${student.LastName || ''}</td>
            <td style="padding: 10px;">${student.Suffix || ''}</td>
            <td style="padding: 10px;">${student.Age || ''}</td>
            <td style="padding: 10px;">${student.Email}</td>
            <td style="padding: 10px; font-weight: bold; color: #4a5568;">${student.BlockName || 'N/A'}</td>
            <td style="padding: 10px;">${student.Course || 'N/A'}</td>
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

function applyFilters(){
    const q = (document.getElementById('searchBox')?.value || '').toLowerCase().trim();
    const course = document.getElementById('filterCourse')?.value || 'All courses';
    const year = document.getElementById('filterYear')?.value || 'All years';

    const filtered = studentsCache.filter(s => {
        if (course && course !== 'All courses' && (s.BlockName || '') !== course) return false;
        if (year && year !== 'All years' && (String(s.YearLevel) || '') !== String(year)) return false;
        if (!q) return true;
        const fullName = `${s.FirstName||''} ${s.MiddleName||''} ${s.LastName||''}`.toLowerCase();
        return (s.StudentNumber && String(s.StudentNumber).toLowerCase().includes(q)) ||
               (s.StudentID && String(s.StudentID).toLowerCase().includes(q)) ||
               fullName.includes(q) ||
               (s.Email && s.Email.toLowerCase().includes(q));
    });

    renderTable(filtered);
}

document.getElementById('studentForm').addEventListener('submit', async (e) => {
    e.preventDefault();

    const formData = {
        studentNum: document.getElementById('studentNum').value,
        fn: document.getElementById('fn').value,
        mn: document.getElementById('mn') ? document.getElementById('mn').value : '',
        ln: document.getElementById('ln').value,
        suffix: document.getElementById('suffix') ? document.getElementById('suffix').value : '',
        age: document.getElementById('age') ? Number(document.getElementById('age').value) : null,
        mail: document.getElementById('mail').value,
        blockId: document.getElementById('blockId').value,
        course: document.getElementById('course').value,
        semester: document.getElementById('semester').value,
        yearLevel: document.getElementById('yearLevel') ? document.getElementById('yearLevel').value : '',
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

window.addEventListener('DOMContentLoaded', () => {
    loadDashboardData();
    loadBlockDropdown();
    const searchBox = document.getElementById('searchBox');
    const filterCourse = document.getElementById('filterCourse');
    const filterYear = document.getElementById('filterYear');
    if (searchBox) searchBox.addEventListener('input', applyFilters);
    if (filterCourse) filterCourse.addEventListener('change', applyFilters);
    if (filterYear) filterYear.addEventListener('change', applyFilters);
});
