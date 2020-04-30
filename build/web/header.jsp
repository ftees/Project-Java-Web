<%@page import="modal.productDB"%>
<%@page import="entity.Phone"%>
<%@page import="entity.Item"%>
<%@page import="modal.Cart"%>
<%@page import="entity.Customer"%>
<%@page import="entity.Admin"%>
<header>
    <!-- top Header -->


    <!-- header -->
    <div id="header">
        <div class="container">
            <div class="pull-left">
                <!-- Logo -->
                <div class="header-logo">
                    <a class="logo" href="home.jsp">
                        <img src="./img/Logo1.png" alt="">
                    </a>
                </div>
                <!-- /Logo -->

                <!-- Search -->
                <div class="header-search">
                    <form action="SearchProducts?page=products" method="post">
                        <input class="input search-input" type="text" placeholder="Enter your keyword" name="search">

                        <button type="submit" class="search-btn"><i class="fa fa-search"></i></button>
                    </form>
                </div>
                <!-- /Search -->
            </div>
            <div class="pull-right">
                <ul class="header-btns">
                    <!-- Account -->
                    <li class="header-account dropdown default-dropdown">
                        <div class="dropdown-toggle" role="button" data-toggle="dropdown" aria-expanded="true">
                            <div class="header-btns-icon">
                                <i class="fa fa-user-o"></i>
                            </div>
                            <%
                                productDB pdb = new productDB();
                                String st = "";
                                Customer s = null;
                                Admin a = null;

                                Cart c = (Cart) session.getAttribute("cart");
                                if (session.getAttribute("admin") != null) {
                                    a = (Admin) session.getAttribute("admin");
                                    st = a.getUsername();
                                } else if (session.getAttribute("customer") != null) {
                                    s = (Customer) session.getAttribute("customer");
                                    st = s.getUsername();
                                    if ((request.getAttribute("idbuy") != null) && (request.getAttribute("quan") != null) && (s != null)) {
                                        c = (Cart) session.getAttribute("cart");
                                        String aa = (String) request.getAttribute("quan");
                                        int quantity = Integer.parseInt(aa);
                                        String idbuy = (String) request.getAttribute("idbuy");

                                        Phone product = pdb.getProductById(idbuy);

                                        Item t = new Item(product, quantity);

                                        c.addItem(t);

                                        System.out.println("size:" + c.getCart().size());

                                    }
                                }

                            %>




                        </div>
                        <%if (s != null || a != null) {%>
                        <strong class="text-uppercase"><%=st%> <i class="fa fa-caret-down"></i></strong>
                        <a href="logout" >Logout</a>  
                        <%} else if (s == null || a == null) {%>
                        <a href="login.jsp" >Login</a> <%}%>


                    </li>
                    <!-- /Account -->
                    <%
                        if (session.getAttribute("customer") != null) {
                    %>
                    <!-- Cart -->
                    <li class="header-cart dropdown default-dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                            <div class="header-btns-icon">
                                <i class="fa fa-shopping-cart"></i>
                                <span class="qty"><%if (c != null) {%><%=c.getCart().size()%><%}%></span>
                            </div>
                            <strong class="text-uppercase">My Cart:</strong>
                            <br>
                            <span><%if (c != null) {%><%=c.totalMoney()%><%}%></span>
                        </a>
                        <div class="custom-menu">
                            <div id="shopping-cart">
                                <div class="shopping-cart-list">

                                    <%
                                        if (c != null) {
                                            for (int i = 0; i < c.getCart().size(); i++) {
                                    %>


                                    <div class="product product-widget">
                                        <div class="product-thumb">
                                            <img src="<%=c.getCart().get(i).getProduct().getImg()%>" alt="">
                                        </div>
                                        <div class="product-body">
                                            <h3 class="product-price"><%=c.getCart().get(i).getProduct().getPrice()%> dong<span class="qty">x<%=c.getCart().get(i).getQuantity()%></span></h3>
                                            <h2 class="product-name"><a href="#"><%=c.getCart().get(i).getProduct().getName()%></a></h2>
                                        </div>
                                        <a href="deleteProductToOrder?id=<%=c.getCart().get(i).getProduct().getID()%>"><button class="cancel-btn"><i class="fa fa-trash"></i></button></a>
                                    </div>
                                    <%}
                                        }%>

                                </div>
                                <div class="shopping-cart-btns">
                                    <a href="viewCart.jsp"><button class="main-btn">View Cart</button></a>
                                    <button class="primary-btn">Checkout <i class="fa fa-arrow-circle-right"></i></button>
                                </div>
                            </div>
                        </div>
                    </li>
                    <%}%>
                    <!-- /Cart -->

                    <!-- Mobile nav toggle-->
                    <li class="nav-toggle">
                        <button class="nav-toggle-btn main-btn icon-btn"><i class="fa fa-bars"></i></button>
                    </li>
                    <!-- / Mobile nav toggle -->
                </ul>
            </div>
        </div>
        <!-- header -->
    </div>
    <!-- container -->
</header>