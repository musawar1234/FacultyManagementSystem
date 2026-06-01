<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HOD.aspx.cs" Inherits="WebApplication_EntryForm.HOD" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Heads of Departments - Air University</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        .hod-card {
            box-shadow: 0 0.25rem 0.75rem rgba(0,0,0,.1);
            border: none;
        }

            .hod-card:hover {
                transform: translateY(-2px);
                box-shadow: 0 0.5rem 1rem rgba(0,0,0,.15);
            }

        .table thead th {
            background: linear-gradient(135deg, #0d6efd 0%, #0b5ed7 100%);
            color: white;
            border: none;
        }

        .page-link {
            color: #0d6efd;
        }

        .page-item.active .page-link {
            background-color: #0d6efd;
            border-color: #0d6efd;
        }

        .empty-state {
            min-height: 300px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
    </style>
</head>
<body class="bg-light">
    <form id="form1" runat="server">
        <div class="container-fluid py-5" style="background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%); min-height: 100vh;">
            <!-- Header Section -->
            <div class="row mb-5">
                <div class="col-12 text-center">
                    <i class="fas fa-users fa-4x text-primary mb-3"></i>
                    <h1 class="display-5 fw-bold text-dark mb-2">Heads of Departments</h1>
                    <p class="lead text-muted mb-0">Air University Faculty Management System</p>
                </div>
            </div>

            <!-- Main Content Card -->
            <div class="row justify-content-center">
                <div class="col-12 col-lg-11">
                    <div class="card hod-card">
                        <div class="card-header bg-white border-0 pb-0">
                            <div class="row align-items-center">
                                <div class="col">
                                    <h4 class="mb-0 fw-semibold text-dark">
                                        <button type="button" class="btn btn-link p-0 border-0 bg-transparent text-decoration-none"
                                            onclick="location.reload();" title="Refresh Data">
                                            <i class="fas fa-sync-alt me-2 text-primary" style="font-size: 1.2rem; cursor: pointer;"></i>
                                            <span class="text-dark fw-semibold">Department Leadership</span>
                                        </button>
                                    </h4>
                                </div>
                                <div class="col-auto">
                                    <span class="badge bg-primary fs-6 py-2 px-3">
                                        <i class="fas fa-database me-1"></i>
                                        Live Data
                                    </span>
                                </div>
                            </div>
                        </div>

                        <div class="card-body p-0">
                            <div class="table-responsive">
                                <asp:GridView ID="gvHeadsOfDept" runat="server"
                                    CssClass="table table-hover align-middle mb-0"
                                    AutoGenerateColumns="False"
                                    GridLines="None"
                                    AllowPaging="true"
                                    PageSize="12" OnPageIndexChanging="gvHeadsOfDept_PageIndexChanging"
                                    EmptyDataRowStyle-CssClass="empty-state bg-white">

                                    <Columns>
                                        <asp:TemplateField HeaderText="Faculty" HeaderStyle-Width="45%">
                                            <ItemTemplate>
                                                <div class="d-flex align-items-center">
                                                    <div class="avatar-sm bg-primary bg-gradient text-white rounded-circle d-flex align-items-center justify-content-center me-3">
                                                        <i class="fas fa-user fs-5"></i>
                                                    </div>
                                                    <div>
                                                        <div class="fw-semibold text-dark"><%# Eval("FacultyName") %></div>
                                                        <small class="text-muted">Faculty Member</small>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:BoundField DataField="DesignationName" HeaderText="Designation"
                                            HeaderStyle-Width="25%" ItemStyle-CssClass="fw-semibold text-primary" />

                                        <asp:BoundField DataField="DepartmentName" HeaderText="Department"
                                            HeaderStyle-Width="30%" ItemStyle-CssClass="text-success fw-medium" />
                                    </Columns>

                                    <EmptyDataTemplate>
                                        <div class="text-center py-12">
                                            <i class="fas fa-chair fa-3x text-muted mb-3"></i>
                                            <h5 class="text-muted mb-1">No Heads of Departments Found</h5>
                                            <p class="text-muted mb-0">No faculty members currently hold 'Chair' status.</p>
                                        </div>
                                    </EmptyDataTemplate>

                                    <PagerStyle CssClass="pagination pagination-sm justify-content-center mb-0 border-top" />
                                    <RowStyle CssClass="border-bottom border-light" />
                                </asp:GridView>
                            </div>
                        </div>

                        <!-- Footer Stats (Optional - Add if you want) -->
                        <div class="card-footer bg-light border-0 pt-3">
                            <div class="row text-center text-muted small">
                                <div class="col-md-4">
                                    <i class="fas fa-sync-alt me-1 text-primary" id="refreshIcon"></i>
                                    <span id="lastUpdated">Last Updated: <span class="fw-bold text-primary" id="timestamp">Loading...</span></span>
                                </div>
                                <div class="col-md-4">
                                    <i class="fas fa-database me-1"></i>
                                    Air University Database
                                </div>
                                <div class="col-md-4">
                                    <i class="fas fa-shield-alt me-1"></i>
                                    Secure & Real-time
                                </div>
                            </div>
                        </div>

                        <script>
                            function updateTimestamp() {
                                const now = new Date();
                                const timeString = now.toLocaleString('en-PK', {
                                    timeZone: 'Asia/Karachi',
                                    year: 'numeric',
                                    month: 'short',
                                    day: 'numeric',
                                    hour: '2-digit',
                                    minute: '2-digit',
                                    second: '2-digit'
                                });
                                document.getElementById('timestamp').textContent = timeString;
    
                                // Rotate refresh icon
                                const icon = document.getElementById('refreshIcon');
                                icon.classList.add('fa-spin');
                                setTimeout(() => icon.classList.remove('fa-spin'), 500);
                            }

                            // Update every 30 seconds AND on page load
                            updateTimestamp();
                            setInterval(updateTimestamp, 30000);

                            // Refresh data every 2 minutes (optional)
                            setInterval(() => {
                                if (confirm('Refresh HOD data?')) {
                                    location.reload();
                            }
                            }, 120000);
                        </script>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    </form>
</body>
</html>