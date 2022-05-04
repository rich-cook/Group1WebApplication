<%--
  Created by IntelliJ IDEA.
  User: Richard
  Date: 2022-05-03
  Time: 11:41 a.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script   src="https://code.jquery.com/jquery-3.6.0.js"   integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="   crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/dayjs/1.11.1/dayjs.min.js"></script>
    <script>

        async function fetchPackages()
        {
            var url = "http://localhost:8080/Group1Term3RestM7_war_exploded/api/getpackages";
            var packages = await fetch(url);
            var packagesJSON = await packages.json();
            for (i=0; i<packagesJSON.length; i++)
            {
                $("#packageselect").append("<option value='" + packagesJSON[i].packageId + "'>"
                    + packagesJSON[i].pkgName + "</option>");
            }
        }

        async function fetchPackage(id) {
            var url = "http://localhost:8080/Group1Term3RestM7_war_exploded/api/getpackage/" + id;
            var response = await fetch(url);
            if (!response.ok)
            {
                throw new Error("Error occurred, status code = " + response.status);
            }
            var packageJSON = await response.json();
            $("#PackageId").val(packageJSON.packageId);
            $("#PkgName").val(packageJSON.pkgName);
            var startdate = dayjs(packageJSON.pkgStartDate).format("YYYY-MM-DD");
            $("#PkgStartDate").val(startdate);
            var enddate = dayjs(packageJSON.pkgEndDate).format("YYYY-MM-DD");
            $("#PkgEndDate").val(enddate);
            $("#PkgDesc").val(packageJSON.pkgDesc);
            $("#PkgBasePrice").val(packageJSON.pkgBasePrice);
            $("#PkgAgencyCommission").val(packageJSON.pkgAgencyCommission);

        }

        async function deletePackage()
        {
            var selectID = ($("#PackageId").html()).toString();
            var url ="http://localhost:8080/Group1Term3RestM7_war_exploded/api/deletepackage/" + selectID.substring(3);
            try {
                const response = await fetch(url,
                    {
                        method: "delete"
                    });
                if (!response.ok)
                {
                    const message = "Delete failed: status=" + response.status;
                    throw new Error(message);
                }
                const data = await response.json();
                $("#message").html(data.message);
            }
            catch (e)
            {
                console.log("Error: " + e);
            }
            //const data = await response.json();

        }

    </script>
</head>
<body>

<select id="packageselect" onchange="fetchPackage(this.value)">
    <option value="">Select a package to view details</option>
</select>
<form>
    Id:<input id="PackageId" type="number" disabled="disabled" /><br />
    Name:<input id="PkgName" type="text" /><br />
    Start Date:<input id="PkgStartDate" type="date" /><br />
    End Date:<input id="PkgEndDate" type="date" /><br />
    Description:<input id="PkgDesc" type="text" /><br />
    Base Price:<input id="PkgBasePrice" type="number" step=".01" /><br />
    Commission:<input id="PkgAgencyCommission" type="number" step=".01" /><br />
    <button type="button" onclick="deletePackage()">Delete</button>
</form>
<script>

    fetchPackages();
    // $(document).ready(function(){
    //     fetchPackages();
    // });
</script>
</body>
</html>