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
        <title>IDE</title>
        <link rel="stylesheet" href="css/nivo-slider.css" type="text/css" media="screen" />
        <script type="text/javascript" src="JavaScript/keyboard.js" charset="UTF-8"></script>
        <link rel="stylesheet" type="text/css" href="css/keyboard.css" />
        <script type="text/javascript" src="JavaScript/chainedselects.js"></script>
        <script type="text/javascript"  language="javascript" src="ii.txt"></script>

    </head>
    <body style="background-image: none">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td height="251" align="center" valign="top">
                    <table width="900" height="366" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                            <td valign="top">
                                <table width="900" border="0" cellspacing="0" align="center" cellpadding="0">
                                    <tr>
                                        <td>
                                            <%
                                                        request.setCharacterEncoding("UTF-8");
                                                        String connectionURL = "jdbc:mysql://localhost:3306/ide_temp?useUnicode=true&characterEncoding=UTF-8";
                                                        Connection connection = null;
                                                        PreparedStatement pstatement = null;
                                                        ResultSet rs = null;
                                                        Statement statement = null;
                                                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                                                        connection = DriverManager.getConnection(connectionURL, "root", "root");
                                                        int updateQuery = 0;


                                                        String pos33 = request.getParameter("pos33");
                                                        String lan = request.getParameter("lan");
                                                        String ort = request.getParameter("ortho");

                                                        if (pos33 != null && pos33 != "") {
                                                            pos33 = pos33.substring(0, pos33.length() - 1);
                                                            String[] pos44 = pos33.split("/");

                                                            for (int n = 0; n < pos44.length; n++) {
                                                                String pos_n = request.getParameter("pos" + n);
                                                                String pon_n = request.getParameter("pon" + n);
                                                                String mea_n = request.getParameter("mea" + n);
                                                                String idi_n = request.getParameter("idi" + n);
                                                                String att = "3";
                                                                if (pon_n.length() == 0 && idi_n.length() != 0) {
                                                                    att = "2";
                                                                } else if (pon_n.length() != 0 && idi_n.length() == 0) {
                                                                    att = "1";
                                                                }
                                                                //String att = "1";
                                                                String[] pos_1 = pos_n.split("\\.");
                                                                connection = DriverManager.getConnection(connectionURL, "root", "root");

                                                                try {
                                                                    String resultString = null;
                                                                    if (att.equals("3")) {
                                                                        resultString = "SELECT * FROM " + lan + " WHERE ORTHOGRAPHY = '" + ort + "' AND POS like '%" + pos_1[0] + "%'";
                                                                    } else {
                                                                        resultString = "SELECT * FROM " + lan + " WHERE ORTHOGRAPHY = '" + ort + "' AND POS like '%" + pos_1[0] + "%' AND ATTRIBUTE='" + att + "'";
                                                                    }
                                                                    statement = connection.createStatement();
                                                                    rs = statement.executeQuery(resultString);

                                                                    String queryString = "INSERT INTO " + lan + "(ORTHOGRAPHY, PRONUNCIATION, MEANING, POS, ATTRIBUTE) VALUES(?,?,?,?,?)";
                                                                    pstatement = connection.prepareStatement(queryString);

                                                                    if (!rs.next()) {

                                                                        if (pon_n != null && pon_n != "") {
                                                                            att="1";
                                                                            pstatement.setString(1, ort);
                                                                            pstatement.setString(2, pon_n);
                                                                            pstatement.setString(3, mea_n);
                                                                            pstatement.setString(4, pos_n);
                                                                            pstatement.setString(5, att);
                                                                            updateQuery = pstatement.executeUpdate();
                                                                            if (updateQuery != 0) {
                                                                                out.println("Successfully Inserted---ORTHOGRAPHY=" + ort + "---PRONUNCIATION=" + pon_n + "---POS=" + pos_n + "---MEANING=" + mea_n + "<br>");
                                                                            } else {
                                                                                out.println("Already Exists---ORTHOGRAPHY=" + ort + "---PRONUNCIATION=" + pon_n + "---POS=" + pos_n + "---MEANING=" + mea_n + "<br>");
                                                                            }
                                                                        }

                                                                        if (idi_n != null && idi_n != "") {
                                                                            att = "2";
                                                                            pstatement.setString(1, ort);
                                                                            pstatement.setString(2, idi_n);
                                                                            pstatement.setString(3, mea_n);
                                                                            pstatement.setString(4, pos_n);
                                                                            pstatement.setString(5, att);
                                                                            updateQuery = pstatement.executeUpdate();
                                                                            if (updateQuery != 0) {
                                                                                out.println("Successfully Inserted---ORTHOGRAPHY=" + ort + "---PRONUNCIATION=" + idi_n + "---POS=" + pos_n + "---MEANING=" + mea_n + "<br>");
                                                                            } else {
                                                                                out.println("Already Exists---ORTHOGRAPHY=" + ort + "---PRONUNCIATION=" + idi_n + "---POS=" + pos_n + "---MEANING=" + mea_n + "<br>");
                                                                            }
                                                                        }
                                                                    } else {
                                                                        out.println("Already Exists---ORTHOGRAPHY=" + rs.getString(2) + "---PRONUNCIATION=" + rs.getString(3) + "---POS=" + rs.getString(5) + "<br>");

                                                                    }

                                                                } catch (Exception ex) {
                                                                    out.println("Unable to connect to Database." + ex.getMessage());
                                                                } finally {
                                                                    rs.close();
                                                                    statement.close();

                                                                    pstatement.close();
                                                                    connection.close();

                                                                }
                                                            }
                                                        } else {
                                                            String pon = request.getParameter("pon");
                                                            String pos = request.getParameter("pos");
                                                            String idi = request.getParameter("idi");
                                                            String mea = request.getParameter("mea");
                                                            String att = "3";
                                                            if (pon.length() == 0 && idi.length() != 0) {
                                                                att = "2";
                                                            } else if (pon.length() != 0 && idi.length() == 0) {
                                                                att = "1";
                                                            }

                                                            try {
                                                                String resultString = null;
                                                                if (att.equals("3")) {
                                                                    resultString = "SELECT * FROM " + lan + " WHERE ORTHOGRAPHY = '" + ort + "' AND POS like '%" + pos + "%'";
                                                                } else {
                                                                    resultString = "SELECT * FROM " + lan + " WHERE ORTHOGRAPHY = '" + ort + "' AND POS like '%" + pos + "%' AND ATTRIBUTE='" + att + "'";
                                                                }
                                                                statement = connection.createStatement();
                                                                rs = statement.executeQuery(resultString);

                                                                String queryString = "INSERT INTO " + lan + "(ORTHOGRAPHY, PRONUNCIATION, MEANING, POS, ATTRIBUTE) VALUES( ?,?,?,?,?)";
                                                                pstatement = connection.prepareStatement(queryString);
                                                                //updateQuery = pstatement.executeUpdate();
                                                                if (!rs.next()) {
                                                                    if (pon != null && pon != "") {
                                                                        att="1";
                                                                        pstatement.setString(1, ort);
                                                                        pstatement.setString(2, pon);
                                                                        pstatement.setString(3, mea);
                                                                        pstatement.setString(4, pos);
                                                                        pstatement.setString(5, att);
                                                                        updateQuery = pstatement.executeUpdate();
                                                                        if (updateQuery != 0) {
                                                                            out.println("Successfully Inserted---ORTHOGRAPHY=" + ort + "---PRONUNCIATION=" + pon + "---POS=" + pos + "---MEANING=" + mea + "<br>");
                                                                        } else {
                                                                            out.println("Already Exists---ORTHOGRAPHY=" + ort + "---PRONUNCIATION=" + pon + "---POS=" + pos + "---MEANING=" + mea + "<br>");
                                                                        }
                                                                    }
                                                                    if (idi != null && idi != "") {
                                                                        att = "2";
                                                                        pstatement.setString(1, ort);
                                                                        pstatement.setString(2, idi);
                                                                        pstatement.setString(3, mea);
                                                                        pstatement.setString(4, pos);
                                                                        pstatement.setString(5, att);
                                                                        updateQuery = pstatement.executeUpdate();
                                                                        if (updateQuery != 0) {
                                                                            out.println("Successfully Inserted---ORTHOGRAPHY=" + ort + "---PRONUNCIATION=" + idi + "---POS=" + pos + "---MEANING=" + mea + "<br>");
                                                                        } else {
                                                                            out.println("Already Exists---ORTHOGRAPHY=" + ort + "---PRONUNCIATION=" + idi + "---POS=" + pos + "---MEANING=" + mea + "<br>");
                                                                        }
                                                                    }
                                                                } else {
                                                                    out.println("Already Exists---ORTHOGRAPHY=" + rs.getString(2) + "---PRONUNCIATION=" + rs.getString(3) + "---POS=" + rs.getString(5) + "<br>");

                                                                }

                                                            } catch (Exception ex) {
                                                                out.println("Unable to connect to Database." + ex.getMessage());
                                                            } finally {
                                                                rs.close();
                                                                statement.close();

                                                                pstatement.close();
                                                                connection.close();

                                                            }

                                                        }
                                            %>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table><br />
                </td>
            </tr>
        </table></body>
</html>
