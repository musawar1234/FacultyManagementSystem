<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Faculty_Department_details.aspx.cs" Inherits="WebApplication_EntryForm.Faculty_Department_details" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Faculty Statistics Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <h2>Active Faculty by Faculty and Department</h2>
            <asp:GridView ID="gvFacultyStats" runat="server" CssClass="table table-striped table-hover" 
                          AutoGenerateColumns="False" AllowSorting="true" DataKeyNames="DEPT_ID">
                <Columns>
                    <asp:BoundField DataField="FACULTY_NAME" HeaderText="Faculty Name" SortExpression="FACULTY_NAME" />
                    <asp:BoundField DataField="DEPT_NAME" HeaderText="Department Name" SortExpression="DEPT_NAME" />
                    <asp:BoundField DataField="ActiveFacultyCount" HeaderText="Active Faculty Count" SortExpression="ActiveFacultyCount" />
                </Columns>
            </asp:GridView>
            <asp:Label ID="lblStatus" runat="server" CssClass="text-info" />
        </div>
    </form>
</body>
</html>
