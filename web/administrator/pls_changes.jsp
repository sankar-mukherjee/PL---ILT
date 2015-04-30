<%-- 
    Document   : pls_changes
    Created on : Mar 3, 2014, 9:44:44 PM
    Author     : IITKGP
--%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    String connectionURL = "jdbc:mysql://localhost:3306/ide?useUnicode=true&characterEncoding=UTF-8";
    Connection connection = null;
    PreparedStatement pstatement = null;
    ResultSet rs = null;
    Statement statement = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    connection = DriverManager.getConnection(connectionURL, "root", "root");
    int K = 0;
    ArrayList<String> array_lang = new ArrayList<String>();
    try {
        String resultString = "SELECT language_name FROM language_list";
        statement = connection.createStatement();
        rs = statement.executeQuery(resultString);
        while (rs.next()) {
            array_lang.add(rs.getString(1));
            //out.print("<option>" + rs.getString(1) + "</option>");
        }
    } catch (Exception ex) {
        out.println("Unable to connect to Database." + ex.getMessage());
    } finally {
        rs.close();
        statement.close();
        connection.close();
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="shortcut icon" type="image/x-icon" href="../Images/favicon.ico"></link>
        <title>Changes in PLS</title>
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
                                                        <a style="color: white; font-size:200%"> PLS Changes by User</a>
                                                        </br>
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
                            <td><br/><br/><br/>
                                <table width="900" height="144" border="0" cellpadding="5" cellspacing="5" align="center" style="font-size: large">
                                    <tr style="background-color: #999999">
                                        <form action="pls_change_language.jsp" method="get">
                                            <td>
                                                Changes made by the users&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <select name="language">
                                                    <%
                                                        for (int ii = 0; ii < array_lang.size(); ii++) {
                                                            out.print("<option>" + array_lang.get(ii) + "</option>");
                                                        }
                                                    %>
                                                </select>
                                            </td>
                                            <td>
                                                <input type="submit" value="Submit" name="submit" />
                                            </td>
                                        </form>
                                    </tr>
                                    <tr style="background-color: #eeeeee; border: 1px solid #000">
                                        <form action="pls_change_add.jsp" method="get">
                                            <td>
                                                Update the Master Database with the user changes<br>
                                                    <a style="font-size: x-large;color: #DF0000; text-decoration: blink">Warning</a><br>
                                                        <a style="color:#DF0000">Before updating you should check the changes made by the user first</a><br>
                                                            <select name="language1">
                                                                <option></option>
                                                                <%
                                                                    for (int ii = 0; ii < array_lang.size(); ii++) {
                                                                        out.print("<option>" + array_lang.get(ii) + "</option>");
                                                                    }
                                                                %>
                                                            </select>
                                                            </td>
                                                            <td>
                                                                <input type="submit" value="Submit" name="submit" />
                                                            </td>
                                                            </form>
                                                            </tr>
                                                            </table>

                                                            <hr></hr>
                                                            <p>&nbsp;</p>
                                                            <a class="link2" href="administrator.jsp">Back to ADMIN page</a>
                                                            </td>
                                                            </tr>   
                                                            </table>
                                                            </td>
                                                            </tr>
                                                            </table>
                                                            </body>
                                                            </html>
