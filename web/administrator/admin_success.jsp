<%--
    Document   : newjsp
    Created on : 19 May, 2011, 2:15:10 PM
    Author     : Sankar
--%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="write.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="email123" class="email123.EmailUtility" scope="session"/>
<jsp:setProperty name="email123" property="*"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="shortcut icon" type="image/x-icon" href="../Images/favicon.ico"></link>
        <title>Success</title>
        <link rel="stylesheet" href="../css/nivo-slider.css" type="text/css" media="screen" />
    </head>
    <body>
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td width="100%" height="145" align="center" valign="bottom">
                    <table width="900" height="145" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="left" valign="top">
                                <table width="900" height="144" border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="750" align="left" valign="middle">
                                            <table width="100%" height="63" border="0" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td><img src="../assets/logo.png" width="80" height="80" /></td>
                                                    <td align="center">
                                                        <a style="color: white; font-size:200%">PLS DEVELOPMENT ENVIRONMENT</a><br>
                                                            <sub>Sponsored By Department of Electronics and Information Technology (DEITY),</sub><br>
                                                                <sub> Ministry of Communication & Information Technology (MC&IT), Govt. of India</sub>
                                                                </td>
                                                                <td><img src="../assets/gov.jpg" width="80" height="80" /></td>
                                                                </tr>
                                                                </table>
                                                                </td>

                                                                </tr>
                                                                </table>
                                                                </td>
                                                                </tr>

                                                                <tr>
                                                                    <td height="251" align="center" valign="top"><br/>
                                                                        <h3>Pending User Registration Update</h3>
                                                                        <form name="register" action="administrator.jsp" method="get">
                                                                            <%
                                                                                request.setCharacterEncoding("UTF-8");
                                                                                String connectionURL = "jdbc:mysql://localhost:3306/ide?useUnicode=true&characterEncoding=UTF-8";
                                                                                Connection connection = null;
                                                                                PreparedStatement pstatement = null;
                                                                                PreparedStatement pstatement1 = null;
                                                                                Statement statement = null;
                                                                                Class.forName("com.mysql.jdbc.Driver").newInstance();
                                                                                int updateQuery = 0;

                                                                                int regis = ((Integer) session.getAttribute("regis")).intValue();
                                                                                for (int i = 0; i < regis; i++) {
                                                                                    String username = request.getParameter("name" + i);
                                                                                    String password = request.getParameter("pass" + i);
                                                                                    String email = request.getParameter("email" + i);
                                                                                    String additional = request.getParameter("additional" + i);
                                                                                    String roles = request.getParameter("roles" + i);                                                                                    
                                                                                    String confirm = request.getParameter("confirm" + i);

                                                                                    if (confirm != null && confirm.equals("on")) {
                                                                                        roles = roles.substring(1);
                                                                                        try {
                                                                                            connection = DriverManager.getConnection(connectionURL, "root", "root");
                                                                                            String queryString = "INSERT INTO userregister (username, password, email, institute, roles) VALUES(?,?,?,?,?)";
                                                                                            pstatement = connection.prepareStatement(queryString);

                                                                                            pstatement.setString(1, username);
                                                                                            pstatement.setString(2, password);
                                                                                            pstatement.setString(3, email);
                                                                                            pstatement.setString(4, additional);
                                                                                            pstatement.setString(5, roles);
                                                                                            updateQuery = pstatement.executeUpdate();

                                                                                            if (updateQuery != 0) {
                                                                                                String queryString1 = "DELETE FROM temp_register WHERE email='" + email + "'";
                                                                                                pstatement1 = connection.prepareStatement(queryString1);
                                                                                                pstatement1.executeUpdate(queryString1);
                                                                                                email123.sendEmail(email, "PLS Confiramtion Mail ", " Dear " + username + ",\n\nThank you for registering for: Pronunciation Lexicon Development\n"
                                                                                                        + "\nYou can add"+roles+" Languages"
                                                                                                        + "\nPlease login with email = " + email + " and Password = " + password + "\n\n\nThis is a system generated mail. Please do not reply to this mail.");
                                                                            %>
                                                                            <a style="font-size: large; color: #000"><%=email%></a><a style="font-size: large; color: dodgerblue"> ---- Successfully Updated</a><br/>
                                                                            <%}

                                                                                        } catch (Exception ex) {
                                                                                            //out.println(ex.getMessage());
                                                                                            out.println(email + "<a style='font-size: large; color: #CC3300'> ----- Email Already Exists</a><br/>");
                                                                                        } finally {
                                                                                            pstatement.close();
                                                                                            connection.close();
                                                                                        }
                                                                                    }
                                                                                }
                                                                            %>
                                                                        </form>
                                                                        <hr></hr>
                                                                        <p>&nbsp;</p>
                                                                        <a class="link2" href="administrator.jsp" >Back to ADMIN page</a>
                                                                    </td>
                                                                </tr>


                                                                </table>
                                                                </body>
                                                                </html>
