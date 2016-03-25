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
        String rePassword = "";
        User user;
                
        if(request.getParameter("btnRegister") !=null){ //check for register button click
            if(request.getParameter("txtEmail") != null){ //ensure users entered email
                email = request.getParameter("txtEmail");//get user text
            }
            if(request.getParameter("txtPassword") != null){ // make sure user entered password
                password = request.getParameter("txtPassword");// get user text
            } 
            if(request.getParameter("txtFirstName") != null){ // make sure user entered first name
                firstName = request.getParameter("txtFirstName");//get user text
            }
            if(request.getParameter("txtLastName") != null){//make sure user entered last name
                lastName = request.getParameter("txtLastName");//get user text
            }
            if(request.getParameter("txtRePassword") != null){//make sure user entered password a second time
                rePassword = request.getParameter("txtRePassword");// get re-password
            }
            if(!firstName.equals("") && !lastName.equals("") && !email.equals("") && !password.equals("") && !rePassword.equals("")){
                    user = new User(firstName, lastName,email, password);//create new user object to create new player profile
                    out.println("<script>alert ('registration successful') </script>");// inform the user that the registation was successful
                    response.sendRedirect("game.jsp");//open the game for the newly registered user
            }
            else{// inform the user that the registration failed
            out.println("<script>alert('registration failed')</script>");
            }   
        }
       
    %>
    <body>
        Please enter the relevant information to register for the Space Invaders game.
            <form id="frmRegister" action = "registration.jsp" method="post">
                <p> 
                    <label for="txtFirstName">First Name:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="txtFirstName" name="txtFirstName" value="">
                        <br />
                </p>

                <p>
                    <label for="txtLastName">Last Name:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="txtLastName" name="txtLastName" value="">
                        <br />
                </p>
                
                <p>
                    <label for="txtEmail">Email:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="email" id="txtEmail" name="txtEmail" value="">
                        <br />
                </p>
                
                <p>
                    <label for="txtPassword">Password:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="password" id="txtPassword" name="txtPassword" value="">
                        <br />
                </p>
               
                <p>
                    <label for="txtRePassword">Re-Password:</label>&nbsp; <input type="password" id="txtRePassword" name="txtRePassword" value="">
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
