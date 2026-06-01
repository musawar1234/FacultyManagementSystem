<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="loginpage.aspx.cs" Inherits="WebApplication_EntryForm.loginpage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login | AUFMD</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    <!-- Same existing styles -->
    <style>
        /* Your existing styles remain exactly the same */
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
        }
        .login-btn:hover {
            background: #3d4ae5;
            transform: translateY(-2px);
        }
        .forgot-link {
            color: #4c5df0 !important;
            font-weight: 600;
        }
        .forgot-link:hover {
            color: #3d4ae5 !important;
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="row g-0 login-container animate__animated animate__fadeInUp">
            <!-- Left Image -->
            <div class="col-md-6 left-panel d-flex align-items-center justify-content-center text-center">
                <img src="Content/Images/two-step-verification.gif" class="img-fluid" width="350" />
            </div>

            <!-- Right Panel -->
            <div class="col-md-6 right-panel">
                <div class="text-center mb-4">
                    <img src="Content/Images/air_university_logo.png" class="logo-img mb-3" style="max-height: 80px;" />
                    <div class="title h4 fw-bold text-dark mb-2">AUFMD Login</div>
                    <div class="subtitle text-muted">Welcome! Please sign in to continue.</div>
                </div>

                <asp:Label ID="lblMessage" runat="server" CssClass="text-danger text-center d-block mb-3" />

                <!-- Username -->
                <div class="mb-4">
                    <label class="form-label fw-semibold">Username</label>
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control"
                        placeholder="Enter username" autocomplete="off" />
                </div>

                <!-- Password -->
                <div class="mb-4">
                    <label class="form-label fw-semibold">Password</label>
                    <div class="input-group">
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control"
                            TextMode="Password" placeholder="Enter password" autocomplete="off" />
                        <button type="button" class="btn btn-outline-secondary" id="togglePassword">
                            <i class="bi bi-eye" id="eyeIcon"></i>
                        </button>
                    </div>
                </div>

                <!-- Login Button -->
                <asp:Button ID="btnLogin" runat="server" Text="Sign In"
                    CssClass="btn login-btn w-100 mb-3"
                    OnClick="btnLogin_Click" />

                <!-- Forgot Password Link -->
                <div class="text-end">
                    <a href="ForgotPassword.aspx" class="forgot-link">
                        <i class="bi bi-question-diamond-fill me-1"></i>Forgot Password?
                    </a>
                </div>
            </div>
        </div>

        <footer class="text-center mt-4 text-white-50" style="background-color:#002147;border-radius:15px">
            Development by <strong>Ghazi</strong> | © 2025-26 All Rights Reserved
        </footer>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const pwdInput = document.getElementById("<%= txtPassword.ClientID %>");
            const toggleBtn = document.getElementById("togglePassword");
            const eyeIcon = document.getElementById("eyeIcon");

            toggleBtn.addEventListener("click", function () {
                if (pwdInput.type === "password") {
                    pwdInput.type = "text";
                    eyeIcon.classList.replace("bi-eye", "bi-eye-slash");
                } else {
                    pwdInput.type = "password";
                    eyeIcon.classList.replace("bi-eye-slash", "bi-eye");
                }
            });
        });
    </script>
</body>
</html>
