<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FacultyDegrees.aspx.cs" Inherits="WebApplication_EntryForm.FacultyDegrees" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Faculty Latest Degrees - Department Wise</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-4">
            <h2>Faculty Latest Degrees by Department</h2>

            <div class="row mb-3">
                <div class="col-md-3">
                    <asp:TextBox ID="txtDeptName" runat="server" CssClass="form-control"
                        placeholder="Enter Department Name (optional)" />
                </div>
                <div class="col-md-3">
                    <asp:TextBox ID="txtFacultyId" runat="server" CssClass="form-control"
                        placeholder="Faculty ID (optional)" TextMode="Number" />
                </div>
                <div class="col-md-3">
                    <asp:Button ID="btnSearch" runat="server" Text="Search"
                        CssClass="btn btn-primary" OnClick="btnSearch_Click" />
                    <asp:Button ID="btnClear" runat="server" Text="Clear"
                        CssClass="btn btn-secondary ms-2" OnClick="btnClear_Click" />
                </div>
                <div class="col-md-3">
                    <asp:Button ID="Button1" runat="server" Text="Back"
                        CssClass="btn btn-primary w-95"
                        OnClientClick="window.location='FacultyManagement.aspx'; return false;" />
                </div>
            </div>

            <asp:GridView ID="GridViewFaculty" runat="server" AutoGenerateColumns="False"
                CssClass="table table-striped table-hover" AllowPaging="true" PageSize="20"
                EmptyDataText="No faculty records found matching your criteria."
                OnPageIndexChanging="GridViewFaculty_PageIndexChanging">
                <Columns>
                    <asp:TemplateField HeaderText="Department">
                        <ItemTemplate>
                            <strong><%# Eval("DEPT_NAME") %></strong>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Faculty Name">
                        <ItemTemplate>
                            <%# Eval("FIRST_NAME") + " " + (Eval("MIDDLE_NAME")!=null ? Eval("MIDDLE_NAME") + " " : "") + Eval("LAST_NAME") %>
                            <br />
                            <small class="text-muted"><%# Eval("TITLE") %></small>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="EDUCATION_TITLE" HeaderText="Highest Degree" />
                    <asp:BoundField DataField="UNIVERSITY_NAME" HeaderText="University" />
                    <asp:BoundField DataField="SUBJECT_MAJORS" HeaderText="Major" />
                    <asp:TemplateField HeaderText="ID" HeaderStyle-Width="5%">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkFacultyID" runat="server"
                                CssClass="btn btn-sm btn-outline-primary"
                                CommandArgument='<%# Eval("FACULTY_ID") %>'
                                OnClick="lnkFacultyID_Click"
                                ToolTip="View Faculty Profile">
                                 <i class="fas fa-eye"></i> <%# Eval("FACULTY_ID") %>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerStyle CssClass="pagination justify-content-center" />
            </asp:GridView>
        </div>
    </form>
</body>
</html>
