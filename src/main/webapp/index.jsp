<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome to Travel Experts</title>
    <script   src="https://code.jquery.com/jquery-3.6.0.js"   integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="   crossorigin="anonymous"></script>
    <%--    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>--%>
    <script>
        // function jQueryGetExample()
        // {
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


        // }

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
    // jQueryGetExample();
</script>
</body>
</html>