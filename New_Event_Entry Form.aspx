<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="New_Event_Entry Form.aspx.cs" Inherits="WebApplication_EntryForm.New_Event_Entry_Form" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>News & Events Form</title>

    <!-- Bootstrap & Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet" />

    <style>
        body {
            background: linear-gradient(to right, #eef2f7, #ffffff);
            font-family: 'Segoe UI', sans-serif;
        }

        .form-container {
            max-width: 800px;
            margin: 40px auto;
        }

        .card {
            border: none;
            border-radius: 16px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.08);
        }

        .card-header {
            background: linear-gradient(to right, #0d6efd, #084298);
            color: white;
            border-radius: 16px 16px 0 0;
            text-align: center;
            padding: 20px;
        }

        .form-label {
            font-weight: 600;
        }

        .form-control {
            border-radius: 10px;
        }

        .preview-img {
            max-height: 150px;
            border-radius: 8px;
            display: none;
        }

        .btn {
            border-radius: 30px;
            padding: 8px 20px;
        }

        .btn-success {
            background: #198754;
        }

        .btn-back {
            background: #6c757d;
            color: white;
        }

            .btn-back:hover {
                background: #5c636a;
            }
    </style>
</head>

<body>
    <form id="form1" runat="server" oncopy="return false;" onpaste="return true;" oncut="return false;">

        <div class="form-container">
            <div class="card">

                <div class="card-header">
                    <h3><i class="bi bi-calendar-event"></i>News & Events Entry</h3>
                </div>

                <div class="card-body p-4">
                    <div class="row g-4">

                        <!-- Title -->
                        <div class="col-md-12">
                            <label class="form-label">Title</label>
                            <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" placeholder="Enter event title" />
                        </div>

                        <!-- Image Path + Preview -->
                        <div class="col-md-12">
                            <label class="form-label">Image Path</label>
                            <asp:TextBox ID="txtImagePath" runat="server" CssClass="form-control"
                                placeholder="Enter image URL"
                                onkeyup="showPreview(this.value)" />
                            <img id="imgPreview" class="preview-img mt-3" />
                        </div>

                        <!-- Event Date (Upgraded) -->
                        <div class="col-md-6">
                            <label class="form-label">Event Date</label>
                            <asp:TextBox ID="txtEventDate" runat="server" CssClass="form-control" TextMode="Date" />
                        </div>

                        <!-- Event Order -->
                        <div class="col-md-3">
                            <label class="form-label">Event Order</label>
                            <asp:TextBox ID="txtEventOrder" runat="server" CssClass="form-control" placeholder="Number" />
                        </div>

                        <!-- Status -->
                        <div class="col-md-3">
                            <label class="form-label">Status</label>
                            <asp:TextBox ID="txtEventStatus" runat="server" CssClass="form-control" placeholder="Active / Inactive" />
                        </div>

                        <!-- Description -->
                        <div class="col-md-12">
                            <label class="form-label">Description</label>
                            <asp:TextBox ID="txtEventDesc" runat="server" TextMode="MultiLine"
                                Rows="4" CssClass="form-control"
                                placeholder="Enter full description"
                                onkeyup="updateCount()" />
                            <small class="text-muted"><span id="charCount">0</span> characters</small>
                        </div>

                        <!-- Is Active -->
                        <div class="col-md-12">
                            <div class="form-check form-switch">
                                <asp:CheckBox ID="chkIsActive" runat="server" CssClass="form-check-input" />
                                <label class="form-check-label">Is Active</label>
                            </div>
                        </div>

                        <!-- Gallery Images -->
                        <div class="col-md-12">
                            <label class="form-label">Image Gallery</label>
                            <asp:TextBox ID="txtImageGallery" runat="server" CssClass="form-control"
                                placeholder="159_1.jpg~159_2.jpg~159_3.jpg" />
                            <small class="text-muted">Separate file names using <b>~</b></small>
                        </div>

                        <!-- Buttons -->
                        <div class="col-md-12 text-center mt-4">
                            <asp:Button ID="btnSave" runat="server" Text="Save Event"
                                CssClass="btn btn-success me-3"
                                OnClick="btnSave_Click" />

                            <asp:Button ID="Button1" runat="server"
                                Text="Back"
                                CssClass="btn btn-back"
                                OnClientClick="window.location='FacultyManagement.aspx'; return false;" />
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </form>

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        function showPreview(url) {
            const preview = document.getElementById("imgPreview");
            if (url.length > 3) {
                preview.src = url;
                preview.style.display = "block";
            } else {
                preview.style.display = "none";
            }
        }

        function updateCount() {
            const txt = document.getElementById('<%= txtEventDesc.ClientID %>').value;
        document.getElementById("charCount").innerText = txt.length;
    }
    </script>

</body>
</html>
