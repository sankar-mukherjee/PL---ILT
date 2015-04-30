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
        <title>Register</title>

        <script type="text/javascript">
            function formValidation()
            {
                var passid = document.registration.passid;
                var uname = document.registration.username;
                var uemail = document.registration.email;
                var answ = document.registration.ans;
                var rolew = document.registration.roles;
                
                if(roles(rolew) && passid_validation(passid,6,12) && allLetter(uname) && ValidateEmail(uemail))
                {
                    window.location="regsuccess.jsp?username="+uname.value+"&passid="+passid.value+"&email="+uemail.value+"&ans="+answ.value+"&roles="+rolew.value;
                }
                else{
                    return false;
                }
            }
            function passid_validation(passid,mx,my)
            {
                var passid_len = passid.value.length;
                if (passid_len == 0 ||passid_len >= my || passid_len < mx)
                {
                    alert("Password should not be empty / length be between "+mx+" to "+my);
                    passid.focus();
                    return false;
                }
                return true;
            }
            function allLetter(uname)
            {
                var letters = /^[A-Za-z]+$/;
                if(uname.value.match(letters))
                {
                    return true;
                }
                else
                {
                    alert('Username must have alphabet characters only');
                    uname.focus();
                    return false;
                }
            }
            function ValidateEmail(uemail)
            {
                var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
                if(uemail.value.match(mailformat))
                {
                    return true;
                }
                else
                {
                    alert("You have entered an invalid email address!");
                    uemail.focus();
                    return false;
                }
            }
            function roles(rolew)
            {                
                if(rolew.value.length == 0)
                {                    
                    alert("You have not entered any Languages!");
                    rolew.focus();
                    return false;
                }else
                {
                    return true;
                }
            }
            
            function ADD_language(){
                document.getElementById("languages").value = document.getElementById("languages").value +"."+ document.getElementById("language_selected").value;
            }
            
        </script>
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
                            <td width="10%" align="center" class="tab"><a href="publish.jsp">PLS Database</a></td>
                            <td width="5%" align="center" class="tab"><a href="help.jsp">HELP</a></td>
                            <td width="15%" align="center" class="selected"><a href="registration.jsp">Register</a></td>
                        </tr>
                    </table>
                </td>
            </tr>
                                                                <tr>
                                                                    <td><br>
                                                                            <%
                                                                                String erro1 = request.getParameter("erro");
                                                                                if (erro1 != null) {
                                                                                    out.println("<p align='center'><a style='font-size: large; color:#DF0000;'>" + erro1 + "</a></p>");
                                                                                }
                                                                            %>
                                                                            <form name="registration" method="get">
                                                                                <table border="0" align="center" cellpadding="6" cellspacing="0">
                                                                                    <tbody>
                                                                                        <tr>
                                                                                            <td class="thead" style="font-weight:normal; border: 1px solid #555576; border-right: 0px; ">Register at IDE</td>
                                                                                            <td class="thead" align="right" style="font-weight:normal; border: 1px solid #555576; border-left: 0px"></td>
                                                                                        </tr>
                                                                                        <tr valign="top">
                                                                                            <td class="alt2" width="200" style="border: 1px solid #555576; border-top: 0px; border-bottom: 0px">Your Name<sup>*</sup></td>
                                                                                            <td class="alt2" style="border-right: 1px solid #555576"><input type="text" name="username"  size=25 /></td>
                                                                                        </tr>

                                                                                        <tr><td class="alt2" colspan="2" style="border: 1px solid #555576; border-top: 0px; border-bottom: 0px"><hr></td></tr>

                                                                                        <tr valign="top">
                                                                                            <td class="alt2" width="200" style="border: 1px solid #555576; border-top: 0px; border-bottom: 0px">Password:<sup>*</sup></td>
                                                                                            <td class="alt2" style="border-right: 1px solid #555576"><input type="password" name="passid"   size=25 value=""></input></td>
                                                                                        </tr>
                                                                                        <tr><td class="alt2" colspan="2" style="border: 1px solid #555576; border-top: 0px; border-bottom: 0px"><hr></td></tr>

                                                                                        <tr valign="top">
                                                                                            <td class="alt2" width="200" style="border: 1px solid #555576; border-top: 0px; border-bottom: 0px">Email Address:<sup>*</sup></td>
                                                                                            <td class="alt2" style="border-right: 1px solid #555576"><input type="text" name="email"  value="" size=25 maxlength=200></input><span id="txtEmailId_error"></span></td>
                                                                                        </tr>

                                                                                        <tr><td class="alt2" colspan="2" style="border: 1px solid #555576; border-top: 0px; border-bottom: 0px"><hr></td></tr>

                                                                                        <tr valign="top">
                                                                                            <td class="alt2" width="200" style="border: 1px solid #555576; border-top: 0px; border-bottom: 0px">Languages you want to modify:<sup>*</sup></td>
                                                                                            <td class="alt2" style="border-right: 1px solid #555576; background-color: #aaaaaa">
                                                                                                <input type="text" name="roles"  value="" size=25 maxlength=200 id="languages"></input>
                                                                                                <select name="languages" id="language_selected">
                                                                                                    <option></option>
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
                                                                                                <input type="button" value="add" name="ADD" onclick="ADD_language()"/>
                                                                                            </td>
                                                                                        </tr>

                                                                                        <tr>
                                                                                            <td class="thead" style="font-weight:normal; border: 1px solid #555576; border-right: 0px">Additional Information</td>
                                                                                            <td class="thead" align="right" style="font-weight:normal; border: 1px solid #555576; border-left: 0px"></td>
                                                                                        </tr>
                                                                                        <tr valign="top">
                                                                                            <td class="alt2" width="200" style="border: 1px solid #555576; border-top: 0px; border-bottom: 0px">Associate Institute:</td>
                                                                                            <td class="alt2" style="border-right: 1px solid #555576"><input type="text" name="ans" value="" size=25 maxlength=200></input></td>
                                                                                        </tr>


                                                                                        <tr>
                                                                                            <td align="right" colspan="2" class="thead" align="right" style="font-weight:normal; border: 1px solid #555576;">
                                                                                                <input type="button" name="submit" onclick="formValidation()" value="Submit"/>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </tbody>
                                                                                </table>
                                                                            </form>
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
