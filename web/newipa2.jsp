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
        <link rel="shortcut icon" type="image/x-icon" href="Images/favicon.ico" />
        <link rel="stylesheet" href="css/nivo-slider.css" type="text/css" media="screen" />
    </head>
    <body style="background-image: none">
        <%         request.setCharacterEncoding("UTF-8");
                    String phon = request.getParameter("phon");
                    String lang = request.getParameter("language");
                    String ipa = request.getParameter("ipa");
                    String grapheme = request.getParameter("grapheme");
                    String place = request.getParameter("place");
                    String manner = request.getParameter("manner");
                    String initiall = request.getParameter("initiall");
                    String medially = request.getParameter("medially");
                    String finall = request.getParameter("finally");
                    String dip = request.getParameter("dip");
                    String pm = request.getParameter("pm");
                    String sound = request.getParameter("sound");%>
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td height="251" align="center" valign="top">
                    <table width="900" height="366" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="center" valign="top">

                                <form action="newipa.jsp" method="get" >
                                    <table>
                                        <tr>
                                            <td>
                                                <table border="1" >
                                                    <tbody>
                                                        <tr>
                                                            <td style="background-color: #2F89DF" align="center">
                                                                <table border="0" cellspacing="5" cellpadding="5">
                                                                    <tbody>
                                                                        <tr>
                                                                            <td>Language</td>
                                                                            <td>
                                                                                <input type="text" name="lang" value="<%out.println(lang);%>" readonly="readonly"/>
                                                                            </td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <table border="0" cellspacing="5" cellpadding="5" style="background-color: #2F89DF">
                                                                    <tbody>
                                                                        <tr>
                                                                            <td>IPA Symbols</td>
                                                                            <td>Related Grapheme</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="left">
                                                                                <input type="text" name="ipa" value="<%out.println(ipa);%>" style="font-size: xx-large" readonly="readonly"/>
                                                                            </td>
                                                                            <td align="left">
                                                                                <input type="text" name="grapheme" value="<%out.println(grapheme);%>" style="font-size: xx-large" readonly="readonly" />
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
                                                                            <tr>
                                                                                <td>Place of Articulation</td>
                                                                                <td><input type="text" name="place" value="<%out.println(place);%>" readonly="readonly" /></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>Manner of Articulation</td>
                                                                                <td><input type="text" name="manner" value="<%out.println(manner);%>" readonly="readonly" /></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>Diphthong</td>
                                                                                <td><input type="text" name="dip" value="<%out.println(dip);%>"  readonly="readonly" /></td>
                                                                            </tr>
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
                                                                <table border="0" cellspacing="5" cellpadding="5" style="background-color: #2F89DF">
                                                                    <tbody>
                                                                        <tr>
                                                                            <td>Initially</td>
                                                                            <td>Medially</td>
                                                                            <td>Finally</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="left">
                                                                                <input type="text" name="initiall" value="<%out.println(initiall);%>" readonly="readonly"  />
                                                                            </td>
                                                                            <td align="left">
                                                                                <input type="text" name="medially" value="<%out.println(medially);%>" readonly="readonly"  />
                                                                            </td>
                                                                            <td align="left">
                                                                                <input type="text" name="finall" value="<%out.println(finall);%>" readonly="readonly"  />
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
                                            <td align="right">
                                                <input type="submit" value="Submit" name="submit" style="height: 30px; width: 100px"/>
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
