<%-- 
    Document   : admin
    Created on : Oct 18, 2019, 8:19:12 PM
    Author     : TienNp
--%>

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

        <title>Admin</title>

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
    <style>
        button{
            background-color: #e8e8e3;

        }
    </style>
    <body>
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
                            <li><a href="#">Sales</a></li>
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
                    <li class="active">Admin</li>
                </ul>
            </div>
        </div>
        <!-- /Viết vào đây nhé -->
        <div id="f1">
            <button style="margin-bottom: 2%;" class="btnAdmin"  type="submit" name="add" value="add"> <a href="AddNewProduct.jsp">Add Products</a> </button>
            <form>
                <table class="list">
                    <tr>
                        <td>ID</td>
                        <td>Name</td>
                        <td>Brand</td>
                        <td>Image</td>
                        <td>Price</td>
                        <td>Quantity</td>
                        <td>Status</td>
                        <td>Describe</td>
                        <td>Add Date</td>
                        <td>Edit</td>
                        <td>Delete</td>
                    </tr>
                    <%
                        ArrayList<Phone> list = pdb.getProdust();
                        if (request.getAttribute("listSearch") != null) {
                            list = (ArrayList<Phone>) request.getAttribute("listSearch");
                        } else {
                            list = pdb.getProdust();
                        }
                        int index = 0;
                        int size = list.size(); // so phan tu trong bang 
                        int curPage = 0;  // dang o trang nao
                        int pPerPage = 4; // so san phan tren 1 trang
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
                    <tr style="margin-top: 5%;">
                        <td><%=list.get(index).getID()%></td>
                        <td><%=list.get(index).getName()%></td>
                        <td><%=list.get(index).getBrand()%></td>
                        <td><img src="<%=list.get(index).getImg()%>" style="width: 100px;height: 100px;margin-top: 5%;margin-bottom: 5%;"></td>
                        <td><%=list.get(index).getPrice()%></td>
                        <td><%=list.get(index).getQuantity()%></td>
                        <td><%=list.get(index).getStatus()%></td>
                        <td><%=list.get(index).getDescribe()%></td>
                        <td><%=list.get(index).getAddDate()%></td>

                        <td><button class="btnAdmin" type="submit" name="update" value="update"> <a href="UpdateProduct.jsp?id=<%=list.get(index).getID()%>">Update Products</a> </button></td>
                        <td style="padding-left: 3px;"><button class="btnAdmin" type="submit" name="delete" value="delete"><a href="DeleteProdudcts?id=<%=list.get(index).getID()%>&page=<%=curPage%>"> Delete Products </a> </button></td>

                    </tr>
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
                </table>
                <p></p>
                <%
                    String afileName = "admin.jsp";
                    if (index == 0) {
                        out.print("No Product");
                    } else {
                        if (curPage == 1) {
                            out.print("<button><a href=#> Previous </a></button>");
                        } else {
                            out.print("<button><a href=" + afileName + "?page=" + (curPage - 1) + " onclick='doColor(this)' onblur='removeColor(this)'>Previous</a></button>");
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
                        out.print("<button style=" + "min-width:30px;" + "><a href=" + afileName + "?page=" + indexpage + ">" + indexpage + "</a></button>");
                        indexpage++;
                    }
                    if (curPage == numpage) {
                        out.print("<button><a href=#> Next </a></button> ");
                    } else {
                        out.print("<button><a href=" + afileName + "?page=" + (curPage + 1) + "> Next </a></button>");
                    }
                %>
            </form>
        </div>
        <!-- section -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
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
            function doColor(var i) {
                document.getElementById()
            }
        </script>
    </body>

</html>

