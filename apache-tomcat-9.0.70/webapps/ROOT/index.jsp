<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 1/7/2023
  Time: 11:01 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Furama Resort</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<link rel="stylesheet" href="../view/my_css/my.css">

<body>
<div class="container-fluid vh-100">
    <!--    header-->
    <div class=" d-flex justify-content-between">
        <div class="col-lg-1 left" style="width: 5%">
            <img class="img-fluid" src="img/logo (1).png" alt="logo">
        </div>
        <div class="row col-lg-2 m-md-8 d-flex justify-content-center align-items-md-center ">
            Lê Hữu Tài
            <img src="img/admin.png" style="width: 25%;height: 35%" alt="">
        </div>
    </div>
    <!--    navbar-->
    <div class="row">
        <nav class="navbar navbar-expand-lg bg-body-tertiary">
            <div class="container-fluid">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false"
                        aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <a class="navbar-brand" href="#">Home</a>
                <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="/employee">Employee</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="/customer">Customer</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page"
                               href="/facility">Service</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#">Control</a>
                        </li>
                    </ul>
                    <form class="d-flex" role="search">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                </div>
            </div>
        </nav>
    </div>

    <!--    slide-->
    <div class="row ">
        <div class="slide-content">
            <div id="carouselExample" class="carousel slide">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="img/Vietnam_Danang_Furama_Resort_Exterior_Beach.jpg"
                             class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="img/maxresdefault.jpg" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="img/10953_16030216470040397599.jpg" class="d-block w-100" alt="...">
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>

    </div>

    <!--footer-->
    <div class="row">
        <footer class="mainfooter" role="contentinfo">
            <div class="footer-middle">
                <div class="container">
                    <div class="row">
                        <div class="col-md-4 col-sm-6">
                            <!--Column1-->
                            <div class="footer-pad">
                                <h4>Moving Guide</h4>
                                <p>Furama Resort is the premier base from which to explore one of Asia's most exciting
                                    destinations.
                                    Just a short drive from Da Nang are four UNESCO World Heritage Sites:</p>
                                <a class="btn btn-outline-secondary" href="https://www.google.com/maps/dir//
                                %C4%91%E1%BB%8Ba+ch%E1%BB%89+furama+resort+%C4%91%C3%A0+n%E1%BA%B5ng/data=
                                !4m6!4m5!1m1!4e2!1m2!1m1!1s0x31420fdbc8cc38ef:
                                0x9a6a3e31121225d2?sa=X&ved=2ahUKEwjYyKyyzqP8AhUNt1YBHYGWBM4Q9Rd6BAhgEAQ"
                                   target="_blank">See On Map</a>
                                <ul class="list-unstyled">
                                    <li>
                                        <h3>Place</h3>
                                    </li>
                                    <li>
                                        <a href="https://thuathienhue.gov.vn/vi-vn/Ten-duong-tinh-thua-thien-hue/cid/A064E1C0-0A55-462F-A303-988E0859B383"
                                           target="_blank">The ancient capital of Hue</a></li>
                                    <li><a href="https://hoian.quangnam.gov.vn/webcenter/portal/hoian" target="_blank">Hoi
                                        An</a></li>
                                    <li><a href="https://disanvanhoamyson.vn/" target="_blank">My Son Sanctuary</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-6">
                            <!--Column2-->
                            <div class="footer-pad">
                                <ul class="list-unstyled">
                                    <li><a href="#">Rack rate</a></li>
                                    <li><a href="#">Lifestyle blog</a></li>
                                    <li><a href="#">Recruitment</a></li>
                                    <li><a href="#">Contact</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-6">
                            <!--Column3-->
                            <div class="footer-pad">
                                <h4>Contact</h4>
                                <ul class="list-unstyled">
                                    <li>
                                        <img src="img/add1.png.crdownload" style="width: 5%" alt="">
                                        <a href="https://www.google.com/maps/dir//%C4%91%E1%BB%8Ba+ch%E1%BB%89+furama+resort
                                        +%C4%91%C3%A0+n%E1%BA%B5ng/data=!4m6!4m5!1m1!4e2!1m2!1m1!1s0x31420fdbc8cc38ef:0x9a6a3e31
                                        121225d2?sa=X&ved=2ahUKEwjYyKyyzqP8AhUNt1YBHYGWBM4Q9Rd6BAhgEAQ">103 - 105 Vo
                                            Nguyen Giap Street, Khue My Ward,
                                            Ngu Hanh Son District, Danang City, Vietnam</a>
                                    </li>
                                    <li><a href="#">Tel.: 84-236-3847 333/888 * Fax: 84-236-3847 666</a></li>
                                    <li><a href="#">Email: reservation@furamavietnam.com * www.furamavietnam.com</a>
                                    </li>
                                    <ul class="social-network social-circle">
                                        <li><img src="img/fb.png" style="width: 7%" class="icoLinkedin"
                                                 title="Linkedin"><i class="fa fa-linkedin"></i></img></li>
                                        <li><img src="img/ytb2.png" style="width: 7%" class="icoLinkedin"
                                                 title="Linkedin"><i class="fa fa-linkedin"></i></img></li>
                                        <li><img src="img/ig.png" style="width: 7%" class="icoLinkedin"
                                                 title="Linkedin"><i
                                                class="fa fa-linkedin"></i></img></li>
                                    </ul>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 copy">
                            <p class="text-center">&copy; 2018 Furama Resort Danang.</p>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
    </div>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous">

</script>
</html>
