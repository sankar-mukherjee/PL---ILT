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
        <title>Bangla : IPA Symbols</title>
        <link rel="stylesheet" href="css/nivo-slider.css" type="text/css" media="screen" />
        <script language="javascript">
            function toggle(toggleText, displayText) {
                var ele = document.getElementById(toggleText);
                var text = document.getElementById(displayText);
                if(ele.style.display == "block") {
                    ele.style.display = "none";
                    text.innerHTML = " ";
                }
                else {
                    ele.style.display = "block";
                    text.innerHTML = " ";
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
                                                                                            <td width="20%" align="center" class="selected"><a href="ipa.jsp">Indian Languages IPA Symbols</a></td>
                                                                                            <td width="20%" align="center" class="pls_tab"><a href="IDEMAIN.jsp">PLS Development Environment</a></td>
                                                                                            <td width="10%" align="center" class="tab"><a href="publish.jsp">PLS Database</a></td>
                                                                                            <td width="5%" align="center" class="tab"><a href="help.jsp">HELP</a></td>
                                                                                            <td width="15%" align="center" class="tab"><a href="registration.jsp">Register</a></td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                            <%String connectionURL = "jdbc:mysql://localhost:3306/ide?useUnicode=true&characterEncoding=UTF-8";
                                                                                // declare a connection by using Connection interface
                                                                                Connection connection = null;
                                                                                // declare object of Statement interface that uses for executing sql statements.
                                                                                ResultSet rs = null;
                                                                                Statement statement = null;
                                                                                ResultSet rs2 = null;
                                                                                Statement statement2 = null;
                                                                                ResultSet rs3 = null;
                                                                                Statement statement3 = null;
                                                                                // Load JBBC driver "com.mysql.jdbc.Driver"
                                                                                Class.forName("com.mysql.jdbc.Driver").newInstance();
                                                                                int updateQuery = 0;
                                                                                try {
                                                                                    // check if the text box is empty

                                                                                    /* Create a connection by using getConnection() method that takes
                                                                                     parameters of string type connection url, user name and password to connect
                                                                                     to database. */
                                                                                    connection = DriverManager.getConnection(connectionURL, "root", "root");


                                                                                    // sql query to insert values in the secified table.
                                                                                    String resultString = "SELECT * FROM banglacons";
                                                                                    statement = connection.createStatement();
                                                                                    rs = statement.executeQuery(resultString);

                                                                                    String resultString2 = "SELECT * FROM banglavowel";
                                                                                    statement2 = connection.createStatement();
                                                                                    rs2 = statement2.executeQuery(resultString2);

                                                                                    String resultString3 = "SELECT * FROM bangladip";
                                                                                    statement3 = connection.createStatement();
                                                                                    rs3 = statement3.executeQuery(resultString3);
                                                                            %>
                                                                            <tr>
                                                                                <td height="251" align="center" valign="top">
                                                                                    <table width="900" height="366" border="0" cellpadding="0" cellspacing="0">
                                                                                        <tr>
                                                                                            <td align="center" valign="top"><p>&nbsp;</p>
                                                                                                <table width="900" border="0" cellspacing="0" cellpadding="0">
                                                                                                    <tr>
                                                                                                        <td align="left" valign="top" class="style18">Collection of Data for the Phonetic Representation of Indian Languages in IPA<br /><br /></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td align="left" valign="top" class="style19">
                                                                                                            <p><a href="javascript:toggle('toggleText1','switchText1');" rel="nofollow">
                                                                                                                    <span class="link2" style="font-size: 18pt;">Place and manner of articulation of the Bangla Consonant</span>
                                                                                                                    <div id="switchText1" style="display: inline;"></div></a><div id="toggleText1" style="display: none">&nbsp;
                                                                                                                    <p><div class="style32">
                                                                                                                            <table border="0" cellspacing="5" cellpadding="5" align="center">
                                                                                                                                <thead>
                                                                                                                                    <tr style="background-color: #2F89DF">
                                                                                                                                        <th>IPA Symbols</th>
                                                                                                                                        <th>Related Grapheme</th>
                                                                                                                                        <th>Place of Articulation</th>
                                                                                                                                        <th>Manner of Articulation</th>
                                                                                                                                        <th colspan="3"><table border="0" width="100%">
                                                                                                                                                <thead>
                                                                                                                                                    <tr>
                                                                                                                                                        <th colspan="3">Example Bangla Words</th>
                                                                                                                                                    </tr>
                                                                                                                                                </thead>
                                                                                                                                                <tbody>
                                                                                                                                                    <tr>
                                                                                                                                                        <td>Initially</td>
                                                                                                                                                        <td>Medially</td>
                                                                                                                                                        <td>Finally</td>
                                                                                                                                                    </tr>
                                                                                                                                                </tbody>
                                                                                                                                            </table>
                                                                                                                                        </th>
                                                                                                                                        <th>Corresponding Sound Files</th>
                                                                                                                                    </tr>
                                                                                                                                </thead>
                                                                                                                                <tbody>
                                                                                                                                    <%while (rs.next()) {%>
                                                                                                                                    <tr style="background-color: #CCCCCC">
                                                                                                                                        <td><%=rs.getString(2)%></td>
                                                                                                                                        <td><%=rs.getString(3)%></td>
                                                                                                                                        <td><%=rs.getString(7)%></td>
                                                                                                                                        <td><%=rs.getString(8)%></td>
                                                                                                                                        <td><%=rs.getString(4)%></td>
                                                                                                                                        <td><%=rs.getString(5)%></td>
                                                                                                                                        <td><%=rs.getString(6)%></td>
                                                                                                                                        <td></td>
                                                                                                                                    </tr>
                                                                                                                                    <%}%>
                                                                                                                                </tbody>
                                                                                                                            </table></div>
                                                                                                                    </p></div>
                                                                                                            </p>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td align="left" valign="top" class="style19">
                                                                                                            <p><a href="javascript:toggle('toggleText2','switchText2');" rel="nofollow">
                                                                                                                    <span class="link2" style="font-size: 18pt;">Place and manner of articulation of the Bangla Vowel</span>
                                                                                                                    <div id="switchText2" style="display: inline;"></div></a><div id="toggleText2" style="display: none">&nbsp;
                                                                                                                    <p><div class="style32">
                                                                                                                            <table border="0" cellspacing="5" cellpadding="5" align="center">
                                                                                                                                <thead>
                                                                                                                                    <tr style="background-color: #2F89DF">
                                                                                                                                        <th>IPA Symbol</th>
                                                                                                                                        <th>Related Grapheme</th>
                                                                                                                                        <th>Manner and Place of Articulation</th>
                                                                                                                                        <th colspan="3"><table border="0" width="100%">
                                                                                                                                                <thead>
                                                                                                                                                    <tr>
                                                                                                                                                        <th colspan="3">Example Bangla Words</th>
                                                                                                                                                    </tr>
                                                                                                                                                </thead>
                                                                                                                                                <tbody>
                                                                                                                                                    <tr>
                                                                                                                                                        <td>Initially</td>
                                                                                                                                                        <td>Medially</td>
                                                                                                                                                        <td>Finally</td>
                                                                                                                                                    </tr>
                                                                                                                                                </tbody>
                                                                                                                                            </table></th>
                                                                                                                                        <th>Corresponding Sound Files</th>
                                                                                                                                    </tr>
                                                                                                                                </thead>
                                                                                                                                <tbody>
                                                                                                                                    <%while (rs2.next()) {%>
                                                                                                                                    <tr style="background-color: #CCCCCC">
                                                                                                                                        <td><%=rs2.getString(2)%></td>
                                                                                                                                        <td><%=rs2.getString(3)%></td>
                                                                                                                                        <td><%=rs2.getString(7)%></td>
                                                                                                                                        <td><%=rs2.getString(4)%></td>
                                                                                                                                        <td><%=rs2.getString(5)%></td>
                                                                                                                                        <td><%=rs2.getString(6)%></td>
                                                                                                                                        <td></td>
                                                                                                                                    </tr>
                                                                                                                                    <%}%>                                
                                                                                                                                </tbody>
                                                                                                                            </table>
                                                                                                                        </div>
                                                                                                                    </p></div>
                                                                                                            </p>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td align="left" valign="top" class="style19">
                                                                                                            <p><a href="javascript:toggle('toggleText3','switchText3');" rel="nofollow">
                                                                                                                    <span class="link2" style="font-size: 18pt;">Occurrence of Diphthong in Bangla Words</span>
                                                                                                                    <div id="switchText3" style="display: inline;"></div></a><div id="toggleText3" style="display: none">&nbsp;
                                                                                                                    <p><div class="style32">
                                                                                                                            <table border="0" cellspacing="5" cellpadding="5" align="center">
                                                                                                                                <thead>
                                                                                                                                    <tr style="background-color: #2F89DF">
                                                                                                                                        <th>Diphthong</th>
                                                                                                                                        <th colspan="3"><table border="0" width="100%">
                                                                                                                                                <thead>
                                                                                                                                                    <tr>
                                                                                                                                                        <th colspan="3">Example Bangla Words</th>
                                                                                                                                                    </tr>
                                                                                                                                                </thead>
                                                                                                                                                <tbody>
                                                                                                                                                    <tr>
                                                                                                                                                        <td>Initially</td>
                                                                                                                                                        <td>Medially</td>
                                                                                                                                                        <td>Finally</td>
                                                                                                                                                    </tr>
                                                                                                                                                </tbody>
                                                                                                                                            </table></th>
                                                                                                                                        <th>Sound files</th>
                                                                                                                                    </tr>
                                                                                                                                </thead>
                                                                                                                                <tbody>
                                                                                                                                    <%while (rs3.next()) {%>
                                                                                                                                    <tr style="background-color: #CCCCCC">
                                                                                                                                        <td><%=rs3.getString(5)%></td>
                                                                                                                                        <td><%=rs3.getString(2)%></td>
                                                                                                                                        <td><%=rs3.getString(3)%></td>
                                                                                                                                        <td><%=rs3.getString(4)%></td>
                                                                                                                                        <td></td>
                                                                                                                                    </tr>
                                                                                                                                    <%}%>
                                                                                                                                </tbody>
                                                                                                                            </table>
                                                                                                                        </div>
                                                                                                                    </p></div>
                                                                                                            </p>
                                                                                                        </td>
                                                                                                    </tr>                                   
                                                                                                </table>
                                                                                                <p><br /></p>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table><br />
                                                                                </td>
                                                                            </tr>
                                                                            <%
                                                                                } catch (Exception ex) {
                                                                                    out.println("Unable to connect to Database." + ex.getMessage());

                                                                                } finally {
                                                                                    // close all the connections.
                                                                                    rs.close();
                                                                                    statement.close();

                                                                                    rs2.close();
                                                                                    statement2.close();

                                                                                    rs3.close();
                                                                                    statement3.close();
                    connection.close();
                }%>
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
