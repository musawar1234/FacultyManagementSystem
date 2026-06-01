<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FacultyReports.aspx.cs" Inherits="WebApplication_EntryForm.FacultyReports" %>

<!DOCTYPE html>
<html>
<head>
    <title>Faculty Report | Air University</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />

    <!-- ===================== MODERN UI STYLING ===================== -->
    <style>
        body {
            background: linear-gradient(135deg, #eef2f7, #e2ebf5);
            font-family: "Segoe UI", Arial, sans-serif;
        }

        .page-wrapper {
            max-width: 1200px;
            margin: auto;
            padding: 40px 20px;
        }

        .report-header {
            font-weight: 800;
            color: #0d6efd;
            border-left: 5px solid #0d6efd;
            padding-left: 12px;
            margin-bottom: 25px;
        }

        /* Search Card */
        .search-card {
            border-radius: 14px;
            background: #fff;
            padding: 25px;
            box-shadow: 0px 10px 25px rgba(0,0,0,0.08);
        }

            .search-card label {
                font-weight: 600;
                color: #334155;
            }

        .section-title {
            background: #0d6efd;
            color: white;
            padding: 12px 18px;
            border-radius: 8px;
            font-size: 18px;
            font-weight: 600;
            margin-top: 28px;
            margin-bottom: 10px;
            letter-spacing: 0.4px;
        }

        .info-table {
            background: white;
            border-radius: 12px;
            overflow: hidden;
            border: 1px solid #dce1e7;
        }

            .info-table th {
                width: 250px;
                background: #f1f3f7 !important;
                font-weight: 600;
            }

            .info-table td {
                background: #ffffff;
                font-size: 15px;
            }

        .card-custom {
            background: white;
            border-radius: 12px;
            box-shadow: 0px 3px 14px rgba(0,0,0,0.08);
            padding: 20px;
            margin-top: 10px;
        }

        /* Print Mode */
        @media print {
            .no-print {
                display: none !important;
            }

            body {
                background: white !important;
            }

            .card-custom, .info-table {
                box-shadow: none !important;
                border: 1px solid #888 !important;
            }
        }
    </style>
</head>

<body>

    <form id="form1" runat="server">

        <div class="page-wrapper">

            <!-- Page Title -->
            <h2 class="report-header">Faculty Report</h2>

            <!-- ======================= SEARCH PANEL ======================= -->
            <div class="search-card no-print mb-4">
                <div class="row g-3 align-items-center">
                    <!-- Search Faculty Name -->
                    <div class="col-md-4">
                        <label class="fw-semibold mb-1">Search Faculty</label>
                        <asp:TextBox ID="txtSearchFaculty" runat="server" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtSearchFaculty_TextChanged" placeholder="Type faculty name..."></asp:TextBox>
                    </div>
                    <!-- Dropdown -->
                    <div class="col-md-4">
                        <br />
                        <label class="fw-semibold mb-1">Select Faculty</label>
                        <asp:DropDownList ID="ddlFaculty" runat="server" CssClass="form-control"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvFaculty" runat="server" ControlToValidate="ddlFaculty" InitialValue="0" ErrorMessage="Please select faculty" CssClass="text-danger small" ValidationGroup="SearchGroup" />
                    </div>
                    <!-- Search Button -->
                    <div class="col-md-2">
                        <label class="invisible">Search</label>
                        <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary w-100" OnClick="btnSearch_Click" ValidationGroup="SearchGroup" />
                    </div>
                    <!-- Print -->
                    <div class="col-md-1">
                        <label class="invisible">Print</label>
                        <asp:Button ID="btnPrint" runat="server" Text="Print" CssClass="btn btn-secondary w-100" OnClientClick="window.print(); return false;" />
                    </div>
                    <!-- Back -->
                    <div class="col-md-1">
                        <label class="invisible">Back</label>
                        <asp:Button ID="Button1" runat="server" Text="Back" CssClass="btn btn-success w-100" OnClientClick="window.location='FacultyManagement.aspx'; return false;" />
                    </div>
                </div>
            </div>


            <!-- ======================= REPORT PANEL ======================= -->
            <asp:Panel ID="pnlReport" runat="server" Visible="false">

                <!-- Basic Info -->
                <div class="section-title">Basic Information</div>

                <table class="table table-bordered info-table">
                    <tr>
                        <th>Name</th>
                        <td>
                            <asp:Label ID="lblName" runat="server" /></td>
                    </tr>
                    <tr>
                        <th>Email</th>
                        <td>
                            <asp:Label ID="lblEmail" runat="server" /></td>
                    </tr>
                    <tr>
                        <th>Mobile</th>
                        <td>
                            <asp:Label ID="lblMobile" runat="server" /></td>
                    </tr>
                    <tr>
                        <th>Designation</th>
                        <td>
                            <asp:Label ID="lblDesignation" runat="server" /></td>
                    </tr>
                    <tr>
                        <th>Department</th>
                        <td>
                            <asp:Label ID="lblDepartment" runat="server" /></td>
                    </tr>
                    <tr>
                        <th>Status</th>
                        <td>
                            <asp:Label ID="lblStatus" runat="server" /></td>
                    </tr>
                    <tr>
                        <th>Biography</th>
                        <td>
                            <asp:Label ID="lblBio" runat="server" /></td>
                    </tr>
                </table>

                <!-- Education -->
                <div class="section-title">Education</div>
                <div class="card-custom">
                    <asp:GridView ID="gvEducation" runat="server"
                        CssClass="table table-striped table-bordered" />
                </div>

                <!-- Publications -->
                <div class="section-title">Research Publications</div>
                <div class="card-custom">
                    <asp:BulletedList ID="blPublications" runat="server" CssClass="fs-6" />
                </div>

                <!-- Research Interests -->
                <div class="section-title">Research Interests</div>
                <div class="card-custom">
                    <asp:BulletedList ID="blResearch" runat="server" CssClass="fs-6" />
                </div>

            </asp:Panel>

        </div>
    </form>

</body>
</html>
