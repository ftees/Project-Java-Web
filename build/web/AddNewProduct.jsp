<%-- 
    Document   : AddNewProduct
    Created on : Oct 3, 2019, 4:25:40 PM
    Author     : Giang
--%>

<%@page import="entity.Phone"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <title>E-SHOP HTML Template</title>

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
                <ul class="breadcrumb">zz
                    <li><a href="home.jsp">Home</a></li>
                    <li><a href="admin.jsp">Admin</a></li>
                    <li class="active">Add</li>
                </ul>
            </div>
        </div>
        <div class="divAdd">
            <h1>Add new Phone</h1>
            <%
                SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd");
                if (request.getAttribute("error") != null) {
                    String re = request.getAttribute("error").toString();
            %>
            <h3 style="color: red"> <%=re%> </h3>
            <%
                }
            %>
            <form action="AddProduct" method="post">
                <table>
                    <td>
                        <p>ID</p>
                        <input type="text" name="id" placeholder="id">
                        <p>Name</p>
                        <input type="text" name="name" placeholder="name">
                        <p>Brand</p>
                        <input type="text" name="brand" placeholder="brand">
                        </br>
                        <p>Image</p>
                        <input name="image" type="file" accept="image/*" onchange="document.getElementById('output').src = window.URL.createObjectURL(this.files[0])">
                        <p>Price</p>
                        <input type="text" name="price" placeholder="price">
                    </td>
                    <td>
                        <p>Quantity</p>
                        <input type="text" name="quantity" placeholder="quantity">
                        <p>Status</p>
                        <input type="text" name="status" placeholder="status">
                        <p>AddDate</p>
                        <input type="text" name="adddate" readonly placeholder="adddate" value="<%=date.format(new java.util.Date())%>">
                        <p>Describe</p>
                        <input type="text" name="describe" placeholder="describe">
                        </br>
                        </br>
                        <input type="reset" name="clear" value="clear">
                        <input type="submit" name="submit" value="submit">
                    </td>
                    <td>
                        <img style="padding-left: 15%;" id="output" src="" width="500" height="400">
                    </td>
                </table>
            </form>
        </div>
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

