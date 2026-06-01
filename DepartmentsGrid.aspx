<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DepartmentsGrid.aspx.cs" Inherits="WebApplication_EntryForm.DepartmentsGrid" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Department Details</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Bootstrap 5 JS + Popper + jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f8f9fa;
            padding-top: 20px;
        }

        .search-section {
            margin-bottom: 15px;
        }

        .btn-spacing {
            margin-left: 5px;
        }

        h2 {
            color: #0d6efd;
            font-weight: 600;
        }

        /* Optional: center GridView on small screens */
        @media (max-width: 576px) {
            .container-custom {
                padding: 0 10px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" oncopy="return false;" onpaste="return false;" oncut="return false;">
        <div class="container container-custom">

            <!-- Page Title -->
            <div class="row mb-3">
                <div class="col-12">
                    <h2>Department Details</h2>
                    <hr />
                </div>
            </div>

            <!-- Search + Buttons -->
            <div class="row mb-3">
                <div class="col-md-6 col-sm-12 mb-2">
                    <div class="input-group">
                        <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Search by Department Name"></asp:TextBox>
                        <button class="btn btn-primary" type="button">
                            <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary border-0"
                                OnClick="btnSearch_Click" />
                        </button>
                    </div>
                </div>
                <div class="col-md-6 col-sm-12 text-md-end text-sm-start mb-2">
                    <asp:Button ID="Button1" runat="server" Text="Back" CssClass="btn btn-secondary"
                        OnClientClick="window.location='FacultyManagement.aspx'; return false;" />
                </div>
            </div>

            <!-- GridView -->
            <div class="row">
                <div class="col-12 table-responsive">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" DataKeyNames="DEPT_ID"
                        CssClass="table table-striped table-bordered table-hover text-center"
                        DataSourceID="SqlDataSource1"
                        AllowPaging="True" PageSize="10"
                        PagerSettings-Mode="Numeric" PagerSettings-PageButtonCount="10"
                        PagerStyle-CssClass="pagination-boot">

                        <Columns>
                            <asp:BoundField DataField="DEPT_ID" HeaderText="ID" ReadOnly="True" SortExpression="DEPT_ID" />
                            <asp:BoundField DataField="DEPT_NAME" HeaderText="Department Name" SortExpression="DEPT_NAME" />
                            <asp:BoundField DataField="DEPT_DESC" HeaderText="Description" SortExpression="DEPT_DESC" />
                            <asp:CheckBoxField DataField="IS_ACTIVE" HeaderText="Active" SortExpression="IS_ACTIVE" />
                            <asp:BoundField DataField="FACULTY_NAME" HeaderText="Faculty" SortExpression="FACULTY_NAME" />
                        </Columns>

                    </asp:GridView>
                </div>
            </div>

            <!-- SQL Data Source -->
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:au_edu_pk_websiteDBConnectionString %>"
                SelectCommand="SELECT [DEPT_ID], [DEPT_NAME], [DEPT_DESC], [IS_ACTIVE], [FACULTY_NAME] FROM [DEPARTMENTS] ORDER BY [DEPT_ID] ASC">
            </asp:SqlDataSource>

        </div>
    </form>

    <style>
        /* Bootstrap-style pager for GridView */
        .pagination-boot a, .pagination-boot span {
            padding: 6px 12px;
            margin: 2px;
            border-radius: 6px;
            border: 1px solid #cfd1d4;
            text-decoration: none;
            font-size: 14px;
        }

        .pagination-boot a {
            background-color: #ffffff;
            color: #0d6efd;
        }

        .pagination-boot span {
            background-color: #0d6efd;
            color: #fff;
            border-color: #0d6efd;
        }

        .pagination-boot a:hover {
            background-color: #eaf0ff;
        }
    </style>

</body>
</html>
