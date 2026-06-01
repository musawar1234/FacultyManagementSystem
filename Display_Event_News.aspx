<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Display_Event_News.aspx.cs" Inherits="WebApplication_EntryForm.Display_Event_News" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>News Events Grid</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>

<body>
    <form id="form1" runat="server" oncopy="return false;" onpaste="return false;" oncut="return false;">

        <div class="container-fluid mt-4">

            <!-- Title -->
            <div class="row mb-4">
                <div class="col-12 text-center">
                    <h2 class="fw-bold text-primary">News & Events Records</h2>
                    <hr />
                </div>
            </div>

            <!-- Search Section -->
            <div class="row mb-3 justify-content-center">

                <div class="col-md-4 mb-2">
                    <asp:TextBox ID="txtSearchID" runat="server" CssClass="form-control"
                        placeholder="Enter ID to search"></asp:TextBox>
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
                <div class="col-md-12">

                    <asp:GridView ID="gvNewsEvents" runat="server"
                        AutoGenerateColumns="false"
                        CssClass="table table-bordered table-hover table-striped"
                        GridLines="None" Width="100%">

                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="ID" />
                            <asp:BoundField DataField="TITLE" HeaderText="Title" />
                            <asp:BoundField DataField="IMAGE_PATH" HeaderText="Image Path" />
                            <asp:BoundField DataField="EVENT_DATE" HeaderText="Event Date" />
                            <asp:BoundField DataField="EVENT_ORDER" HeaderText="Event Order" />
                            <asp:BoundField DataField="EVENT_STATUS" HeaderText="Event Status" />
                            <asp:BoundField DataField="IS_ACTIVE" HeaderText="Is Active" />
                            <asp:BoundField DataField="CREATED_DATE" HeaderText="Created Date" />
                            <asp:BoundField DataField="MODIFY_DATE" HeaderText="Modify Date" />
                            <asp:BoundField DataField="CREATED_BY" HeaderText="Created By" />
                            <asp:BoundField DataField="IMAGE_GALLARY" HeaderText="Image Gallery">
                                <HeaderStyle Width="120px" />
                                <ItemStyle Width="120px" Wrap="true" />
                            </asp:BoundField>
                        </Columns>

                    </asp:GridView>

                </div>
            </div>

        </div>

    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
