<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Advertisement_Form_Entry.aspx.cs" Inherits="WebApplication_EntryForm.Advertisement_Form_Entry" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Advertisement Entry Form</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
 <form id="form1" runat="server" class="container mt-5"  oncopy="return false;" onpaste="return false;" oncut="return false;">
        <div class="card shadow-sm">
            <div class="card-header bg-primary text-white">
                <h4 class="mb-0">Advertisement Entry Form</h4>
            </div>
            <div class="card-body">
                <div class="row mb-3">
                    <label for="txtAdvTitle" class="col-sm-3 col-form-label">Title:</label>
                    <div class="col-sm-9">
                        <asp:TextBox ID="txtAdvTitle" runat="server" CssClass="form-control" />
                    </div>
                </div>

                <div class="row mb-3">
                    <label for="txtAdvDesc" class="col-sm-3 col-form-label">Description:</label>
                    <div class="col-sm-9">
                        <asp:TextBox ID="txtAdvDesc" runat="server" TextMode="MultiLine" Rows="5" CssClass="form-control" />
                    </div>
                </div>

                <div class="row mb-3">
                    <label for="txtAdvDate" class="col-sm-3 col-form-label">Advertisement Date:</label>
                    <div class="col-sm-9">
                        <asp:TextBox ID="txtAdvDate" runat="server" CssClass="form-control" Placeholder="yyyy-mm-dd" />
                    </div>
                </div>

                <div class="row mb-3 align-items-center">
                    <label for="chkIsActive" class="col-sm-3 col-form-label">Is Active:</label>
                    <div class="col-sm-9">
                        <asp:CheckBox ID="chkIsActive" runat="server" CssClass="form-check-input" />
                    </div>
                </div>

                <div class="row mb-3">
                    <label for="txtNewspaperName" class="col-sm-3 col-form-label">Newspaper Name:</label>
                    <div class="col-sm-9">
                        <asp:TextBox ID="txtNewspaperName" runat="server" CssClass="form-control" />
                    </div>
                </div>

                <div class="row mb-3">
                    <label for="txtReferenceUrl" class="col-sm-3 col-form-label">Reference URL:</label>
                    <div class="col-sm-9">
                        <asp:TextBox ID="txtReferenceUrl" runat="server" CssClass="form-control" />
                    </div>
                </div>

                <div class="row mb-3">
                    <label for="txtCreatedBy" class="col-sm-3 col-form-label">Created By (User ID):</label>
                    <div class="col-sm-9">
                        <asp:TextBox ID="txtCreatedBy" runat="server" CssClass="form-control" />
                    </div>
                </div>

                <div class="row mb-3">
                    <label for="txtImagePath" class="col-sm-3 col-form-label">Image Path:</label>
                    <div class="col-sm-9">
                        <asp:TextBox ID="txtImagePath" runat="server" CssClass="form-control" />
                    </div>
                </div>

                <div class="row mb-3">
                    <label for="txtAdvType" class="col-sm-3 col-form-label">Advertisement Type:</label>
                    <div class="col-sm-9">
                        <asp:TextBox ID="txtAdvType" runat="server" CssClass="form-control" />
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="offset-sm-3 col-sm-9">
                        <asp:Button ID="btnSubmit" runat="server" Text="Save Advertisement" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
                        <button class="btn btn-primary"><a href="FacultyManagement.aspx" Class="btn btn-primary">Back</a></button>
                    </div>
                </div>

                <div class="row">
                    <div class="offset-sm-3 col-sm-9">
                        <asp:Label ID="lblMessage" runat="server" />
                    </div>
                </div>
            </div>
        </div>
    </form>

    <!-- Bootstrap 5 JS Bundle including Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
