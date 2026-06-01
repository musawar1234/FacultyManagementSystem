<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListofDepartments.aspx.cs" Inherits="WebApplication_EntryForm.ListofDepartments" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Heads of Departments</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid mt-4">
            <h2 class="mb-4">Heads of Departments</h2>
            <div class="table-responsive">
                <asp:GridView ID="gvHeadsOfDept" runat="server" CssClass="table table-striped table-bordered table-hover"
                    AutoGenerateColumns="False" GridLines="None" AllowPaging="true" PageSize="10">
                    <Columns>
                        <asp:BoundField DataField="FacultyName" HeaderText="Faculty Name" HeaderStyle-CssClass="table-dark" />
                        <asp:BoundField DataField="DesignationName" HeaderText="Designation" HeaderStyle-CssClass="table-dark" />
                        <asp:BoundField DataField="DepartmentName" HeaderText="Department" HeaderStyle-CssClass="table-dark" />
                    </Columns>
                    <PagerStyle CssClass="pagination justify-content-center" />
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>