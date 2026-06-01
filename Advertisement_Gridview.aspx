<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Advertisement_Gridview.aspx.cs" Inherits="WebApplication_EntryForm.Advertisement_Gridview" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Advertisement Details</title>

    <!-- Bootstrap & Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet" />

    <style>
        body {
            background: linear-gradient(to right, #f7f9fc, #eef2f7);
            font-family: 'Segoe UI', sans-serif;
        }

        .container {
            margin-top: 40px;
        }

        h2 {
            font-size: 28px;
            font-weight: 700;
            color: #0d6efd;
        }

        .card {
            border-radius: 15px;
            border: none;
            box-shadow: 0 10px 25px rgba(0,0,0,0.08);
            padding: 20px;
            background: #ffffff;
        }

        .btn-back {
            background: #6c757d;
            color: white;
            border-radius: 8px;
        }

        .btn-back:hover {
            background: #5a6268;
        }

        .table th {
            background: linear-gradient(to right, #0d6efd, #084298);
            color: white;
            text-align: center;
            vertical-align: middle;
        }

        .table td {
            text-align: center;
            vertical-align: middle;
            padding: 12px;
        }

        .table-hover tbody tr:hover {
            background-color: #f1f5ff;
            transition: 0.2s;
        }

        .img-thumbnail {
            max-height: 45px;
            transition: 0.3s ease-in-out;
        }

        .img-thumbnail:hover {
            transform: scale(1.8);
            z-index: 10;
        }

        .description-cell {
            max-width: 260px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .status-true {
            background: #198754;
            color: white;
            padding: 3px 10px;
            border-radius: 20px;
            font-size: 13px;
        }

        .status-false {
            background: #dc3545;
            color: white;
            padding: 3px 10px;
            border-radius: 20px;
            font-size: 13px;
        }

        .toolbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .search-box {
            max-width: 280px;
        }

        .pagination {
            justify-content: center !important;
        }
    </style>
</head>

<body>
<form id="form1" runat="server" oncopy="return false;" onpaste="return false;" oncut="return false;">

    <div class="container">
        <div class="card">

            <!-- Header -->
            <div class="toolbar">
                <h2><i class="bi bi-megaphone-fill"></i> Advertisement Display</h2>

                <div>
                    <a href="FacultyManagement.aspx" class="btn btn-back me-2">
                        <i class="bi bi-arrow-left-circle"></i> Back
                    </a>
                </div>
            </div>

            <!-- Search (UI only) -->
            <div class="input-group search-box mb-3">
                <span class="input-group-text bg-primary text-white">
                    <i class="bi bi-search"></i>
                </span>
                <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Search Title..." />
            </div>

            <!-- Grid -->
            <div class="table-responsive">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="ADV_ID"
                    DataSourceID="SqlDataSource1"
                    AllowPaging="True" PageSize="10"
                    CssClass="table table-bordered table-striped table-hover"
                    PagerStyle-CssClass="pagination justify-content-center"
                    OnPageIndexChanging="GridView1_PageIndexChanging">

                    <Columns>

                        <asp:BoundField DataField="ADV_ID" HeaderText="ID" ReadOnly="True" />

                        <asp:BoundField DataField="ADV_TITLE" HeaderText="Title" />

                        <asp:TemplateField HeaderText="Description">
                            <ItemTemplate>
                                <div class="description-cell" title='<%# Eval("ADV_DESC") %>'>
                                    <%# Eval("ADV_DESC").ToString().Length > 50 
                                        ? Eval("ADV_DESC").ToString().Substring(0, 50) + "..." 
                                        : Eval("ADV_DESC") %>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField DataField="ADV_DATE" HeaderText="Advert Date" DataFormatString="{0:yyyy-MM-dd}" />

                        <asp:TemplateField HeaderText="Status">
                            <ItemTemplate>
                                <span class='<%# (bool)Eval("IS_ACTIVE") ? "status-true" : "status-false" %>'>
                                    <%# (bool)Eval("IS_ACTIVE") ? "Active" : "Inactive" %>
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField DataField="NEWSPAPER_NAME" HeaderText="Newspaper" />

                        <asp:BoundField DataField="MODIFY_DATE" HeaderText="Modified" DataFormatString="{0:yyyy-MM-dd}" />

                        <asp:BoundField DataField="CREATED_BY" HeaderText="Created By" />

                        <asp:BoundField DataField="ADV_TYPE" HeaderText="Type" />

                        <asp:TemplateField HeaderText="Image">
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" 
                                    ImageUrl='<%# Eval("IMAGE_PATH") %>' 
                                    CssClass="img-thumbnail"
                                    AlternateText="No Image" />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField DataField="CREATED_DATE" HeaderText="Created Date" DataFormatString="{0:yyyy-MM-dd}" />

                    </Columns>
                </asp:GridView>
            </div>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:au_edu_pk_websiteDBConnectionString3 %>"
                SelectCommand="SELECT [ADV_ID], [ADV_TITLE], [ADV_DESC], [ADV_DATE], 
                               [IS_ACTIVE], [NEWSPAPER_NAME], [MODIFY_DATE],
                               [CREATED_BY], [ADV_TYPE], [IMAGE_PATH], [CREATED_DATE]
                               FROM [ADVERTISEMENTS] 
                               ORDER BY [ADV_ID] DESC">
            </asp:SqlDataSource>

        </div>
    </div>

</form>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
