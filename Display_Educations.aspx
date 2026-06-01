<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Display_Educations.aspx.cs"
    Inherits="WebApplication_EntryForm.Display_Educations" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Faculty Education Search</title>

    <!-- BOOTSTRAP CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body class="bg-light">

    <form id="form1" runat="server">

        <div class="container mt-5">

            <div class="card shadow-lg">
                <div class="card-header bg-primary text-white text-center">
                    <h3>Faculty Education Search</h3>
                </div>

                <div class="card-body">

                    <div class="row mb-3">

                        <div class="col-md-6">
                            <label class="form-label fw-bold">Faculty ID</label>
                            <asp:TextBox ID="txtFacultyID" runat="server"
                                CssClass="form-control"
                                placeholder="Enter Faculty ID"></asp:TextBox>
                        </div>

                        <div class="col-md-6">
                            <label class="form-label fw-bold">Faculty Name</label>

                            <asp:TextBox
                                ID="txtFacultyName"
                                runat="server"
                                CssClass="form-control"
                                AutoComplete="on"
                                list="FacultyList">
                            </asp:TextBox>

                            <datalist id="FacultyList" runat="server"></datalist>
                        </div>

                    </div>

                    <div class="text-center">
                        <asp:Button ID="btnSearch" runat="server"
                            Text="🔍 Search"
                            CssClass="btn btn-success px-5"
                            OnClick="btnSearch_Click" />
                        <asp:Button ID="Button2" runat="server" Text="🔙 Back" CssClass="btn btn-success px-5"
                            OnClientClick="window.location='FacultyManagement.aspx'; return false;" />
                    </div>
                    <hr class="my-4" />

                    <div class="table-responsive">

                        <asp:GridView ID="gvFacultyEducation" runat="server"
                            AutoGenerateColumns="true"
                            CssClass="table table-bordered table-striped table-hover text-center"
                            HeaderStyle-CssClass="table-dark"
                            EmptyDataText="No Data Found"
                            BorderWidth="0">
                        </asp:GridView>

                    </div>

                </div>

                <div class="card-footer text-center text-muted">
                    Faculty Education Management System
                </div>

            </div>

        </div>

    </form>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
