<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Faculty_Education.aspx.cs"
    Inherits="WebApplication_EntryForm.Faculty_Education" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Faculty Education Entry</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />

    <style>
        body {
            background-color: #eef2f5;
            padding: 30px;
        }

        .container-box {
            background: white;
            max-width: 900px;
            margin: auto;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 12px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
        }

        .form-group label {
            font-weight: 600;
            color: #34495e;
        }

        .form-control {
            border-radius: 4px;
        }

        .submit-btn {
            background-color: #2980b9;
            color: white;
            border: none;
            padding: 10px 25px;
            border-radius: 5px;
            margin: 10px;
        }

        .submit-btn:hover {
            background-color: #1f618d;
        }

        #lblMessage {
            display: block;
            margin-top: 15px;
            text-align: center;
            font-weight: bold;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server" oncopy="return false;" onpaste="return true;" oncut="return false;">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />

        <div class="container-box">
            <h2>Faculty Education Entry Form</h2>
            <hr />

            <div class="row">

                <!-- Education Title -->
                <div class="col-md-6">
                    <div class="form-group">
                        <label>Education Title</label>
                        <asp:TextBox ID="txtEducationTitle" CssClass="form-control" runat="server" />
                    </div>
                </div>

                <!-- University Name -->
                <div class="col-md-6">
                    <div class="form-group">
                        <label>University Name</label>
                        <asp:TextBox ID="txtUniversityName" CssClass="form-control" runat="server" />
                    </div>
                </div>

                <!-- Is Active -->
                <div class="col-md-6">
                    <div class="form-group">
                        <label>Is Active (1 or 0)</label>
                        <asp:TextBox ID="txtIsActive" CssClass="form-control" runat="server" Text="1" />
                    </div>
                </div>

                <!-- Created Date -->
                <div class="col-md-6">
                    <div class="form-group">
                        <label>Created Date</label>
                        <asp:TextBox ID="txtCreatedDate" CssClass="form-control" runat="server" Placeholder="yyyy-MM-dd" />
                        <ajaxToolkit:CalendarExtender TargetControlID="txtCreatedDate" Format="yyyy-MM-dd" runat="server" />
                    </div>
                </div>

                <!-- Modify Date -->
                <div class="col-md-6">
                    <div class="form-group">
                        <label>Modify Date</label>
                        <asp:TextBox ID="txtModifyDate" CssClass="form-control" runat="server" Placeholder="yyyy-MM-dd" />
                        <ajaxToolkit:CalendarExtender TargetControlID="txtModifyDate" Format="yyyy-MM-dd" runat="server" />
                    </div>
                </div>

                <!-- Created By -->
                <div class="col-md-6">
                    <div class="form-group">
                        <label>Created By (User ID)</label>
                        <asp:TextBox ID="txtCreatedBy" CssClass="form-control" runat="server" />
                    </div>
                </div>

                <!-- Faculty ID -->
                <div class="col-md-6">
                    <div class="form-group">
                        <label>Faculty ID</label>
                        <asp:TextBox ID="txtFacultyID" CssClass="form-control" runat="server" />
                    </div>
                </div>

                <!-- Subject Majors -->
                <div class="col-md-6">
                    <div class="form-group">
                        <label>Subject Majors</label>
                        <asp:TextBox ID="txtSubjectMajors" CssClass="form-control" runat="server" />
                    </div>
                </div>

            </div>

            <div class="text-center">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit"
                    CssClass="submit-btn" OnClick="btnSubmit_Click" />

                <asp:Button ID="Button1" runat="server" Text="Back"
                    CssClass="submit-btn"
                    OnClientClick="window.location='FacultyManagement.aspx'; return false;" />
            </div>

            <asp:Label ID="lblMessage" runat="server" ForeColor="Green" />

        </div>
    </form>
</body>
</html>
