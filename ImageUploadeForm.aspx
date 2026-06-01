<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ImageUploadeForm.aspx.cs" Inherits="WebApplication_EntryForm.ImageUploadeForm" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Image Upload Form</title>
    <!-- Updated to Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body class="bg-light">
    <form id="form1" runat="server" enctype="multipart/form-data">
        <div class="container-fluid py-4">
            <div class="row justify-content-center">
                <div class="col-12 col-lg-10 col-xl-8">
                    <!-- Header -->
                    <div class="card border-0 shadow-sm mb-5">
                        <div class="card-body text-center p-5">
                            <h1 class="display-5 fw-bold text-primary mb-3">
                                <i class="bi bi-cloud-upload-fill me-3"></i>
                                Image Uploader
                            </h1>
                            <p class="lead text-muted">Upload and resize your images easily</p>
                        </div>
                    </div>

                    <div class="row g-5">
                        <!-- Upload Form Section -->
                        <div class="col-lg-8">
                            <div class="card border-0 shadow">
                                <div class="card-body p-5">
                                    <div class="row">
                                        <!-- File Upload - CORRECTED -->
                                        <div class="col-12 mb-4">
                                            <label for="FileUpload1" class="form-label fw-semibold fs-5">
                                                <i class="bi bi-file-earmark-image text-primary me-2"></i>
                                                Select Image File
                                            </label>
                                            <div class="position-relative">
                                                <asp:FileUpload ID="FileUpload1" runat="server"
                                                    CssClass="form-control form-control-lg w-100 pe-5"
                                                    accept="image/*" />
                                                <span class="position-absolute top-50 start-0 translate-middle-y ms-3 text-muted">
                                                    <i class="bi bi-image fs-5"></i>
                                                </span>
                                            </div>
                                            <div class="form-text">Supported formats: JPG, PNG, GIF, WebP</div>
                                        </div>

                                        <!-- Action Buttons (unchanged) -->
                                        <div class="col-12">
                                            <div class="d-grid d-md-flex gap-3">
                                                <asp:Button ID="btnUpload" runat="server"
                                                    Text="Upload & Resize"
                                                    OnClick="btnUpload_Click"
                                                    CssClass="btn btn-primary btn-lg flex-fill" />

                                                <a href="https://www.remove.bg/upload"
                                                    class="btn btn-outline-success btn-lg flex-fill"
                                                    target="_blank">
                                                    <i class="bi bi-magic me-2"></i>Change Background
                                                </a>

                                                <a href="FacultyManagement.aspx"
                                                    class="btn btn-outline-secondary btn-lg flex-fill">
                                                    <i class="bi bi-arrow-left me-2"></i>Back
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Image Preview Section -->
                        <div class="col-lg-4">
                            <div class="card border-0 shadow h-100">
                                <div class="card-header bg-primary text-white">
                                    <h5 class="mb-0">
                                        <i class="bi bi-image me-2"></i>Preview
                                    </h5>
                                </div>
                                <div class="card-body d-flex align-items-center justify-content-center p-4">
                                    <div class="text-center">
                                        <div class="preview-image-container border rounded-3 p-4 mb-3 bg-light"
                                            style="width: 280px; height: 280px; overflow: hidden;">
                                            <asp:Image ID="Image1" runat="server"
                                                CssClass="img-fluid rounded shadow-sm w-100 h-100 object-fit-cover"
                                                AlternateText="Image Preview" />
                                        </div>
                                        <div class="text-muted small">
                                            <i class="bi bi-info-circle me-1"></i>
                                            Preview will appear here after upload
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <!-- Bootstrap 5 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
