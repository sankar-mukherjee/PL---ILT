<%--
    Document   : CALCULATE
    Created on : 29 Jul, 2012, 4:38:37 PM
    Author     : Sankar
--%>
<%@ page import="java.io.*" %>
<%@ page import="write.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="write" class="write.UNICODE_TO_PASCI" scope="session"/>
<jsp:setProperty name="write" property="*"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="newjavascript.js" language="javascript"></script>
        <link href="CalendarControl.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="../JavaScript/chainedselects.js"></script>
        <script type="text/javascript"  language="javascript" src="../ii.txt"></script>
        <script type="text/javascript">
            function Validate(){
                var inp = document.getElementsByTagName("input");
                for (var ii=0; ii<inp.length; ii++){
                    if (inp.value[ii] == "" || inp.value[ii] == null){
                        alert('Invalid value detected');
                        inp[ii].focus();
                    }

                }

            }
            function BBB(){
                alert("hotttttttt");
            }
            function show(id){
                //document.getElementById("poss").style.display="inline";

                var img = document.getElementById("poss");
                img.style.top= id.offsetTop+20;
                img.style.left= id.offsetLeft;
                img.style.display='block';
                //pos_x = event.offsetX?(event.offsetX):event.pageX-document.getElementById(divID).offsetLeft;
                // pos_y = event.offsetY?(event.offsetY):event.pageY-document.getElementById(divID).offsetTop;

                //alert(pos_y+"  "+pos_x+" "+divId);

                //document.getElementById("poss").style.top = pos_y;
                //document.getElementById("poss").style.left = pos_x;
                //document.getElementById("poss").style.display = 'block';

            }
            function hide(){
                document.getElementById("poss").style.display="none";
            }
        </script>
    </head>
    <body onload=" initListGroup('pos', document.forms[0].make2, document.forms[0].type2);initListGroup('attribute', document.forms[0].make3, document.forms[0].type3);">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td height="251" align="center" valign="top">
                    <table width="900" height="366" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                            <td valign="top">
                                <form action="PHON.jsp" method="get" >
                                    <table width="900" border="0" cellspacing="0" align="center" cellpadding="0">
                                        <tr>
                                            <td>
                                                <%
                                                            String[] LL = write.getByline();
                                                            String[] WW = null;
                                                            for (int i = 0; i < LL.length; i++) {
                                                                out.print("<h3>" + LL[i] + "</h3>");
                                                                WW = LL[i].split("[\\s,;]+");
                                                                out.print("<table border='0' cellspacing='5' cellpadding='5' width='100%' style='text-align: center'>");
                                                                out.print("<tr><th>Words</th><th>POS</th><th>Morphology</th><th>Meaning</th></tr>");
                                                                for (int j = 0; j < WW.length; j++) {
                                                                    if (!WW[j].equals(null) && !WW[j].equals("")) {
                                                                        out.print("<tr><td><input type='text' name='graph' value='" + WW[j] + "' readonly='readonly' /></td>");
                                                                        //out.print("<td><input type='text' value='' name='pos' id='divid" + i + j + "' style='width: 50%' onclick='show(this)' onblur='hide()'/></td>");
                                                                        out.print("<td><input type='text' value='' name='poss' id='divid" + i + j + "' onfocus='showCalendarControl(this);' style='width: 50%' /></td>");
                                                                        //out.print("<script type='text/javascript'>at_attach('divid" + i + j + "', 'poss', 'click', 'x', 'pointer');</script>");
                                                                        out.print("<td><input type='text' value='' name='morph' style='width: 90%'/></td>");
                                                                        out.print("<td><input type='text' value='' name='meann' style='width: 50%'/></td></tr>");
                                                                    }
                                                                }
                                                                out.print("</table><hr>");
                                                            }
                                                            request.getSession().setAttribute("list", LL);
                                                            request.getSession().setAttribute("wlist", WW);

                                                            //session.setAttribute("ll", LL);
%>
                                            </td>



                                        </tr>
                                        <tr><td align="right"><input type="submit" value="Convert" name="Convert" style="height: 50px"/></td></tr>
                                    </table>
                                   
                                </form>
                            </td>
                        </tr>
                    </table><br />
                </td>
            </tr>
        </table>
    </body>
</html>
