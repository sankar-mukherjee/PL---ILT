<%@page language="java"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <body>
        <%
            String language = request.getParameter("language");
            String I = request.getParameter("iPageNo");
            int M = Integer.parseInt(I);
            int regis = ((Integer) session.getAttribute("regis111")).intValue();
            out.println(regis);
            String connectionURL = "jdbc:mysql://localhost:3306/ide?useUnicode=true&characterEncoding=UTF-8";
            Connection connection = null;
            PreparedStatement pstatement = null;
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            int updateQuery2 = 0;
            for (int i = 0; i < regis; i++) {
                String ID = request.getParameter("id" + i);
                String ORTHOGRAPHY = request.getParameter("ort" + i);
                String POS = request.getParameter("pos" + i);
                String PRONUNCIATION = request.getParameter("pro" + i);
                String MEANING = request.getParameter("mean" + i);
                String ATTRIBUTE = request.getParameter("attr" + i);
                String confirm = request.getParameter("confirm" + i);
                String delete = request.getParameter("delete" + i);
                if (confirm != null && confirm.equals("on")) {
                    out.println(MEANING);
                    try {
                        connection = DriverManager.getConnection(connectionURL, "root", "root");
                        String queryString = "UPDATE " + language + " SET ORTHOGRAPHY = ?, PRONUNCIATION = ?, MEANING = ?,POS = ?, ATTRIBUTE = ? WHERE ID = " + ID;
                        pstatement = connection.prepareStatement(queryString);
                        pstatement.setString(1, ORTHOGRAPHY);
                        pstatement.setString(2, PRONUNCIATION);
                        pstatement.setString(3, MEANING);
                        pstatement.setString(4, POS);
                        pstatement.setString(5, ATTRIBUTE);
                        updateQuery2 = pstatement.executeUpdate();
                    } catch (Exception ex) {
                        out.println("Unable to connect to batabase." + ex.getMessage());
                    } finally {
                        pstatement.close();
                        connection.close();
                    }
                }
                if (delete != null && delete.equals("on")) {
                    try {
                        connection = DriverManager.getConnection(connectionURL, "root", "root");
                        String queryString = "DELETE FROM " + language + " WHERE ID = " + ID;
                        pstatement = connection.prepareStatement(queryString);
                        updateQuery2 = pstatement.executeUpdate();
                    } catch (Exception ex) {
                        out.println("Unable to connect to batabase." + ex.getMessage());
                    } finally {
                        pstatement.close();
                        connection.close();
                    }
                }
            }
            System.out.print(language);
        %>
        <%String url = "edit_language_databse.jsp?iPageNo=" + I + "&language=" + language + "";%>
        <jsp:forward page="<%=url%>"/>
    </body>
</html>
