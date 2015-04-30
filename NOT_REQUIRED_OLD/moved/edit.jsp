<%@page language="java"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<body>
<%
  //String MS=request.getParameter("ms");
String language = request.getParameter("language");
  String I=request.getParameter("iPageNo");
  int M = Integer.parseInt(I);
  String ID=request.getParameter("id");
  String ORTHOGRAPHY = request.getParameter("ort");
  String POS  = request.getParameter("pos");
  String PRONUNCIATION = request.getParameter("pro");
  String MEANING = request.getParameter("mean");
  String connectionURL = "jdbc:mysql://localhost:3306/ide?useUnicode=true&characterEncoding=UTF-8";
  Connection connection = null;
  PreparedStatement pstatement = null;
  Class.forName("com.mysql.jdbc.Driver").newInstance();
         int updateQuery2 = 0;
         if(ORTHOGRAPHY!=null && PRONUNCIATION!=null && MEANING!=null &&POS!=null)
         {
            if(ORTHOGRAPHY!=" " && PRONUNCIATION!=" " && MEANING!=" " &&POS!=" ")
             {
              try
              {
              connection = DriverManager.getConnection(connectionURL, "root", "root");
              String queryString = "UPDATE " + language + " SET ORTHOGRAPHY = ?, PRONUNCIATION = ?, MEANING = ?,POS = ?, ATTRIBUTE = ? WHERE ID = "+ID;
              pstatement = connection.prepareStatement(queryString);
              pstatement.setString(1, ORTHOGRAPHY);
              pstatement.setString(2, PRONUNCIATION);
              pstatement.setString(3, MEANING);
              pstatement.setString(4, POS);
              pstatement.setString(5, MEANING);
              updateQuery2 = pstatement.executeUpdate();
              if(updateQuery2!=0){%>
               <jsp:forward page="xxx3.jsp?iPageNo=<%=I%>&language=<%=language%>"/>
              <%
}
              }
    catch (Exception ex) {
            out.println("Unable to connect to batabase." + ex.getMessage());

               }
            finally {
                // close all the connections.
                pstatement.close();
               
                connection.close();
            }
}
}
%>

   </body>
</html>
