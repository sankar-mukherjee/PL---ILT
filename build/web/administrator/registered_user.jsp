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
        <link rel="shortcut icon" type="image/x-icon" href="../Images/favicon.ico"></link>
        <title>Registration User</title>
        <link rel="stylesheet" href="../css/nivo-slider.css" type="text/css" media="screen" />
        <script type="text/javascript">
            checked=false;
            value="off";
            function selectall(frm){
                var aa= frm.getElementsByTagName("input");
                if (checked == false)
                {
                    checked = true
                    value="on";
                }
                else
                {
                    checked = false
                    value="off";
                }
                for (var i =0; i < aa.length; i++)
                {
                    if(aa[i].type==='checkbox'){
                        aa[i].checked = checked;
                        aa[i].value = value;
                    }
                }
            }
            function value_v(id){
                var aa= document.getElementById(id);
                //alert(aa.value);
                if(aa.value=="off"){

                    aa.value="on";
                }else{
                    aa.value="off";
                }
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
                                                                    <td align="center"><br />
                                                                        <h3>Registered User</h3>
                                                                        <form name="register" action="registered_delete.jsp" method="get">
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
                                                                                        try {
                                                                                            String resultString = "SELECT * FROM userregister";
                                                                                            statement = connection.createStatement();
                                                                                            rs = statement.executeQuery(resultString);

                                                                                            out.print("<table border='1' cellspacing='4' align='center' cellpadding='4'>");
                                                                                            //out.print("<tr><td colspan='6' align='right'>Select all<br/><input type='checkbox' onclick='selectall(this.form)' name='confirm' value='ON' /></td></tr>");
                                                                                            out.print("<th>Name</th><th>Password</th><th>Email</th><th>Additional</th><th>ROLEs</th><th>Delete User</th>");
                                                                                            while (rs.next()) {
                                                                                                out.print("<tr><td><input type='text' name='name" + K + "' value='" + rs.getString(2) + "' readonly='readonly' /></td>");
                                                                                                out.print("<td><input type='text' name='pass" + K + "' value='" + rs.getString(3) + "' readonly='readonly' /></td>");
                                                                                                out.print("<td><input type='text' name='email" + K + "' value='" + rs.getString(4) + "' readonly='readonly' /></td>");
                                                                                                out.print("<td><input type='text' name='additional" + K + "' value='" + rs.getString(5) + "' readonly='readonly' /></td>");
                                                                                                out.print("<td><input type='text' name='role" + K + "' value='" + rs.getString(6) + "' readonly='readonly' /></td>");
                                                                                                out.print("<td align='right'><input type='checkbox' id='confirm" + K + "' name='confirm" + K + "' value='off' onclick='value_v(this.id)'/></td></tr>");
                                                                                                K++;
                                                                                            }
                                                                                            out.print("</table><br/>");
                                                                                            out.print("<input type='submit' value='Delete' name='submit' />");
                                                                                        } catch (Exception ex) {
                                                                                            out.println("Unable to connect to Database." + ex.getMessage());
                                                                                        } finally {
                                                                                            rs.close();
                                                                                            statement.close();
                                                                                            connection.close();
                                                                                        }
                                                                                        request.getSession().setAttribute("regis11", K);
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
