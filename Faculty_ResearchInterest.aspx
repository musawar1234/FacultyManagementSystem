<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Faculty_ResearchInterest.aspx.cs" Inherits="WebApplication_EntryForm.UpdateFacultyEntryFrom" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Faculty Research Interest Entry</title>
    <style>
        body {
            font-family: Calibri, sans-serif;
            background-color: #f0f4f8;
            padding: 20px;
        }

        .form-container {
            max-width: 550px;
            margin: auto;
            background: white;
            padding: 25px 30px;
            box-shadow: 0 2px 12px rgb(0 0 0 / 0.1);
            border-radius: 8px;
        }

        h2 {
            text-align: center;
            color: #355070;
            margin-bottom: 25px;
            font-weight: 700;
        }

        .field-group {
            margin-bottom: 18px;
        }

        label {
            display: inline-block;
            width: 150px;
            color: #333;
            font-weight: 600;
            padding-top: 6px;
        }

        input[type=text], input[type=datetime], input[type=number] {
            width: calc(100% - 160px);
            padding: 8px 12px;
            border: 1px solid #bbb;
            border-radius: 4px;
            font-size: 15px;
            box-sizing: border-box;
            font-family: inherit;
        }

        .submit-btn {
            width: 140px;
            margin: 25px auto 0 auto;
            display: block;
            background-color: #355070;
            border: none;
            padding: 12px;
            border-radius: 6px;
            font-size: 16px;
            color: white;
            cursor: pointer;
            font-weight: 700;
        }

            .submit-btn:hover {
                background-color: #2a3e5a;
            }

        #lblMessage {
            text-align: center;
            margin-top: 20px;
            font-weight: 600;
            color: green;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" oncopy="return false;" onpaste="return true;" oncut="return false;">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="form-container">
            <h2>Faculty Research Interest Entry</h2>
            <div class="field-group">
                <label for="txtResearchTitle">Research Title:</label>
                <asp:TextBox ID="txtResearchTitle" runat="server" />
            </div>
            <hr />
            <div class="field-group">
                <label for="txtFacultyID">Faculty ID:</label>
                <asp:TextBox ID="txtFacultyID" runat="server" />
            </div>
            <div class="field-group">
                <label for="txtCreatedDate">Created Date:</label>
                <asp:TextBox ID="txtCreatedDate" runat="server" placeholder="yyyy-MM-dd HH:mm:ss" />
                <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server"
                    TargetControlID="txtCreatedDate"
                    Format="yyyy-MM-dd HH:mm:ss" />
            </div>

            <div class="field-group">
                <label for="txtModifyDate">Modify Date:</label>
                <asp:TextBox ID="txtModifyDate" runat="server" placeholder="yyyy-MM-dd HH:mm:ss" />
                <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server"
                    TargetControlID="txtModifyDate"
                    Format="yyyy-MM-dd HH:mm:ss" />
            </div>
            <%--            <div class="field-group">
                <label for="txtCreatedDate">Created Date:</label>
                <asp:TextBox ID="txtCreatedDate" runat="server" placeholder="yyyy-MM-dd HH:mm:ss" />
            </div>

            <div class="field-group">
                <label for="txtModifyDate">Modify Date:</label>
                <asp:TextBox ID="txtModifyDate" runat="server" placeholder="yyyy-MM-dd HH:mm:ss" />
            </div>--%>

            <div class="field-group">
                <label for="txtCreatedBy">Created By:</label>
                <asp:TextBox ID="txtCreatedBy" runat="server" />
            </div>

            <div class="field-group">
                <label for="txtIsActive">Is Active (1 or 0):</label>
                <asp:TextBox ID="txtIsActive" runat="server" Text="1" />
            </div>

            <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="submit-btn" OnClick="btnSubmit_Click" />
            <asp:Button ID="Button1" runat="server" Text="Back" CssClass="submit-btn" OnClientClick="window.location='FacultyManagement.aspx'; return false;" />
            <asp:Label ID="lblMessage" runat="server" />
        </div>
    </form>
</body>
</html>
