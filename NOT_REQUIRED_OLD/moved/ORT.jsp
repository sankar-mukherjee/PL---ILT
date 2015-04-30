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
        <link rel="shortcut icon" type="image/x-icon" href="Images/favicon.ico" />
        <title>IDE</title>
        <link rel="stylesheet" href="css/nivo-slider.css" type="text/css" media="screen" />
        <script type="text/javascript" src="JavaScript/keyboard_2.js" charset="UTF-8"></script>
        <link rel="stylesheet" type="text/css" href="css/keyboard.css" />
        <script type="text/javascript">            
            function hide(id){
                var el = document.getElementById(id);
                //el.style.display = (el.style.display != 'none' ? 'none' : '' );
                if(el.style.display=='none')
                    {
                        el.style.display='block';
                    }
                    else
                        {
                            el.style.display='none';
                        }
            }
        </script>
    </head>
    <body style="background-image: none">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td height="251" align="center" valign="top">
                    <table width="900" height="366" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="center" valign="top">
                                <table width="900" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td>
                                            <form action="FinishORT.jsp" method="get">
                                                <table border="1">
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                <%
                                                                            String pos33 = request.getParameter("pos33");
                                                                            String ort = request.getParameter("ort");
                                                                            String mea = request.getParameter("mea");
                                                                            String lan = request.getParameter("lan");
                                                                %>
                                                                <table border="0" cellspacing="5" cellpadding="5" style="background-color: #2F89DF">
                                                                    <tbody>
                                                                        <tr>
                                                                            <td align="center" colspan="4">Orthography</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="center" colspan="4">
                                                                                <input type="text" name="ortho" value="<%out.print(ort);%>" style="font-size: xx-large;"readonly="readonly" />
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                POS
                                                                            </td>
                                                                            <td>
                                                                                Pronunciation
                                                                            </td>
                                                                            <td>
                                                                                Meaning
                                                                            </td>
                                                                            <td>
                                                                                Idiolectal Variation
                                                                            </td>
                                                                        </tr>
                                                                        <%
                                                                                    if (pos33 != null && pos33 != "") {
                                                                                        pos33 = pos33.substring(0, pos33.length() - 1);
                                                                                        String[] pos44 = pos33.split("/");
                                                                                        for (int p = 0; p < pos44.length; p++) {
                                                                                            String[] pos55 = pos44[p].split("\\.");%>
                                                                                            <tr><td><input type="text" name="pos<%=p%>"  value="<%= pos44[p] %>"/></td>
                                                                                                <td><input type="text" class="keyboardInput" style="font-size: xx-large;" name="pon<%=p%>"  value="<%= write.getPon(ort, pos55[0], lan) %>"/></td>
                                                                                                <td><input type="text" name="mea<%=p%>"  value="<%=mea%>"/></td>
                                                                                           <td><input type="text" class="keyboardInput" style="font-size:large; display:none" id ="idi<%=p%>"  name="idi<%=p%>" value=""/><input type="checkbox" onclick="hide('idi<%=p%>');"/></td></tr>
                                                                               <%         }
                                                                                    }
                                                                        %>
                                                                        <input type="hidden" name="lan" value="<%=lan%>" />
                                                                        <input type="hidden" name="pos33" value="<%=pos33%>" />
                                                                        <tr><td align="center" colspan="4"><input type="submit" value="save" name="save" style="height: 50px; width: 300px;" /></td></tr>
                                                                    </tbody>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>        
                                            </form>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table><br />
                </td>
            </tr>
        </table>
    </body>
</html>
