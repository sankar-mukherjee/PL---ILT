<%--
    Document   : newjsp
    Created on : 19 May, 2011, 2:15:10 PM
    Author     : Sankar
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
        <title>PLS Database</title>
        <script type="text/javascript" src="JavaScript/keyboard.js" charset="UTF-8"></script>
        <link rel="stylesheet" type="text/css" href="css/keyboard.css" />
        <link rel="stylesheet" href="css/nivo-slider.css" type="text/css" media="screen" />
        <script type="text/javascript">
            function check(){
                //var x=frm.language1.value;
                var language = document.cog.language1;
                //var x= document.forms["cog"]["text"].value                
                if(language.value=="Select")
                {                    
                    window.location="publish.jsp";                    
                }
                else
                {                    
                    window.location="publish.jsp?LANGUAGE="+language.value+"";
                }                
            }
        </script>
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
                    <table width="80%" height="37" border="0" cellpadding="0" cellspacing="0">
                        <tr align="center" valign="middle" class="style20">
                            <td width="10%" align="center" class="tab"><a href="files/PLS.pdf"><span>PLS Document</span></a></t</td>
                            <td width="20%" align="center" class="tab"><a href="ipa.jsp">Indian Languages IPA Symbols</a></td>
                            <td width="20%" align="center" class="pls_tab"><a href="IDEMAIN.jsp">PLS Development Environment</a></td>
                            <td width="10%" align="center" class="selected"><a href="publish.jsp">PLS Database</a></td>
                            <td width="5%" align="center" class="tab"><a href="help.jsp">HELP</a></td>
                            <td width="15%" align="center" class="tab"><a href="registration.jsp">Register</a></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td height="251" valign="top">
                    <table width="900" height="366" border="0" cellpadding="0" cellspacing="0" align="center">
                        <tr>
                            <td valign="top" align="center"><br/>
                                <table width="900" border="0" cellspacing="5" cellpadding="0" align="center">                                                                                        
                                    <tr><td valign="top" class="style19" align="center" style="border: 1px solid">
                                            <a class="style18" style="background-color: #cccccc; padding: 5px">Look for a Word in the PLS Database<br /></a>
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
                                        </td></tr>
                                    <tr><td valign="top" class="style19" align="center" style="border: 1px solid">
                                            <a class="style18" style="background-color: #cccccc; padding: 5px">Browse the PLS Database as list</a><br /><br />
                                            <form action="show_language_database.jsp" method="get">
                                                Select Language
                                                <select name="language">
                                                    <%
                                                        request.setCharacterEncoding("UTF-8");
                                                        String connectionURL1 = "jdbc:mysql://localhost:3306/ide?useUnicode=true&characterEncoding=UTF-8";
                                                        Connection connection4 = null;

                                                        ResultSet rs4 = null;
                                                        Statement statement4 = null;
                                                        int updateQuery1 = 0;
                                                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                                                        connection4 = DriverManager.getConnection(connectionURL1, "root", "root");
                                                        try {
                                                            String resultString = "SELECT * FROM language_list";
                                                            statement4 = connection4.createStatement();
                                                            rs4 = statement4.executeQuery(resultString);

                                                            while (rs4.next()) {
                                                                out.println("<option>" + rs4.getString(2) + "</option>");
                                                            }

                                                        } catch (Exception ex) {
                                                            out.println("Unable to connect to Database." + ex.getMessage());
                                                        } finally {
                                                            rs4.close();
                                                            statement4.close();
                                                            connection4.close();
                                                        }
                                                    %>
                                                </select>
                                                <input type="submit" value="Show Database" />
                                            </form> </br>
                                        </td></tr>
                                    <tr><td valign="top" class="style19" align="center" style="border: 1px solid">
                                            <a class="style18" style="background-color: #cccccc; padding: 5px">Publish Full Pronunciation Lexicon Dictionary</a><br />
                                            <form method="post" name="cog">
                                                <p><a style="color: #000">Select Language</a>
                                                    <select name="language1" onchange="check();" id="language1">
                                                        <%
                                                            request.setCharacterEncoding("UTF-8");
                                                            Connection connection1 = null;
                                                            ResultSet rs1 = null;
                                                            Statement statement1 = null;
                                                            Class.forName("com.mysql.jdbc.Driver").newInstance();
                                                            connection1 = DriverManager.getConnection(connectionURL, "root", "root");
                                                            try {
                                                                String resultString = "SELECT * FROM language_list";
                                                                statement1 = connection1.createStatement();
                                                                rs1 = statement1.executeQuery(resultString);
                                                                out.println("<option value='Select'>Select Language</option>");
                                                                while (rs1.next()) {
                                                                    out.println("<option value='" + rs1.getString(2) + "'>" + rs1.getString(2) + "</option>");
                                                                }
                                                            } catch (Exception ex) {
                                                                out.println("Unable to connect to Database." + ex.getMessage());
                                                            } finally {
                                                                rs1.close();
                                                                statement1.close();
                                                                connection1.close();
                                                            }
                                                        %>
                                                    </select></p>
                                            </form>

                                            <%
                                                request.setCharacterEncoding("UTF-8");
                                                String language = request.getParameter("LANGUAGE");
                                                Connection connection2 = null;
                                                PreparedStatement pstatement1 = null;
                                                //out.println("" + language + "");
                                                ResultSet rs2 = null;
                                                long count = 0;
                                                if (language != null) {
                                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                                    connection2 = DriverManager.getConnection(connectionURL, "root", "root");
                                                    try {
                                                        String resultString1 = "SELECT * FROM " + language + " GROUP BY ORTHOGRAPHY";
                                                        pstatement1 = connection2.prepareStatement(resultString1);
                                                        rs2 = pstatement1.executeQuery();
                                                        rs2.last();
                                                        count = rs2.getRow();
                                                    } catch (Exception ex) {
                                                        out.println("Unable to connect to Database." + ex.getMessage());
                                                    } finally {
                                                        rs2.close();
                                                        pstatement1.close();
                                                        connection2.close();
                                                    }
                                                }
                                            %>
                                            <p>Number of entries in<br>
                                                    <a class="style18"><%out.print(language);%> = <%=count%></a></p>
                                            <p>Enter Range of Download data
                                                <a style="color: #DF0000;font-size: small">(*Range Data should be less than 40000)</a></p>                                                                                                            
                                            <form action="Servlet/DownloadFile4" method="get">
                                                <p class="style18"><input name="language" type="hidden" value="<%=language%>"/> 
                                                    Start value<input align="middle" name="start" type="text" value="" style="font-size:xx-small"/> 
                                                    Range <input type="text" name="end" value="" style="font-size: xx-small"/>
                                                    <a href="Servlet/DownloadFile4"><input type="submit" value="Get the PLS" name="Search" style="height: 30px;"/></a> 
                                                </p>
                                            </form>
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
