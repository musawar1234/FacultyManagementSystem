<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Display_Researech_interest_details.aspx.cs" Inherits="WebApplication_EntryForm.Display_Researech_interest_details" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Faculty Research Interest</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>

<body>
    <form id="form1" runat="server" oncopy="return false;" onpaste="return false;" oncut="return false;">

        <div class="container mt-4">

            <!-- Page Title -->
            <div class="row mb-4">
                <div class="col-md-12 text-center">
                    <h2 class="fw-bold text-primary">Display of Faculty Research Interest</h2>
                </div>
            </div>

            <!-- Search Section -->
            <div class="row mb-3 justify-content-center">
                <div class="col-md-6">
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" 
                        placeholder="Search by Research ID"></asp:TextBox>
                </div>
                <div class="col-md-3 d-flex gap-2">
                    <asp:Button ID="btnSearch" runat="server" Text="Search" 
                        CssClass="btn btn-primary w-50" OnClick="btnSearch_Click" />

                    <asp:Button ID="Button1" runat="server" Text="Back" 
                        CssClass="btn btn-success w-50" 
                        OnClientClick="window.location='FacultyManagement.aspx'; return false;" />
                </div>
            </div>

            <!-- GridView Section -->
            <div class="row justify-content-center">
                <div class="col-md-10">
                    <asp:GridView ID="GridView1" runat="server" 
                        CssClass="table table-bordered table-striped table-hover"
                        AutoGenerateColumns="false" GridLines="None" Width="100%"
                        AllowPaging="True" PageSize="10">

                        <Columns>
                            <asp:BoundField DataField="RESEARCH_ID" HeaderText="Research ID" />
                            <asp:BoundField DataField="RESEARCH_TITLE" HeaderText="Title" />
                            <asp:BoundField DataField="FACULTY_ID" HeaderText="Faculty ID" />
                            <asp:BoundField DataField="CREATED_DATE" HeaderText="Created Date" DataFormatString="{0:yyyy-MM-dd}" />
                            <asp:BoundField DataField="MODIFY_DATE" HeaderText="Modified Date" DataFormatString="{0:yyyy-MM-dd}" />
                            <asp:BoundField DataField="CREATED_BY" HeaderText="Created By" />

                            <asp:TemplateField HeaderText="Active">
                                <ItemTemplate>
                                    <%# (Eval("IS_ACTIVE").ToString() == "True") ? "Yes" : "No" %>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>

                    </asp:GridView>
                </div>
            </div>

        </div>

    </form>
</body>
</html>
