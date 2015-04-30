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
        <title>Comments</title>
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
                                                    <td><img src="assets/logo.png" width="50" height="50" /></td>
                                                    <td align="center">
                                                        <a style="color: white; font-size:200%">PLS DEVELOPMENT ENVIRONMENT</a><br>
                                                            <sub>Sponsored By Department of Information Technology (DIT),</sub><br>
                                                           <sub> Ministry of Communication & Information Technology (MC&IT), Govt. of India</sub>
                                                    </td>
                                                    <td><img src="assets/gov.jpg" width="50" height="50" /></td>
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
                                            <%
                    if (session.getAttribute("username") != null && session.getAttribute("username") != "" && session.getAttribute("password") != "" && session.getAttribute("password") != null) {
                        String user = session.getAttribute("username").toString();
                        String pass = session.getAttribute("password").toString();}
        %>
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
                            <td width="10%"><a href="comments.jsp">COMMENTS</a></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <%
                        String connectionURL = "jdbc:mysql://localhost:3306/ide?useUnicode=true&characterEncoding=UTF-8";
                        ResultSet rs = null;
                        Statement statement = null;
                        Connection connection = null;
                        Class.forName("com.mysql.jdbc.Driver").newInstance();

                        connection = DriverManager.getConnection(connectionURL, "root", "root");
                        String resultString = "SELECT * from comments ORDER BY ID DESC";
                        statement = connection.createStatement();
                        rs = statement.executeQuery(resultString);
            %>
            <tr>
                <td height="251" align="center" valign="top">
                    <table width="900" height="366" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="center" valign="top"><p>&nbsp;</p>
                                <table width="900" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td align="left" valign="top" class="style18">Leave a Comment<br /><br /></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <form action="comments.jsp" method="get">
                                                <table border="0" style="background-color: #2F89DF; border-style: solid; border-color: #0169B6" id="commbox">
                                                    <tbody>
                                                        <tr>
                                                            <td align="left"><input type="text" name="nm" value="" size="30" style="margin: 1em"/>Name(Required)</td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left"><input type="text" name="mail" value="" size="30" style="margin: 1em"/><img src="Images/ico-email.png"/> Mail(Will not be published)(required)</td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left"><input type="text" name="web" value="" size="30" style="margin: 1em"/><img src="Images/ico-website.png"/>Web-Site (if any)</td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left"><textarea name="commen" rows="5" cols="50" style="border: #061C37;border-style: groove; margin: 1em"></textarea></td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left"><input type="submit" value="submit" name="submit" /></td>
                                                            <td><input type="reset" value="reset" name="reset" /></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <p>&nbsp;</p>
                                                <p>&nbsp;</p>
                                                <%while (rs.next()) {%>
                                                <div class="page" style="width:100%; text-align:left">
                                                    <div align="left" style="padding:0px 5px 0px 5px">
                                                        <div style="padding:0px 0px 6px 0px">
                                                            <table border="0" class="tborder" width="100%" cellpadding="6" cellspacing="0" style="border-bottom: 1px solid #555576">
                                                                <tbody>
                                                                    <tr>
                                                                        <td colspan="2" style="background-color: #2F89DF;font-weight:normal; border: 1px solid #555576; border-right: 0px"><%=rs.getString(5)%></td>
                                                                    </tr>
                                                                    <tr valign="top">
                                                                        <td class="alt2" width="125" style="border: 1px solid #555576; border-top: 0px; border-bottom: 0px"><%=rs.getString(2)%></td>
                                                                        <td class="alt1" style="border-right: 1px solid #555576"><%=rs.getString(4)%></td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                                <%}%>
                                                <p>&nbsp;</p>
                                                <%
                                                            request.setCharacterEncoding("UTF-8");
                                                            String commen = request.getParameter("commen");
                                                            String name = request.getParameter("nm");
                                                            String email = request.getParameter("mail");
                                                            if (commen != null && name != null) {
                                                                // check if the text box having only blank spaces
                                                                if (commen != "" && name != "") {
                                                                    /* Create string of connection url within specified format with machine name,
                                                                    port number and database name. Here machine name id localhost and database name is student. */

                                                                    // declare a connection by using Connection interface

                                                                    // declare object of Statement interface that uses for executing sql statements.
                                                                    PreparedStatement pstatement = null;
                                                                    int updateQuery = 0;

                                                                    // Load JBBC driver "com.mysql.jdbc.Driver"



                                                                    // check if the text box is empty
                                                                    try {
                                                                        /* Create a connection by using getConnection() method that takes
                                                                        parameters of string type connection url, user name and password to connect
                                                                        to database. */
                                                                        // sql query to insert values in the secified table.
                                                                        String queryString = "INSERT INTO comments(name,mail,txt,time) VALUES (?,?,?,NOW())";
                                                                        /* createStatement() is used for create statement object that is used for
                                                                        sending sql statements to the specified database. */
                                                                        pstatement = connection.prepareStatement(queryString);
                                                                        pstatement.setString(1, name);
                                                                        pstatement.setString(2, email);
                                                                        pstatement.setString(3, commen);
                                                                        updateQuery = pstatement.executeUpdate();
                                                                        // sql query to retrieve values from the secified table.



                                                                    } catch (Exception ex) {
                                                                        out.println("Unable to connect to Database." + ex.getMessage());

                                                                    } finally {
                                                                        // close all the connections.
                                                                        rs.close();

                                                                        statement.close();
                                                                        pstatement.close();
                                                                        connection.close();
                                                                    }
                                                                }
                                                            }
                                                %>
                                            </form>
                                        </td>
                                    </tr>
                                </table>
                                <p><br /></p>
                            </td>
                        </tr>
                    </table><br />
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
