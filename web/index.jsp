<%-- 
    Document   : index
    Created on : Mar 14, 2016, 3:50:55 PM
    Author     : gew24
--%>

<%@page import="edu.pitt.is1017.spaceinvaders.ScoreTracker"%>
<%@page import="edu.pitt.is1017.spaceinvaders.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Space Invaders - Login</title>
    </head>
    <%
        String txtEmail = "";
        String txtPassword = "";
        User user;
        if(request.getParameter("btnSubmit") !=null){
            if(request.getParameter("txtEmail") != ""){
                txtEmail = request.getParameter("txtEmail");
            }
            if(request.getParameter("txtPassword") != null){
                txtPassword = request.getParameter("txtPassword");
            } 
            if(!txtEmail.equals("") && !txtPassword.equals("")){   
                user = new User(txtEmail, txtPassword);
                
                if(user.isLoggedIn()){
                //out.println("email = " + txtEmail + " password  = " + txtPassword);
                    //out.println("<script>alert('login successful')</script>");
                    response.sendRedirect("game.jsp");
                }
                else{ 
                    out.println("<script>alert('wrong email or password')</script>");
                }
            }
            else{
                out.println("<script>alert('you must enter username and password')</script>");
            }
        }
     
    %>     
    <body>
        <div>
            <form id="frmLogin" action = "index.jsp" method="post">
                <p>
                    <label for="txtEmail">Email:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="email" id="txtEmail" name="txtEmail" value="">
                        <br />
                </p>
                
                <p>
                    <label for="txtPassword">Password:</label>&nbsp; <input type="password" id="txtPassword" name="txtPassword" value="">
                        <br />
                </p>
                
                <p> 
                    <input type="submit" id="btnSubmit" name="btnSubmit" value="Submit">&nbsp;&nbsp;&nbsp;
                    <a href="registration.jsp">Registration</a>
                </p>
            </form>
        </div>
        
    </body>
</html>
