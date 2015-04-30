<%--
    Document   : xml2
    Created on : 29 Jul, 2011, 4:05:37 PM
    Author     : Sankar
--%>

<%@page import="java.io.Writer"%>
<%@page import="java.io.OutputStreamWriter"%>
<%@page import="java.io.FileOutputStream"%>
<%@ page pageEncoding="UTF-8"%>
<%@ page import="form.*" %>
<jsp:useBean id="portfolio" class="form.fetch2" />

<%java.util.Iterator folio = portfolio.getPortfolio();
            GenerateXml stock = null;
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
      
        
   
    
        <%
                    boolean flag = false;
                    ServletContext sc = getServletContext();
                    String file = sc.getRealPath("files/XML.txt");
                    //response.setContentType("application/text");
        //response.setHeader("Content-Disposition","attachment;filename=\"XML.txt\"");
                    
                   // String file = "D:/write.txt";
                    try {
                        // Create file
                        FileOutputStream fstream = new FileOutputStream(file);
                        
                        Writer xml = new OutputStreamWriter(fstream, "UTF8");
                        while (folio.hasNext()) {
                            stock = (GenerateXml) folio.next();
                            xml.write("<lexicon version=1.0 alphabet=ipa xml:lang=bn>" + "\r\n"
                                    + "<lexeme>" + "\r\n"
                                    + "<grapheme>" + stock.getGrapheme() + "</grapheme>" + "\r\n"
                                    + "<phoneme Pos=" + stock.getPos() + ">" + stock.getPhoneme() + "</phoneme>" + "\r\n"
                                    + "<!-- Meaning is: " + stock.getMeaning() + " -->" + "\r\n"
                                    + "<morphology>" + stock.getMorphology() + "</morphology>" + "\r\n"
                                    + "</lexeme>" + "\r\n"
                                    + "</lexicon>" + "\r\n" + "\r\n");
                            flag = true;
                        }
                        //Close the output stream
                        xml.close();
                    } catch (Exception e) {//Catch exception if any
                        System.err.println("Error: " + e.getMessage());
                    }
                    response.setContentType("application/text");

     response.addHeader("Content-Disposition","attachment; filename=\"XML.txt\"");
                    //out.println(file);
                    //if (flag != true) {
                     //   response.sendRedirect("home.jsp");
                   // } else {
                  //      response.sendRedirect("publish.jsp");
                   // }
        %>
    </head>
</html>
