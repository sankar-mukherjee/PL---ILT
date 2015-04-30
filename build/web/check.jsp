<%-- 
    Document   : check
    Created on : 25 Aug, 2011, 12:01:17 PM
    Author     : Sankar
--%>

<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Check Page</title>
    </head>
    <body>
        <%
                    String email = request.getParameter("email");
                    String password = request.getParameter("password");

                    if ((email != null || password != null) && (email != "" || password != "")) {
                        String connectionURL = "jdbc:mysql://localhost:3306/ide?useUnicode=true&characterEncoding=UTF-8";
                        // declare a connection by using Connection interface
                        Connection connection = null;
                        ResultSet rs = null;
                        Statement statement = null;
                        // Load JBBC driver "com.mysql.jdbc.Driver"
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        try {
                            /* Create a connection by using getConnection() method that takes
                            parameters of string type connection url, user name and password to connect
                            to database. */
                            connection = DriverManager.getConnection(connectionURL, "root", "root");
                            //String resultString = "SELECT username, password FROM userregister";
                            String resultString = "select * from userregister where email='" + email + "' and  password='" + password + "'";
                            statement = connection.createStatement();
                            rs = statement.executeQuery(resultString);

                            int count = 0;
                            while (rs.next()) {

                                session.setAttribute("username", rs.getString(4));
                                session.setAttribute("password", rs.getString(3));
                                count++;
                            }

                            if (count > 0) {%>
        <jsp:forward page="IDEMAIN.jsp"/>
        <%                                //  response.sendRedirect("IDEMAIN.jsp");
                                    } else {%>
        <jsp:forward page="login.jsp"/>
        <%                        // response.sendRedirect("login.jsp");
                                    }

                                } catch (Exception ex) {
                                    out.println("Unable to connect to Database." + ex.getMessage());

                                } finally {
                                    // close all the connections.
                                    rs.close();
                                    statement.close();

                                    connection.close();
                                }
                            } else {%>
        <jsp:forward page="login.jsp"/>
        <%                        //response.sendRedirect("login.jsp");
                    }
        %>
    </body>
</html>