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
                    <li class="active">View <%
                        Customer cus = (Customer) session.getAttribute("customer");
                        %><%=cus.getUsername().toUpperCase()%> Cart </li>
                </ul>
            </div>
        </div>
        <!-- /BREADCRUMB -->

        <!-- section -->
        <%            String id = "";
            if (request.getAttribute("id") != null) {
                id = request.getAttribute("id").toString();
            }

            if (c.getCart().size() == 0 && c.getCart().isEmpty()) {
        %>
        <h2  style="color: red; font-size: 16px;padding-left: 6%; padding-top: 2%;">Giỏ hàng không có sản phẩm. Vui lòng thực hiện lại.</h2>
        <%
        } else {
        %>
        <h2  style="font-size: 24px;padding-left: 6%; padding-top: 2%;">GIỎ HÀNG (<%=c.getCart().size()%> sản phẩm)</h2>
        <%
            }
        %>

        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <!--  Product Details -->
                    <div class="product product-details clearfix" style="width: 100%;">
                        <div class="col-md-6"style="width: 100%;">
                            <div class="product-body" style="width: 100%;">
                                <table>
                                    <%
                                        ArrayList<Phone> listProduct = pdb.getProdust();

                                        for (Item i : c.getCart()) {
                                    %>
                                    <tr>
                                        <td style="padding:10px;" >
                                            <img style="height: 90px;" src="<%=i.getProduct().getImg()%>" alt="">
                                        </td>
                                        <td style="padding: 0px;">
                                            <p> Tên sản phẩm : <%=i.getProduct().getName()%></p>

                                            <%
                                                for (Phone p : listProduct) {
                                                    if (p.getID().equals(i.getProduct().getID())) {
                                            %>
                                            <p> Còn <%=p.getQuantity()%> sản phẩm</p>
                                            <p> Cung cấp bởi <%=p.getBrand()%></p>
                                            <%
                                                    }
                                                }
                                            %>
                                        </td>
                                        <td style="padding-left: 50%;">
                                            <p>Số lượng: <%=i.getQuantity()%></p>
                                        </td>
                                        <td style="padding-left: 60%;">
                                            <p><%=i.getProduct().getPrice()%>đ</p>
                                        </td>
                                        <td style="padding-left: 90%;">
                                            <p><%=i.getProduct().getPrice() * i.getQuantity()%>đ</p>
                                        </td>
                                    </tr>
                                    <%}%>
                                </table>
                                <%
                                    int tong = 0;
                                    for (Item i : c.getCart()) {
                                        tong += i.getProduct().getPrice() * i.getQuantity();
                                    }
                                %>
                                <div style="padding-top: 5%;">
                                    <h3>Tổng Tiền : <%=tong%> đ</h3>
                                </div>
                                <button class="primary-btn">Checkout <i class="fa fa-arrow-circle-right"></i></button>
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
                                <div class="product-btns">
                                </div>
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
        <%@include file="footer.jsp" %>

        <!-- FOOTER -->

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

