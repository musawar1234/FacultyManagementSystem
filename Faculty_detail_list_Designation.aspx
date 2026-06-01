<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Faculty_detail_list_Designation.aspx.cs" Inherits="WebApplication_EntryForm.Faculty_detail_list_Designation" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Faculty by Designation</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .main-container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.1);
            margin: 2rem auto;
            max-width: 1200px;
        }
        .header-section {
            background: linear-gradient(45deg, #4facfe 0%, #00f2fe 100%);
            color: white;
            padding: 2rem;
            border-radius: 20px 20px 0 0;
            text-align: center;
        }
        .select-section {
            padding: 2.5rem;
            background: #f8f9ff;
        }
        .dropdown-container {
            position: relative;
            max-width: 400px;
            margin: 0 auto;
        }
        .form-select {
            border: none;
            border-radius: 15px;
            padding: 15px 20px;
            font-size: 1.1rem;
            background: linear-gradient(45deg, #fff, #f0f4ff);
            box-shadow: 0 10px 30px rgba(0,123,255,0.2);
            transition: all 0.3s ease;
            height: 60px;
        }
        .form-select:focus {
            box-shadow: 0 15px 40px rgba(0,123,255,0.4);
            transform: translateY(-2px);
            border: none;
        }
        .faculty-card {
            background: white;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            margin-bottom: 1.5rem;
            overflow: hidden;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .faculty-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 40px rgba(0,0,0,0.15);
        }
        .faculty-header {
            background: linear-gradient(45deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 1.5rem;
        }
        .faculty-body {
            padding: 1.5rem;
        }
        .faculty-name {
            font-size: 1.3rem;
            font-weight: 700;
            color: #2c3e50;
            margin-bottom: 0.5rem;
        }
        .faculty-details {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1rem;
        }
        .detail-item {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            padding: 0.5rem 0;
        }
        .detail-icon {
            width: 20px;
            color: #4facfe;
        }
        .no-data {
            text-align: center;
            padding: 3rem;
            color: #6c757d;
        }
        .no-data i {
            font-size: 4rem;
            margin-bottom: 1rem;
            opacity: 0.5;
        }
        @media (max-width: 768px) {
            .main-container {
                margin: 1rem;
                border-radius: 15px;
            }
            .header-section, .select-section {
                padding: 1.5rem;
            }
            .faculty-details {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid p-4">
            <div class="main-container">
                <!-- Header -->
                <div class="header-section">
                    <i class="fas fa-users fs-1 mb-3 d-block"></i>
                    <h1 class="mb-2 fw-bold">Faculty Directory</h1>
                    <p class="mb-0 opacity-90">Browse faculty by designation</p>
                </div>

                <!-- Selection Section -->
                <div class="select-section">
                    <div class="row justify-content-center">
                        <div class="col-md-6 col-lg-5">
                            <label class="form-label fw-bold mb-3 d-block text-center fs-5 text-muted">
                                <i class="fas fa-filter me-2"></i>Select Designation
                            </label>
                            <div class="dropdown-container">
                                <asp:DropDownList ID="ddlDesignations" runat="server" 
                                    CssClass="form-select" AutoPostBack="true" 
                                    OnSelectedIndexChanged="ddlDesignations_SelectedIndexChanged">
                                    <asp:ListItem Text="-- Select Designation --" Value="0"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-md-6 text-md-end">
                                                        <label class="form-label fw-bold mb-3 d-block text-center fs-5 text-muted">
                                <i class="fas fa-filter me-2"></i>Back to Home
                            </label>
                                <asp:Button ID="Button1" runat="server" Text="Back"
                                    CssClass="btn btn-primary w-100"
                                    OnClientClick="window.location='FacultyManagement.aspx'; return false;" />
                            </div>
                    </div>
                </div>

                <!-- Faculty Results -->
                <div class="p-4 p-md-5">
                    <asp:Panel ID="pnlFaculty" runat="server">
                        <asp:Repeater ID="rptFaculty" runat="server">
                            <HeaderTemplate>
                                <div class="row">
                            </HeaderTemplate>
                            <ItemTemplate>
                                <div class="col-sm-6 col-lg-4 col-xl-3 mb-4">
                                    <div class="faculty-card h-100">
                                        <div class="faculty-header">
                                            <h5 class="mb-0 fw-bold">
                                                <i class="fas fa-user-tie me-2"></i>
                                                <%# Eval("TITLE") %>
                                            </h5>
                                        </div>
                                        <div class="faculty-body">
                                            <div class="faculty-name">
                                                <%# Eval("FIRST_NAME") + " " + (Eval("MIDDLE_NAME") != null ? Eval("MIDDLE_NAME") + " " : "") + Eval("LAST_NAME") %>
                                            </div>
                                            <div class="faculty-details">
                                                <div class="detail-item">
                                                    <i class="fas fa-id-badge detail-icon"></i>
                                                    <span>ID: <%# Eval("FACULTY_ID") %></span>
                                                </div>
                                                <div class="detail-item">
                                                    <i class="fas fa-envelope detail-icon"></i>
                                                    <span><%# Eval("FACULTY_EMAIL") %></span>
                                                </div>
                                               <div class="detail-item">
                                                    <i class="fas fa-hand-paper detail-icon"></i>
                                                    <span><%# Eval("IS_ACTIVE") %></span>
                                                </div>
                                                <div class="detail-item">
                                                    <i class="fas fa-section detail-icon"></i>
                                                    <span>Departmant: <%# Eval("DEPT_NAME") %></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                            <FooterTemplate>
                                </div>
                            </FooterTemplate>
                        </asp:Repeater>
                    </asp:Panel>

                    <!-- No Data Message -->
                    <asp:Panel ID="pnlNoData" runat="server" Visible="false">
                        <div class="no-data">
                            <i class="fas fa-users-slash"></i>
                            <h3 class="mb-3">No Faculty Found</h3>
                            <p class="lead">Please select a designation to view faculty members.</p>
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>