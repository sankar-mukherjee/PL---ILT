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
    String lang = request.getParameter("language1");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="shortcut icon" type="image/x-icon" href="../Images/favicon.ico"></link>
        <title><%out.print(lang);%></title>
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
                                                        <a style="color: white; font-size:200%">Changes in <%out.print(lang);%></a>
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
                            <td><br/>
                                <table width="900" height="144" border="0" cellpadding="0" cellspacing="0">
                                    <tr><td>
                                            <%
                                                Class.forName("com.mysql.jdbc.Driver").newInstance();
                                                String connectionURL1 = "jdbc:mysql://localhost:3306/ide_temp?useUnicode=true&characterEncoding=UTF-8";
                                                Connection connection1 = null;
                                                ResultSet rs1 = null;
                                                Statement statement1 = null;
                                                connection1 = DriverManager.getConnection(connectionURL1, "root", "root");

                                                String connectionURL = "jdbc:mysql://localhost:3306/ide?useUnicode=true&characterEncoding=UTF-8";
                                                Connection connection = null;
                                                PreparedStatement pstatement = null;
                                                connection = DriverManager.getConnection(connectionURL, "root", "root");
                                                int updateQuery = 0;
                                                try {
                                                    String resultString1 = "SELECT * FROM " + lang;
                                                    statement1 = connection1.createStatement();
                                                    rs1 = statement1.executeQuery(resultString1);
                                                    while (rs1.next()) {

                                                        String queryString = "INSERT INTO " + lang + " (ORTHOGRAPHY, PRONUNCIATION, MEANING, POS, ATTRIBUTE) VALUES(?,?,?,?,?)";
                                                        pstatement = connection.prepareStatement(queryString);

                                                        pstatement.setString(1, rs1.getString(2));
                                                        pstatement.setString(2, rs1.getString(3));
                                                        pstatement.setString(3, rs1.getString(4));
                                                        pstatement.setString(4, rs1.getString(5));
                                                        pstatement.setString(5, rs1.getString(6));
                                                        updateQuery = pstatement.executeUpdate();
                                                        if (updateQuery != 0) {
                                                            out.println("Successfully Inserted---INTO "
                                                                    + lang + " ORTHOGRAPHY="
                                                                    + rs1.getString(2) + "---PRONUNCIATION="
                                                                    + rs1.getString(3) + "---POS="
                                                                    + rs1.getString(4) + "---MEANING="
                                                                    + rs1.getString(5) + "---ATTRIBUTE="
                                                                    + rs1.getString(6) + "<br>");
                                                        } else {
                                                            out.println("Already Exists---INTO "
                                                                    + lang + "ORTHOGRAPHY="
                                                                    + rs1.getString(2) + "---PRONUNCIATION="
                                                                    + rs1.getString(3) + "---POS="
                                                                    + rs1.getString(4) + "---MEANING="
                                                                    + rs1.getString(5) + "---ATTRIBUTE="
                                                                    + rs1.getString(6) + "<br>");
                                                        }
                                                    }
                                                } catch (Exception ex) {
                                                    out.println(ex.getMessage());
                                                } finally {
                                                    rs1.close();
                                                    statement1.close();
                                                    connection1.close();
                                                    connection.close();
                                                    if (pstatement == null) {
                                                        out.println("No changes in Master Databse as Tempurary <a style='color: red'>" + lang + "</a> Database is Empty");
                                                    } else {
                                                        pstatement.close();
                                                    }
                                                }
                                            %>
                                        </td>
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
