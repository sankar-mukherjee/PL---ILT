<%-- 
    Document   : publish1
    Created on : May 8, 2013, 11:40:50 AM
    Author     : Prasanta
--%>

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="shortcut icon" type="image/x-icon" href="Images/favicon.ico"></link>
        <title>Publish</title>
        <script type="text/javascript" src="JavaScript/keyboard.js" charset="UTF-8"></script>
        <link rel="stylesheet" type="text/css" href="css/keyboard.css" />
        <link rel="stylesheet" href="css/nivo-slider.css" type="text/css" media="screen" />
    </head>
    <body>
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td width="100%" height="145" align="center" valign="bottom">
                    <table width="100%" height="145" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="center" valign="top">
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
                                                                            <tr align="center" valign="middle" class="style20">
                                                                                <td width="10%" align="center" class="tab"><a href="about.jsp"><span>ABOUT</span></a></t</td>
                                                                                <td width="10%" align="center" class="tab"><a href="pls.jsp">PLS</a></td>
                                                                                <td width="10%" align="center" class="tab"><a href="ipa.jsp">IPA</a></td>
                                                                                <td width="30%" align="center" class="tab"><a href="IDEMAIN.jsp">IDE</a></td>
                                                                                <td width="10%" align="center" class="selected"><a href="publish.jsp">PUBLISH</a></td>
                                                                                <td width="10%" align="center" class="tab"><a href="help.jsp">HELP</a></td>
                                                                                <td width="10%" align="center" class="tab"><a href="registration.jsp">REGISTRATION</a></td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td height="251" valign="top">
                                                                        <table width="900" height="366" border="0" cellpadding="0" cellspacing="0" align="center">
                                                                            <tr>
                                                                                <td valign="top" align="center"><p>&nbsp;</p>
                                                                                    <table width="900" border="0" cellspacing="0" cellpadding="0" align="center">
                                                                                        <tr>
                                                                                            <td valign="top" align="center"class="style18">Look for a Word<br /></td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td valign="top" class="style19" align="center">
                                                                                                <p><form action="result.jsp" method="get" >
                                                                                                        <table border="1" >
                                                                                                            <tbody>
                                                                                                                <tr>
                                                                                                                    <td style="background-color: #2F89DF">
                                                                                                                        <table border="0" cellspacing="5" cellpadding="5" >
                                                                                                                            <tbody>
                                                                                                                                <tr>
                                                                                                                                    <td colspan="2"><input type="text" name="ser" value="" style="font-size: xx-large" class="keyboardInput"/></td>
                                                                                                                                </tr>
                                                                                                                                <tr><td>
                                                                                                                                        <a style="color: #000">Select Language</a>
                                                                                                                                        <select name="language">
                                                                                                                                            <%
                                                                                                                                                        request.setCharacterEncoding("UTF-8");
                                                                                                                                                        String connectionURL = "jdbc:mysql://localhost:3306/ide?useUnicode=true&characterEncoding=UTF-8";
                                                                                                                                                        Connection connection = null;
                                                                                                                                                        PreparedStatement pstatement = null;
                                                                                                                                                        ResultSet rs = null;
                                                                                                                                                        Statement statement = null;
                                                                                                                                                        int updateQuery = 0;
                                                                                                                                                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                                                                                                                                                        connection = DriverManager.getConnection(connectionURL, "root", "root");
                                                                                                                                                        try {
                                                                                                                                                            String resultString = "SELECT * FROM language_list";
                                                                                                                                                            statement = connection.createStatement();
                                                                                                                                                            rs = statement.executeQuery(resultString);

                                                                                                                                                            while (rs.next()) {
                                                                                                                                                                out.println("<option>" + rs.getString(2) + "</option>");
                                                                                                                                                            }

                                                                                                                                                        } catch (Exception ex) {
                                                                                                                                                            out.println("Unable to connect to Database." + ex.getMessage());
                                                                                                                                                        } finally {
                                                                                                                                                            rs.close();
                                                                                                                                                            statement.close();
                                                                                                                                                            connection.close();
                                                                                                                                                        }
                                                                                                                                            %>
                                                                                                                                        </select>
                                                                                                                                    </td>
                                                                                                                                    <td><input type="submit" value="Search" name="Search" style="height: 50px;"/></td>
                                                                                                                                </tr>
                                                                                                                            </tbody>
                                                                                                                        </table>
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                            </tbody>
                                                                                                        </table>
                                                                                                    </form></p>
                                                                                                <p>&nbsp;</p>
                                                                                                <p>&nbsp;</p>
                                                                                            
                                                                                                            
                                                                                                <p class="style18">Publish Full Pronunciation Lexicon Dictionary<br /></p>
                                                                                                <form action="Servlet/DownloadFile4" method="get">
                                                                                                    <p class="style18">Enter Range of Download data<input align="middle" name="start" type="text" value="" style="font-size:xx-small"/> To <input type="text" name="end" value="" style="font-size: xx-small"/><a href="Servlet/DownloadFile4"><input type="submit" value="Submit" name="Search" style="height: 30px;"/></a> </p>
                                                                                                </form>
                                                                                                <p class="style18">Download Pronunciation Lexicon Dictionary 1-50000<br /></p>
                                                                                                <p class="style18"><a href="DownloadServlet.do"><img alt="" height="40" width="40" src="Images/download.png"/></a></p>
                                                                                                <p class="style18">Download Pronunciation Lexicon Dictionary 50001-100000<br /></p>
                                                                                                <p class="style18"><a href="DownloadServlet1.do"><img alt="" height="40" width="40" src="Images/download.png"/></a></p>
                                                                                                <p class="style18">Download Pronunciation Lexicon Dictionary 100001-150000<br /></p>
                                                                                                <p class="style18"><a href="DownloadServlet2.do"><img alt="" height="40" width="40" src="Images/download.png"/></a></p>
                                                                                                <p class="style18">Download Pronunciation Lexicon Dictionary 150001-200000<br /></p>
                                                                                                <p class="style18"><a href="DownloadServlet3.do"><img alt="" height="40" width="40" src="Images/download.png"/></a></p>
                                                                                               
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
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

