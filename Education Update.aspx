<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Education Update.aspx.cs" Inherits="WebApplication_EntryForm.Education_Update" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml"><head runat="server">
    <title></title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Bootstrap JS Bundle (includes Popper) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container mt-4">
       <h2>Update Faculty Education Form</h2>
            <hr />
        <div class="row mb-3 align-items-center">
            <div class="col-md-3">
                <asp:TextBox ID="txtFacultyID" runat="server" CssClass="form-control" placeholder="Enter Faculty ID"></asp:TextBox>
            </div>
            <div class="col-md-2">
                <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary" OnClick="btnSearch_Click" />
                <button class="btn btn-outline-primary"><a href="FacultyManagement.aspx">Back</a></button>
            </div>
        </div>
        <div class="table-responsive">
            <asp:GridView ID="gvEducation" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-striped"
                DataKeyNames="EDUCATION_ID"
                OnRowEditing="gvEducation_RowEditing"
                OnRowUpdating="gvEducation_RowUpdating"
                OnRowCancelingEdit="gvEducation_RowCancelingEdit">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btnEdit" runat="server" Text="Edit" CommandName="Edit" CssClass="btn btn-sm btn-warning" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Button ID="btnUpdate" runat="server" Text="Update" CommandName="Update" CssClass="btn btn-sm btn-success me-2" />
                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CommandName="Cancel" CssClass="btn btn-sm btn-secondary" />
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField DataField="EDUCATION_ID" HeaderText="ID" ReadOnly="True" />

                    <asp:TemplateField HeaderText="Education Title">
                        <ItemTemplate>
                            <%# Eval("EDUCATION_TITLE") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEducationTitle" runat="server" Text='<%# Bind("EDUCATION_TITLE") %>' CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="University Name">
                        <ItemTemplate>
                            <%# Eval("UNIVERSITY_NAME") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtUniversityName" runat="server" Text='<%# Bind("UNIVERSITY_NAME") %>' CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Is Active">
                        <ItemTemplate>
                            <%# Convert.ToBoolean(Eval("IS_ACTIVE")) ? "1" : "0" %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:CheckBox ID="chkIsActive" runat="server" Checked='<%# Bind("IS_ACTIVE") %>' CssClass="form-check-input" />
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Subject Majors">
                        <ItemTemplate>
                            <%# Eval("SUBJECT_MAJORS") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtSubjects" runat="server" Text='<%# Bind("SUBJECT_MAJORS") %>' TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</form>

</body>
</html>
