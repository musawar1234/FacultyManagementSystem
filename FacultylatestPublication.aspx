<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FacultylatestPublication.aspx.cs" Inherits="WebApplication_EntryForm.FacultylatestPublication" %>


<!DOCTYPE html>
<html>
<head runat="server">
    <title>Faculty Publications by Department</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }

        .search-card {
            box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
        }

        .table-container {
            background: white;
            border-radius: 0.375rem;
        }

        .publication-cell {
            max-width: 800px;
            word-wrap: break-word;
        }

        .no-data {
            color: #6c757d;
            font-style: italic;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid py-4">
            <div class="row justify-content-center">
                <div class="col-lg-11">
                    <!-- Page Header -->
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h2 class="h2 mb-0 fw-bold text-primary">
                            <i class="bi bi-people-fill me-2"></i>Faculty Publications
                        </h2>
                        <small class="text-muted">Latest publications by department</small>
                    </div>

                    <!-- Search Panel -->
                    <div class="card search-card p-4 mb-4">
                        <div class="row g-3 align-items-end">
                            <div class="col-md-8">
                                <label for="ddlDepartments" class="form-label fw-semibold">
                                    <i class="bi bi-building me-1"></i>Select Department
                                </label>
                                <asp:DropDownList ID="ddlDepartments" runat="server"
                                    CssClass="form-select form-select-lg" AppendDataBoundItems="true">
                                    <asp:ListItem Value="" Text="-- Select Department --" Selected="True"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-4">
                                <asp:Button ID="btnSearch" runat="server" Text="Search Faculty"
                                    OnClick="btnSearch_Click" CssClass="btn btn-primary btn-md-110" />
                                <asp:Button ID="Button1" runat="server" Text="Back"
                        CssClass="btn btn-primary btn-md-110" OnClientClick="window.location='FacultyManagement.aspx'; return false;" />
                            </div>
                        </div>
                    </div>

                    <!-- Results Grid -->
                    <div class="table-container p-4">
                        <div class="table-responsive">
                            <asp:GridView ID="gvFacultyPublications" runat="server"
                                AutoGenerateColumns="false" AllowPaging="true" PageSize="10"
                                CssClass="table table-hover table-striped"
                                EmptyDataText="No faculty found for selected department."
                                EmptyDataRowStyle-CssClass="no-data text-center py-5"
                                OnPageIndexChanging="gvFacultyPublications_PageIndexChanging">
                                <Columns>
                                    <asp:TemplateField HeaderText="Faculty" HeaderStyle-CssClass="table-primary">
                                        <ItemTemplate>
                                            <div class="d-flex align-items-center">
                                                <div class="avatar-sm bg-light rounded-circle d-flex align-items-center justify-content-center me-3">
                                                    <i class="bi bi-person-circle fs-4 text-secondary"></i>
                                                </div>
                                                <div>
                                                    <strong class="text-dark mb-0"><%# Eval("FacultyName") %></strong><br>
                                                    <small class="text-muted"><%# Eval("Title") %></small>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:BoundField DataField="Email" HeaderText="Email" ItemStyle-CssClass="text-nowrap" HeaderStyle-CssClass="table-success" />

                                    <%--<asp:BoundField DataField="Mobile" HeaderText="Mobile"
                                        ItemStyle-CssClass="text-nowrap" HeaderStyle-CssClass="table-info" />--%>

                                   <%-- <asp:TemplateField HeaderText="Research Interest" HeaderStyle-CssClass="table-warning">
                                        <ItemTemplate>
                                            <div class="publication-cell">
                                                <%# GetResearchInterestPreview((string)Eval("ResearchInterest")) %>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>--%>

                                    <asp:TemplateField HeaderText="Latest Publication" HeaderStyle-CssClass="table-danger">
                                        <ItemTemplate>
                                            <div class="publication-cell">
                                                <%# GetLatestPublicationDisplay(Eval("LatestPublication"), Eval("Publication_Year")) %>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <PagerSettings Mode="NumericFirstLast" Position="Bottom" />
                                <PagerStyle CssClass="pagination-sm" />
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </form>
</body>
</html>
