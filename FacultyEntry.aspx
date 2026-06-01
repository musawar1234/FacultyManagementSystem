<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FacultyEntry.aspx.cs"
    Inherits="WebApplication_EntryForm.FacultyEntry" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Faculty Data Entry</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />

    <style>
        body {
            background-color: #f7f9fc;
            padding: 25px;
        }

        .container-box {
            background: #fff;
            max-width: 1200px;
            margin: auto;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 12px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #2F5878;
            margin-bottom: 30px;
        }

        .form-group label {
            font-weight: 600;
            color: #333;
        }

        .form-control {
            border-radius: 4px;
        }

        .submit-btn {
            width: 140px;
            background-color: #2F5878;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 5px;
            font-size: 15px;
            margin: 10px;
        }

        .submit-btn:hover {
            background-color: #1c3e55;
        }

        #lblMessage {
            display: block;
            text-align: center;
            margin-top: 20px;
            font-weight: bold;
            font-size: 15px;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />

        <div class="container-box">
            <h2>Faculty Data Entry Form</h2>
            <hr />

            <div class="row">

                <!-- First Name -->
                <div class="col-md-4">
                    <div class="form-group">
                        <label>First Name</label>
                        <asp:TextBox ID="txtFirstName" CssClass="form-control" runat="server" />
                        <asp:RequiredFieldValidator ID="rfvName" runat="server"
                            ControlToValidate="txtFirstName" ErrorMessage="First Name is required" ForeColor="Red" />
                    </div>
                </div>

                <!-- Middle Name -->
                <div class="col-md-4">
                    <div class="form-group">
                        <label>Middle Name</label>
                        <asp:TextBox ID="txtMiddleName" CssClass="form-control" runat="server" />
                    </div>
                </div>

                <!-- Last Name -->
                <div class="col-md-4">
                    <div class="form-group">
                        <label>Last Name</label>
                        <asp:TextBox ID="txtLastName" CssClass="form-control" runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                            ControlToValidate="txtLastName" ErrorMessage="Last Name is required" ForeColor="Red" />
                    </div>
                </div>

                <!-- Title -->
                <div class="col-md-4">
                    <div class="form-group">
                        <label>Title</label>
                        <asp:TextBox ID="txtTitle" CssClass="form-control" runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ControlToValidate="txtTitle" ErrorMessage="Title is required" ForeColor="Red" />
                    </div>
                </div>

                <!-- Image Path -->
                <div class="col-md-4">
                    <div class="form-group">
                        <label>Image Path</label>
                        <asp:TextBox ID="txtImagePath" CssClass="form-control" runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                            ControlToValidate="txtImagePath" ErrorMessage="Image Path is required" ForeColor="Red" />
                    </div>
                </div>

                <!-- Email -->
                <div class="col-md-4">
                    <div class="form-group">
                        <label>Email</label>
                        <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" />
                        <asp:RegularExpressionValidator ID="revEmail" runat="server"
                            ControlToValidate="txtEmail" ErrorMessage="Enter a valid email"
                            ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$" ForeColor="Red" />
                    </div>
                </div>

                <!-- Mobile -->
                <div class="col-md-4">
                    <div class="form-group">
                        <label>Mobile</label>
                        <asp:TextBox ID="txtMobileNo" CssClass="form-control" runat="server" />
                    </div>
                </div>

                <!-- Landline -->
                <div class="col-md-4">
                    <div class="form-group">
                        <label>Landline</label>
                        <asp:TextBox ID="txtLandNo" CssClass="form-control" runat="server" />
                    </div>
                </div>

                <!-- Designation -->
                <div class="col-md-4">
                    <div class="form-group">
                        <label>Designation ID</label>
                        <asp:TextBox ID="txtDesignationID" CssClass="form-control" runat="server" />
                    </div>
                </div>

                <!-- Department -->
                <div class="col-md-4">
                    <div class="form-group">
                        <label>Department ID</label>
                        <asp:TextBox ID="txtDepartmentID" CssClass="form-control" runat="server" />
                    </div>
                </div>

                <!-- Order -->
                <div class="col-md-4">
                    <div class="form-group">
                        <label>Faculty Order</label>
                        <asp:TextBox ID="txtFacultyOrder" CssClass="form-control" runat="server" />
                    </div>
                </div>

                <!-- Active -->
                <div class="col-md-4">
                    <div class="form-group">
                        <label>Is Active (1/0)</label>
                        <asp:TextBox ID="txtIsActive" CssClass="form-control" runat="server" />
                    </div>
                </div>

                <!-- Created Date -->
                <div class="col-md-4">
                    <div class="form-group">
                        <label>Created Date</label>
                        <asp:TextBox ID="txtCreatedDate" CssClass="form-control" runat="server" />
                        <ajaxToolkit:CalendarExtender TargetControlID="txtCreatedDate" Format="yyyy-MM-dd" runat="server" />
                    </div>
                </div>

                <!-- Modify Date -->
                <div class="col-md-4">
                    <div class="form-group">
                        <label>Modify Date</label>
                        <asp:TextBox ID="txtModifyDate" CssClass="form-control" runat="server" />
                        <ajaxToolkit:CalendarExtender TargetControlID="txtModifyDate" Format="yyyy-MM-dd" runat="server" />
                    </div>
                </div>

                <!-- Created By -->
                <div class="col-md-4">
                    <div class="form-group">
                        <label>Created By</label>
                        <asp:TextBox ID="txtCreatedBy" CssClass="form-control" runat="server" />
                    </div>
                </div>

                <!-- Research -->
                <div class="col-md-4">
                    <div class="form-group">
                        <label>Research Interest</label>
                        <asp:TextBox ID="txtResearchInterest" CssClass="form-control" runat="server" />
                    </div>
                </div>

                <!-- Education -->
                <div class="col-md-4">
                    <div class="form-group">
                        <label>Faculty Education</label>
                        <asp:TextBox ID="txtFacultyEducation" CssClass="form-control" runat="server" />
                    </div>
                </div>

                <!-- Status -->
                <div class="col-md-4">
                    <div class="form-group">
                        <label>Status</label>
                        <asp:TextBox ID="txtStatus" CssClass="form-control" runat="server" />
                    </div>
                </div>

                <!-- Biography -->
                <div class="col-md-6">
                    <div class="form-group">
                        <label>Biography</label>
                        <asp:TextBox ID="txtBiography" CssClass="form-control" TextMode="MultiLine" Rows="4" runat="server" />
                    </div>
                </div>

                <!-- Course -->
                <div class="col-md-6">
                    <div class="form-group">
                        <label>Current Course</label>
                        <asp:TextBox ID="txtCurrentCourse" CssClass="form-control" runat="server" />
                    </div>
                </div>

            </div>

            <div class="text-center">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="submit-btn" OnClick="btnSubmit_Click" />
                <asp:Button ID="Button1" runat="server" Text="Back" CssClass="submit-btn"
                    OnClientClick="window.location='FacultyManagement.aspx'; return false;" />
            </div>

            <asp:Label ID="lblMessage" runat="server" ForeColor="Green" />

        </div>
    </form>

    <!-- Back to top -->
    <button type="button" id="btn-back-to-top"
        style="display:none; position: fixed; bottom: 20px; right:20px; z-index:999;"
        class="btn btn-primary btn-lg">
        ↑
    </button>

    <script>
        let mybutton = document.getElementById("btn-back-to-top");
        window.onscroll = function () {
            mybutton.style.display =
                (document.documentElement.scrollTop > 100) ? "block" : "none";
        };

        mybutton.onclick = function () {
            window.scrollTo({ top: 0, behavior: 'smooth' });
        };
    </script>
</body>
</html>
