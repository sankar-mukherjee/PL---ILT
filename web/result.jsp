<%--
    Document   : newjsp
    Created on : 19 May, 2011, 2:15:10 PM
    Author     : Sankar
--%>

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%request.setCharacterEncoding("UTF-8");
            String ser = request.getParameter("ser");
            String[] chk = request.getParameterValues("chk");
            request.setCharacterEncoding("UTF-8");
            String pos = request.getParameter("pos");
            String atr = request.getParameter("mor");
            String or = request.getParameter("ort");
            String pon = request.getParameter("pon");
            String mea = request.getParameter("mea");
            String next = request.getParameter("Next");
            String prev = request.getParameter("prev");

            String language = request.getParameter("language");
%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="shortcut icon" type="image/x-icon" href="Images/favicon.ico"></link>
        <title><%out.println(ser);%></title>
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
                            <td width="10%" align="center" class="selected"><a href="publish.jsp">PLS Database</a></td>
                            <td width="5%" align="center" class="tab"><a href="help.jsp">HELP</a></td>
                            <td width="15%" align="center" class="tab"><a href="registration.jsp">Register</a></td>
                        </tr>
                    </table>
                </td>
            </tr>

                                                                <tr>
                                                                    <td height="251" align="center" valign="top">
                                                                        <table width="100%" height="366" border="0" cellpadding="0" cellspacing="0">
                                                                            <tr>
                                                                                <td align="center" valign="top"><p>&nbsp;</p>
                                                                                    <table width="900" border="0" cellspacing="0" cellpadding="0">
                                                                                        <tr>
                                                                                            <td align="left" valign="top" class="style18">Search Results<br /><br /></td>
                                                                                        </tr>
                                                                                        <%
                                                                                                    String connectionURL = "jdbc:mysql://localhost:3306/ide?useUnicode=true&characterEncoding=UTF-8";
                                                                                                    // declare a connection by using Connection interface
                                                                                                    Connection connection = null;
                                                                                                    // declare object of Statement interface that uses for executing sql statements.
                                                                                                    ResultSet rs = null;
                                                                                                    ResultSet rs2 = null;
                                                                                                    Statement statement = null;
                                                                                                    CallableStatement cstmt = null;
                                                                                                    String[] temp = new String[6];
                                                                                                    String[] g = new String[6];
                                                                                                    String[] po = new String[6];
                                                                                                    ArrayList<String> d = new ArrayList<String>();
                                                                                                    String ME;
                                                                                                    //ResultSetMetaData rsmtadta=null;

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
                                                                                                        String resultString = "SELECT * FROM " + language + " where ORTHOGRAPHY = '" + ser + "'";
                                                                                                        statement = connection.createStatement();
                                                                                                        rs = statement.executeQuery(resultString);
                                                                                                        rs.last();
                                                                                                        int nrows = rs.getRow();
                                                                                                        rs.beforeFirst();
                                                                                                        rs.next();
                                                                                                        //boolean resultsAvailable = cstmt.execute(resultString);
                                                                                                        //String PP = rs.getString(2);
                                                                                                        // String MN = rs.getString(4);
                                                                                        %>
                                                                                        <tr>
                                                                                            <td align="left" valign="top" class="style19">
                                                                                                <table cellpadding="5" cellspacing="5" style="font-size: x-large" border="0">
                                                                                                    <tbody>

                                                                                                        <tr>
                                                                                                            <td><%=rs.getString(2)%></td>

                                                                                                            <td><%=rs.getString(3)%></td>

                                                                                                        </tr>

                                                                                                    </tbody>
                                                                                                </table>
                                                                                                <p class="style18">
                                                                                                    Pronunciation Lexicon Standard (PLS) Format
                                                                                                </p>
                                                                                            </td>
                                                                                        </tr>

                                                                                        <tr>
                                                                                            <td>

                                                                                                <div class="style222">
                                                                                                    &lt;?xml version="1.0" encoding="UTF-8"?&gt;
                                                                                                    <br>&lt;!-- This pronunciation lexicon is licensed under the GPL. --&gt;</br>
                                                                                                    &lt;lexicon version="1.0" xmlns="http://www.w3.org/2005/01/pronunciation-lexicon"
                                                                                                    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                                                                                                    xsi:schemaLocation="http://www.w3.org/2005/01/pronunciation-lexicon
                                                                                                    http://www.w3.org/TR/2007/CR-pronunciation-lexicon-20071212/pls.xsd"
                                                                                                    <br> alphabet="ipa" xml:lang="bn"&gt;</br>   </br>
                                                                                                </div>
                                                                                                <div class="style23">
                                                                                                    &lt;lexeme&gt;</br>
                                                                                                    <%if (nrows == 1) {%>
                                                                                                    &lt;grapheme&gt;<%=rs.getString(2)%>&lt;/grapheme&gt;<br>
                                                                                                        &lt;POS&gt;<%=rs.getString(5)%>&lt;/POS&gt;<br>
                                                                                                            &lt;phoneme&nbsp;Standard=True&gt;<%=rs.getString(3)%>&lt;/phoneme&gt;<br>
                                                                                                                &lt;meanning&nbsp;&gt;<%=rs.getString(4)%>&lt;/meanning&gt;<br>
                                                                                                                    &lt;/lexeme&gt;
                                                                                                                    <%} else {%>
                                                                                                                    &lt;grapheme&gt;<%=rs.getString(2)%>&lt;/grapheme&gt;<br>
                                                                                                                        <%
                                                                                                                            for (int i = 0; i < nrows; i++) {
                                                                                                                                if (rs.getString(5).equals("null") || rs.getString(5).equals("")) {
                                                                                                                                    temp[i] = "null";
                                                                                                                                } else {
                                                                                                                                    ME = rs.getString(5);
                                                                                                                                    g = ME.split("\\.");
                                                                                                                                    temp[i] = g[0];
                                                                                                                                    

                                                                                                                                }
                                                                                                                                rs.next();
                                                                                                                            }
                                                                                                                            d.clear();
                                                                                                                            for (int u = 0; u < nrows; u++) {
                                                                                                                                if (!d.contains(temp[u])) {
                                                                                                                                    d.add(temp[u]);
                                                                                                                                }
                                                                                                                            }
                                                                                                                            d.toArray(po);
                                                                                                                            for (int j = 0; j < d.size(); j++) {
                                                                                                                                String resest = "SELECT * FROM " + language + " where ORTHOGRAPHY='" + ser + "' AND POS like'%" + po[j] + "%'";
                                                                                                                                statement = connection.createStatement();
                                                                                                                                rs2 = statement.executeQuery(resest);
                                                                                                                                rs2.last();
                                                                                                                                int prows = rs2.getRow();
                                                                                                                                rs2.beforeFirst();
                                                                                                                                rs2.next();
                                                                                                                                String PPPP = rs2.getString(5);
                                                                                                                                ArrayList<String> AA = new ArrayList<String>();
                                                                                                                                String[] ppp = PPPP.split("\\.");
                                                                                                                                for(int iii = 0;iii<ppp.length;iii++){
                                                                                                                                     AA.add(ppp[iii]);
                                                                                                                                }
                                                                                                                                for(int iii = ppp.length;iii<9;iii++){
                                                                                                                                     AA.add("null");
                                                                                                                                }
                                                                                                                                      //int pp = ppp.length;
                                                                                                                                      //ppp[2]="n";
                                                                                                                               
                                                                                                                                //String pp = ppp[0]+"."+ppp[1]+"."+ppp[2]+"."+ppp[3]+"."+ppp[4]+"."+ppp[5]+"."+ppp[6]+"."+ppp[7]+"."+ppp[8]+"."+ppp[9];
                                                                                                                                String pp = AA.get(0)+"."+AA.get(1)+"."+AA.get(2)+"."+AA.get(3)
                                                                                                                                        +"."+AA.get(4)+"."+AA.get(5)+"."+AA.get(6)+"."+AA.get(7)+"."+AA.get(8);
                                                                                                                                if (prows >= 2) {
                                                                                                                                    rs2.next();
                                                                                                                                    if (rs2.getString(6).equals("2")) {
                                                                                                                                        rs2.previous();
                                                                                                                        %>


                                                                                                                        &lt;POS&gt;<%=pp%>&lt;/POS&gt;<br>
                                                                                                                            &lt;phoneme&nbsp;Standard=True&gt;<%=rs2.getString(3)%>&lt;/phoneme&gt;<br>
                                                                                                                                &lt;meaning&gt;<%=rs2.getString(4)%>&lt;/meaning&gt;<br>
                                                                                                                                    <%for (int o = 0; o < (prows - 1); o++) {

                                                                                                                                                                     rs2.next();%>
                                                                                                                                    &lt;phoneme&nbsp;Standard=False&gt;<%=rs2.getString(3)%>&lt;/phoneme&gt;<br>
                                                                                                                                        &lt;meaning&gt;<%=rs2.getString(4)%>&lt;/meaning&gt;<br>
                                                                                                                                            <%}

                                                                                                                                                                      } else {
                                                                                                                                                                 rs2.previous();%>
                                                                                                                                            &lt;POS&gt;<%=pp%>&lt;/POS&gt;<br>
                                                                                                                                                &lt;phoneme&nbsp;Standard=True&gt;<%=rs2.getString(3)%>&lt;/phoneme&gt;<br>
                                                                                                                                                    &lt;meaning&gt;<%=rs2.getString(4)%>&lt;/meaning&gt;<br>
                                                                                                                                                        <%}
                                                                                                                                                                                       } else {%>
                                                                                                                                                        &lt;POS&gt;<%=pp%>&lt;/POS&gt;<br>
                                                                                                                                                            &lt;phoneme&nbsp;Standard=True&gt;<%=rs2.getString(3)%>&lt;/phoneme&gt;<br>
                                                                                                                                                                &lt;meaning&gt;<%=rs2.getString(4)%>&lt;/meaning&gt;<br>
                                                                                                                                                                    <%}
                                                                                                                                                                        }%>

                                                                                                                                                                    &lt;/lexeme&gt;

                                                                                                                                                                    <%}%>
                                                                                                                                                                    </div>
                                                                                                                                                                    </td>
                                                                                                                                                                    </tr>
                                                                                                                                                                    <%
                                                                                                                                                                                } catch (Exception ex) {
                                                                                                                                                                                    out.println("No Record Found");

                                                                                                                                                                                } finally {
                                                                                                                                                                                    // close all the connections.
                                                                                                                                                                                    rs.close();
                                                                                                                                                                                    statement.close();

                                                                                                                                                                                    connection.close();
                                                                                                                                                                                }%>
                                                                                                                                                                    </table>

                                                                                                                                                                    <p><br /></p>
                                                                                                                                                                    </td>
                                                                                                                                                                    </tr>
                                                                                                                                                                    </table><br />
                                                                                                                                                                    <hr style="color: #ffffff"/>
                                                                                                                                                                    <p>&nbsp;</p>
                                                                                                                                                                    <a class="link2" href="publish.jsp" >Back to search page</a>
                                                                                                                                                                    </td>
                                                                                                                                                                    </tr>

                                                                                                                                                                    <tr>
                                                                                                                                                                        <td width="900" height="184" align="center" valign="top" background="Images/bckbottom.png">
                                                                                                                                                                            <table width="100%" height="28" border="0" cellpadding="0" cellspacing="0">
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
                                                                                                                                                                                        <span class="style24">© 2012 All Rights Reserved. | CET-IITKGP | Website designed by >
                                                                                                                                                                                            <a href="#" target="_blank">Sank</a>
                                                                                                                                                                                        </span>
                                                                                                                                                                                    </td>
                                                                                                                                                                                </tr>
                                                                                                                                                                            </table>
                                                                                                                                                                        </td>
                                                                                                                                                                    </tr>
                                                                                                                                                                    </table>
                                                                                                                                                                    </body>
                                                                                                                                                                    </html>
