<%-- 
    Document   : login
    Created on : Oct 14, 2019, 7:16:11 PM
    Author     : TienNp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
         <link type="text/css" rel="stylesheet" href="css/login.css">
    </head>
    
    <script type="text/javascript">

</script>
<body background="img/bg3.png">
       
	 <%
            Cookie[] listCookies = request.getCookies();
            String user = "";
            String pass = "";
            String rem = "";
            if (listCookies != null) {
                for (int i = 0; i < listCookies.length; i++) {
                    if (listCookies[i].getName().equals("username")) {
                        user = listCookies[i].getValue();
                    }
                    if (listCookies[i].getName().equals("pass")) {
                        pass = listCookies[i].getValue();
                    }
                    if (listCookies[i].getName().equals("remember")) {
                        rem = listCookies[i].getValue();
                    }
                }
            }
        %>
     <%
            String s;
            if (request.getAttribute("error") != null) {
                s = (String) request.getAttribute("error");
           

        %> 
         
        <div class="box" style="top:82%; left: 21%;"> <h3 style="color: red"><%=s%></h3>
               <% } %></div>
               <%
            String e;
            if (request.getAttribute("er") != null) {
                e = (String) request.getAttribute("er");
        %> 
        <div class="box" style="top:82%; left: 21%;"> <h3 style="color: red"><%=e%></h3>
               <% } %></div>
    <div class="box" style="top:40%; left: 21%;">
		<h2>Login</h2>
               
                <form action="" method="post">
                <div class="inputbox">	
                    <input type="text" name="username" value="<%=user %>" required="">
				<label>ID</label>
			</div>
			<div class="inputbox">
				<input type="Password" name="password" value="<%=pass %>" required="">
				<label>Password</label>
			</div>
                    <%if (rem.equals("ON")) {
                     %>
                     <input type="checkbox" name="remember" value="ON"/><label style="color: #fff;">Remember me</label>
                    <br><br>
                    <%} else {
                     %>
                      <input type="checkbox" name="remember" value="ON"/><label style="color: #fff;">Remember me</label>
                    <br><br>
                     <% }%>
                    <input type="submit" name="" formaction="LoginCustomer" value="Customer" >
                    <input type="submit" name="" formaction="LoginAdmin"  value="Admin" >
                      
                    </form>
                  
	</div>
          
	<div class="box" style="left: 55%;top: 48%;">
		<h2>Create a new account</h2>
                <form action="AddCustomer" method="post">
                      <div class="inputbox">	
				<input type="text" name="id" required="">
				<label>ID</label>
			</div>
			<div class="inputbox">	
				<input type="text" name="username" required="">
				<label>Username</label>
			</div>
			<div class="inputbox">
				<input type="Password" name="pass" required="">
				<label>Password</label>
			</div>
			
			<div class="inputbox">	
				<input type="text" name="email" required="">
				<label>Email</label>
			</div>
			<div class="inputbox">	
				<input type="text" name="phone" required="">
				<label>Phone Number</label>
			</div>
			<input type="submit" name="" value="Create" onclick="f1()">
		</form>
	</div>
</body>
</html>
