<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FacultyManagement.aspx.cs"
    Inherits="WebApplication_EntryForm.FacultyManagement" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Air University - Faculty Management</title>

    <!-- Bootstrap & Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />

    <style>
        :root {
            --primary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            --air-primary: linear-gradient(135deg, #0d6efd, #0b5ed7);
        }

        * { box-sizing: border-box; }
        body {
            background: linear-gradient(135deg, #eef2f7, #dbe5ef);
            font-family: 'Segoe UI', Arial, sans-serif;
            min-height: 100vh;
        }

        .dashboard-wrapper {
            max-width: 1600px;
            margin: auto;
            padding: 40px 30px;
        }

        .dashboard-header {
            background: rgba(255,255,255,0.95);
            backdrop-filter: blur(20px);
            border-radius: 20px;
            padding: 30px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.1);
            margin-bottom: 30px;
        }

        .dashboard-logo {
            width: 160px;
            transition: all 0.4s ease;
        }

        .dashboard-logo:hover {
            transform: scale(1.15);
        }

        .main-card {
            background: rgba(255,255,255,0.98);
            backdrop-filter: blur(25px);
            padding: 40px;
            border-radius: 24px;
            box-shadow: 0 25px 80px rgba(0,0,0,0.12);
            margin-bottom: 40px;
        }

        .section-title {
            font-size: 22px;
            font-weight: 800;
            margin-bottom: 15px;
            color: #1e293b;
        }

        .btn-custom {
            border-radius: 12px;
            font-weight: 700;
            padding: 12px 20px;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        .btn-custom:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.15);
        }

        /* FIXED DROPDOWN CONTAINER */
        .dropdown-container {
            position: relative;
            z-index: 9999;
        }

        /* CRITICAL DROPDOWN FIXES */
        .dropdown-menu {
            position: absolute !important;
            top: 100% !important;
            left: 0 !important;
            z-index: 9999 !important;
            min-width: 100%;
            max-height: 500px;
            overflow-y: auto;
            background: white;
            border: 1px solid rgba(0,0,0,0.15);
            border-radius: 12px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.15);
            padding: 10px 0;
            margin-top: 5px;
            transform: none !important;
            display: none; /* Bootstrap will handle show/hide */
        }

        .dropdown-menu.show {
            display: block !important;
        }

        .dropdown-item {
            padding: 12px 20px;
            font-weight: 600;
            color: #333;
            white-space: normal;
            border-radius: 8px;
            margin: 2px 8px;
            transition: all 0.2s ease;
        }

        .dropdown-item:hover {
            background: rgba(13,110,253,0.1);
            color: #0d6efd;
            transform: translateX(5px);
        }

        .section-row {
            display: flex;
            gap: 25px;
            flex-wrap: wrap;
        }

        .section-box {
            flex: 1;
            min-width: 320px;
            background: rgba(248,250,252,0.9);
            border-radius: 20px;
            padding: 30px;
            box-shadow: 0 15px 40px rgba(0,0,0,0.08);
            border: 1px solid rgba(255,255,255,0.5);
            position: relative;
            z-index: 1;
        }

        .section-box:hover {
            transform: translateY(-5px);
            box-shadow: 0 25px 50px rgba(0,0,0,0.12);
        }

        .designation-block {
            height: 160px;
            border-radius: 16px;
            color: white;
            padding: 20px;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 10px 30px rgba(0,0,0,0.15);
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .designation-block:hover {
            transform: translateY(-8px);
            box-shadow: 0 20px 40px rgba(0,0,0,0.25);
        }

        .bg-0 { background: linear-gradient(135deg, #6366f1, #8b5cf6); }
        .bg-1 { background: linear-gradient(135deg, #3b82f6, #60a5fa); }
        .bg-2 { background: linear-gradient(135deg, #10b981, #34d399); }
        .bg-3 { background: linear-gradient(135deg, #f59e0b, #fbbf24); }
        .bg-4 { background: linear-gradient(135deg, #ef4444, #f87171); }
        .bg-5 { background: linear-gradient(135deg, #334155, #475569); }

        .grid-container {
            background: rgba(255,255,255,0.95);
            backdrop-filter: blur(20px);
            padding: 35px;
            border-radius: 24px;
            box-shadow: 0 25px 60px rgba(0,0,0,0.1);
        }

        .table {
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0,0,0,0.08);
        }

        .table thead th {
            background: var(--air-primary);
            color: white;
            border: none;
            font-weight: 700;
            padding: 15px;
        }

        .badge {
            padding: 6px 12px;
            border-radius: 20px;
            font-weight: 600;
        }

        footer {
            background: linear-gradient(135deg, #0094ff, #005fcc);
            margin-top: 50px;
            padding: 25px 0;
            border-radius: 20px 20px 0 0;
        }

        @media (max-width: 768px) {
            .section-row { flex-direction: column; }
            .section-box { min-width: 100%; }
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />

        <div class="dashboard-wrapper">
            <!-- HEADER -->
            <div class="dashboard-header text-center mb-5">
                <img src="Content/Images/air_university_logo.png" class="dashboard-logo mb-3 mx-auto d-block" alt="Air University Logo" />
                <h1 class="fw-bold mb-2" style="font-size: 2.2rem; background: var(--air-primary); -webkit-background-clip: text; -webkit-text-fill-color: transparent; background-clip: text;">
                    Air University – Faculty Management Dashboard
                </h1>
                <p class="text-muted lead">Manage Faculty Profiles, Academic Records, Publications & More</p>
            </div>

            <!-- USER BAR -->
            <div class="d-flex justify-content-end align-items-center mb-4">
                <asp:Label ID="lblUsername" runat="server" CssClass="fw-bold text-primary me-4" Font-Size="20px" />
                <a href="loginpage.aspx" onclick="return confirm('Are you sure you want to logout?');"
                   class="btn btn-danger btn-custom">
                    <i class="fa fa-sign-out me-2"></i>Logout
                </a>
            </div>

            <!-- MAIN CARD -->
            <div class="main-card">
                <!-- HORIZONTAL SECTIONS -->
                <div class="section-row mb-5">
                    <!-- DISPLAY -->
                    <div class="section-box">
                        <div class="section-title mb-4">
                            <i class="bi bi-eye text-primary me-2"></i>Display
                        </div>
                        <div class="dropdown-container dropdown">
                            <button class="btn btn-outline-primary btn-custom dropdown-toggle w-100 text-start shadow-sm" 
                                    type="button" id="displayDrop" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="bi bi-list-ul me-2"></i>View Records
                            </button>
                            <ul class="dropdown-menu w-100" aria-labelledby="displayDrop">
                                <li><a class="dropdown-item" style="font-family: 'Georgia', serif;" href="Viewfaculty.aspx">
                                    <i class="bi bi-people me-2 text-primary"></i>Faculty</a></li>
                                <li><a class="dropdown-item" style="font-family: 'Georgia', serif;" href="DepartmentsGrid.aspx">
                                    <i class="bi bi-building me-2 text-success"></i>Department</a></li>
                                <li><a class="dropdown-item" style="font-family: 'Georgia', serif;" href="Advertisement_Gridview.aspx">
                                    <i class="bi bi-megaphone me-2 text-info"></i>Advertisement</a></li>
                                <li><a class="dropdown-item" style="font-family: 'Georgia', serif;" href="Display_Educations.aspx">
                                    <i class="bi bi-mortorboard me-2 text-warning"></i>Education</a></li>
                                <li><a class="dropdown-item" style="font-family: 'Georgia', serif;" href="Display_Researech_interest_details.aspx">
                                    <i class="bi bi-graph-up me-2 text-success"></i>Research</a></li>
<%--                                <li><a class="dropdown-item" style="font-family: 'Georgia', serif;" href="WebForm2.aspx">
                                    <i class="bi bi-bar-chart me-2 text-info"></i>Faculty Count</a></li>--%>
                                <li><a class="dropdown-item" style="font-family: 'Georgia', serif;" href="Display_Event_News.aspx">
                                    <i class="bi bi-calendar-event me-2 text-danger"></i>News & Events</a></li>
                            </ul>
                        </div>
                    </div>
                    <!-- Reports -->
                    <div class="section-box">
                        <div class="section-title mb-4">
                            <i class="bi bi-eye text-primary me-2"></i>Reports
                        </div>
                        <div class="dropdown-container dropdown">
                            <button class="btn btn-outline-primary btn-custom dropdown-toggle w-100 text-start shadow-sm" 
                                    type="button" id="displayDrop1" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="bi bi-list-ul me-2"></i>View Report
                            </button>
                            <ul class="dropdown-menu w-100" aria-labelledby="displayDrop">
                                <li><a class="dropdown-item" style="font-family: 'Georgia', serif;" href="Faculty_detail_list_Designation.aspx">
                                    <i class="bi bi-file-earmark-text me-2 text-secondary"></i>Faculty detail Designation</a></li>
                                <li><a class="dropdown-item" style="font-family: 'Georgia', serif;" href="FacultyReports.aspx">
                                    <i class="bi bi-file-earmark-text me-2 text-secondary"></i>Faculty Report</a></li>
                                <li><a class="dropdown-item" style="font-family: 'Georgia', serif;" href="FacultyCharts.aspx">
                                    <i class="bi bi-pie-chart me-2 text-primary"></i>No. of Faculty in Department Report</a></li>
                                <li><a class="dropdown-item" style="font-family: 'Georgia', serif;" href="FacultyDegrees.aspx">
                                    <i class="bi bi-award me-2 text-warning"></i>Faculty Latest Degrees Report</a></li>
                                <li><a class="dropdown-item" style="font-family: 'Georgia', serif;" href="FacultylatestPublication.aspx">
                                    <i class="bi bi-book me-2 text-success"></i>Faculty Latest Publication Report</a></li>
                            </ul>
                        </div>
                    </div>

                    <!-- INSERT -->
                    <asp:Panel ID="Panel1" runat="server" CssClass="section-box">
                        <div class="section-title mb-4">
                            <i class="bi bi-plus-circle text-success me-2"></i>Insert
                        </div>
                        <div class="dropdown-container dropdown">
                            <button class="btn btn-success btn-custom dropdown-toggle w-100 text-start shadow-sm" 
                                    type="button" id="insertDrop" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="bi bi-plus-circle me-2"></i>Insert Records
                            </button>
                            <ul class="dropdown-menu w-100" aria-labelledby="insertDrop">
                                <li><a class="dropdown-item" style="font-family: 'Georgia', serif;" href="FacultyEntry.aspx">
                                    <i class="bi bi-person-plus me-2 text-success"></i>Faculty</a></li>
                                <li><a class="dropdown-item" style="font-family: 'Georgia', serif;" href="Faculty_Education.aspx">
                                    <i class="bi bi-mortorboard-fill me-2 text-warning"></i>Education</a></li>
                                <li><a class="dropdown-item" style="font-family: 'Georgia', serif;" href="Faculty_Publication.aspx">
                                    <i class="bi bi-file-earmark-text-fill me-2 text-primary"></i>Publication</a></li>
                                <li><a class="dropdown-item" style="font-family: 'Georgia', serif;" href="Faculty_ResearchInterest.aspx">
                                    <i class="bi bi-graph-up-arrow me-2 text-success"></i>Research</a></li>
                                <li><a class="dropdown-item" style="font-family: 'Georgia', serif;" href="New_Event_Entry Form.aspx">
                                    <i class="bi bi-calendar-plus me-2 text-info"></i>Event</a></li>
                                <li><a class="dropdown-item" style="font-family: 'Georgia', serif;" href="Advertisement_Form_Entry.aspx">
                                    <i class="bi bi-megaphone-fill me-2 text-danger"></i>Advertisement</a></li>
                            </ul>
                        </div>
                    </asp:Panel>

                    <!-- UPDATE -->
                    <asp:Panel ID="Panel2" runat="server" CssClass="section-box">
                        <div class="section-title mb-4">
                            <i class="bi bi-pencil-square text-warning me-2"></i>Update
                        </div>
                        <div class="dropdown-container dropdown">
                            <button class="btn btn-warning btn-custom dropdown-toggle w-100 text-start shadow-sm" 
                                    type="button" id="updateDrop" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="bi bi-pencil-square me-2"></i>Update Records
                            </button>
                            <ul class="dropdown-menu w-100" aria-labelledby="updateDrop">
                                <li><a class="dropdown-item" style="font-family: 'Georgia', serif;" href="update_facultyDetail.aspx">
                                    <i class="bi bi-person-gear me-2 text-warning"></i>Faculty</a></li>
                                <li><a class="dropdown-item" style="font-family: 'Georgia', serif;" href="Education Update.aspx">
                                    <i class="bi bi-mortorboard me-2 text-primary"></i>Education</a></li>
                                <li><a class="dropdown-item" style="font-family: 'Georgia', serif;" href="Update_Publication.aspx">
                                    <i class="bi bi-book-half me-2 text-success"></i>Publication</a></li>
                                <li><a class="dropdown-item" style="font-family: 'Georgia', serif;" href="update_News_Events_form.aspx">
                                    <i class="bi bi-newspaper me-2 text-info"></i>News</a></li>
                                <li><a class="dropdown-item" style="font-family: 'Georgia', serif;" href="Update_Research_interest_form.aspx">
                                    <i class="bi bi-clipboard-data me-2 text-secondary"></i>Research</a></li>
                                <li><a class="dropdown-item" style="font-family: 'Georgia', serif;" href="ImageUploadeForm.aspx">
                                    <i class="bi bi-image me-2 text-danger"></i>Images</a></li>
                            </ul>
                        </div>
                    </asp:Panel>
                </div>

                <!-- FACTS & FIGURES -->
                <div class="section-title mb-4">
                    <i class="bi bi-graph-up text-success me-2"></i>Faculty – Facts & Figures
                </div>

                <div id="designationSlider" class="carousel slide mt-3" data-bs-ride="carousel">
                    <div class="carousel-inner">
                        <asp:Repeater ID="rptSlides" runat="server">
                            <ItemTemplate>
                                <div class='carousel-item <%# Container.ItemIndex==0?"active":"" %>'>
                                    <div class="row justify-content-center">
                                        <asp:Repeater ID="rptSlideItems" runat="server" DataSource='<%# Container.DataItem %>'>
                                            <ItemTemplate>
                                                <div class="col-md-3 mb-3">
                                                    <div class="designation-block <%# Eval("ColorClass") %>">
                                                        <h6 class="mb-2"><%# Eval("DesignationName") %></h6>
                                                        <p class="fs-4 mb-1"><%# Eval("FacultyCount") %> Faculty</p>
                                                        <p class="fs-5"><%# Eval("ChairCount") %> Chair</p>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>

            <!-- GRID CONTAINER -->
            <div class="grid-container">
                <h4 class="fw-bold mb-4" style="color: #1e293b;">
                    <i class="bi bi-table me-2 text-primary"></i>Designation Records
                </h4>

                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <div class="input-group mb-4" style="max-width: 400px;">
                            <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control shadow-sm" 
                                         placeholder="🔍 Search designation..." />
                            <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary shadow-sm px-4" 
                                        OnClick="btnSearch_Click" />
                        </div>

                        <asp:GridView ID="GridView1" runat="server"
                            CssClass="table table-hover table-striped text-center"
                            AutoGenerateColumns="False" AllowPaging="True" PageSize="10"
                            DataSourceID="SqlDataSource1" GridLines="None">
                            <Columns>
                                <asp:BoundField DataField="DESIGNATION_ID" HeaderText="ID" ItemStyle-CssClass="fw-bold" />
                                <asp:BoundField DataField="DESIGNATION_NAME" HeaderText="Designation" ItemStyle-CssClass="fw-semibold" />
                                <asp:BoundField DataField="DESIGNATION_DESC" HeaderText="Description" ItemStyle-CssClass="text-start" />
                                <asp:TemplateField HeaderText="Status">
                                    <ItemTemplate>
                                        <span class='<%# Convert.ToBoolean(Eval("IS_ACTIVE")) ? "badge bg-success" : "badge bg-secondary" %>'>
                                            <%# Convert.ToBoolean(Eval("IS_ACTIVE")) ? "Active" : "Inactive" %>
                                        </span>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="CREATED_BY" HeaderText="Created By" />
                                <asp:BoundField DataField="DESIGNATION_PRIORITY" HeaderText="Priority" ItemStyle-CssClass="fw-bold text-warning" />
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                    ConnectionString="<%$ ConnectionStrings:au_edu_pk_websiteDBConnectionString2 %>"
                    SelectCommand="SELECT * FROM DESIGNATIONS ORDER BY DESIGNATION_ID">
                </asp:SqlDataSource>
            </div>
        </div>

        <footer class="text-white text-center py-4">
            <div class="container">
                <p class="mb-2 h5 fw-bold">© 2025-26 Air University</p>
                <p class="mb-0">Developed with ❤️ by <strong>Ghazi</strong></p>
            </div>
        </footer>
    </form>

    <!-- Bootstrap JS MUST be last -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
