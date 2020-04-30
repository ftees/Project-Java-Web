<%-- 
    Document   : admin
    Created on : Oct 18, 2019, 8:19:12 PM
    Author     : TienNp
--%>

<%@page import="entity.Customer"%>
<%@page import="java.util.Random"%>
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

        <title>Product Detail</title>

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

    <body>
        <!-- HEADER -->
        <%@include file="header.jsp" %>
        <!-- /HEADER -->

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
                    <li class="active">Product Detail</li>
                </ul>
            </div>
        </div>
        <!-- /BREADCRUMB -->

        <!-- section -->
        <%            String id = "";
            if (request.getAttribute("id") != null) {
                id = request.getAttribute("id").toString();
            }
            Phone p = pdb.getProductById(id);

        %>
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <!--  Product Details -->
                    <div class="product product-details clearfix">
                        <div class="col-md-6">
                            <div id="product-main-view">                                
                                <img src="<%=p.getImg()%>" alt="">
                            </div>

                        </div>
                        <div class="col-md-6">
                            <div class="product-body">
                                <div class="product-label">
                                    <span>New</span>

                                </div>
                                <h2 class="product-name"><%=p.getName()%></h2>
                                <h3 class="product-price"><%=p.getPrice()%></h3>
                                <div>
                                    <div class="product-rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star-o empty"></i>
                                    </div>

                                </div>
                                <p><strong>Availability:</strong> In Stock</p>
                                <p><strong>Brand:</strong> <%=p.getBrand()%></p>


                                <br>
                                <form action="shopping" method="post">
                                    <div class="product-btns">
                                        <div class="qty-input">
                                            <span class="text-uppercase">QTY: </span>
                                            <input name="quantity" class="input" type="number">
                                        </div>
                                        <input name="id" class="input" type="hidden" value="<%=id%>">
                                        <input name="price" class="input" type="hidden" value="<%=p.getPrice()%>">
                                        <button <%if (session.getAttribute("customer") == null) { %>onclick='myFunction()'<%}%> type="submit" class="primary-btn add-to-cart"><i class="fa fa-shopping-cart"></i> Add to Cart</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="product-tab">
                                <ul class="tab-nav">
                                    <li class="active"><a data-toggle="tab" href="#tab1">Description</a></li>

                                </ul>
                                <div class="tab-content">
                                    <div id="tab1" class="tab-pane fade in active">
                                        <p><%= p.getDescribe()%></p>
                                    </div>

                                </div>
                            </div>
                        </div>

                    </div>
                    <!-- /Product Details -->
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
                            <h2 class="title">Picked For You</h2>
                        </div>
                    </div>
                    <!-- section title -->
                    <%  ArrayList<Phone> list = pdb.getProdust();
                        Random r = new Random();
                        int n = r.nextInt(30);
                        for (int i = n; i < n + 4; i++) {
                    %>

                    <!-- Product Single -->
                    <div class="col-md-3 col-sm-6 col-xs-6">
                        <div class="product product-single">
                            <div class="product-thumb">
                                <a href="ProductPage?id=<%=list.get(i).getID()%>"><button class="main-btn quick-view"><i class="fa fa-search-plus"></i> Quick view</button></a>
                                <img src="<%=list.get(i).getImg()%>" alt="">
                            </div>
                            <div class="product-body">
                                <h3 class="product-price"><%=list.get(i).getPrice()%></h3>
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
                    <!-- /Product Single -->
                    <%
                        }
                    %>
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
        <script>
                                            function myFunction() {
                                                alert("Your must login to buy any thing !!");
                                            }
        </script>

    </body>

</html>

