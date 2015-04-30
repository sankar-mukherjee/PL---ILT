<%--
    Document   : newjsp
    Created on : 19 May, 2011, 2:15:10 PM
    Author     : Sankar
--%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="shortcut icon" type="image/x-icon" href="Images/favicon.ico"></link>
        <title>Registration Success</title>
        <link rel="stylesheet" href="css/nivo-slider.css" type="text/css" media="screen" />
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
                                                    <td><img src="assets/logo.png" width="80" height="80" /></td>
                                                    <td align="center">
                                                        <a style="color: white; font-size:200%">PLS&nbsp;&nbsp;&nbsp;DEVELOPMENT&nbsp;&nbsp;&nbsp;ENVIRONMENT</a><br>
                                                            <sub style="color:#cccccc ;font-size:100%">Sponsored By <br>
                                                                Department of Electronics and Information Technology (DEITY)<br>
                                                                    Ministry of Communication & Information Technology (MC&IT)<br>
                                                                        Govt. of India</sub>
                                                    </td>
                                                    <td><img src="assets/gov.jpg" width="80" height="80" /></td>
                                                </tr>
                                            </table>
                                                                </td>
                                                                <td width="150" align="right" valign="top"><br />
                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                        <tr>
                                                                            <td align="right" valign="top">
                                                                                <span class="style16"><a href="index.jsp">HOME</a>
                                                                                    <span class="style17">.</span> <a href="contact.jsp">CONTACT US</a></span>
                                                                                    <%if (session.getAttribute("username") != null && session.getAttribute("username") != "" && session.getAttribute("password") != "" && session.getAttribute("password") != null) {
                        String user = session.getAttribute("username").toString();
                        String pass = session.getAttribute("password").toString();
                                                        %>
                                                         Welcome &nbsp;
                                                            <a style="font-size: large"><%= user%></a>
                                                            &nbsp;&nbsp;<a href="logout.jsp">Logout</a>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                             <%}%>
                                                                </td>
                                                                </tr>
                                                                </table>
                                                                </td>
                                                                </tr>
                                                                </table>
                                                                </td>
                                                                </tr>
                                                                <tr>
                                                                    <td height="39" align="center" valign="middle">
                                                                        <table width="900" height="37" border="0" cellpadding="0" cellspacing="0">
                                                                            <tr>
                <td height="39" align="center" valign="middle">
                    <table width="80%" height="37" border="0" cellpadding="0" cellspacing="0">
                        <tr align="center" valign="middle" class="style20">
                            <td width="10%" align="center" class="tab"><a href="files/PLS.pdf"><span>PLS Document</span></a></t</td>
                            <td width="20%" align="center" class="tab"><a href="ipa.jsp">Indian Languages IPA Symbols</a></td>
                            <td width="20%" align="center" class="pls_tab"><a href="IDEMAIN.jsp">PLS Development Environment</a></td>
                            <td width="10%" align="center" class="tab"><a href="publish.jsp">PLS Database</a></td>
                            <td width="5%" align="center" class="tab"><a href="help.jsp">HELP</a></td>
                            <td width="15%" align="center" class="selected"><a href="registration.jsp">Register</a></td>
                        </tr>
                    </table>
                </td>
            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <%
                                                                                String username = request.getParameter("username");
                                                                                String password = request.getParameter("passid");
                                                                                String email = request.getParameter("email");
                                                                                String ans = request.getParameter("ans");
                                                                                String roles = request.getParameter("roles");
                                                                                roles = roles.substring(1);

                                                                                String connectionURL = "jdbc:mysql://localhost:3306/ide?useUnicode=true&characterEncoding=UTF-8";
                                                                                Connection connection = null;
                                                                                PreparedStatement pstatement = null;
                                                                                ResultSet rs = null;
                                                                                ResultSet rs2 = null;
                                                                                Statement statement = null;
                                                                                Class.forName("com.mysql.jdbc.Driver").newInstance();
                                                                                int updateQuery = 0;
                                                                                try {
                                                                                    connection = DriverManager.getConnection(connectionURL, "root", "root");
                                                                                    String resultString = "SELECT * FROM userregister WHERE email = '" + email+"'";
                                                                                    statement = connection.createStatement();
                                                                                    rs = statement.executeQuery(resultString);
                                                                                    String resultString2 = "SELECT * FROM temp_register WHERE email = '" + email+"'";
                                                                                    statement = connection.createStatement();
                                                                                    rs2 = statement.executeQuery(resultString2);
                                                                                    String queryString = "INSERT INTO temp_register (name, password, email, additional, roles) VALUES(?,?,?,?,?)";
                                                                                    pstatement = connection.prepareStatement(queryString);
                                                                                    pstatement.setString(1, username);
                                                                                    pstatement.setString(2, password);
                                                                                    pstatement.setString(3, email);
                                                                                    pstatement.setString(4, ans);
                                                                                    pstatement.setString(5, roles);

                                                                                    if (!rs.next() && !rs2.next()) {
                                                                                        updateQuery = pstatement.executeUpdate();%>
                                                                    <td width="50%" align="center">
                                                                        <br><br><br><br><br><br>
                                                                                                <a style="font-size: large; color: dodgerblue">Successfully Registered</a>
                                                                                                <br><br><br><br><br><br>
                                                                                                                        <a style="font-size: large; color: #000">Your account will be confirmed shortly.<br>
                                                                                                                                Once it is confirmed a confirmation email will be sent your email address.</a><br><br><br><br><br><br>
                                                                                                                                                </td>
                                                                                                                                                <%} else {
                                                                                                                                                String error = email + " already exists";%>
                                                                                                                                                <jsp:forward page="registration.jsp">
                                                                                                                                                <jsp:param name="erro" value="<%=error%>"/>
                                                                                                                                                </jsp:forward>
                                                                                                                                                <%}%>
                                                                                                                                                <%} catch (Exception ex) {
                                                                                                                                                                out.println("Unable to connect to Database." + ex.getMessage());

                                                                                                                                                            } finally {
                                                                                                                                                                rs.close();
                                                                                                                                                                statement.close();
                                                                                                                                                                pstatement.close();
                                                                                                                                                                connection.close();
                                                                                                                                                            }



                                                                                                                                                %>

                                                                                                                                                </tr>
                                                                                                                                                <tr>
                                                                                                                                                    <td height="184" align="center" valign="top" background="Images/bckbottom.png">
                                                                                                                                                        <table width="900" height="28" border="0" cellpadding="0" cellspacing="0">
                                                                                                                                                            <tr>
                                                                                                                                                                <td>&nbsp;</td>
                                                                                                                                                            </tr>
                                                                                                                                                        </table>
                                                                                                                                                        <table width="900" height="84" border="0" cellpadding="0" cellspacing="0">
                                                                                                                                                            <tr align="left" valign="top">
                                                                                                                                                                <td width="300" height="27" class="style22"><br />
                                                                                                                                                                    <img src="assets/bel2.png" width="200" height="100" />
                                                                                                                                                                </td>
                                                                                                                                                                <td width="200" class="style22">
                                                                                                                                                                    <p class="style1">ABOUT IDE</p>
                                                                                                                                                                    <p class="style16">
                                                                                                                                                                        <a href="about.jsp#switchText4">Some useful definition</a><br />
                                                                                                                                                                        <a href="pls.jsp#switchText4">An Example of Bangla PL</a>
                                                                                                                                                                    </p>
                                                                                                                                                                </td>
                                                                                                                                                                <td width="200" class="style22">
                                                                                                                                                                    <p class="style1">IPA</p>
                                                                                                                                                                    <p><span class="style16">
                                                                                                                                                                            <a href="xml.jsp">Show Last Added word in PLS</a><br />
                                                                                                                                                                            <a href="newipamain.jsp">Add New IPA Symbol</a>
                                                                                                                                                                        </span><br />
                                                                                                                                                                    </p>
                                                                                                                                                                </td>
                                                                                                                                                                <td width="100" class="style22">
                                                                                                                                                                    <p class="style1">HELP</p>
                                                                                                                                                                    <p class="style16">
                                                                                                                                                                        <a href="help.jsp">Abbreviation</a><br />
                                                                                                                                                                    </p>
                                                                                                                                                                </td>
                                                                                                                                                                <td width="100" align="left" class="style22">
                                                                                                                                                                    <p class="style1">CONTACTS</p>
                                                                                                                                                                    <p class="style16">
                                                                                                                                                                        <a href="contact.jsp">Contact Us</a>
                                                                                                                                                                    </p>
                                                                                                                                                                </td>
                                                                                                                                                            </tr>
                                                                                                                                                        </table>
                                                                                                                                                        <br />
                                                                                                                                                        <table width="900" height="26" border="0" cellpadding="0" cellspacing="0">
                                                                                                                                                            <tr>
                                                                                                                                                                <td align="center" valign="bottom">
                                                                                                                                                                    <span class="style24">© 2012 All Rights Reserved. | <a href="http://www.iitkgp.ac.in/cet/index.html">CET-IITKGP</a>
                                                                                                                                                                    </span>
                                                                                                                                                                </td>
                                                                                                                                                            </tr>
                                                                                                                                                        </table>
                                                                                                                                                    </td>
                                                                                                                                                </tr>
                                                                                                                                                </table>
                                                                                                                                                </body>
                                                                                                                                                </html>
