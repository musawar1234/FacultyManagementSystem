<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Fac_dept_count.aspx.cs" Inherits="WebApplication_EntryForm.Fac_dept_count" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Faculty Count by Department</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <h2 class="mb-4">Faculty per Department Report</h2>
            <asp:GridView ID="gvDeptStats" runat="server" 
                CssClass="table table-striped table-hover table-bordered" 
                AutoGenerateColumns="False" 
                AllowPaging="True" PageSize="10"
                AllowSorting="True"
                EmptyDataText="No active departments found."
                GridLines="None"
                OnPageIndexChanging="gvDeptStats_PageIndexChanging">
                <Columns>
                    <asp:BoundField DataField="DEPT_NAME" HeaderText="Department" SortExpression="DEPT_NAME" />
                    <asp:BoundField DataField="FacultyCount" HeaderText="Active Faculty Count" SortExpression="FacultyCount" />
                </Columns>
                <PagerStyle CssClass="pagination justify-content-center" />
                <HeaderStyle CssClass="table-dark" />
                <EmptyDataRowStyle CssClass="text-center text-muted p-4" />
            </asp:GridView>
            <asp:Label ID="lblStatus" runat="server" CssClass="mt-3 d-block" />
        </div>
    </form>
</body>
</html>
