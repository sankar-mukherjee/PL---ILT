<%--
    Document   : newjsp
    Created on : 19 May, 2011, 2:15:10 PM
    Author     : Sankar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="shortcut icon" type="image/x-icon" href="Images/favicon.ico"></link>
        <title>Home</title>
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
                            <td width="15%" align="center" class="tab"><a href="registration.jsp">Register</a></td>
                            <td width="15%" align="center" class="admin_tab"><a href="administrator/administrator.jsp">ADMINISTRATOR</a></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td height="251" align="center" valign="top">
                    <table width="900" height="366" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="center" valign="top"><p>&nbsp;</p>
                                <table width="900" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td align="center" valign="top" class="style18">Welcome to <br><br>
                                                    Pronunciation Lexicon Specification Development Environment<br /><br /></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" valign="top" class="style19">                                                                                                
                                                            <p class="style30">
                                                                Pronunciation Lexicon Specification Development Environment is
                                                                a mass development tool to create comprehensive 
                                                                machine readable pronunciation lexicon for Indian languages. 
                                                                The lexicon file contains the orthography, corresponding 
                                                                pronunciations, parts-of-Speech, morphosyntactic description, 
                                                                idiolectic variation of word pronunciation and meaning of lexical 
                                                                entries in a format based on requirements defined by the W3C 
                                                                Voice Browser Activity Pronunciation Lexicon Specification 
                                                                (PLS) 1.0. The current version of the Pronunciation Lexicon for 
                                                                Indian Languages Toolkit (PL-ILT) PLS contains approximately 
                                                                2 million lexical entries for Bengali.
                                                            </p>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" valign="top" class="style19">
                                                            <p class="style30">PL-ILT: A Web Tool for Creation of Pronunciation Lexicon in Indian Languages</p>
                                                            <p>Sankar Mukherjee and Shyamal Kumar Das Mandal
                                                                <span class="style32"><a href="http://ieeexplore.ieee.org/xpl/articleDetails.jsp?reload=true&arnumber=6709858" target="_blank" class="link2">PDF</a></span>
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
