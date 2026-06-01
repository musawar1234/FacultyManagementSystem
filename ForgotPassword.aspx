<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ForgotPassword.aspx.cs" Inherits="WebApplication_EntryForm.ForgotPassword" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Forgot Password | AUFMD</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    
    <style>
        body {
            background: url('https://images.unsplash.com/photo-1519389950473-47ba0277781c?auto=format&fit=crop&w=1920&q=80') no-repeat center center fixed;
            background-size: cover;
            min-height: 100vh;
            padding: 20px;
            font-family: "Segoe UI", sans-serif;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        body::before {
            content: "";
            position: fixed;
            inset: 0;
            background: rgba(0, 0, 0, 0.55);
            z-index: -1;
        }
        .login-container {
            max-width: 900px;
            width: 100%;
            border-radius: 24px;
            overflow: hidden;
            backdrop-filter: blur(14px);
            background: rgba(255, 255, 255, 0.10);
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.45);
            border: 1px solid rgba(255, 255, 255, 0.25);
        }
        .left-panel {
            background: url('https://images.unsplash.com/photo-1526401281623-3597d31f1c54?auto=format&fit=crop&w=1920&q=80') no-repeat center center;
            background-size: cover;
            position: relative;
        }
        .left-panel::after {
            content: "";
            position: absolute;
            inset: 0;
            background: rgba(0, 0, 0, 0.45);
        }
        .right-panel {
            padding: 50px 40px;
            background: rgba(255, 255, 255, 0.85);
            backdrop-filter: blur(10px);
        }
        .form-control {
            border-radius: 12px;
            padding: 12px 15px;
            border: 1.5px solid #ced4da;
            transition: 0.2s ease-in-out;
        }
        .form-control:focus {
            border-color: #4c5df0;
            box-shadow: 0 0 7px rgba(76, 93, 240, 0.25);
        }
        .login-btn {
            background: linear-gradient(135deg, #4c5df0, #6b78ff);
            color: #fff;
            padding: 12px;
            border-radius: 14px;
            font-weight: 600;
            transition: 0.25s;
            border: none;
        }
        .login-btn:hover {
            background: #3d4ae5;
            transform: translateY(-2px);
            color: #fff;
            box-shadow: 0 8px 25px rgba(76, 93, 240, 0.4);
        }
        .forgot-link {
            color: #4c5df0 !important;
            font-weight: 600;
        }
        .forgot-link:hover {
            color: #3d4ae5 !important;
            text-decoration: underline;
        }
        .logo-img { max-height: 80px; width: auto; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="row g-0 login-container animate__animated animate__fadeInUp">
            <!-- Left Panel -->
            <div class="col-md-6 left-panel d-flex align-items-center justify-content-center text-center p-4">
                <div>
                    <i class="bi bi-key-fill display-1 text-white mb-3"></i>
                    <h3 class="text-white fw-bold">Reset Password</h3>
                    <p class="text-white-50 lead">Enter your username</p>
                </div>
            </div>

            <!-- Right Panel -->
            <div class="col-md-6 right-panel">
                <div class="text-center mb-5">
                    <img src="Content/Images/air_university_logo.png" class="logo-img mb-3 mx-auto d-block" />
                    <div class="h4 fw-bold text-dark mb-2">Reset Password</div>
                    <p class="text-muted mb-0">Enter your username to continue.</p>
                </div>

                <asp:Label ID="lblForgotMsg" runat="server" Visible="false" />

                <div class="mb-4">
                    <label class="form-label fw-semibold mb-2">Username</label>
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control"
                        placeholder="Enter your username" autocomplete="off" />
                    <asp:RequiredFieldValidator ID="rfvUsername" runat="server" 
                        ControlToValidate="txtUsername" ErrorMessage="Username is required" 
                        CssClass="text-danger small mt-1 d-block" Display="Dynamic" />
                </div>

                <asp:Button ID="btnSendReset" runat="server" Text="Continue" 
                    CssClass="btn login-btn w-100 mb-4" OnClick="btnSendReset_Click" />

                <div class="text-center pt-3">
                    <a href="loginpage.aspx" class="forgot-link text-decoration-none">
                        <i class="bi bi-arrow-left me-2"></i>Back to Login
                    </a>
                </div>
            </div>
        </div>

        <footer class="text-center mt-4 text-white-50" style="background-color:#002147;border-radius:15px">
            Development by <strong>Ghazi</strong> | © 2025-26 All Rights Reserved
        </footer>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
