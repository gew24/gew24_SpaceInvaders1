<%-- 
    Document   : registration
    Created on : Mar 16, 2016, 3:36:03 PM
    Author     : anger_000
--%>

<%@page import="edu.pitt.is1017.spaceinvaders.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Space Invaders Registration</title>
    </head>
    <%
        String lastName = "";
        String firstName = "";
        String email = "";
        String password = "";
        
        User user;
                
        if(request.getParameter("btnRegister") !=null){
            if(request.getParameter("txtEmail") != null){
                email = request.getParameter("txtEmail");
            }
            if(request.getParameter("txtPassword") != null){
                password = request.getParameter("txtPassword");
            } 
            if(request.getParameter("txtFirstName") != null){
                firstName = request.getParameter("txtFirstName");
            }
            if(request.getParameter("txtLastName") != null){
                lastName = request.getParameter("txtLastName");
            }
            if(!firstName.equals("") && !lastName.equals("") && !email.equals("") && !password.equals("")){   
                user = new User(firstName, lastName,email, password);
                out.println("<script>alert ('registration successful') </script>");
                response.sendRedirect("game.jsp");
            }
            else{
            out.println("<script>alert('registration failed')</script>");
            }   
        }
       
    %>
    <body>
        Please enter the relevant information to register for the Space Invaders game.
            <form id="frmRegister" action = "registration.jsp" method="post">
                <p> 
                    <label for="txtFirstName">First Name:</label>&nbsp;<input type="text" id="txtFirstName" name="txtFirstName" value="">
                        <br />
                </p>

                <p>
                    <label for="txtLastName">Last Name:</label>&nbsp;<input type="text" id="txtLastName" name="txtLastName" value="">
                        <br />
                </p>
                
                <p>
                    <label for="txtEmail">Email:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="email" id="txtEmail" name="txtEmail" value="">
                        <br />
                </p>
                
                <p>
                    <label for="txtPassword">Password:</label>&nbsp;&nbsp;&nbsp; <input type="password" id="txtPassword" name="txtPassword" value="">
                        <br />
                </p>
               
                <p> 
                    <input type="submit" id="btnRegister" name="btnRegister" value="Register">
                </p>
                <p>
                    <a href="index.jsp">Return to Login</a>
                </p>
            </form>
    </body>
</html>
