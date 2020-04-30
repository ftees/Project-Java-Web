<%-- 
    Document   : home
    Created on : Oct 18, 2019, 8:15:09 PM
    Author     : TienNp
--%>

<%@page import="entity.Admin"%>
<%@page import="entity.Customer"%>
<%@page import="entity.Phone"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modal.productDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <title>I-Shop</title>

        <!-- Google font -->
        <link href="https://fonts.googleapis.com/css?family=Hind:400,700" rel="stylesheet">

        <!-- Bootstrap -->
        <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />

        <!-- Slick -->
        <link type="text/css" rel="stylesheet" href="css/slick.css" />
        <link type="text/css" rel="stylesheet" href="css/slick-theme.css" />

        <!-- nouislider -->
        <link type="text/css" rel="stylesheet" href="css/nouislider.min.css" />

        <!-- Font Awesome Icon -->
        <link rel="stylesheet" href="css/font-awesome.min.css">

        <!-- Custom stlylesheet -->
        <link type="text/css" rel="stylesheet" href="css/style.css" />


    </head>
    <style type="text/css">
        .imgIcon{
            padding-left: 30px;
        }
    </style>
    <body>
        <!-- HEADER -->
        <%@include file="header.jsp" %>
        <!-- /HEADER -->

        <!-- NAVIGATION -->
        <div id="navigation">
            <!-- container -->
            <div class="container">
                <div id="responsive-nav">
                    <!-- category nav -->
                    <div class="category-nav show-on-click">
                        <span class="category-header">Brand <i class="fa fa-list"></i></span>
                        <ul class="category-list">
                            <li class="dropdown side-dropdown">
                            <li><a href="Brand?brand=apple"><img src="./img/apples.png">  Apple</a></li>       
                            <li><a href="Brand?brand=samsung"><img src="./img/samsungg.png">  Samsung</a></li>
                            <li><a href="Brand?brand=nokia"><img src="./img/nokiaa.png">  Nokia</a></li>
                            <li><a href="Brand?brand=oppo"><img src="./img/oppoo.png">  Oppo</a></li>

                            <li><a href="Brand?brand=xiaomi"><img src="./img/xiaomii.png">  Xiaomi</a></li>						
                            <li><a href="Brand?brand=sony"><img src="./img/sonyy.png">  Sony</a></li>
                            <li><a href="Brand?brand=lg"><img src="./img/lgg.png">  LG</a></li>

                        </ul>
                    </div>
                    <!-- /category nav -->

                    <!-- menu nav -->
                    <div class="menu-nav">
                        <span class="menu-header">Menu <i class="fa fa-bars"></i></span>
                        <ul class="menu-list">
                            <li><a href="home.jsp">Home</a></li>
                            <li><a href="products.jsp">Shop</a></li>
                            <li><a href="Aboutus.jsp">About us</a></li>
                            <li><a href="#">Contact</a></li>
                            <li><a href="Sale.jsp">Sales</a></li>
                            <li class="dropdown default-dropdown"><a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">Pages <i class="fa fa-caret-down"></i></a>
                                <ul class="custom-menu">
                                    <li><a href="home.jsp">Home</a></li>
                                    <li><a href="products.jsp">Products</a></li>

                                    <li><a href="checkout.html">Checkout</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <!-- menu nav -->
                </div>
            </div>
            <!-- /container -->
        </div>
        <!-- /NAVIGATION -->


        <!-- HOME -->
        <div id="home">
            <!-- container -->
            <div class="container">
                <!-- home wrap -->
                <div class="home-wrap">
                    <!-- home slick -->
                    <div id="home-slick">
                        <!-- banner -->
                        <div class="banner banner-1">
                            <img src="./img/a1.jpg" alt="">
                            <div class="banner-caption text-center">
                            </div>
                        </div>
                        <!-- /banner -->

                        <!-- banner -->
                        <div class="banner banner-1">
                            <img src="./img/a2.jpg" alt="">
                            <div class="banner-caption">	
                            </div>
                        </div>
                        <!-- /banner -->

                        <!-- banner -->
                        <div class="banner banner-1">
                            <img src="./img/a3.jpg" alt="">
                            <div class="banner-caption">
                            </div>
                        </div>
                        <div class="banner banner-1">
                            <img src="./img/a4.jpg" alt="">
                            <div class="banner-caption">
                            </div>
                        </div>
                        <div class="banner banner-1">
                            <img src="./img/a5.jpg" alt="">
                            <div class="banner-caption">
                            </div>
                        </div>
                        <!-- /banner -->
                    </div>
                    <!-- /home slick -->
                </div>
                <!-- /home wrap -->
            </div>
            <!-- /container -->
        </div>
        <!-- /HOME -->

        <!-- section -->

        <!-- /section -->

        <!-- section -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <!-- section-title -->
                    <div class="col-md-12">
                        <div class="section-title">
                            <h2 class="title">Deals Of The Day</h2>
                            <div class="pull-right">
                                <div class="product-slick-dots-1 custom-dots"></div>
                            </div>
                        </div>
                    </div>
                    <!-- /section-title -->

                    <!-- banner -->
                    <div class="col-md-3 col-sm-6 col-xs-6">
                        <div class="banner banner-2">
                            <img src="./img/banner1.png" alt="">
                            <div class="banner-caption">
                                <h2 class="white-color">NEW<br>COLLECTION</h2>
                                <button class="primary-btn">Shop Now</button>
                            </div>
                        </div>
                    </div>
                    <!-- /banner -->

                    <!-- Product Slick -->
                    <div class="col-md-9 col-sm-6 col-xs-6">
                        <div class="row">

                            <div id="product-slick-1" class="product-slick">
                                <%  productDB db = new productDB();
                                    ArrayList<Phone> list = db.getProdust();
                                    if (request.getAttribute("listSearch") != null) {
                                        list = (ArrayList<Phone>) request.getAttribute("listSearch");
                                    } else {
                                        list = db.getProdust();
                                    }
                                    for (int i = 4; i < 7; i++) {
                                %>

                                <!-- Product Single -->
                                <div class="product product-single">
                                    <div class="product-thumb">
                                        <div class="product-label">
                                            <span>New</span>
                                            <span class="sale">-20%</span>
                                        </div>

                                        <a href="ProductPage?id=<%=list.get(i).getID()%>"><button class="main-btn quick-view"><i class="fa fa-search-plus"></i> Quick view</button></a>
                                        <img src="<%=list.get(i).getImg()%>" style="width: 212px; height: 220px;"  alt="">
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-price"><%=((list.get(i).getPrice()) * 80) / 100 + "Đ"%> <del class="product-old-price"><%=list.get(i).getPrice() + "VNĐ"%></del></h3>
                                        <div class="product-rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star-o empty"></i>
                                        </div>
                                        <h2 class="product-name"><a href="#"><%=list.get(i).getName()%></a></h2>

                                    </div>
                                </div>
                                <%
                                    }
                                %>
                            </div>

                        </div>
                    </div>
                    <!-- /Product Slick -->
                </div>
                <!-- /row -->

                <!-- row -->

                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /section -->

        <!-- section -->
        <div class="section section-grey">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <!-- banner -->
                    <div class="col-md-8">
                        <div class="banner banner-1">
                            <a class="banner banner-1" href="#">
                                <img src="./img/banner5.jpg" alt="">
                                <div class="banner-caption text-center">

                                </div>
                            </a>
                        </div>
                    </div>
                    <!-- /banner -->

                    <!-- banner -->
                    <div class="col-md-4 col-sm-6">
                        <a class="banner banner-1" href="#">
                            <img src="./img/banner11.jpg" alt="">
                            <div class="banner-caption text-center">
                                <h2 class="white-color">NEW COLLECTION</h2>
                            </div>
                        </a>
                    </div>
                    <!-- /banner -->

                    <!-- banner -->
                    <div class="col-md-4 col-sm-6">
                        <a class="banner banner-1" href="#">
                            <img src="./img/banner12.jpg" alt="">
                            <div class="banner-caption text-center">
                                <h2 class="white-color">NEW COLLECTION</h2>
                            </div>
                        </a>
                    </div>
                    <!-- /banner -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /section -->

        <!-- section -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <!-- section title -->
                    <div class="col-md-12">
                        <div class="section-title">
                            <h2 class="title">Best Seller Products</h2>
                        </div>
                    </div>
                    <!-- section title -->
                    <%
                        for (int i = 14; i < 18; i++) {
                    %>
                    <!-- Product Single -->
                    <div class="col-md-3 col-sm-6 col-xs-6">
                        <div class="product product-single">
                            <div class="product-thumb">
                                <a href="ProductPage?id=<%=list.get(i).getID()%>"><button class="main-btn quick-view"><i class="fa fa-search-plus"></i> Quick view</button></a>
                                <img src="<%=list.get(i).getImg()%>" alt="">
                            </div>
                            <div class="product-body">
                                <h3 class="product-price"><%=list.get(i).getPrice() + " VNĐ"%></h3>
                                <div class="product-rating">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star-o empty"></i>
                                </div>
                                <h2 class="product-name"><a href="#"><%=list.get(i).getName()%></a></h2>

                            </div>
                        </div>
                    </div>
                    <% } %>
                    <!-- /Product Single -->

                    <!-- Product Single -->

                </div>
                <!-- /row -->

                <!-- row -->

                <!-- /Product Single -->

                <!-- /row -->

                <!-- row -->
                <div class="row">
                    <!-- section title -->
                    <div class="col-md-12">
                        <div class="section-title">
                            <h2 class="title">New Products</h2>
                        </div>
                    </div>
                    <!-- section title -->
                    <%
                        for (int i = 24; i < 28; i++) {
                    %>         
                    <!-- Product Single -->
                    <div class="col-md-3 col-sm-6 col-xs-6">
                        <div class="product product-single">
                            <div class="product-thumb">
                                <a href="ProductPage?id=<%=list.get(i).getID()%>"><button class="main-btn quick-view"><i class="fa fa-search-plus"></i> Quick view</button></a>
                                <img src="<%=list.get(i).getImg()%>" alt="">
                            </div>
                            <div class="product-body">
                                <h3 class="product-price"><%=list.get(i).getPrice() + " VNĐ"%></h3>
                                <div class="product-rating">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star-o empty"></i>
                                </div>
                                <h2 class="product-name"><a href="#"><%=list.get(i).getName()%></a></h2>

                            </div>
                        </div>
                    </div>
                    <% }%>         
                    <!-- /Product Single -->

                    <!-- Product Single -->

                    <!-- /Product Single -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /section -->

        <!-- FOOTER -->
        <%@include file="footer.jsp" %>   
        <!-- /FOOTER -->

        <!-- jQuery Plugins -->
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/slick.min.js"></script>
        <script src="js/nouislider.min.js"></script>
        <script src="js/jquery.zoom.min.js"></script>
        <script src="js/main.js"></script>

    </body>

</html>

