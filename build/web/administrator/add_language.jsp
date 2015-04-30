<%@page import="java.util.ArrayList"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page import="java.io.*,java.util.*,javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="shortcut icon" type="image/x-icon" href="../Images/favicon.ico"></link>
        <title>Add New Languages</title>
        <link rel="stylesheet" href="../css/nivo-slider.css" type="text/css" media="screen" />

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
                                                    <td><img src="../assets/logo.png" width="80" height="80" /></td>
                                                    <td align="center">
                                                        <a style="color: white; font-size:200%"> Register Language</a>
                                                        </br>
                                                    </td>
                                                    <td><img src="../assets/gov.jpg" width="80" height="80" /></td>
                                                </tr>
                                            </table>
                                        </td>                                        
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>                                                                
            <tr><td height="300" align="center" valign="middle">
                    <%
                        request.setCharacterEncoding("UTF-8");
                        File file;
                        String format = "none";
                        int maxFileSize = 100000 * 1024;
                        int maxMemSize = 100000 * 1024;
                        ServletContext context = pageContext.getServletContext();
                        String solution = null;
                        String fileName = null;
                        String sourse = "/home/ide/Desktop/ide_language_folder/";

                        DiskFileItemFactory factory = new DiskFileItemFactory();
                        factory.setSizeThreshold(maxMemSize);
                        factory.setRepository(new File("/home/ide/Desktop/ide_language_folder/"));

                        ServletFileUpload upload = new ServletFileUpload(factory);
                        upload.setSizeMax(maxFileSize);
                        try {
                            List fileItems = upload.parseRequest(request);
                            Iterator i = fileItems.iterator();
                            while (i.hasNext()) {
                                FileItem fi = (FileItem) i.next();
                                if (!fi.isFormField()) {
                                    String fieldName = fi.getFieldName();
                                    fileName = fi.getName();

                                    solution = sourse.concat(fileName);
                                    boolean isInMemory = fi.isInMemory();
                                    long sizeInBytes = fi.getSize();
                                    if (fileName.lastIndexOf("\\") >= 0) {
                                        file = new File(sourse
                                                + fileName.substring(fileName.lastIndexOf("\\")));
                                    } else {
                                        file = new File(sourse
                                                + fileName.substring(fileName.lastIndexOf("\\") + 1));
                                    }
                                    fi.write(file);
                                }
                            }
                        } catch (Exception ex) {
                            System.out.println(ex);
                        }

                        String connectionURL = "jdbc:mysql://localhost:3306/ide?useUnicode=true&characterEncoding=UTF-8";
                        Connection connection = null;
                        PreparedStatement pstatement = null;
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        connection = DriverManager.getConnection(connectionURL, "root", "root");

                        String connectionURL_temp = "jdbc:mysql://localhost:3306/ide_temp?useUnicode=true&characterEncoding=UTF-8";
                        Connection connection_temp = null;
                        connection_temp = DriverManager.getConnection(connectionURL_temp, "root", "root");

                        
                        String lan = fileName.replace(".txt", "");
                        lan = lan.toLowerCase();
                        int updateQuery = 0;
                        int updateQuery_format = 0;

                        if (lan != null) {
                            if (lan != " ") {
                                try {
                                    //String queryString = "CREATE TABLE " + lan + "(ID INT UNSIGNED NOT NULL AUTO_INCREMENT," + "PRIMARY KEY(ID),ORTHOGRAPHY VARCHAR(50) NOT NULL,PRONUNCIATION VARCHAR(50),MEANING VARCHAR(50),POS VARCHAR(20),ATTRIBUTE VARCHAR(20))";
                                    String queryString = "CREATE TABLE " + lan + "(ID INT UNSIGNED NOT NULL AUTO_INCREMENT," + "PRIMARY KEY(ID),ORTHOGRAPHY VARCHAR(50) CHARACTER SET utf8 collate utf8_general_ci NOT NULL,PRONUNCIATION VARCHAR(50) CHARACTER SET utf8 collate utf8_general_ci,MEANING VARCHAR(50) CHARACTER SET utf8 collate utf8_general_ci,POS VARCHAR(20) CHARACTER SET utf8 collate utf8_general_ci,ATTRIBUTE VARCHAR(20) CHARACTER SET utf8 collate utf8_general_ci)ENGINE=InnoDB DEFAULT CHARSET=utf8";
                                    pstatement = connection.prepareStatement(queryString);
                                    updateQuery = pstatement.executeUpdate();

                                    pstatement = connection_temp.prepareStatement(queryString);
                                    updateQuery = pstatement.executeUpdate();

                                    String queryString1 = "ALTER TABLE " + lan + " ADD UNIQUE INDEX `Index_2`(`ORTHOGRAPHY`, `POS`)";
                                    pstatement = connection.prepareStatement(queryString1);
                                    updateQuery = pstatement.executeUpdate();

                                    pstatement = connection_temp.prepareStatement(queryString1);
                                    updateQuery = pstatement.executeUpdate();

                                    //String queryString2 = "CREATE TABLE " + lan + "_g2p (ID INT UNSIGNED NOT NULL AUTO_INCREMENT," + "PRIMARY KEY(ID),IPA VARCHAR(50),GRAPHEME VARCHAR(50),UNICODE VARCHAR(50))";
                                    String queryString2 = "CREATE TABLE " + lan + "_g2p (ID INT UNSIGNED NOT NULL AUTO_INCREMENT," + "PRIMARY KEY(ID),IPA VARCHAR(50) CHARACTER SET utf8 collate utf8_general_ci,GRAPHEME VARCHAR(50) CHARACTER SET utf8 collate utf8_general_ci,UNICODE VARCHAR(50) CHARACTER SET utf8 collate utf8_general_ci)ENGINE=InnoDB DEFAULT CHARSET=utf8";
                                    pstatement = connection.prepareStatement(queryString2);
                                    updateQuery = pstatement.executeUpdate();
                                    
                                    request.setCharacterEncoding("UTF-8");
                                    String line = null;
                                    FileReader filereader = new FileReader(solution);
                                    BufferedReader bufferedReader = new BufferedReader(filereader);
                                    while ((line = bufferedReader.readLine()) != null) {
                                        String[] WW = line.split("\\s+");
                                        if (WW.length == 3) {
                                            String queryString4 = "INSERT INTO " + lan + "_g2p (IPA, GRAPHEME, UNICODE) VALUES(?,?,?)";
                                            pstatement = connection.prepareStatement(queryString4);
                                            pstatement.setString(1, WW[0]);
                                            pstatement.setString(2, WW[1]);
                                            pstatement.setString(3, WW[2]);
                                            updateQuery_format = pstatement.executeUpdate();
                                        } else {
                                            out.println("<a style='color: #0066FF; font-size: large'> BAD DATA FORMAT</a><br>");
                                        }
                                    }
                                    bufferedReader.close();

                                    String queryString3 = "INSERT INTO language_list (LANGUAGE_NAME ) VALUES('" + lan + "')";
                                    pstatement = connection.prepareStatement(queryString3);
                                    updateQuery = pstatement.executeUpdate();

                                    if (updateQuery != 0) {
                                        out.println(lan + "<br/><a style='color: #0066FF; font-size: large'> Successfully Registered</a>");
                                    }else if(updateQuery_format != 0){
                                        out.println(lan + "<br/><a style='color: #0066FF; font-size: large'>There is a problem in your uploaded File."
 + "Check the File content.</a>");
                                    }
                                    
                                } catch (Exception ex) {
                                    out.println(ex);
                                } finally {
                                    pstatement.close();
                                    connection.close();
                                    connection_temp.close();
                                }
                            }
                        }
                    %>
                    </br>
                    <hr></hr>
                    <a href="language.jsp" style="color: #0475FF">Go Back</a>
                </td></tr>
        </table>
    </body>
</html>
