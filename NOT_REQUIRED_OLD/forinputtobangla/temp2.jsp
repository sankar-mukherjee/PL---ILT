<%--
    Document   : temp
    Created on : 19 Jul, 2011, 10:30:25 AM
    Author     : Sankar
--%>

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" src="JavaScript/keyboard.js" charset="UTF-8"></script>
        <link rel="stylesheet" type="text/css" href="css/keyboard.css">
    </head>
    <body>
        <FORM action="temp2.jsp" method="get" >
        <table border="1">
                            <thead>
                                <tr>

                                    <th colspan="3"><table border="0" width="100%">
                                            <thead>
                                                <tr>
                                                    <th colspan="3">Occurrence in Hindi Words</th>
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
                                    <th>dipthong</th>

                                </tr>
                            </thead>
                            <tbody>

                                <tr>
                                    <td style="background-color: #b56a9e"><input type="text" name="initiall" value=""  class="keyboardInput"/></td>
                                    <td style="background-color: #b56a9e"><input type="text" name="medially" value=""  class="keyboardInput"/></td>
                                    <td style="background-color: #b56a9e"><input type="text" name="finally" value="" class="keyboardInput"/></td>
                                    <td style="background-color: #b56a9e"><input type="text" name="dip" value="" /></td>
                                </tr>
                                <tr>
                                    <td align="left" colspan="5"><textarea name="commen" rows="10" cols="100" style="border: #061C37;border-style: groove; margin: 1em"></textarea></td>
                                </tr>
                            </tbody>
                        </table>
        <p>&nbsp;</p>
                        <p>&nbsp;</p>
                        <input type="submit" value="Submit" name="submit" />
                        <p>&nbsp;</p>
        <%
                                    request.setCharacterEncoding("UTF-8");
                                    String place = request.getParameter("dip");
                                    String initiall = request.getParameter("initiall");
                                    String medially = request.getParameter("medially");
                                    String finall = request.getParameter("finally");
                                    if ( place != null ) {
                                        // check if the text box having only blank spaces
                                        if (place != "" ) {
                                            /* Create string of connection url within specified format with machine name,
                                            port number and database name. Here machine name id localhost and database name is student. */
                                            String connectionURL = "jdbc:mysql://localhost:3306/ide?useUnicode=true&characterEncoding=UTF-8";
                                            // declare a connection by using Connection interface
                                            Connection connection = null;
                                            // declare object of Statement interface that uses for executing sql statements.
                                            PreparedStatement pstatement = null;
                                            ResultSet rs = null;
                                            Statement statement = null;
                                            // Load JBBC driver "com.mysql.jdbc.Driver"
                                            Class.forName("com.mysql.jdbc.Driver").newInstance();
                                            int updateQuery = 0;
                                            // check if the text box is empty
                                            try {
                                                /* Create a connection by using getConnection() method that takes
                                                parameters of string type connection url, user name and password to connect
                                                to database. */
                                                connection = DriverManager.getConnection(connectionURL, "root", "root");
                                                // sql query to insert values in the secified table.
                                                String queryString = "INSERT INTO bangladip (INITIALL, MEDIALLY, FINALL, DIP) VALUES (?,?,?,?)";
                                                /* createStatement() is used for create statement object that is used for
                                                sending sql statements to the specified database. */
                                                pstatement = connection.prepareStatement(queryString);
                                                pstatement.setString(1, initiall);
                                                pstatement.setString(2, medially);
                                                pstatement.setString(3, finall);
                                                pstatement.setString(4, place);

                                                updateQuery = pstatement.executeUpdate();
                                                // sql query to retrieve values from the secified table.

                                                if (updateQuery != 0) {}
                                                                    } catch (Exception ex) {
                                                                        out.println("Unable to connect to Database." + ex.getMessage());

                                                                    } finally {
                                                                        // close all the connections.

                                                                        pstatement.close();
                                                                        connection.close();
                                                                    }
                                                                }}

                        %>
                        </FORM>
    </body>
</html>
