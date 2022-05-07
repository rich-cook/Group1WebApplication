
<%--
  Created by IntelliJ IDEA.
  User: Richard
  Date: 2022-05-03
  Time: 10:08 a.m.
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Package display</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Inter:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800&amp;display=swap">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css">
    <link rel="stylesheet" href="assets/css/untitled.css">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script   src="https://code.jquery.com/jquery-3.6.0.js"   integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="   crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/dayjs/1.11.1/dayjs.min.js"></script>
    <script>
        //fetch all of the packages from the packages table
        async function fetchPackages()
        {
            //url db connection
            var url = "http://localhost:8080/Group1Term3RestM7_war_exploded/api/getpackages";

            var packages = await fetch(url);
            var packagesJSON = await packages.json();
            for (i=0; i<packagesJSON.length; i++)
            {
                $("#packageselect").append("<option value='" + packagesJSON[i].packageId + "'>"
                    + packagesJSON[i].pkgName + "</option>");
            }
        }
        //getting the packages from the api via their id
        async function fetchPackage(id) {

            //url db connection
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

        async function editPackage()
        {
            //var startdate = dayjs($("#PkgStartDate").val()).format("YYYY-MM-DD");
            //var enddate = dayjs($("#PkgEndDate").val()).format("YYYY-MM-DD");

        //using jquery to get the values of the form to be edited
            const editData = {
                "packageId":$("#PackageId").val(),
                "pkgName":$("#PkgName").val(),
                "pkgStartDate":dayjs($("#PkgStartDate").val()).format("YYYY-MM-DD"),
                "pkgEndDate":dayjs($("#PkgEndDate").val()).format("YYYY-MM-DD"),
                "pkgDesc":$("#PkgDesc").val(),
                "pkgBasePrice":$("#PkgBasePrice").val(),
                "pkgAgencyCommission":$("#PkgAgencyCommission").val()
            };

            var url = "http://localhost:8080/Group1Term3RestM7_war_exploded/api/postpackage/"

            var response = await fetch(url,
                {
                    method: "post",
                    headers: {"Content-Type": "application/json"},
                    body:JSON.stringify(editData)
                });
            alert("Package updated");

        }
    </script>
</head>



<body style="/*background: url(&quot;design.jpg&quot;);*/background-position: 0 -60px;">
<nav class="navbar navbar-light navbar-expand-md fixed-top navbar-shrink py-3" id="mainNav">
    <div class="container"><a class="navbar-brand d-flex align-items-center" href="index.jsp"><span class="bs-icon-sm bs-icon-circle bs-icon-primary shadow d-flex justify-content-center align-items-center mr-2 bs-icon"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-arrow-down-right-square-fill">
                        <path d="M14 16a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12zM5.904 5.197 10 9.293V6.525a.5.5 0 0 1 1 0V10.5a.5.5 0 0 1-.5.5H6.525a.5.5 0 0 1 0-1h2.768L5.197 5.904a.5.5 0 0 1 .707-.707z"></path>
                    </svg></span><span><strong>Travel Experts</strong></span></a><button data-toggle="collapse" class="navbar-toggler" data-target="#navcol-3"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navcol-3">
            <ul class="navbar-nav mx-auto">
                <li class="nav-item"><a class="nav-link active" href="getPackage.jsp">Show</a></li>
                <li class="nav-item"><a class="nav-link" href="deletePackage.jsp">Delete</a></li>
                <li class="nav-item"></li>
                <li class="nav-item"><a class="nav-link" href="putPackage.jsp">Add</a></li>
                <li class="nav-item"><a class="nav-link" href="editPackage.jsp">Change</a></li>
            </ul>
        </div>
    </div>
</nav>
<header class="bg-primary-gradient pt-5">
    <div class="container pt-4 pt-xl-5">
        <div class="row pt-5">
            <div class="col-md-8 col-xl-6 text-center text-md-left mx-auto bg-primary-gradient">
                <div class="text-center">
                    <p class="font-weight-bold text-success mb-2">Voted #1 Worldwide</p>
                    <h1 class="font-weight-bold">Travel Experts - Adventure Awaits</h1>
                </div>
            </div>
            <div class="col-12 col-lg-10 mx-auto">
                <div class="position-relative" style="display: flex;flex-wrap: wrap;justify-content: flex-end;">
                    <div style="position: relative;flex: 0 0 45%;transform: translate3d(-15%, 35%, 0);"><img class="img-fluid" data-aos="fade-down" src="assets/img/products/karl-kohler-dV1S_uKSb6A-unsplash.jpg" data-bss-parallax="" data-bss-parallax-speed="0.8"></div>
                    <div style="position: relative;flex: 0 0 45%;transform: translate3d(-5%, 20%, 0);"><img class="img-fluid" data-aos="fade-down" src="assets/img/products/david-kohler-VFRTXGw1VjU-unsplash.jpg" data-bss-parallax="" data-bss-parallax-speed="0.4"></div>
                    <div style="position: relative;flex: 0 0 60%;transform: translate3d(0, 0%, 0);"><img class="img-fluid" src="assets/img/products/andre-benz-MsMISAIe8Qw-unsplash.jpg" data-bss-parallax="" data-bss-parallax-speed="0.25"></div>
                </div>
            </div>
        </div>
    </div>
</header>
<section class="py-4 py-xl-5">
    <div class="container">
        <div class="row">
            <div class="col-md-12"></div>
        </div>
        <div class="row">
            <div class="col-md-6"></div>
            <div class="col-md-6"></div>
        </div>
    </div>
    <div class="container"></div>
</section>
<section>
    <div class="container bg-primary-gradient py-4 py-xl-5">
        <div class="py-5 p-lg-5">
            <div class="row row-cols-1 row-cols-md-2 mx-auto" style="max-width: 900px;">
                <div class="col mb-5">
                    <div class="card shadow-sm">
                        <div class="card-body px-4 py-5 px-md-5">
                            <div class="bs-icon-lg d-flex justify-content-center align-items-center mb-3 bs-icon" style="top: 1rem;right: 1rem;position: absolute;"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-bell">
                                <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zM8 1.918l-.797.161A4.002 4.002 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4.002 4.002 0 0 0-3.203-3.92L8 1.917zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5.002 5.002 0 0 1 13 6c0 .88.32 4.2 1.22 6z"></path>
                            </svg></div>
                            <h5 class="font-weight-bold card-title">Lorem ipsum dolor sit&nbsp;</h5>
                            <p class="text-muted card-text mb-4">Erat netus est hendrerit, nullam et quis ad cras porttitor iaculis. Bibendum vulputate cras aenean.</p><button class="btn btn-primary shadow" type="button">Learn more</button>
                        </div>
                    </div>
                </div>
                <div class="col mb-5">
                    <div class="card shadow-sm">
                        <div class="card-body px-4 py-5 px-md-5">
                            <div class="bs-icon-lg d-flex justify-content-center align-items-center mb-3 bs-icon" style="top: 1rem;right: 1rem;position: absolute;"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-bezier">
                                <path fill-rule="evenodd" d="M0 10.5A1.5 1.5 0 0 1 1.5 9h1A1.5 1.5 0 0 1 4 10.5v1A1.5 1.5 0 0 1 2.5 13h-1A1.5 1.5 0 0 1 0 11.5v-1zm1.5-.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1zm10.5.5A1.5 1.5 0 0 1 13.5 9h1a1.5 1.5 0 0 1 1.5 1.5v1a1.5 1.5 0 0 1-1.5 1.5h-1a1.5 1.5 0 0 1-1.5-1.5v-1zm1.5-.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1zM6 4.5A1.5 1.5 0 0 1 7.5 3h1A1.5 1.5 0 0 1 10 4.5v1A1.5 1.5 0 0 1 8.5 7h-1A1.5 1.5 0 0 1 6 5.5v-1zM7.5 4a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1z"></path>
                                <path d="M6 4.5H1.866a1 1 0 1 0 0 1h2.668A6.517 6.517 0 0 0 1.814 9H2.5c.123 0 .244.015.358.043a5.517 5.517 0 0 1 3.185-3.185A1.503 1.503 0 0 1 6 5.5v-1zm3.957 1.358A1.5 1.5 0 0 0 10 5.5v-1h4.134a1 1 0 1 1 0 1h-2.668a6.517 6.517 0 0 1 2.72 3.5H13.5c-.123 0-.243.015-.358.043a5.517 5.517 0 0 0-3.185-3.185z"></path>
                            </svg></div>
                            <h5 class="font-weight-bold card-title">Lorem ipsum dolor sit&nbsp;</h5>
                            <p class="text-muted card-text mb-4">Erat netus est hendrerit, nullam et quis ad cras porttitor iaculis. Bibendum vulputate cras aenean.</p><button class="btn btn-primary shadow" type="button">Learn more</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<section>
    <div class="container py-4 py-xl-5">
        <div class="mx-auto" style="max-width: 900px;">
            <div class="row row-cols-1 row-cols-md-2 d-flex justify-content-center">
                <div class="col mb-4">
                    <div class="card bg-primary-light">
                        <div class="card-body text-center px-4 py-5 px-md-5">
                            <p class="font-weight-bold text-primary card-text mb-2">Fully Managed</p>
                            <h5 class="font-weight-bold card-title mb-3">Lorem ipsum dolor sit&nbsp;nullam et quis ad cras porttitor</h5><button class="btn btn-primary btn-sm" type="button">Learn more</button>
                        </div>
                    </div>
                </div>
                <div class="col mb-4">
                    <div class="card bg-secondary-light">
                        <div class="card-body text-center px-4 py-5 px-md-5">
                            <p class="font-weight-bold text-secondary card-text mb-2">Fully Managed</p>
                            <h5 class="font-weight-bold card-title mb-3">Lorem ipsum dolor sit&nbsp;nullam et quis ad cras porttitor</h5><button class="btn btn-secondary btn-sm" type="button">Learn more</button>
                        </div>
                    </div>
                </div>
                <div class="col mb-4">
                    <div class="card bg-info-light">
                        <div class="card-body text-center px-4 py-5 px-md-5">
                            <p class="font-weight-bold text-info card-text mb-2">Fully Managed</p>
                            <h5 class="font-weight-bold card-title mb-3">Lorem ipsum dolor sit&nbsp;nullam et quis ad cras porttitor</h5><button class="btn btn-info btn-sm" type="button">Learn more</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<section class="py-5 mt-5"></section>
<section class="py-4 py-xl-5 mt-5">
    <div class="container">
        <div class="row mb-5">
            <div class="col-md-8 col-xl-6 text-center mx-auto">
                <p class="font-weight-bold text-success mb-2">Packages</p>
                <h2 class="font-weight-bold">Packages We Can Offer</h2>
            </div>
        </div>
        <div class="row d-flex justify-content-center">
            <div class="col-md-6 col-xl-4">
                <div>
                    <form class="p-3 p-xl-4">
                        <div class="mb-3">

                            <select id="packageselect" onchange="fetchPackage(this.value)">
                                <option value="">Select a package to view details</option>
                            </select>
                            <form>
                                <div class="mb-3"><input class="form-control mt-3" id="PackageId" type="number" disabled="disabled" name="name" placeholder="Package ID"></div>
                                <%--                                Id:<input id="PackageId" type="number" disabled="disabled" /><br />--%>
                                <div class="mb-3"><input class="form-control mt-3" id="PkgName" type="text" placeholder="Package Name"></div>
                                <div class="mb-3"><input class="form-control mt-2" id="PkgStartDate" type="date">
                                    <div class="mb-3"><input class="form-control mt-2" id="PkgEndDate" type="date">
                                        <div class="mb-3"><input class="form-control mt-2" id="PkgDesc" type="text"placeholder="Package Description">
                                            <div class="mb-3"><input class="form-control mt-2" id="PkgBasePrice" type="number" step="0.01" placeholder="Package Base Price">
                                                <div class="mb-3"><input class="form-control mt-2" id="PkgAgencyCommission" type="number" step=".01" placeholder="Agency Commission">
                                                    <div><button class="btn btn-primary shadow d-block w-100" type="button" onclick="editPackage(this.value)">Submit</button></div>
                            </form>





                        </div>


                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<footer class="bg-primary-gradient">
    <div class="container py-4 py-lg-5">
        <div class="row justify-content-center">
            <div class="col-sm-4 col-md-3 text-center text-lg-left d-flex flex-column item">
                <h3 class="font-weight-bold" style="font-size: 1rem;">Services</h3>
                <ul class="list-unstyled">
                    <li><a class="text-muted" href="#">Web design</a></li>
                    <li><a class="text-muted" href="#">Development</a></li>
                    <li><a class="text-muted" href="#">Hosting</a></li>
                </ul>
            </div>
            <div class="col-sm-4 col-md-3 text-center text-lg-left d-flex flex-column item">
                <h3 class="font-weight-bold" style="font-size: 1rem;">About</h3>
                <ul class="list-unstyled">
                    <li><a class="text-muted" href="#">Company</a></li>
                    <li><a class="text-muted" href="#">Team</a></li>
                    <li><a class="text-muted" href="#">Legacy</a></li>
                </ul>
            </div>
            <div class="col-sm-4 col-md-3 text-center text-lg-left d-flex flex-column item">
                <h3 class="font-weight-bold" style="font-size: 1rem;">Careers</h3>
                <ul class="list-unstyled">
                    <li><a class="text-muted" href="#">Job openings</a></li>
                    <li><a class="text-muted" href="#">Employee success</a></li>
                    <li><a class="text-muted" href="#">Benefits</a></li>
                </ul>
            </div>
            <div class="col-lg-3 text-center text-lg-left d-flex flex-column align-items-center order-first align-items-lg-start order-lg-last item social">
                <div class="font-weight-bold d-flex align-items-center mb-2"><span class="bs-icon-sm bs-icon-circle bs-icon-primary d-flex justify-content-center align-items-center bs-icon mr-2"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-bezier">
                                <path fill-rule="evenodd" d="M0 10.5A1.5 1.5 0 0 1 1.5 9h1A1.5 1.5 0 0 1 4 10.5v1A1.5 1.5 0 0 1 2.5 13h-1A1.5 1.5 0 0 1 0 11.5v-1zm1.5-.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1zm10.5.5A1.5 1.5 0 0 1 13.5 9h1a1.5 1.5 0 0 1 1.5 1.5v1a1.5 1.5 0 0 1-1.5 1.5h-1a1.5 1.5 0 0 1-1.5-1.5v-1zm1.5-.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1zM6 4.5A1.5 1.5 0 0 1 7.5 3h1A1.5 1.5 0 0 1 10 4.5v1A1.5 1.5 0 0 1 8.5 7h-1A1.5 1.5 0 0 1 6 5.5v-1zM7.5 4a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1z"></path>
                                <path d="M6 4.5H1.866a1 1 0 1 0 0 1h2.668A6.517 6.517 0 0 0 1.814 9H2.5c.123 0 .244.015.358.043a5.517 5.517 0 0 1 3.185-3.185A1.503 1.503 0 0 1 6 5.5v-1zm3.957 1.358A1.5 1.5 0 0 0 10 5.5v-1h4.134a1 1 0 1 1 0 1h-2.668a6.517 6.517 0 0 1 2.72 3.5H13.5c-.123 0-.243.015-.358.043a5.517 5.517 0 0 0-3.185-3.185z"></path>
                            </svg></span><span>Brand</span></div>
                <p class="text-muted copyright">Sem eleifend donec molestie, integer quisque orci aliquam.</p>
            </div>
        </div>
        <hr>
        <div class="text-muted d-flex justify-content-between pt-3" style="background: var(--bs-gray-100);">
            <p class="mb-0">Copyright © 2022 Brand</p>
            <ul class="list-inline mb-0">
                <li class="list-inline-item"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-facebook">
                    <path d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951z"></path>
                </svg></li>
                <li class="list-inline-item"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-twitter">
                    <path d="M5.026 15c6.038 0 9.341-5.003 9.341-9.334 0-.14 0-.282-.006-.422A6.685 6.685 0 0 0 16 3.542a6.658 6.658 0 0 1-1.889.518 3.301 3.301 0 0 0 1.447-1.817 6.533 6.533 0 0 1-2.087.793A3.286 3.286 0 0 0 7.875 6.03a9.325 9.325 0 0 1-6.767-3.429 3.289 3.289 0 0 0 1.018 4.382A3.323 3.323 0 0 1 .64 6.575v.045a3.288 3.288 0 0 0 2.632 3.218 3.203 3.203 0 0 1-.865.115 3.23 3.23 0 0 1-.614-.057 3.283 3.283 0 0 0 3.067 2.277A6.588 6.588 0 0 1 .78 13.58a6.32 6.32 0 0 1-.78-.045A9.344 9.344 0 0 0 5.026 15z"></path>
                </svg></li>
                <li class="list-inline-item"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-instagram">
                    <path d="M8 0C5.829 0 5.556.01 4.703.048 3.85.088 3.269.222 2.76.42a3.917 3.917 0 0 0-1.417.923A3.927 3.927 0 0 0 .42 2.76C.222 3.268.087 3.85.048 4.7.01 5.555 0 5.827 0 8.001c0 2.172.01 2.444.048 3.297.04.852.174 1.433.372 1.942.205.526.478.972.923 1.417.444.445.89.719 1.416.923.51.198 1.09.333 1.942.372C5.555 15.99 5.827 16 8 16s2.444-.01 3.298-.048c.851-.04 1.434-.174 1.943-.372a3.916 3.916 0 0 0 1.416-.923c.445-.445.718-.891.923-1.417.197-.509.332-1.09.372-1.942C15.99 10.445 16 10.173 16 8s-.01-2.445-.048-3.299c-.04-.851-.175-1.433-.372-1.941a3.926 3.926 0 0 0-.923-1.417A3.911 3.911 0 0 0 13.24.42c-.51-.198-1.092-.333-1.943-.372C10.443.01 10.172 0 7.998 0h.003zm-.717 1.442h.718c2.136 0 2.389.007 3.232.046.78.035 1.204.166 1.486.275.373.145.64.319.92.599.28.28.453.546.598.92.11.281.24.705.275 1.485.039.843.047 1.096.047 3.231s-.008 2.389-.047 3.232c-.035.78-.166 1.203-.275 1.485a2.47 2.47 0 0 1-.599.919c-.28.28-.546.453-.92.598-.28.11-.704.24-1.485.276-.843.038-1.096.047-3.232.047s-2.39-.009-3.233-.047c-.78-.036-1.203-.166-1.485-.276a2.478 2.478 0 0 1-.92-.598 2.48 2.48 0 0 1-.6-.92c-.109-.281-.24-.705-.275-1.485-.038-.843-.046-1.096-.046-3.233 0-2.136.008-2.388.046-3.231.036-.78.166-1.204.276-1.486.145-.373.319-.64.599-.92.28-.28.546-.453.92-.598.282-.11.705-.24 1.485-.276.738-.034 1.024-.044 2.515-.045v.002zm4.988 1.328a.96.96 0 1 0 0 1.92.96.96 0 0 0 0-1.92zm-4.27 1.122a4.109 4.109 0 1 0 0 8.217 4.109 4.109 0 0 0 0-8.217zm0 1.441a2.667 2.667 0 1 1 0 5.334 2.667 2.667 0 0 1 0-5.334z"></path>
                </svg></li>
            </ul>
        </div>
    </div>
</footer>
<script>
    $(document).ready(function(){
        fetchPackages();
    });
</script>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/js/bs-init.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
<script src="assets/js/bold-and-bright.js"></script>
</body>

</html>

