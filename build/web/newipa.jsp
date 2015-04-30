<%--
    Document   : newjsp
    Created on : 19 May, 2011, 2:15:10 PM
    Author     : Sankar
--%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="shortcut icon" type="image/x-icon" href="Images/favicon.ico"></link>
        <script type="text/javascript" src="JavaScript/keyboard.js" charset="UTF-8"></script>
        <link rel="stylesheet" type="text/css" href="css/keyboard.css" />
        <title>Add New IPA Symbol</title>
        <link rel="stylesheet" href="css/nivo-slider.css" type="text/css" media="screen" />
        <script type="text/javascript">
            function makeChoice()
            {
                var val = 0;
                for( i = 0; i < document.form1.cons.length; i++ )
                {
                    if( document.form1.cons[i].checked == true )
                    {
                        val = document.form1.cons[i].value;
                        if(val=='con'||val=='vow')
                        {
                            document.getElementById("place").style.display = "table";
                            document.getElementById("manner").style.display = "table";
                            document.getElementById("dip").style.display = "none";
                        }
                        else if(val == 'dipt')
                        {

                            document.getElementById("place").style.display = "none";
                            document.getElementById("manner").style.display = "none";
                            document.getElementById("dip").style.display = "table";
                           
                        }
                    }
                }
            }
        </script>
    </head>
    <body style="background-image: none">
        <%
                    request.setCharacterEncoding("UTF-8");
                    String lang12 = request.getParameter("lang");
                    String ipa12 = request.getParameter("ipa");
                    String grapheme12 = request.getParameter("grapheme");
                    String place12 = request.getParameter("place");
                    String manner12 = request.getParameter("manner");
                    String initiall12 = request.getParameter("initiall");
                    String medially12 = request.getParameter("medially");
                    String finall12 = request.getParameter("finall");
                    String dip12 = request.getParameter("dip");
                    String pm12 = request.getParameter("pm");
                    String sound12 = request.getParameter("sound");

                    if (ipa12 != null && grapheme12 != null && lang12 != null) {
                        // check if the text box having only blank spaces
                        if (ipa12 != "" && grapheme12 != "" && lang12 != "") {
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

                                String resultString = "SELECT IPA, GRAPHEME FROM " + lang12 + " WHERE IPA = '" + ipa12 + "' AND GRAPHEME = '" + grapheme12 + "'";
                                statement = connection.createStatement();
                                rs = statement.executeQuery(resultString);

                                // sql query to insert values in the secified table.
                                String queryString = "INSERT INTO " + lang12 + "(IPA, GRAPHEME, INITIALL, MEDIALLY, FINALL, PLACE, MANNER, PM, DIP) VALUES (?,?,?,?,?,?,?,?,?)";
                                /* createStatement() is used for create statement object that is used for
                                sending sql statements to the specified database. */
                                pstatement = connection.prepareStatement(queryString);
                                pstatement.setString(1, ipa12);
                                pstatement.setString(2, grapheme12);
                                pstatement.setString(3, initiall12);
                                pstatement.setString(4, medially12);
                                pstatement.setString(5, finall12);
                                pstatement.setString(6, place12);
                                pstatement.setString(7, manner12);
                                pstatement.setString(8, pm12);
                                pstatement.setString(9, dip12);

                                if (!rs.next()) {
                                    updateQuery = pstatement.executeUpdate();%>
        <a style="font-size: large; color: #DF0000">Successfully Inserted</a>
        <%} else {%>
        <a style="font-size: large; color: #DF0000">Data Already exists </a>
        <%                                                                }


                                        if (updateQuery == 0) {%>
        <a style="font-size: large; color: #DF0000"> No update</a>
        <%}
                            } catch (Exception ex) {
                                out.println("Unable to connect to Database." + ex.getMessage());

                            } finally {
                                // close all the connections.
                                pstatement.close();
                                connection.close();
                            }
                        }
                    }
        %>
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td height="251" align="center" valign="top">
                    <table width="900" height="366" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="center" valign="top">                                
                                <form action="newipa2.jsp" method="get" name="form1">
                                    <table border="0">
                                        <tr>
                                            <td>
                                                <table border="1" >
                                                    <tbody>
                                                        <tr>
                                                            <td style="background-color: #2F89DF">
                                                                <table border="0" cellspacing="5" cellpadding="5" align="center">
                                                                    <tbody>
                                                                        <tr>
                                                                            <td>Select Language</td>
                                                                            <td>
                                                                                 <select name="language">
                                                    <%
                                                        request.setCharacterEncoding("UTF-8");
                                                        String connectionURL1 = "jdbc:mysql://localhost:3306/ide?useUnicode=true&characterEncoding=UTF-8";
                                                        Connection connection4 = null;

                                                        ResultSet rs4 = null;
                                                        Statement statement4 = null;
                                                        int updateQuery1 = 0;
                                                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                                                        connection4 = DriverManager.getConnection(connectionURL1, "root", "root");
                                                        try {
                                                            String resultString = "SELECT * FROM language_list";
                                                            statement4 = connection4.createStatement();
                                                            rs4 = statement4.executeQuery(resultString);

                                                            while (rs4.next()) {
                                                                out.println("<option>" + rs4.getString(2) + "</option>");
                                                            }

                                                        } catch (Exception ex) {
                                                            out.println("Unable to connect to Database." + ex.getMessage());
                                                        } finally {
                                                            rs4.close();
                                                            statement4.close();
                                                            connection4.close();
                                                        }
                                                    %>
                                                </select>
                                                                            </td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <table border="0" cellspacing="5" cellpadding="5" style="background-color:#0475FF">
                                                                    <tbody>
                                                                        <tr>
                                                                            <td>IPA Symbols</td>
                                                                            <td>Related Grapheme</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="left">
                                                                                <input type="text" name="ipa" value="" style="font-size: xx-large" class="keyboardInput"/>
                                                                            </td>
                                                                            <td align="left">
                                                                                <input type="text" name="grapheme" value="" style="font-size: xx-large" class="keyboardInput"/>
                                                                            </td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>                                                                
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="background-color: #2F89DF">
                                                                <table border="0" cellspacing="5" cellpadding="5" align="center">
                                                                    <tbody>
                                                                        <tr>
                                                                            <td>Select Phoneme Type</td>
                                                                            <td>
                                                                                <input type="radio" name="cons" value="con"  onclick="makeChoice();"/>Consonant
                                                                                <input type="radio" name="cons" value="vow" onclick="makeChoice();"/>Vowel
                                                                                <input type="radio" name="cons" value="dipt" onclick="makeChoice();"/>Diphthong
                                                                            </td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="background-color:  #2F89DF">
                                                                <table border="0" cellpadding="5" cellspacing="5" align="center" >
                                                                    <tbody>
                                                                        <tr>
                                                                            <td>Place of Articulation</td>
                                                                            <td>Manner of Articulation</td>
                                                                            <td>Diphthong</td>                                                                            
                                                                        </tr>
                                                                        <tr>
                                                                            <td> <input type="text" name="place" value="" id="place"/></td>
                                                                            <td> <input type="text" name="manner" value="" id="manner"/></td>
                                                                            <td><input type="text" name="dip" value=""  id="dip"/></td>
                                                                        </tr>                                                                        
                                                                    </tbody>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center">
                                                <h2>Example Words</h2>
                                                <table border="1">
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                <table border="0" cellspacing="5" cellpadding="5" style="background-color:#2F89DF">
                                                                    <tbody>
                                                                        <tr>
                                                                            <td>Initially</td>
                                                                            <td>Medially</td>
                                                                            <td>Finally</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="left">
                                                                                <input type="text" name="initiall" value=""  class="keyboardInput"/>
                                                                            </td>
                                                                            <td align="left">
                                                                                <input type="text" name="medially" value=""  class="keyboardInput"/>
                                                                            </td>
                                                                            <td align="left">
                                                                                <input type="text" name="finally" value="" class="keyboardInput"/>
                                                                            </td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center">
                                                <h2>Upload Corresponding Sound Files</h2>
                                                <table border="1">
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                <table border="0" cellspacing="5" cellpadding="5" style="background-color: #2F89DF">
                                                                    <tbody>
                                                                        <tr>
                                                                            <td><input type="file" name="sound" size=" "/></td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <input type="submit" value="Submit" name="submit"style="height: 30px; width: 100px"/>
                                            </td>
                                        </tr>
                                    </table>
                                </form>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </body>
</html>
