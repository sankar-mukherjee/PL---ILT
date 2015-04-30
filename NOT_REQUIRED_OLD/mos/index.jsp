<%--
    Document   : newjsp
    Created on : 19 May, 2011, 2:15:10 PM
    Author     : Sankar
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<html>
    <head>        
        <link rel="shortcut icon" type="image/x-icon" href="Images/favicon.ico">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="css/Style.css" />
        <title>MOS</title>
        <script type="text/javascript">
            function check(id){
                if(document.getElementById(id).value >5 || document.getElementById(id).value <1){
                    alert("enter value between 1 - 5");
                }

            }

        </script>
    </head>

    <body>
        <div id="container">            
            <div id="content">
                <table style="text-align:left" class="wikitable" cellspacing="3" cellpadding="3">
                    <tbody><tr>
                            <th>Score</th>
                            <th>Quality</th>
                            <th>Description</th>
                        </tr>
                        <tr>
                            <th>5</th>
                            <td>Excellent</td>
                            <td>totally understandable</td>
                        </tr>
                        <tr>
                            <th>4</th>
                            <td>Good</td>
                            <td>understandable but not annoying</td>
                        </tr>
                        <tr>
                            <th>3</th>
                            <td>Fair</td>
                            <td>Slightly annoying</td>
                        </tr>
                        <tr>
                            <th>2</th>
                            <td>Poor</td>
                            <td>Annoying</td>
                        </tr>
                        <tr>
                            <th>1</th>
                            <td>Bad</td>
                            <td>Very annoying</td>
                        </tr>
                    </tbody></table>
                <p>&nbsp;</p>
                <h1>Please play the sound and put your score below it. Your score has to be between 1 to 5. see the upper table for total description.</h1>

                <form action="index.jsp" method="get">
                    <p>&nbsp;</p>
                    <table border="1">
                        <tbody>
                            <tr>
                                <td><audio controls="controls">
                            <source src="../sound/A1LIPUR.wav" type="audio/wav" />
                        </audio></td>
                        <td><audio controls="controls">
                            <source src="sound/ARA1ID0A1NG0A1.wav" type="audio/wav" />
                        </audio></td>
                        <td><audio controls="controls">
                            <source src="sound/HORIPA1L.wav" type="audio/wav" />
                        </audio></td>
                        </tr>
                        <tr>
                            <td colspan="3">Score</td>
                        </tr>
                        <tr>
                            <td><input type="text" id="ali" name="ali" value="" onblur="check(this.id)"/></td>
                            <td><input type="text" id="arai" name="arai" value="" onblur="check(this.id)"/></td>
                            <td><input type="text" id="hori" name="hori" onblur="check(this.id)"/></td>
                        </tr>
                        </tbody>
                    </table>
                    <p>&nbsp;</p>
                    <table border="1">
                        <tbody>
                            <tr>
                                <td><audio controls="controls">
                            <source src="sound/b1a1rotiyo.wav" type="audio/wav" />
                        </audio></td>
                        <td><audio controls="controls">
                            <source src="sound/domjur.wav" type="audio/wav" />
                        </audio></td>
                        <td><audio controls="controls">
                            <source src="sound/hariye.wav" type="audio/wav" />
                        </audio></td>
                        </tr>
                        <tr>
                            <td colspan="2">Score</td>
                        </tr>
                        <tr>
                            <td><input type="text" id="bha" name="bha"value="" onblur="check(this.id)"/></td>
                            <td><input type="text" id="dom" name="dom" value="" onblur="check(this.id)"/></td>
                            <td><input type="text" id="hari" name="hari" value="" onblur="check(this.id)"/></td>
                        </tr>
                        </tbody>
                    </table>
                    <p>&nbsp;</p>
                    <table border="1">
                        <tbody>
                            <tr>
                                <td><audio controls="controls">
                            <source src="sound/janota.wav" type="audio/wav" />
                        </audio></td>
                        <td><audio controls="controls">
                            <source src="sound/tapon.wav" type="audio/wav" />
                        </audio></td>
                        <td><audio controls="controls">
                            <source src="sound/tomluk.wav" type="audio/wav" />
                        </audio></td>
                        </tr>
                        <tr>
                            <td colspan="2">Score</td>
                        </tr>
                        <tr>
                            <td><input type="text" id="jon" name="jon" value="" onblur="check(this.id)"/></td>
                            <td><input type="text" id="tap" name="tap" value="" onblur="check(this.id)"/></td>
                            <td><input type="text" id="tom" name="tom" value="" onblur="check(this.id)"/></td>
                        </tr>
                        </tbody>
                    </table>
                    <table border="1">
                        <tbody>
                            <tr>
                                <td><audio controls="controls">
                            <source src="sound/trinomul.wav" type="audio/wav" />
                        </audio></td>
                        <td><audio controls="controls">
                            <source src="sound/A1LIPUR.wav.wav" type="audio/wav" />
                        </audio></td>
                        <td><audio controls="controls">
                            <source src="sound/ARA1ID0A1NG0A1.wav.wav" type="audio/wav" />
                        </audio></td>
                        </tr>
                        <tr>
                            <td colspan="2">Score</td>
                        </tr>
                        <tr>
                            <td><input type="text" id="tri" name="tri" value="" onblur="check(this.id)"/></td>
                            <td><input type="text" id="oali" name="oali" value="" onblur="check(this.id)"/></td>
                            <td><input type="text" id="oarai" name="oarai" value="" onblur="check(this.id)"/></td>
                        </tr>
                        </tbody>
                    </table>
                    <table border="1">
                        <tbody>
                            <tr>
                                <td><audio controls="controls">
                            <source src="sound/D0OMJUR.wav.wav" type="audio/wav" />
                        </audio></td>
                        <td><audio controls="controls">
                            <source src="sound/HORIPA1L.wav.wav" type="audio/wav" />
                        </audio></td>
                        <td><audio controls="controls">
                            <source src="sound/TAPON.wav.wav" type="audio/wav" />
                        </audio></td>
                        </tr>
                        <tr>
                            <td colspan="2">Score</td>
                        </tr>
                        <tr>
                            <td><input type="text" id="odom" name="odom" value="" onblur="check(this.id)"/></td>
                            <td><input type="text" id="ohori" name="ohori" value="" onblur="check(this.id)"/></td>
                            <td><input type="text" id="otap" name="otap" value="" onblur="check(this.id)"/></td>
                        </tr>
                        </tbody>
                    </table>
                    <table border="1">
                        <tbody>
                            <tr>
                                <td><audio controls="controls">
                            <source src="sound/TOMLUK.wav.wav" type="audio/wav" />
                        </audio></td>
                        <td><audio controls="controls">
                            <source src="sound/b1a1rotiyo.wav.wav" type="audio/wav" />
                        </audio></td>
                        <td><audio controls="controls">
                            <source src="sound/hariye.wav.wav" type="audio/wav" />
                        </audio></td>
                        </tr>
                        <tr>
                            <td colspan="2">Score</td>
                        </tr>
                        <tr>
                            <td><input type="text" id="otom" name="otom" value="" onblur="check(this.id)"/></td>
                            <td><input type="text" id="obha" name="obha" value="" onblur="check(this.id)"/></td>
                            <td><input type="text" id="ohari" name="ohari" value="" onblur="check(this.id)"/></td>
                        </tr>
                        </tbody>
                    </table>
                    <table border="1">
                        <tbody>
                            <tr>
                                <td><audio controls="controls">
                            <source src="sound/janota.wav.wav" type="audio/wav" />
                        </audio></td>
                        <td><audio controls="controls">
                            <source src="sound/trinomul.wav.wav" type="audio/wav" />
                        </audio></td>
                        </tr>
                        <tr>
                            <td colspan="2">Score</td>
                        </tr>
                        <tr>
                            <td><input type="text" id="ojon" name="ojon" value="" onblur="check(this.id)"/></td>
                            <td><input type="text" id="otri" name="otri" value="" onblur="check(this.id)"/></td>
                        </tr>
                        </tbody>
                    </table>
                    <p>&nbsp;</p>
                    <table border="1">
                        <tbody>
                            <tr>
                                <td>Your Name</td>
                                <td><input type="text" name="name" value="" /></td>
                            </tr>
                            <tr>
                                <td colspan="2"><input type="submit" value="OK" /></td>
                            </tr>
                        </tbody>
                    </table>
                    <p>&nbsp;</p>
                    <%

                                String otri = request.getParameter("otri");
                                String tri = request.getParameter("tri");
                                String otap = request.getParameter("otap");
                                String tap = request.getParameter("tap");
                                String otom = request.getParameter("otom");
                                String tom = request.getParameter("tom");
                                String ali = request.getParameter("ali");
                                String oali = request.getParameter("oali");
                                String arai = request.getParameter("arai");
                                String oarai = request.getParameter("oarai");
                                String dom = request.getParameter("dom");
                                String odom = request.getParameter("odom");
                                String ohori = request.getParameter("ohori");
                                String hori = request.getParameter("hori");
                                String bha = request.getParameter("bha");
                                String obha = request.getParameter("obha");
                                String hari = request.getParameter("hari");
                                String ohari = request.getParameter("ohari");
                                String jon = request.getParameter("jon");
                                String ojon = request.getParameter("ojon");

                                String name = request.getParameter("name");
                    %>
                    <%
                                if (otri != null) {
                                    if (otri != "") {
                                        int o = Integer.parseInt(otri) + Integer.parseInt(otap) + Integer.parseInt(otom)
                                                + Integer.parseInt(oali) + Integer.parseInt(oarai) + Integer.parseInt(odom)
                                                + Integer.parseInt(obha) + Integer.parseInt(ohori) + Integer.parseInt(ohari)
                                                + Integer.parseInt(ojon);
                                        int s = Integer.parseInt(tri) + Integer.parseInt(tap) + Integer.parseInt(tom)
                                                + Integer.parseInt(ali) + Integer.parseInt(arai) + Integer.parseInt(dom)
                                                + Integer.parseInt(bha) + Integer.parseInt(hori) + Integer.parseInt(hari)
                                                + Integer.parseInt(jon);
                                        String osum = Integer.toString(o);
                                        String ssum = Integer.toString(s);
                                        // String osum = "sdf";
                                        //  String ssum = "sf";
                                        String connectionURL = "jdbc:mysql://localhost:3306/ide?useUnicode=true&characterEncoding=UTF-8";
                                        // declare a connection by using Connection interface
                                        Connection connection = null;
                                        // declare object of Statement interface that uses for executing sql statements.
                                        PreparedStatement pstatement = null;
                                        // Load JBBC driver "com.mysql.jdbc.Driver"
                                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                                        int updateQuery = 0;
                                        try {
                                            /* Create a connection by using getConnection() method that takes
                                            parameters of string type connection url, user name and password to connect
                                            to database. */
                                            connection = DriverManager.getConnection(connectionURL, "root", "root");


                                            // sql query to insert values in the secified table.
                                            String queryString = "INSERT INTO mos (NAME, SSUM, OSUM) VALUES(?,?,?)";
                                            /* createStatement() is used for create statement object that is used for
                                            sending sql statements to the specified database. */
                                            pstatement = connection.prepareStatement(queryString);
                                            pstatement.setString(1, name);
                                            pstatement.setString(2, ssum);
                                            pstatement.setString(3, osum);

                                            updateQuery = pstatement.executeUpdate();
                                            if (updateQuery != 0) {%>
                    <br>
                    <table WIDTH="30%" border="1">
                        <tr><th>Data is inserted successfully
                                in database.</th></tr>
                    </table>
                    <%}

                                        } catch (Exception ex) {
                                            out.println("Unable to connect to Database." + ex.getMessage());

                                        } finally {
                                            // close all the connections.


                                            pstatement.close();
                                            connection.close();
                                        }
                                    }
                                }%>
                </form>

            </div>
        </div>
        <div id="footer"><h3><a href="http://www.iitkgp.ernet.in">IIT KGP</a> | <a href="#">CET</a></h3></div>
    </body>
</html>
