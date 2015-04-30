<%--
    Document   : newjsp
    Created on : 19 May, 2011, 2:15:10 PM
    Author     : Sankar
--%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="shortcut icon" type="image/x-icon" href="../Images/favicon.ico"></link>
        <title>Administrator</title>
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
                                                        <a style="color: white; font-size:200%">----------------</a><br>
                                                            <a style="color: white; font-size:200%"> Administrator PAGE</a>
                                                        </br>
                                                    </td>
                                                    <td><img src="../assets/gov.jpg" width="80" height="80" /></td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td width="150" align="right" valign="top"><br />
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td align="right" valign="top">
                                                        <span class="style16"><a href="../index.jsp">HOME</a>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>

                        <tr>
                            <td height="251" align="center" valign="top"><br/><br/>
                                <h3  class="data_link"><a href="pls_changes.jsp">Show Changes in PLS database by user</a></h3>
                                <hr></hr>
                                <h3  class="data_link"><a href="registered_temp_user.jsp">Pending User Registration</a></h3>
                                <hr></hr>
                                <h3 class="data_link"><a href="registered_user.jsp">Show Registered USERs</a></h3>
                                <hr></hr>
                                <h3 class="data_link"><a href="language.jsp"><b>Add Languages</b></a></h3>
                                <h3 class="data_link"><a href="language_show.jsp"><b>Show Languages</b></a></h3>
                                <hr></hr></br>
                                <form action="edit_language_databse.jsp" method="get">
                                    Select Language
                                    <select name="language">
                                        <%
                                            request.setCharacterEncoding("UTF-8");
                                            String connectionURL = "jdbc:mysql://localhost:3306/ide?useUnicode=true&characterEncoding=UTF-8";
                                            Connection connection = null;
                                            ResultSet rs = null;
                                            Statement statement = null;
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
                                    <input type="submit" value="Edit Database" />
                                </form>
                            </td>                                                                        
                        </tr>                                                             


                    </table>
                    </body>
                    </html>
