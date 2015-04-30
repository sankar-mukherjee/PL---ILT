<%--
    Document   : newjsp
    Created on : 19 May, 2011, 2:15:10 PM
    Author     : Sankar
--%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="write.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="write" class="write.UNICODE_TO_PASCI" scope="session"/>
<jsp:setProperty name="write" property="*"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="shortcut icon" type="image/x-icon" href="Images/favicon.ico"></link>
        <title>IDE</title>
        <link rel="stylesheet" href="css/nivo-slider.css" type="text/css" media="screen" />
        <script type="text/javascript" src="JavaScript/keyboard.js" charset="UTF-8"></script>
        <link rel="stylesheet" type="text/css" href="css/keyboard.css" />
    </head>
    <body>
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td height="251" align="center" valign="top">
                    <table width="900" height="366" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="center" valign="top">
                                <table width="900" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td>
                                            <form action="IDE.jsp" method="get">
                                                <table border="1">
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                <table border="0" cellspacing="5" cellpadding="5" style="background-color: #ECE5B6">
                                                                    <tbody>
                                                                        <tr>
                                                                            <td>Orthography</td>
                                                                            <td>Pronunciation</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="left">
                                                                                <input type="text"name="or3" value="<%= write.getOrt()%>" style="font-size: xx-large;"readonly="readonly" />
                                                                            </td>
                                                                            <td align="left">
                                                                                <input type="text" name="pon" value="<%= write.getPon()%>" style="font-size: xx-large;" class="keyboardInput"/>
                                                                            </td>
                                                                        </tr>
                                                                        <%--<tr>
                                                                            <td>For test</td>
                                                                            <td align="left"><input type="text"name="n3" size="40" value="<%= write.getNN()%>" readonly="readonly"/></td>
                                                                            <td>For test</td>
                                                                            <td align="left"><input type="text"name="n3" size="40" value="<%= write.getN()%>" readonly="readonly"/></td>
                                    </tr>--%>
                                                                    </tbody>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <table border="1">
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                <table border="0" cellspacing="5" cellpadding="5" style="background-color: #60b9c1">
                                                                    <tbody>
                                                                        <tr>
                                                                            <td>Language</td>
                                                                            <td>
                                                                                <input type="text" value="<%= write.getLan1()%>" readonly="readonly"/>
                                                                                <input type="hidden" name="langu" value="<%= write.getLan()%>"/>
                                                                            </td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>


                                                <table border="1">
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                <table border="0" cellspacing="5" cellpadding="5" style="background-color: #60b9c1">
                                                                    <tbody>
                                                                        <tr>
                                                                            <td align="right">POS</td>
                                                                            <td align="left">
                                                                                <input type="text" name="pos1"  value="<%= write.getPos()%>"/>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="right">Morphology</td>
                                                                            <td align="left">
                                                                                <input type="text" name="atr1"  id="thisarea" value="<%= write.getatr()%>" readonly="readonly"/>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="right">Meaning</td>
                                                                            <td align="left"><input type="text" name="mea3" value="<%= write.getMea()%>" readonly="readonly"/></td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <input type="submit" value="save" name="save" style="height: 50px; width: 300px" />
                                            </form>
                                        </td>
                                    </tr>
                                </table>
                                <p><br /></p>
                            </td>
                        </tr>
                    </table><br />
                </td>
            </tr>
        </table>
    </body>
</html>
