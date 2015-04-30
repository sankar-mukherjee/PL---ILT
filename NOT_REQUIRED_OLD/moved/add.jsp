<%@page import="java.util.ArrayList"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

            if (session.getAttribute("username") == null) {%>
<jsp:forward page="login.jsp"/>
<%                //response.sendRedirect("login.jsp"); // GO TO LOGIN PAGE
            }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="shortcut icon" type="image/x-icon" href="Images/favicon.ico"></link>
        <title>Add New Languages</title>
        <link rel="stylesheet" href="css/nivo-slider.css" type="text/css" media="screen" />
        <script type="text/javascript">
            function upper(ustr)
            {

                var str=ustr.value;
                ustr.value=str.toUpperCase();
            }
        </script>
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
                                                        <a style="color: white; font-size:200%">PLS DEVELOPMENT ENVIRONMENT</a><br>
                                                            <sub>Sponsored By Department of Electronics and Information Technology (DEITY),</sub><br>
                                                                <sub> Ministry of Communication & Information Technology (MC&IT), Govt. of India</sub>
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
                                                                            </td>
                                                                        </tr>
                                                                    </table>
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
                                                                        <table width="900" height="33" border="0" cellpadding="0" cellspacing="0">
                                                                            <tr align="center" valign="middle" class="style16">
                                                                                <td width="10%"><a href="about.jsp">ABOUT</a></td>
                                                                                <td width="10%"><a href="pls.jsp">PLS</a></td>
                                                                                <td width="10%"><a href="ipa.jsp">IPA</a></td>
                                                                                <td width="30%"><a href="IDEMAIN.jsp">IDE</a></td>
                                                                                <td width="10%"><a href="publish.jsp">PUBLISH</a></td>
                                                                                <td width="10%"><a href="help.jsp">HELP</a></td>
                                                                                <td width="10%"><a href="registration.jsp">Registration</a></td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                <tr><td height="300" align="center" valign="middle">
                                                                        <%
                                                                                    String lan = request.getParameter("lan");
                                                                                    String connectionURL = "jdbc:mysql://localhost:3306/ide?useUnicode=true&characterEncoding=UTF-8";
                                                                                    Connection connection = null;
                                                                                    PreparedStatement pstatement = null;
                                                                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                                                                    int updateQuery = 0;
                                                                                    if (lan != null) {
                                                                                        if (lan != " ") {
                                                                                            try {
                                                                                                connection = DriverManager.getConnection(connectionURL, "root", "root");
                                                                                                String queryString = "CREATE TABLE " + lan + "(ID INT UNSIGNED NOT NULL AUTO_INCREMENT," + "PRIMARY KEY(ID),ORTHOGRAPHY VARCHAR(50) NOT NULL,PRONUNCIATION VARCHAR(50),MEANING VARCHAR(50),POS VARCHAR(20),ATTRIBUTE VARCHAR(20))";
                                                                                                pstatement = connection.prepareStatement(queryString);
                                                                                                updateQuery = pstatement.executeUpdate();
                                                                                                String queryString1 = "ALTER TABLE " + lan + " ADD UNIQUE INDEX `Index_2`(`ORTHOGRAPHY`, `POS`)";
                                                                                                pstatement = connection.prepareStatement(queryString1);
                                                                                                updateQuery = pstatement.executeUpdate();
                                                                                                if (updateQuery != 0) {
                                                                                                    out.println(lan + "<a style='color: #0066FF; font-size: large'>Successfully Updated</a>");
                                                                                                }
                                                                                            } catch (Exception ex) {
                                                                                                out.println(lan + "<a style='color: #CC3300; font-size: large'> Already Exists</a>");
                                                                                            } finally {
                                                                                                // close all the connections.
                                                                                                pstatement.close();

                                                                                                connection.close();
                                                                                            }
                                                                                        }
                                                                                    }
                                                                        %>
                                                                        </br>
                                                                        <hr></hr>
                                                                        <a href="language.jsp" style="color: #0475FF">Go Back</a>
                                                                    </td></tr>
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