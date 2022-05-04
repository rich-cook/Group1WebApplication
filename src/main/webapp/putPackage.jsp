<%--
  Created by IntelliJ IDEA.
  User: Richard
  Date: 2022-05-03
  Time: 10:09 a.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-3.6.0.js"   integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="   crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/dayjs/1.11.1/dayjs.min.js"></script>
    <script>

        // insert a new package to travelexperts database
        async function putPackage() {
            var startdate = dayjs($("#PkgStartDate").val()).format("YYYY-MM-DD");
            var enddate = dayjs($("#PkgEndDate").val()).format("YYYY-MM-DD");
            var price =$("#PkgBasePrice").val();
            var commission =$("#PkgAgencyCommission").val();

            const insertData = {
                "packageId":0,
                "pkgName":$("#PkgName").val(),
                "pkgStartDate":startdate,
                "pkgEndDate":enddate,
                "pkgDesc":$("#PkgDesc").val(),
                "pkgBasePrice":$("#PkgBasePrice").val(),
                "pkgAgencyCommission":$("#PkgAgencyCommission").val()
            };

            //url for add packages from REST app
            var url = "http://localhost:8080/Group1Term3RestM7_war_exploded/api/putpackage" ;
            try {
                const response = await fetch(url,
                    {
                        method: "PUT",
                        //dataType: "json",
                        headers: {"Content-type": "application/json"},
                        body: JSON.stringify(insertData),
                        //mode: "no-cors"
                    });
                if (!response.ok) {
                    const message = "Insert failed: status=" + response.status;
                    throw new Error(message);
                }
                const data = await response.json();
                $("#message").html(data.message);
            } catch (e) {
                console.log("Error: " + e);
            }
        };

    </script>
</head>
<%--<header>--%>
<%--    <jsp:include page="header.jsp" />--%>
<%--</header>--%>
<body>
<h1>Travel Experts
</h1>
<p id="message"></p>
<form>
    Id:<input id="PackageId" type="number" disabled="disabled" /><br />
    Name:<input id="PkgName" type="text" /><br />
    Start Date:<input id="PkgStartDate" type="date" /><br />
    End Date:<input id="PkgEndDate" type="date" /><br />
    Description:<input id="PkgDesc" type="text" /><br />
    Base Price:<input id="PkgBasePrice" type="number" step=".01" /><br />
    Commission:<input id="PkgAgencyCommission" type="number" step=".01" /><br />
    <button type="button" onclick="putPackage()">Insert</button>
</form>
</body>
</html>
