<%-- 
    Document   : database
    Created on : 31 Jan, 2012, 5:12:04 PM
    Author     : Sankar
--%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%

            if (session.getAttribute("username") == null) {
%>
<jsp:forward page="login.jsp"/>
<%                        //response.sendRedirect("login.jsp"); // GO TO LOGIN PAGE
            }
%>
<%
            request.setCharacterEncoding("UTF-8");
            String pos = request.getParameter("pos");
            String atr = request.getParameter("mor");
            String or = request.getParameter("ort");
            String pon = request.getParameter("pon");
            String mea = request.getParameter("mea");
            String next = request.getParameter("Next");
            String prev = request.getParameter("prev");

            String connectionURL = "jdbc:mysql://localhost:3306/ide?useUnicode=true&characterEncoding=UTF-8";

            Connection connection = null;

            PreparedStatement pstatement = null;
            PreparedStatement pstatement1 = null;

            ResultSet rsPagination = null;
            ResultSet rsRowCnt = null;

            PreparedStatement psPagination = null;
            PreparedStatement psRowCnt = null;

            Class.forName("com.mysql.jdbc.Driver").newInstance();
            int updateQuery = 0;
            int updateQuery1 = 0;

            connection = DriverManager.getConnection(connectionURL, "root", "root");

            if (next != null) {
                String sqlPagination1 = "SELECT SQL_CALC_FOUND_ROWS * FROM banglaorthography WHERE ID = '" + next + "'";
                psPagination = connection.prepareStatement(sqlPagination1);
            } else {
                String sqlPagination2 = "SELECT SQL_CALC_FOUND_ROWS * FROM banglaorthography WHERE ID = '52' ";
                psPagination = connection.prepareStatement(sqlPagination2);
            }
            rsPagination = psPagination.executeQuery();

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="css/Style.css" />
        <script type="text/javascript" src="JavaScript/keyboard.jskeyboard.js" charset="UTF-8"></script>
        <link rel="stylesheet" type="text/css" href="css/keyboard.css">
        <title>All</title>
        <script type="text/javascript" src="JavaScript/chainedselects.js"></script>
        <script type="text/javascript"  language="javascript" src="ii.txt"></script>

    </head>
    <body>
        <div id="container">
            <div id="menu">
                <ul>
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="pls.jsp">PLS</a></li>
                    <li><a href="ipa.jsp">IPA Symbol</a></li>
                    <li><a href="newipamain.jsp">New IPA Symbol</a></li>
                    <li><a href="IDEMAIN.jsp">IDE</a></li>
                    <li><a href="comments.jsp">Comments</a></li>
                    <li><a href="help.jsp">Help</a></li>
                    <li><a href="publish.jsp">Publish</a></li>
                </ul>
            </div>          
<%out.println(pos);out.println(atr);out.println(or);out.println(pon);out.println(mea);out.println(next);
                                %>
            <div id="database">
                <table border="1" cellspacing="5" cellpadding="5">
                    <thead>
                        <tr>
                            <th>Orthography</th>
                            <th>POS</th>
                            <th>Pronunciation</th>
                            <th>Meaning</th>
                            <th>Morphology</th>
                        </tr>
                    </thead>
                    <tbody>

                    <form action="database.jsp" method="get">
                        <%while (rsPagination.next()) {%>
                        <tr style="background-color: scrollbar">
                            <td><input type="text" name="ort" id="" value="<%=rsPagination.getString(2)%>" /></td>
                            <td><input type="text" name="pos" id="" value="<%=rsPagination.getString(3)%>" /></td>
                            <td><input type="text" name="pon" id="" value="<%=rsPagination.getString(4)%>" /></td>
                            <td><input type="text" name="mea" id="" value="<%=rsPagination.getString(5)%>" /></td>
                            <td><input type="text" name="mor" id="atr" value="<%=rsPagination.getString(6)%>" /></td>
                            <td><input type="submit" value="<%=rsPagination.getString(1)%>" name="Next" id="Next"/></td>
                        </tr>
                        <%}%>
                    </form>

                    </tbody>
                </table>
            </div>

            <p>&nbsp;</p>
        </div>
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
            } finally {
                // close all the connections.

                if (pos != null && or != null && pon != null) {
                    pstatement.close();
                }

            }%>
