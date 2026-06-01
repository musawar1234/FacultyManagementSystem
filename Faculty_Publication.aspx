<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Faculty_Publication.aspx.cs" Inherits="WebApplication_EntryForm.Faculty_Publication" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Faculty Publications Entry</title>

    <style>
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background: linear-gradient(135deg,#eef3f9,#dce6f2);
            margin: 0;
            padding: 40px 15px;
        }

        .container {
            background-color: #fff;
            max-width: 700px;
            padding: 30px 35px;
            margin: auto;
            box-shadow: 0 12px 30px rgba(0,0,0,0.08);
            border-radius: 10px;
        }

        h2 {
            text-align: center;
            color: #2F5878;
            margin-bottom: 20px;
        }

        hr {
            border: none;
            height: 1px;
            background: #e3eaf2;
            margin-bottom: 25px;
        }

        .form-group {
            margin-bottom: 18px;
            display: flex;
            flex-wrap: wrap;
            align-items: flex-start;
        }

        label {
            width: 160px;
            font-weight: 600;
            padding-top: 8px;
            color: #333;
        }

        input[type=text], textarea {
            width: calc(100% - 160px);
            padding: 9px 12px;
            border: 1px solid #cdd6e1;
            border-radius: 6px;
            font-size: 14px;
            transition: 0.2s;
        }

        input:focus, textarea:focus {
            outline: none;
            border-color: #2F5878;
            box-shadow: 0 0 0 2px rgba(47,88,120,0.1);
        }

        textarea {
            resize: vertical;
        }

        .btn-area {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 30px;
        }

        .submit-btn {
            width: 140px;
            background-color: #2F5878;
            color: white;
            border: none;
            padding: 10px;
            font-size: 15px;
            border-radius: 35px;
            cursor: pointer;
            transition: all 0.2s ease;
        }

        .submit-btn:hover {
            background-color: #1c3e55;
            transform: translateY(-1px);
        }

        #lblMessage {
            display: block;
            text-align: center;
            margin-top: 20px;
            font-weight: bold;
        }

        .validator {
            color: red;
            margin-left: 160px;
            font-size: 13px;
            margin-top: 3px;
        }

        /* Mobile view */
        @media (max-width: 600px) {
            .form-group {
                flex-direction: column;
            }

            label {
                width: 100%;
                margin-bottom: 6px;
            }

            input[type=text], textarea {
                width: 100%;
            }

            .validator {
                margin-left: 0;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" oncopy="return false;" onpaste="return true;" oncut="return false;">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <div class="container">
            <h2>Faculty Publications Entry Form</h2>
            <hr />

            <div class="form-group">
                <label for="txtPublication">Publication:</label>
                <asp:TextBox ID="txtPublication" runat="server" TextMode="MultiLine" Rows="4" Columns="40" />
                <asp:RequiredFieldValidator ID="rfvPublication" runat="server"
                    ControlToValidate="txtPublication"
                    ErrorMessage="Publication is required"
                    CssClass="validator" />
            </div>

            <div class="form-group">
                <label for="txtPublicationYear">Publication Year:</label>
                <asp:TextBox ID="txtPublicationYear" runat="server" />
                <asp:RequiredFieldValidator ID="rfvYear" runat="server"
                    ControlToValidate="txtPublicationYear"
                    ErrorMessage="Year is required"
                    CssClass="validator" />
                <asp:RegularExpressionValidator ID="revYear" runat="server"
                    ControlToValidate="txtPublicationYear"
                    ValidationExpression="^\d{4}$"
                    ErrorMessage="Enter valid 4-digit year"
                    CssClass="validator" />
            </div>

            <div class="form-group">
                <label for="txtFacultyID">Faculty ID:</label>
                <asp:TextBox ID="txtFacultyID" runat="server" />
                <asp:RequiredFieldValidator ID="rfvFaculty" runat="server"
                    ControlToValidate="txtFacultyID"
                    ErrorMessage="Faculty ID is required"
                    CssClass="validator" />
            </div>

            <div class="form-group">
                <label for="txtCreatedDate">Created Date:</label>
                <asp:TextBox ID="txtCreatedDate" runat="server" />
                <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server"
                    TargetControlID="txtCreatedDate"
                    Format="yyyy-MM-dd" />
                <asp:RequiredFieldValidator ID="rfvCreate" runat="server"
                    ControlToValidate="txtCreatedDate"
                    ErrorMessage="Select a date"
                    CssClass="validator" />
            </div>

            <div class="form-group">
                <label for="txtModifyDate">Modify Date:</label>
                <asp:TextBox ID="txtModifyDate" runat="server" />
                <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server"
                    TargetControlID="txtModifyDate"
                    Format="yyyy-MM-dd" />
            </div>

            <div class="form-group">
                <label for="txtIsActive">Is Active (1 or 0):</label>
                <asp:TextBox ID="txtIsActive" runat="server" Text="1" />
                <asp:RegularExpressionValidator ID="revActive" runat="server"
                    ControlToValidate="txtIsActive"
                    ValidationExpression="^[01]{1}$"
                    ErrorMessage="Only 1 or 0 allowed"
                    CssClass="validator" />
            </div>

            <div class="btn-area">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit"
                    CssClass="submit-btn"
                    OnClick="btnSubmit_Click" />

                <asp:Button ID="Button1" runat="server" Text="Back"
                    CssClass="submit-btn"
                    OnClientClick="window.location='FacultyManagement.aspx'; return false;" />
            </div>

            <asp:Label ID="lblMessage" runat="server" ForeColor="Green" />
        </div>
    </form>
</body>
</html>
