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
        <title>Show Language</title>
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
                                                        <a style="color: white; font-size:200%">Registered Languages in 
                                                            Master Database 
                                                            as well as Temporary Database</a>
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
                    </table>
                </td>
            </tr>
            <tr>
                <td height="39" align="center" valign="middle">
                    <table width="80%" height="37" border="0" cellpadding="0" cellspacing="0">
                        <tr align="center" valign="middle" class="style20">
                            <td style="color: white;">Deleting one Languages will delete the language specific database from 
                                Master and Temporary Database</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <br /><br /><br />
                    <form name="register" action="language_delete.jsp" method="get">
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
                            int K = 0;
                            try {
                                String resultString = "SELECT * FROM language_list";
                                statement = connection.createStatement();
                                rs = statement.executeQuery(resultString);

                                out.print("<table border='0' cellspacing='10' align='center' cellpadding='10'>");
                                out.print("<th>Name of <br>Registered Languages</th><th>Confirm Delete</th>");
                                while (rs.next()) {
                                    out.print("<tr><td><input type='text' name='name" + K + "' value='" + rs.getString(2) + "' readonly='readonly' /></td>");
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
