<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 20px;
        }

        .container {
            max-width: 1400px;
            margin: 0 auto;
        }

        /* Header */
        .header {
            background: white;
            padding: 25px 40px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            margin-bottom: 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header h1 {
            color: #667eea;
            font-size: 32px;
            font-weight: 700;
        }

        .header .admin-info {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .admin-avatar {
            width: 50px;
            height: 50px;
            background: linear-gradient(135deg, #667eea, #764ba2);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 20px;
            font-weight: bold;
        }

        /* Navigation */
        .nav-tabs {
            background: white;
            padding: 15px 30px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            margin-bottom: 30px;
            display: flex;
            gap: 20px;
        }

        .nav-tab {
            padding: 12px 30px;
            border: none;
            border-radius: 10px;
            background: #f0f0f0;
            color: #666;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
        }

        .nav-tab:hover {
            background: #e0e0e0;
        }

        .nav-tab.active {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
        }

        /* Main Content */
        .content {
            background: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            min-height: 500px;
        }

        .tab-content {
            display: none;
        }

        .tab-content.active {
            display: block;
            animation: fadeIn 0.5s;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Dashboard Cards */
        .dashboard-cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
            margin-top: 20px;
        }

        .dash-card {
            background: linear-gradient(135deg, #667eea, #764ba2);
            padding: 40px;
            border-radius: 15px;
            color: white;
            text-align: center;
            transition: transform 0.3s;
            cursor: pointer;
        }

        .dash-card:hover {
            transform: translateY(-10px);
        }

        .dash-card-icon {
            font-size: 60px;
            margin-bottom: 20px;
        }

        .dash-card h3 {
            font-size: 24px;
            margin-bottom: 10px;
        }

        .dash-card p {
            opacity: 0.9;
            font-size: 14px;
        }

        /* Section Header */
        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            padding-bottom: 15px;
            border-bottom: 3px solid #667eea;
        }

        .section-header h2 {
            color: #667eea;
            font-size: 28px;
        }

        /* Buttons */
        .btn {
            padding: 12px 25px;
            border: none;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            text-decoration: none;
            display: inline-block;
        }

        .btn-primary {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
        }

        .btn-success {
            background: #28a745;
            color: white;
        }

        .btn-warning {
            background: #ffc107;
            color: #333;
        }

        .btn-danger {
            background: #dc3545;
            color: white;
        }

        .btn-small {
            padding: 8px 15px;
            font-size: 13px;
        }

        /* Table */
        .table-container {
            overflow-x: auto;
            margin-top: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        thead {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
        }

        th {
            padding: 15px;
            text-align: left;
            font-weight: 600;
            font-size: 14px;
        }

        td {
            padding: 15px;
            border-bottom: 1px solid #e0e0e0;
        }

        tbody tr {
            transition: background 0.3s;
        }

        tbody tr:hover {
            background: #f8f9fa;
        }

        .actions {
            display: flex;
            gap: 10px;
        }

        /* Form */
        .form-container {
            max-width: 800px;
        }

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #333;
            font-weight: 600;
            font-size: 14px;
        }

        .form-group input,
        .form-group select,
        .form-group textarea {
            width: 100%;
            padding: 12px;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            font-size: 14px;
            transition: border-color 0.3s;
        }

        .form-group input:focus,
        .form-group select:focus,
        .form-group textarea:focus {
            outline: none;
            border-color: #667eea;
        }

        .form-actions {
            display: flex;
            gap: 15px;
            margin-top: 30px;
        }

        /* Modal */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.7);
            z-index: 1000;
            animation: fadeIn 0.3s;
        }

        .modal.active {
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .modal-content {
            background: white;
            padding: 40px;
            border-radius: 15px;
            max-width: 600px;
            width: 90%;
            max-height: 90vh;
            overflow-y: auto;
            animation: slideIn 0.3s;
        }

        @keyframes slideIn {
            from { transform: translateY(-50px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        .modal-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
            padding-bottom: 15px;
            border-bottom: 2px solid #e0e0e0;
        }

        .modal-header h3 {
            color: #667eea;
            font-size: 24px;
        }

        .close-modal {
            background: none;
            border: none;
            font-size: 30px;
            color: #999;
            cursor: pointer;
            line-height: 1;
        }

        .close-modal:hover {
            color: #333;
        }

        /* Alert */
        .alert {
            padding: 15px 20px;
            border-radius: 8px;
            margin-bottom: 20px;
            animation: slideDown 0.3s;
        }

        @keyframes slideDown {
            from { transform: translateY(-20px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        .alert-success {
            background: #d4edda;
            color: #155724;
            border-left: 4px solid #28a745;
        }

        .alert-danger {
            background: #f8d7da;
            color: #721c24;
            border-left: 4px solid #dc3545;
        }

        /* No Data */
        .no-data {
            text-align: center;
            padding: 60px 20px;
            color: #999;
        }

        .no-data-icon {
            font-size: 80px;
            margin-bottom: 20px;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .header {
                flex-direction: column;
                text-align: center;
                gap: 15px;
            }

            .nav-tabs {
                flex-direction: column;
            }

            .form-row {
                grid-template-columns: 1fr;
            }

            .dashboard-cards {
                grid-template-columns: 1fr;
            }

            .actions {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Header -->
        <div class="header">
            <h1>🎯 Admin Panel</h1>
            <div class="admin-info">
                <div class="admin-avatar">A</div>
                <div>
                    <strong>Administrator</strong>
                    <p style="color: #999; font-size: 12px;">admin@example.com</p>
                </div>
            </div>
        </div>

        <!-- Navigation Tabs -->
        <div class="nav-tabs">
            <button class="nav-tab active" onclick="showTab('dashboard')">📊 Dashboard</button>
            <button class="nav-tab" onclick="showTab('companies')">🏢 Companies</button>
            <button class="nav-tab" onclick="showTab('jobs')">💼 Jobs</button>
        </div>

        <!-- Main Content -->
        <div class="content">
            <!-- Dashboard Tab -->
            <div id="dashboard" class="tab-content active">
                <div class="section-header">
                    <h2>Dashboard Overview</h2>
                </div>
                <div class="dashboard-cards">
                    <div class="dash-card" onclick="showTab('companies')">
                        <div class="dash-card-icon">🏢</div>
                        <h3>Company Management</h3>
                        <p>Manage all company details and information</p>
                    </div>
                    <div class="dash-card" onclick="showTab('jobs')">
                        <div class="dash-card-icon">💼</div>
                        <h3>Job Management</h3>
                        <p>Manage job postings and listings</p>
                    </div>
                </div>
            </div>

            <!-- Companies Tab -->
            <div id="companies" class="tab-content">
                <div class="section-header">
                    <h2>Company Management</h2>
                    <button class="btn btn-primary" onclick="openAddCompanyModal()">
                        + Add New Company
                    </button>
                </div>

                <div id="companyAlert"></div>

                <div class="table-container">
                    <table id="companyTable">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Company Name</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>Website</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody id="companyTableBody">
                            <!-- Data will be populated here -->
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Jobs Tab -->
            <div id="jobs" class="tab-content">
                <div class="section-header">
                    <h2>Job Management</h2>
                    <button class="btn btn-primary" onclick="openAddJobModal()">
                        + Add New Job
                    </button>
                </div>

                <div id="jobAlert"></div>

                <div class="table-container">
                    <table id="jobTable">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Job Title</th>
                                <th>Company</th>
                                <th>Location</th>
                                <th>Salary</th>
                                <th>Type</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody id="jobTableBody">
                            <!-- Data will be populated here -->
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- Company Modal -->
    <div id="companyModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h3 id="companyModalTitle">Add Company</h3>
                <button class="close-modal" onclick="closeCompanyModal()">&times;</button>
            </div>
            <form id="companyForm">
                <input type="hidden" id="companyId">

                <div class="form-group">
                    <label for="companyName">Company Name *</label>
                    <input type="text" id="companyName" required placeholder="Enter company name">
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="companyEmail">Email *</label>
                        <input type="email" id="companyEmail" required placeholder="company@example.com">
                    </div>
                    <div class="form-group">
                        <label for="companyPhone">Phone</label>
                        <input type="tel" id="companyPhone" placeholder="+91 9876543210">
                    </div>
                </div>

                <div class="form-group">
                    <label for="companyWebsite">Website</label>
                    <input type="url" id="companyWebsite" placeholder="https://example.com">
                </div>

                <div class="form-group">
                    <label for="companyAddress">Address</label>
                    <textarea id="companyAddress" rows="3" placeholder="Enter company address"></textarea>
                </div>

                <div class="form-actions">
                    <button type="submit" class="btn btn-primary">Save Company</button>
                    <button type="button" class="btn btn-danger" onclick="closeCompanyModal()">Cancel</button>
                </div>
            </form>
        </div>
    </div>

    <!-- Job Modal -->
    <div id="jobModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h3 id="jobModalTitle">Add Job</h3>
                <button class="close-modal" onclick="closeJobModal()">&times;</button>
            </div>
            <form id="jobForm">
                <input type="hidden" id="jobId">

                <div class="form-group">
                    <label for="jobCompany">Company *</label>
                    <select id="jobCompany" required>
                        <option value="">Select Company</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="jobTitle">Job Title *</label>
                    <input type="text" id="jobTitle" required placeholder="e.g., Software Engineer">
                </div>

                <div class="form-group">
                    <label for="jobDescription">Description</label>
                    <textarea id="jobDescription" rows="4" placeholder="Job description..."></textarea>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="jobLocation">Location</label>
                        <input type="text" id="jobLocation" placeholder="e.g., Bangalore">
                    </div>
                    <div class="form-group">
                        <label for="jobSalary">Salary</label>
                        <input type="text" id="jobSalary" placeholder="e.g., 5-8 LPA">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="jobType">Job Type</label>
                        <select id="jobType">
                            <option value="Full-time">Full-time</option>
                            <option value="Part-time">Part-time</option>
                            <option value="Contract">Contract</option>
                            <option value="Internship">Internship</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="jobExperience">Experience Required</label>
                        <input type="text" id="jobExperience" placeholder="e.g., 2-4 years">
                    </div>
                </div>

                <div class="form-actions">
                    <button type="submit" class="btn btn-primary">Save Job</button>
                    <button type="button" class="btn btn-danger" onclick="closeJobModal()">Cancel</button>
                </div>
            </form>
        </div>
    </div>

    <script>
        // Sample Data Storage
        let companies = [
            {id: 1, name: 'Tech Solutions Inc', email: 'info@techsolutions.com', phone: '9876543210', website: 'www.techsolutions.com', address: '123 Tech Street, Silicon Valley'},
            {id: 2, name: 'Digital Innovations', email: 'contact@digital.com', phone: '9876543211', website: 'www.digital.com', address: '456 Innovation Ave, San Francisco'}
        ];

        let jobs = [
            {id: 1, companyId: 1, title: 'Software Engineer', description: 'Develop web applications', location: 'Bangalore', salary: '8-12 LPA', type: 'Full-time', experience: '2-4 years'},
            {id: 2, companyId: 1, title: 'Senior Java Developer', description: 'Lead development team', location: 'Mumbai', salary: '15-20 LPA', type: 'Full-time', experience: '5-7 years'},
            {id: 3, companyId: 2, title: 'Frontend Developer', description: 'Create responsive UIs', location: 'Delhi', salary: '6-10 LPA', type: 'Full-time', experience: '1-3 years'}
        ];

        // Tab Navigation
        function showTab(tabName) {
            const tabs = document.querySelectorAll('.tab-content');
            const navTabs = document.querySelectorAll('.nav-tab');

            tabs.forEach(tab => tab.classList.remove('active'));
            navTabs.forEach(nav => nav.classList.remove('active'));

            document.getElementById(tabName).classList.add('active');
            event.target.classList.add('active');

            if (tabName === 'companies') {
                loadCompanies();
            } else if (tabName === 'jobs') {
                loadJobs();
                populateCompanyDropdown();
            }
        }

        // Load Companies
        function loadCompanies() {
            const tbody = document.getElementById('companyTableBody');
            if (companies.length === 0) {
                tbody.innerHTML = '<tr><td colspan="6" class="no-data"><div class="no-data-icon">📭</div><p>No companies found. Add your first company!</p></td></tr>';
                return;
            }

            tbody.innerHTML = companies.map(company => `
                <tr>
                    <td>${company.id}</td>
                    <td><strong>${company.name}</strong></td>
                    <td>${company.email}</td>
                    <td>${company.phone}</td>
                    <td><a href="http://${company.website}" target="_blank">${company.website}</a></td>
                    <td class="actions">
                        <button class="btn btn-warning btn-small" onclick="editCompany(${company.id})">✏️ Edit</button>
                        <button class="btn btn-danger btn-small" onclick="deleteCompany(${company.id})">🗑️ Delete</button>
                    </td>
                </tr>
            `).join('');
        }

        // Load Jobs
        function loadJobs() {
            const tbody = document.getElementById('jobTableBody');
            if (jobs.length === 0) {
                tbody.innerHTML = '<tr><td colspan="7" class="no-data"><div class="no-data-icon">📭</div><p>No jobs found. Add your first job posting!</p></td></tr>';
                return;
            }

            tbody.innerHTML = jobs.map(job => {
                const company = companies.find(c => c.id === job.companyId);
                return `
                    <tr>
                        <td>${job.id}</td>
                        <td><strong>${job.title}</strong></td>
                        <td>${company ? company.name : 'N/A'}</td>
                        <td>${job.location}</td>
                        <td>${job.salary}</td>
                        <td>${job.type}</td>
                        <td class="actions">
                            <button class="btn btn-warning btn-small" onclick="editJob(${job.id})">✏️ Edit</button>
                            <button class="btn btn-danger btn-small" onclick="deleteJob(${job.id})">🗑️ Delete</button>
                        </td>
                    </tr>
                `;
            }).join('');
        }

        // Company Modal Functions
        function openAddCompanyModal() {
            document.getElementById('companyModalTitle').textContent = 'Add Company';
            document.getElementById('companyForm').reset();
            document.getElementById('companyId').value = '';
            document.getElementById('companyModal').classList.add('active');
        }

        function closeCompanyModal() {
            document.getElementById('companyModal').classList.remove('active');
        }

        function editCompany(id) {
            const company = companies.find(c => c.id === id);
            if (company) {
                document.getElementById('companyModalTitle').textContent = 'Edit Company';
                document.getElementById('companyId').value = company.id;
                document.getElementById('companyName').value = company.name;
                document.getElementById('companyEmail').value = company.email;
                document.getElementById('companyPhone').value = company.phone;
                document.getElementById('companyWebsite').value = company.website;
                document.getElementById('companyAddress').value = company.address;
                document.getElementById('companyModal').classList.add('active');
            }
        }

        function deleteCompany(id) {
            if (confirm('Are you sure you want to delete this company? All associated jobs will also be deleted.')) {
                companies = companies.filter(c => c.id !== id);
                jobs = jobs.filter(j => j.companyId !== id);
                loadCompanies();
                showAlert('companyAlert', 'Company deleted successfully!', 'success');
            }
        }

        // Job Modal Functions
        function openAddJobModal() {
            document.getElementById('jobModalTitle').textContent = 'Add Job';
            document.getElementById('jobForm').reset();
            document.getElementById('jobId').value = '';
            document.getElementById('jobModal').classList.add('active');
        }

        function closeJobModal() {
            document.getElementById('jobModal').classList.remove('active');
        }

        function populateCompanyDropdown() {
            const select = document.getElementById('jobCompany');
            select.innerHTML = '<option value="">Select Company</option>' +
                companies.map(c => `<option value="${c.id}">${c.name}</option>`).join('');
        }

        function editJob(id) {
            const job = jobs.find(j => j.id === id);
            if (job) {
                document.getElementById('jobModalTitle').textContent = 'Edit Job';
                document.getElementById('jobId').value = job.id;
                document.getElementById('jobCompany').value = job.companyId;
                document.getElementById('jobTitle').value = job.title;
                document.getElementById('jobDescription').value = job.description;
                document.getElementById('jobLocation').value = job.location;
                document.getElementById('jobSalary').value = job.salary;
                document.getElementById('jobType').value = job.type;
                document.getElementById('jobExperience').value = job.experience;
                document.getElementById('jobModal').classList.add('active');
            }
        }

        function deleteJob(id) {
            if (confirm('Are you sure you want to delete this job?')) {
                jobs = jobs.filter(j => j.id !== id);
                loadJobs();
                showAlert('jobAlert', 'Job deleted successfully!', 'success');
            }
        }

        // Form Submissions
        document.getElementById('companyForm').addEventListener('submit', function(e) {
            e.preventDefault();

            const id = document.getElementById('companyId').value;
            const companyData = {
                id: id ? parseInt(id) : companies.length > 0 ? Math.max(...companies.map(c => c.id)) + 1 : 1,
                name: document.getElementById('companyName').value,
                email: document.getElementById('companyEmail').value,
                phone: document.getElementById('companyPhone').value,
                website: document.getElementById('companyWebsite').value,
                address: document.getElementById('companyAddress').value
            };

            if (id) {
                const index = companies.findIndex(c => c.id === parseInt(id));
                companies[index] = companyData;
                showAlert('companyAlert', 'Company updated successfully!', 'success');
            } else {
                companies.push(companyData);
                showAlert('companyAlert', 'Company added successfully!', 'success');
            }

            closeCompanyModal();
            loadCompanies();
        });

        document.getElementById('jobForm').addEventListener('submit', function(e) {
            e.preventDefault();

            const id = document.getElementById('jobId').value;
            const jobData = {
                id: id ? parseInt(id) : jobs.length > 0 ? Math.max(...jobs.map(j => j.id)) + 1 : 1,
                companyId: parseInt(document.getElementById('jobCompany').value),
                title: document.getElementById('jobTitle').value,
                description: document.getElementById('jobDescription').value,
                location: document.getElementById('jobLocation').value,
                salary: document.getElementById('jobSalary').value,
                type: document.getElementById('jobType').value,
                experience: document.getElementById('jobExperience').value
            };

            if (id) {
                const index = jobs.findIndex(j => j.id === parseInt(id));
                jobs[index] = jobData;
                showAlert('jobAlert', 'Job updated successfully!', 'success');
            } else {
                jobs.push(jobData);
                showAlert('jobAlert', 'Job added successfully!', 'success');
            }

            closeJobModal();
            loadJobs();
        });

        // Alert Function
        function showAlert(elementId, message, type) {
            const alertDiv = document.getElementById(elementId);
            alertDiv.innerHTML = `<div class="alert alert-${type === 'success' ? 'success' : 'danger'}">${message}</div>`;
            setTimeout(() => {
                alertDiv.innerHTML = '';
            }, 3000);
        }

        // Close modal on outside click
        window.onclick = function(event) {
            const companyModal = document.getElementById('companyModal');
            const jobModal = document.getElementById('jobModal');
            if (event.target === companyModal) {
                closeCompanyModal();
            }
            if (event.target === jobModal) {
                closeJobModal();
            }
        }

        // Initialize
        loadCompanies();
    </script>
</body>
</html>