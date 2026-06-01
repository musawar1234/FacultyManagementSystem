<%@ Page Title="About" Language="C#" MasterPageFile="~/FacultyManagementmasterpage.Master" AutoEventWireup="true" 
    CodeBehind="About.aspx.cs" Inherits="WebApplication_EntryForm.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Faculty Management</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 20px;
            background-color: #f5f7fa;
        }

        .tab {
            overflow: hidden;
            border-bottom: 2px solid #ccc;
            background-color: #fff;
            max-width: 1700px;
            margin: auto;
            border-radius: 6px 6px 0 0;
            box-shadow: 0 1px 4px rgba(0,0,0,0.1);
        }

            .tab button {
                background-color: inherit;
                border: groove;
                outline: none;
                cursor: pointer;
                padding: 14px 22px;
                transition: 0.3s;
                font-size: 16px;
                color: #555;
                font-weight: bold;
            }

                .tab button:hover {
                    background-color: #dde9f7;
                }

                .tab button.active {
                    background-color: #2f5878;
                    color: white;
                    border-radius: 6px 6px 0 0;
                }

        .tabcontent {
            display: none;
            padding: 20px 30px;
            background-color: white;
            max-width: 900px;
            margin: auto;
            border-radius: 0 0 6px 6px;
            box-shadow: 0 1px 6px rgba(0,0,0,0.1);
        }
        .tablinks {
    font-size: 18px; /* Adjust as needed */
    font-weight: bold;
}

        .form-group {
            margin-bottom: 12px;
        }

        label {
            width: 160px;
            display: inline-block;
            font-weight: 600;
            vertical-align: top;
            padding-top: 6px;
        }

        input[type=text], textarea {
            width: calc(100% - 180px);
            padding: 7px 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
            font-family: Arial, sans-serif;
            box-sizing: border-box;
        }

        textarea {
            resize: vertical;
        }

        .submit-btn {
            background-color: #2f5878;
            color: white;
            border: none;
            padding: 10px 22px;
            border-radius: 5px;
            cursor: pointer;
            font-weight: 600;
            font-size: 15px;
            margin-top: 15px;
        }

            .submit-btn:hover {
                background-color: #204060;
            }

        .message-label {
            margin-top: 12px;
            font-weight: 600;
            color: green;
        }
    </style>
    <script>
        function openTab(evt, tabName) {
            var i, tabcontent, tabbuttons;
            tabcontent = document.getElementsByClassName("tabcontent");
            for (i = 0; i < tabcontent.length; i++) {
                tabcontent[i].style.display = "none";
            }
            tabbuttons = document.getElementsByClassName("tablinks");
            for (i = 0; i < tabbuttons.length; i++) {
                tabbuttons[i].className = tabbuttons[i].className.replace(" active", "");
            }
            document.getElementById(tabName).style.display = "block";
            evt.currentTarget.className += " active";
        }

        window.onload = function () {
            document.getElementById("defaultOpen").click();
        };
    </script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12 well" style="padding: 30px; background: #f9f9f9; border-radius: 10px;">
                    <img src="Content/Images/air_university_logo.png" alt="Air University Logo" class="center-block" style="max-width: 150px; height: auto; margin-bottom: 20px;" />

                    <h2 class="text-center display-5 fw-bold text-primary mb-5" style="font-family: 'Open Sans', 'Roboto', 'Lato', sans-serif; font-weight: 700;">Air University Faculty Management Dashboard (AUFMD)
                    </h2>

<%--                    <div class="row">
                        <div class="col-md-12 d-flex justify-content-center">
                            <div class="tab" style="max-width: 900px; width: 100%;">

                                <section class="section-group mb-4">
                                    <b style="font-size: 22px; color: #343a40;">Display Section:</b>
                                    <div class="btn-group btn-group-sm mt-2" role="group" aria-label="Display section buttons" style="flex-wrap: wrap; gap: 10px;">
                                        <a href="Viewfaculty.aspx" class="btn btn-outline-primary d-flex align-items-center">
                                            <i class="fa fa-building me-2"></i>Faculty Details
                                        </a>
                                        <a href="DepartmentsGrid.aspx" class="btn btn-outline-primary d-flex align-items-center">
                                            <i class="fa fa-building me-2"></i>Department Details
                                        </a>
                                        <a href="Advertisement_Gridview.aspx" class="btn btn-outline-primary d-flex align-items-center">
                                            <i class="fa fa-edit me-2"></i>Advertisement Display
                                        </a>
                                        <a href="Display_Researech_interest_details.aspx" class="btn btn-outline-primary d-flex align-items-center">
                                            <i class="fa fa-edit me-2"></i>Research Interest Display
                                        </a>
                                        <a href="FacultyCharts.aspx" class="btn btn-outline-primary d-flex align-items-center">
                                            <i class="fa fa-chart-bar me-2"></i>Faculty Stats
                                        </a>
                                        <a href="Display_Event_News.aspx" class="btn btn-outline-primary d-flex align-items-center">
                                            <i class="fa fa-newspaper-o me-2"></i>News & Events Statistics
                                        </a>
                                    </div>
                                </section>

                                <section class="section-group mb-4">
                                    <b style="font-size: 22px; color: #343a40;">Insert Section:</b>
                                    <div class="btn-group btn-group-sm mt-2" role="group" aria-label="Insert section buttons" style="flex-wrap: wrap; gap: 10px;">
                                        <a href="FacultyEntry.aspx" class="btn btn-primary d-flex align-items-center">
                                            <i class="fa fa-user me-2"></i>Faculty Entry
                                        </a>
                                        <a href="Faculty_Education.aspx" class="btn btn-primary d-flex align-items-center">
                                            <i class="fa fa-graduation-cap me-2"></i>Faculty Education
                                        </a>
                                        <a href="Faculty_Publication.aspx" class="btn btn-primary d-flex align-items-center">
                                            <i class="fa fa-book me-2"></i>Faculty Publication
                                        </a>
                                        <a href="Faculty_ResearchInterest.aspx" class="btn btn-primary d-flex align-items-center">
                                            <i class="fa fa-flask me-2"></i>Faculty Research Interest
                                        </a>
                                        <a href="New_Event_Entry Form.aspx" class="btn btn-primary d-flex align-items-center">
                                            <i class="fa fa-calendar-plus-o me-2"></i>News & Events Entry
                                        </a>
                                        <a href="Advertisement_Form_Entry.aspx" class="btn btn-primary d-flex align-items-center">
                                            <i class="fa fa-bullhorn me-2"></i>Advertisement Entry
                                        </a>
                                    </div>
                                </section>

                                <section class="section-group">
                                    <b style="font-size: 22px; color: #343a40;">Update Section:</b>
                                    <div class="btn-group btn-group-sm mt-2" role="group" aria-label="Update section buttons" style="flex-wrap: wrap; gap: 10px;">
                                        <a href="update_facultyDetail.aspx" class="btn btn-warning d-flex align-items-center">
                                            <i class="fa fa-edit me-2"></i>Update Faculty Entry
                                        </a>
                                        <a href="Education Update.aspx" class="btn btn-warning d-flex align-items-center">
                                            <i class="fa fa-pencil-square-o me-2"></i>Update Faculty Education
                                        </a>
                                        <a href="Update_Publication.aspx" class="btn btn-warning d-flex align-items-center">
                                            <i class="fa fa-pencil-square-o me-2"></i>Update Faculty Publication
                                        </a>
                                        <a href="Update_News_Update_Form.aspx" class="btn btn-warning d-flex align-items-center">
                                            <i class="fa fa-pencil-square-o me-2"></i>Update News & Events
                                        </a>
                                        <a href="Update_Research_interest_form.aspx" class="btn btn-warning d-flex align-items-center">
                                            <i class="fa fa-pencil-square-o me-2"></i>Update Research Interest
                                        </a>
                                        <a href="ImageUploadeForm.aspx" class="btn btn-warning d-flex align-items-center">
                                            <i class="fa fa-image me-2"></i>Image Uploader
                                        </a>
                                        <a href="loginpage.aspx" class="btn btn-danger d-flex align-items-center ms-auto">
                                            <i class="fa fa-sign-out me-2"></i>Log Out
                                        </a>
                                    </div>
                                </section>

                            </div>
                        </div>
                    </div>--%>
                </div>

                <div class="col-md-1">
                </div>
                <div class="col-md-10">
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Search by Designation Name"></asp:TextBox><br />
                    <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary" OnClick="btnSearch_Click1" /><br />
                    <br />
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="DESIGNATION_ID" CssClass="table table-striped table-bordered table-hover" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:BoundField DataField="DESIGNATION_ID" HeaderText="DESIGNATION_ID" InsertVisible="False" ControlStyle-CssClass="focus" ReadOnly="True" SortExpression="DESIGNATION_ID" />
                            <asp:BoundField DataField="DESIGNATION_NAME" HeaderText="DESIGNATION_NAME" SortExpression="DESIGNATION_NAME" />
                            <asp:BoundField DataField="DESIGNATION_DESC" HeaderText="DESIGNATION_DESC" SortExpression="DESIGNATION_DESC" />
                            <asp:CheckBoxField DataField="IS_ACTIVE" HeaderText="IS_ACTIVE" SortExpression="IS_ACTIVE" />
                            <asp:BoundField DataField="CREATED_BY" HeaderText="CREATED_BY" SortExpression="CREATED_BY" />
                            <asp:BoundField DataField="DESIGNATION_PRIORITY" HeaderText="DESIGNATION_PRIORITY" SortExpression="DESIGNATION_PRIORITY" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:au_edu_pk_websiteDBConnectionString2 %>" SelectCommand="SELECT [DESIGNATION_ID], [DESIGNATION_NAME], [DESIGNATION_DESC], [IS_ACTIVE], [CREATED_BY], [DESIGNATION_PRIORITY] FROM [DESIGNATIONS] order by [DESIGNATION_PRIORITY] asc"></asp:SqlDataSource>
                </div>
                <div class="col-md-1">
                </div>
            </div>
        </div>
    </form>
</body>
</html>
</asp:Content>
