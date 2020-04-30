<!DOCTYPE html>
<html lang="en">

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
                            <li><a href="#">About us</a></li>
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
                    <li><a href="home.jso">Home</a></li>
                    <li class="active">About us</li>
                </ul>
            </div>
        </div>
        <div style="width: 100%;">
            <div style="width: 40%; float: left; padding-left: 10%; padding-top: 7%;"><img src="img/manager.png" ></div>
            <div style="width: 50%; float: left;padding-top: 7%; ">
                <h2 style="color: #F8694A">Giang Hoang</h2> 
                <p>Work at: FPT University</p>
                <p>Age: 20</p>
                <p>Major: Software Engineering</p>
                <h2 style="color: #F8694A">Pham Tien</h2>
                <p>Work at: FPT University</p>
                <p>Age: 20</p>
                <p>Major: Software Engineering</p>
            </div>
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

    </body>

</html>
