<%--
    Document   : newjsp
    Created on : 19 May, 2011, 2:15:10 PM
    Author     : Sankar
--%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

            if (session.getAttribute("username") == null) {%>
<jsp:forward page="login.jsp"/>
<%                //response.sendRedirect("login.jsp"); // GO TO LOGIN PAGE
            }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!
    public int nullIntconv(String str) {
        int conv = 0;
        if (str == null) {
            str = "0";
        } else if ((str.trim()).equals("null")) {
            str = "0";
        } else if (str.equals("")) {
            str = "0";
        }
        try {
            conv = Integer.parseInt(str);
        } catch (Exception e) {
        }
        return conv;
    }
%>
<%
            int iShowRows = 20;  // Number of records show on per page
            int iTotalSearchRecords = 10;  // Number of pages index shown
            int iTotalRows = nullIntconv(request.getParameter("iTotalRows"));
            int iTotalPages = nullIntconv(request.getParameter("iTotalPages"));
            int iPageNo = nullIntconv(request.getParameter("iPageNo"));
            int cPageNo = nullIntconv(request.getParameter("cPageNo"));

            int iStartResultNo = 0;
            int iEndResultNo = 0;

            if (iPageNo == 0) {
                iPageNo = 0;
            } else {
                iPageNo = Math.abs((iPageNo - 1) * iShowRows);
            }

            String connectionURL = "jdbc:mysql://localhost:3306/ide?useUnicode=true&characterEncoding=UTF-8";
            Connection connection = null;
            ResultSet rsPagination = null;
            ResultSet rsRowCnt = null;
            PreparedStatement psPagination = null;
            PreparedStatement psRowCnt = null;
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            int updateQuery = 0;
            int updateQuery1 = 0;
            connection = DriverManager.getConnection(connectionURL, "root", "root");
            String sqlPagination = "SELECT SQL_CALC_FOUND_ROWS * FROM banglaorthography ORDER BY ID ASC limit " + iPageNo + "," + iShowRows + "";
            psPagination = connection.prepareStatement(sqlPagination);
            rsPagination = psPagination.executeQuery();
            String sqlRowCnt = "SELECT FOUND_ROWS() as cnt";
            psRowCnt = connection.prepareStatement(sqlRowCnt);
            rsRowCnt = psRowCnt.executeQuery();
            if (rsRowCnt.next()) {
                iTotalRows = rsRowCnt.getInt("cnt");
            }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="shortcut icon" type="image/x-icon" href="Images/favicon.ico"></link>
        <link rel="stylesheet" href="css/nivo-slider.css" type="text/css" media="screen" />
        <title>All</title>
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
                                                    <td><img src="assets/logo.png" width="80" height="80" /></td>
                                                    <td align="center">
                                                        <a style="color: white; font-size:200%">PLS DEVELOPMENT ENVIRONMENT</a><br>
                                                            <sub>Sponsored By Department of Electronics and Information Technology (DEITY),</sub><br>
                                                           <sub> Ministry of Communication & Information Technology (MC&IT), Govt. of India</sub>
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
                                                    </td>
                                                </tr>
                                            </table>
                                            <%
                    if (session.getAttribute("username") != null && session.getAttribute("username") != "") {
                        String user = session.getAttribute("username").toString();
                        if(user.equals("sankar") ){
     out.print("<table width='100%'><tr><td align='right'><br/><a style='color: #DF0000' href='administrator.jsp'>ADMIN</a></td></tr></table>");
                                                            }
                                                                        }
        %>
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
                    <table width="900" height="33" border="0" cellpadding="0" cellspacing="0">
                        <tr align="center" valign="middle" class="style20">
                            <td width="10%" align="center" class="tab"><a href="about.jsp"><span>ABOUT</span></a></t</td>
                            <td width="10%" align="center" class="tab"><a href="pls.jsp">PLS</a></td>
                            <td width="10%" align="center" class="tab"><a href="ipa.jsp">IPA</a></td>
                            <td width="30%" align="center" class="tab"><a href="IDEMAIN.jsp">IDE</a></td>
                            <td width="10%" align="center" class="tab"><a href="publish.jsp">PUBLISH</a></td>
                            <td width="10%" align="center" class="tab"><a href="help.jsp">HELP</a></td>
                            <td width="10%" align="center" class="tab"><a href="registration.jsp">REGISTRATION</a></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <input type="hidden" name="iPageNo" value="<%=iPageNo%>">
            <input type="hidden" name="cPageNo" value="<%=cPageNo%>">
            <input type="hidden" name="iShowRows" value="<%=iShowRows%>">
            <tr>
                <td><br/>
                    <table border="0" cellspacing="5" cellpadding="5" align="center" width="70%">
                        <tbody>
                            <%
                                        //// calculate next record start record  and end record
                                        try {
                                            if (iTotalRows < (iPageNo + iShowRows)) {
                                                iEndResultNo = iTotalRows;
                                            } else {
                                                iEndResultNo = (iPageNo + iShowRows);
                                            }
                                            iStartResultNo = (iPageNo + 1);
                                            iTotalPages = ((int) (Math.ceil((double) iTotalRows / iShowRows)));
                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        }
                            %>
                            <tr>
                                <td colspan="9" style="" align="center" class="data_link">
                                                    <%
                                                                int i = 0;
                                                                int cPage = 0;
                                                                if (iTotalRows != 0) {
                                                                    cPage = ((int) (Math.ceil((double) iEndResultNo / (iTotalSearchRecords * iShowRows))));

                                                                    int prePageNo = (cPage * iTotalSearchRecords) - ((iTotalSearchRecords - 1) + iTotalSearchRecords);
                                                                    if ((cPage * iTotalSearchRecords) - (iTotalSearchRecords) > 0) {
                                                    %>
                                                    <a href="xxx2.jsp?iPageNo=<%=prePageNo%>&cPageNo=<%=prePageNo%>"> <b><< Previous&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></a>
                                                    <%
                                                                                                                    }

                                                                                                                    for (i = ((cPage * iTotalSearchRecords) - (iTotalSearchRecords - 1)); i <= (cPage * iTotalSearchRecords); i++) {
                                                                                                                        if (i == ((iPageNo / iShowRows) + 1)) {
                                                    %>
                                                    <a href="xxx2.jsp?iPageNo=<%=i%>" style="cursor:pointer;color: red"><b><%=i%></b></a>
                                                    <%
                                                                                                                                                                            } else if (i <= iTotalPages) {
                                                    %>
                                                    <a href="xxx2.jsp?iPageNo=<%=i%>"><%=i%></a>
                                                    <%
                                                                                                                        }
                                                                                                                    }
                                                                                                                    if (iTotalPages > iTotalSearchRecords && i < iTotalPages) {
                                                    %>
                                                    <a href="xxx2.jsp?iPageNo=<%=i%>&cPageNo=<%=i%>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Next >> </a>
                                                    <%
                                                                    }
                                                                }
                                                    %>
                                                    <br>Showing <%=iStartResultNo%> - <%=iEndResultNo%> of Total  <%=iTotalRows%>                                                
                                </td>
                            </tr>
                            <tr style="background-color: #2F89DF">
                                <th>Orthography</th>
                                <th>POS</th>
                                <th>Pronunciation</th>
                                <th>Meaning</th>
                            </tr>
                            <%while (rsPagination.next()) {%>
                            <tr style="background-color: #CCCCCC">
                                <td><%=rsPagination.getString(2)%></td>
                                <td><%=rsPagination.getString(5)%></td>
                                <td><%=rsPagination.getString(3)%></td>
                                <td><%=rsPagination.getString(4)%></td>
                            </tr>
                            <%}%>
                        </tbody>
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
<%
            try {
                if (psPagination != null) {
                    psPagination.close();
                }
                if (rsPagination != null) {
                    rsPagination.close();
                }

                if (psRowCnt != null) {
                    psRowCnt.close();
                }
                if (rsRowCnt != null) {
                    rsRowCnt.close();
                }

                if (connection != null) {
                    connection.close();
                }
            } catch (Exception ex) {
                out.println("Unable to connect to Database." + ex.getMessage());
            }%>