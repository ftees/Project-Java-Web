<%-- 
    Document   : products
    Created on : Oct 18, 2019, 8:21:17 PM
    Author     : TienNp
--%>

<%@page import="entity.Admin"%>
<%@page import="entity.Customer"%>
<%@page import="entity.Brand"%>
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

        <title>Products</title>

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

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
                  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
                  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
                <![endif]-->

    </head>

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

        <!-- BREADCRUMB -->
        <div id="breadcrumb">
            <div class="container">
                <ul class="breadcrumb">
                    <li><a href="home.jsp">Home</a></li>
                    <li class="active">Products</li>
                </ul>
            </div>
        </div>
        <!-- /BREADCRUMB -->

        <!-- section -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <!-- ASIDE -->
                    <div id="aside" class="col-md-3">
                        <!-- aside widget -->

                        <!-- /aside widget -->

                        <!-- aside widget -->

                        <!-- aside widget -->

                        <!-- aside widget -->

                        <!-- /aside widget -->

                        <!-- aside widget -->
                        <div class="aside">
                            <h3 class="aside-title">Filter By Status:</h3>
                            <ul class="size-option">
                                <li class="active"><a href="Brand?status=new">New</a></li>
                                <li class="active"><a href="Brand?status=old">Old</a></li>
                                <li class="active"><a href="Brand?status=used">Used</a></li>
                            </ul>
                        </div>
                        <!-- /aside widget -->

                        <!-- aside widget -->
                        <div class="aside">
                            <h3 class="aside-title">Filter by Country</h3>
                            <ul class="list-links">
                                <%
                                    ArrayList<Brand> listBrand = pdb.getBrand();
                                    for (int i = 0; i < listBrand.size(); i++) {
                                %>                                    
                                <li><a href="Brand?country=<%=listBrand.get(i).getCountry()%>">
                                        <%=listBrand.get(i).getCountry()%></a></li>

                                <%
                                    }
                                %>

                            </ul>
                        </div>
                        <!-- /aside widget -->

                        <!-- aside widget -->

                        <!-- /aside widget -->


                        <!-- aside widget -->
                        <div class="aside">
                            <h3 class="aside-title">Top Rated Product</h3>
                            <!-- widget product -->
                            <%
                                ArrayList<Phone> list = pdb.getProdust();
                                for (int i = 0; i < 2; i++) {
                            %>
                            <div class="product product-widget">
                                <div class="product-thumb">
                                    <img src="<%=list.get(i).getImg()%>" alt="">
                                </div>
                                <div class="product-body">
                                    <h2 class="product-name"><a href="#"><%=list.get(i).getName()%></a></h2>
                                    <h3 class="product-price"><%=list.get(i).getPrice()%></h3>
                                    <div class="product-rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star-o empty"></i>
                                    </div>
                                </div>
                            </div>
                            <%  }
                            %>
                            <!-- /widget product -->

                            <!-- widget product -->

                            <!-- /widget product -->
                        </div>
                        <!-- /aside widget -->
                    </div>
                    <!-- /ASIDE -->

                    <!-- MAIN -->
                    <div id="main" class="col-md-9">
                        <!-- store top filter -->

                        <!-- /store top filter -->

                        <!-- STORE -->
                        <div id="store">
                            <!-- row -->
                            <div class="row">
                                <!-- Product Single -->
                                <%
                                    if (request.getAttribute("listSearch") != null) {
                                        list = (ArrayList<Phone>) request.getAttribute("listSearch");
                                    } else {
                                        list = pdb.getProdust();
                                    }

                                    int index = 0;
                                    int size = list.size(); // so phan tu trong bang 
                                    int curPage = 0;  // dang o trang nao
                                    int pPerPage = 9; // so san phan tren 1 trang
                                %>
                                <%
                                    try {
                                        curPage = Integer.parseInt(request.getParameter("page"));

                                    } catch (NumberFormatException e) {
                                        curPage = 0;
                                    }
                                    if (curPage == 0) {
                                        curPage = 1; // so trang danh tu 1

                                    }
                                    index = (curPage - 1) * pPerPage; // lat trang de ve phan tu dau
                                    int counter = 0;  // torng 1 trang 0 

                                    while ((counter < pPerPage) && index < size) {
                                %>


                                <div class="col-md-4 col-sm-6 col-xs-6">
                                    <div class="product product-single">
                                        <div class="product-thumb">

                                            <a href="ProductPage?id=<%=list.get(index).getID()%>"><button class="main-btn quick-view"><i class="fa fa-search-plus"></i> Quick view</button></a>
                                            <img src="<%=list.get(index).getImg()%>" style="width: 212px; height: 169px;" alt="">
                                        </div>
                                        <div class="product-body">
                                            <h3 class="product-price"><%=list.get(index).getPrice()%> Đ</h3>
                                            <div class="product-rating">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-o empty"></i>
                                            </div>
                                            <h2 class="product-name"><a href="#"><%=list.get(index).getName()%></a></h2>
                                        </div>
                                    </div>
                                </div>
                                <%
                                    index++;
                                    counter++;
                                    if (counter >= pPerPage) {
                                        break;
                                    }
                                %>
                                <%
                                    }
                                %>
                                <!-- /Product Single -->


                                <!-- /Product Single -->
                            </div>
                            <!-- /row -->
                        </div>

                        <!-- /STORE -->

                        <!-- store bottom filter -->
                        <div class="store-filter clearfix">

                            <ul class="store-pages">
                                <li><span class="text-uppercase">Page:</span></li>
                                    <%
                                        String afileName = "products.jsp";
                                        String as = "active";
                                        String r = "fa fa-caret-right";
                                        if (index == 0) {
                                            out.print("No Product");
                                        } else {
                                            if (curPage == 1) {
                                                out.print("<li class=" + a + "><a href=#> < </a></li>");
                                            } else {
                                                out.print("<li class=" + a + "><a href=" + afileName + "?page=" + (curPage - 1) + "> < </a></li>");

                                            }
                                        }
                                        int indexpage = 1;
                                        int numpage;
                                        if (size % pPerPage == 0) {
                                            numpage = size / pPerPage;
                                        } else {
                                            numpage = size / pPerPage + 1;
                                        }
                                        while (indexpage <= numpage) {
                                            out.print("<li class=" + a + "><a href=" + afileName + "?page=" + indexpage + ">" + indexpage + "</a></li>");
                                            indexpage++;
                                        }
                                        if (curPage == numpage) {
                                            out.print("<li class=" + a + "><a href=#> > </a></li> ");
                                        } else {
                                            out.print("<li class=" + a + "><a href=" + afileName + "?page=" + (curPage + 1) + "> > </a></li>");
                                        }
                                    %>
                            </ul>
                        </div>
                    </div>
                    <!-- /store bottom filter -->
                </div>
                <!-- /MAIN -->
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

