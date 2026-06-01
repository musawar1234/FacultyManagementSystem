<%--<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Faculty Management Tabs</title>
    <style>
        /* Basic styling for the tab container and buttons */
        .tab {
            display: flex;
            border-bottom: 2px solid #ccc;
            background-color: #f1f1f1;
        }

            .tab button {
                background-color: inherit;
                border: none;
                outline: none;
                cursor: pointer;
                padding: 14px 20px;
                transition: background-color 0.3s;
                font-size: 16px;
            }

                .tab button:hover {
                    background-color: #ddd;
                }

                .tab button.active {
                    background-color: #ccc;
                    border-bottom: 2px solid #007bff;
                }
        /* Style for tab content */
        .tabcontent {
            display: none;
            padding: 20px;
            border: 1px solid #ccc;
            border-top: none;
        }
    </style>
</head>
<body>

    <h2>Faculty Management Navigation</h2>

    <div class="tab" role="tablist" aria-label="Faculty management navigation">
        <button class="tablinks" onclick="openTab(event, 'FacultyDetails')" id="defaultOpen">
            <i class="fa fa-building"></i>Faculty Details
        </button>
        <button class="tablinks" onclick="openTab(event, 'DepartmentDetails')">
            <i class="fa fa-building"></i>Department Details
        </button>
        <button class="tablinks" onclick="openTab(event, 'AdvertisementDisplay')">
            <i class="fa fa-edit"></i>Advertisement Display
        </button>
        <button class="tablinks" onclick="openTab(event, 'FacultyStats')">
            <i class="fa fa-chart-bar"></i>Faculty Stats
        </button>
        <button class="tablinks" onclick="openTab(event, 'FacultyEntry')">
            <i class="fa fa-user"></i>Faculty Entry
        </button>
        <button class="tablinks" onclick="openTab(event, 'FacultyEducation')">
            <i class="fa fa-graduation-cap"></i>Faculty Education
        </button>
        <button class="tablinks" onclick="openTab(event, 'FacultyPublication')">
            <i class="fa fa-book"></i>Faculty Publication
        </button>
        <button class="tablinks" onclick="openTab(event, 'ResearchInterest')">
            <i class="fa fa-flask"></i>Faculty Research Interest
        </button>
        <button class="tablinks" onclick="openTab(event, 'AdvertisementEntry')">
            <i class="fa fa-edit"></i>Advertisement Entry Form
        </button>
        <button class="tablinks" onclick="openTab(event, 'UpdateFaculty')">
            <i class="fa fa-edit"></i>Update Faculty Entry Form
        </button>
        <button class="tablinks" onclick="openTab(event, 'UpdateEducation')">
            <i class="fa fa-pencil-square-o"></i>Update Faculty Education
        </button>
        <button class="tablinks" onclick="openTab(event, 'UpdatePublication')">
            <i class="fa fa-pencil-square-o"></i>Update Faculty Publication
        </button>
        <button class="tablinks" onclick="openTab(event, 'ImageUploader')">
            <i class="fa fa-upload"></i>Image Uploader
        </button>
        <button class="tablinks" onclick="openTab(event, 'Logout')">
            <i class="fa fa-sign-out"></i>Log Out
        </button>
    </div>

    <div id="FacultyDetails" class="tabcontent">
        <h3>Faculty Details</h3>
        <p>Content for Faculty Details here...</p>
    </div>
    <div id="DepartmentDetails" class="tabcontent">
        <h3>Department Details</h3>
        <iframe src="DepartmentsGrid.aspx" width="2300" height="1100"></iframe>
    </div>
    <!-- Repeat div.tabcontent for each tab with corresponding unique id -->
    <div id="AdvertisementDisplay" class="tabcontent">
        <h3>Advertisement Display</h3>
        <iframe src="Advertisement_Gridview.aspx" width="2300" height="1100"></iframe>
    </div>
    <div id="FacultyStats" class="tabcontent">
        <h3>Faculty Stats</h3>
        <iframe src="FacultyCharts.aspx" width="2300" height="1100"></iframe>
    </div>
    <div id="FacultyEntry" class="tabcontent">
        <h3>Faculty Entry</h3>
        <iframe src="FacultyEntry.aspx" width="2300" height="1100"></iframe>
    </div>
    <div id="FacultyEducation" class="tabcontent">
        <h3>Faculty Education</h3>
        <iframe src="Faculty_Education.aspx" width="2300" height="1100"></iframe>
    </div>
    <div id="FacultyPublication" class="tabcontent">
        <h3>Faculty Publication</h3>
        <iframe src="Faculty_Publication.aspx" width="2300" height="1100"></iframe>
    </div>
    <div id="ResearchInterest" class="tabcontent">
        <h3>Faculty Research Interest</h3>
        <iframe src="Faculty_ResearchInterest.aspx" width="2300" height="1100"></iframe>
    </div>
    <div id="AdvertisementEntry" class="tabcontent">
        <h3>Advertisement Entry Form</h3>
        <iframe src="Advertisement_Form_Entry.aspx" width="2300" height="1100"></iframe>
    </div>
    <div id="UpdateFaculty" class="tabcontent">
        <h3>Update Faculty Entry Form</h3>
        <iframe src="update_facultyDetail.aspx" width="2300" height="1100"></iframe>
    </div>
    <div id="UpdateEducation" class="tabcontent">
        <h3>Update Faculty Education</h3>
        <iframe src="Education Update.aspx" width="2300" height="1100"></iframe>
    </div>
    <div id="UpdatePublication" class="tabcontent">
        <h3>Update Faculty Publication</h3>
        <iframe src="Update_Publication.aspx" width="2300" height="1100"></iframe>
    </div>
    <div id="ImageUploader" class="tabcontent">
        <h3>Image Uploader</h3>
        <iframe src="ImageUploadeForm.aspx" width="2300" height="1100"></iframe>
    </div>
    <div id="Logout" class="tabcontent">
        <h3>Log Out</h3>
       <button type="button" class="tablinks"><i class="fa fa-backward"></i><a href="loginpage.aspx">&nbsp;Log Out</a></button>
    </div>

    <script>
        function openTab(evt, tabName) {
            // Hide all tab content
            var tabcontent = document.getElementsByClassName("tabcontent");
            for (var i = 0; i < tabcontent.length; i++) {
                tabcontent[i].style.display = "none";
            }
            // Remove active class from all buttons
            var tablinks = document.getElementsByClassName("tablinks");
            for (var i = 0; i < tablinks.length; i++) {
                tablinks[i].classList.remove("active");
            }
            // Show the selected tab content and set button active
            document.getElementById(tabName).style.display = "block";
            evt.currentTarget.classList.add("active");
        }
        // Open default tab on page load
        document.getElementById("defaultOpen").click();
    </script>

</body>
</html>--%>
