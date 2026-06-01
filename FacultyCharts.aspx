<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FacultyCharts.aspx.cs" Inherits="WebApplication_EntryForm.FacultyCharts" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Faculty Count by Department - Air University</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        .stats-card {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }
        .table-container {
            background: white;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        }
        .page-header {
            background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%);
            color: white;
        }
        .table-row-hover:hover {
            background-color: rgba(0,123,255,.075);
        }
    </style>
</head>
<body class="bg-light">
    <form id="form1" runat="server">
        <!-- Header Card -->
        <div class="container mt-4">
            <div class="row">
                <div class="col-12">
                    <div class="card page-header shadow-lg border-0 rounded-4 p-4 mb-4">
                        <div class="row align-items-center">
                            <div class="col-md-8">
                                <h1 class="mb-1 fw-bold">
                                    <i class="fas fa-users me-3"></i>
                                    Faculty Distribution Report
                                </h1>
                                <p class="mb-0 opacity-75">Active faculty count across all departments</p>
                            </div>
                            <div class="col-md-2 text-md-end">
                                <asp:Label ID="lblStatus" runat="server" CssClass="badge bg-success fs-6 px-4 py-2" />
                            </div>
                            <div class="col-md-2 text-md-end">
                                <asp:Button ID="Button1" runat="server" Text="Back"
                                    CssClass="btn btn-primary w-100"
                                    OnClientClick="window.location='FacultyManagement.aspx'; return false;" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Search Section -->
            <div class="row mb-4">
                <div class="col-md-6">
                    <div class="input-group input-group-lg">
                        <span class="input-group-text bg-white border-end-0">
                            <i class="fas fa-search text-muted"></i>
                        </span>
                        <asp:TextBox ID="txtSearch" runat="server" 
                            CssClass="form-control border-start-0 ps-0" 
                            placeholder="Search departments..." 
                            AutoPostBack="true" 
                            OnTextChanged="txtSearch_TextChanged">
                        </asp:TextBox>
                        <asp:Button ID="btnClearSearch" runat="server" 
                            Text="Clear" 
                            CssClass="btn btn-outline-secondary" 
                            OnClick="btnClearSearch_Click" />
                    </div>
                </div>
                <div class="col-md-6 text-md-end">
                    <asp:Label ID="lblSearchCount" runat="server" CssClass="badge bg-info fs-6 px-4 py-2" />
                </div>
            </div>

            <!-- Main Table Card -->
            <div class="row">
                <div class="col-12">
                    <div class="table-container p-4">
                        <div class="table-responsive">
                            <asp:GridView ID="gvDeptStats" runat="server"
                                CssClass="table table-hover align-middle mb-0"
                                AutoGenerateColumns="False"
                                AllowPaging="True" PageSize="31"
                                AllowSorting="True"
                                EmptyDataText="No active departments with faculty found."
                                GridLines="None"
                                OnPageIndexChanging="gvDeptStats_PageIndexChanging1"
                                OnSorting="gvDeptStats_Sorting">
                                <Columns>
                                    <asp:TemplateField HeaderText="#" HeaderStyle-Width="60px">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 + gvDeptStats.PageIndex * gvDeptStats.PageSize %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="DEPT_NAME" HeaderText="Department" SortExpression="DEPT_NAME"
                                        ItemStyle-Width="60%" />
                                    <asp:TemplateField HeaderText="Faculty Count" SortExpression="FacultyCount">
                                        <ItemTemplate>
                                            <span class="badge bg-primary fs-6 px-3 py-2">
                                                <i class="fas fa-user-graduate me-1"></i>
                                                <%# Eval("FacultyCount") %>
                                            </span>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <PagerStyle CssClass="pagination pagination-sm justify-content-center mb-0" />
                                <HeaderStyle CssClass="table-dark fw-semibold" />
                                <RowStyle CssClass="table-row-hover" />
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
