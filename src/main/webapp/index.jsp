<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome to Travel Experts</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script   src="https://code.jquery.com/jquery-3.6.0.js"   integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="   crossorigin="anonymous"></script>
    <%--    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>--%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/dayjs/1.11.1/dayjs.min.js"></script>
    <script>
        async function fetchPackages()
        {
            //var url = "http://localhost:8080/Winter2022JSPDay7REST-1.0-SNAPSHOT/api/package/getpackages";
            var url = "http://localhost:8080/Group1Term3RestM7_war_exploded/api/getpackages";
            //var url = "http://localhost:8080/api/getpackages";
            var packages = await fetch(url);
            var packagesJSON = await packages.json();
            for (i=0; i<packagesJSON.length; i++)
            {
                $("#packageselect").append("<option value='" + packagesJSON[i].packageId + "'>"
                    + packagesJSON[i].pkgName + "</option>");
            }
        }

        async function fetchPackage(id) {
            //var url = "http://localhost:8080/Winter2022JSPDay7REST-1.0-SNAPSHOT/api/package/getpackage/" + id;
            var url = "http://localhost:8080/Group1Term3RestM7_war_exploded/api/getpackage/" + id;
            //var url = "http://localhost:8080/api/getpackage/" + id;
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


        //function that will serve up the package data to show hte user when they go the the homepage.

        function jQueryGetExample()
         {
        $(document).ready(function() {
            $("#ajaxBtn").click(function(){
                $.get("http://localhost:8080/Group1Term3RestM7_war_exploded/api/getpackages",
                    function(data,status) {
                        // $("#package").html(data);
                        $("#package").append(data.PkgName);
                        $("#packagedescription").append(data.PkgDesc);
                        $("#packageprice").append(data.PkgBasePrice);
                        alert(status);
                    });
            })

        })


         }

        function postPackages()
        {
            $(document).ready(function(){
                $("input").keyup(function() {
                    var packageName = $("input").val();
                })
            })
        }
    </script>
</head>
<body>
<h1>
</h1>
<br/>
<input type="button" id="ajaxBtn" value="Send GET request" />
<p id="package"></p>
<p id="packagedescription"></p>
<p id="packageprice"></p>
<script>
     jQueryGetExample();
</script>
</body>
</html>