<%--
    Document   : newjsp
    Created on : 19 May, 2011, 2:15:10 PM
    Author     : Sankar
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="write" class="write.UNICODE_TO_PASCI" scope="session"/>
<jsp:setProperty name="write" property="*"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="shortcut icon" type="image/x-icon" href="Images/favicon.ico" />

        <script type="text/javascript" src="JavaScript/keyboard_1.js" charset="UTF-8"></script>
        <link rel="stylesheet" type="text/css" href="css/keyboard.css" />
        <title>IDE</title>

        <script type="text/javascript">
            function chMd(id)
            {
                if(id == "b"){                    
                    var xx=document.getElementById("td1").style.visibility="hidden";
                    var xxx=document.getElementById("td").style.visibility="hidden";
                }
                else{
                    var xx=document.getElementById("td1").style.visibility="visible";
                    var xxx=document.getElementById("td").style.visibility="visible";
                }
            }
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
    <body>
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td height="251" align="center" valign="top">
                    <table width="900" height="366" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                            <td valign="top">
                                <form action="FinishPHON.jsp" method="get" >
                                    <table width="900" border="0" cellspacing="0" align="center" cellpadding="0">
                                        <tr>
                                            <td>
                                                <%
                                                            request.setCharacterEncoding("UTF-8");
                                                            String lan = request.getParameter("lan");
                                                            String[] LL = request.getParameterValues("list");
                                                            String[] WW = request.getParameterValues("wlist");
                                                            ArrayList<String> idx = (ArrayList<String>) session.getAttribute("idxx");
                                                            ArrayList<String> phon = new ArrayList<String>();
                                                            String kk=null;%>

                                                            <table border="0" cellspacing="5" cellpadding="5" width="100%" style="text-align: center">
                                                            <tr><th>Words</th><th>POS</th><th>Pronunciation</th><th>Meaning</th><th>Idiolectal Variation</th></tr>

                                                           <% for (int i = 0; i < idx.size(); i++) {
                                                                String ort = request.getParameter("ort" + idx.get(i));
                                                                String pos = request.getParameter("pos" + idx.get(i));
                                                                String mea = request.getParameter("mea" + idx.get(i));

                                                                
                                                                 String[] pos44 = null;
                                                                if (pos != null && pos != "") {
                                                                    pos = pos.substring(0, pos.length() - 1);
                                                                    pos44 = pos.split("/");
                                                                    for (int k = 0; k < pos44.length; k++) {
                                                                        String[] pos55 = pos44[k].split("\\.");%>
                                                                    <tr><td><input type="text" name="ort<%= i+""+k %>" value="<%=ort%> " readonly="readonly" /></td>
                                                                    <td><input type="text" name="pos<%= i+""+k %>" value="<%= pos44[k] %>"/></td>
                                                                    <td><input type="text" name="pon<%= i+""+k %>" class="keyboardInput" style="font-size: x-large;" value="<%= write.getPon(ort, pos55[0], lan)%>"/></td>
                                                                    <td><input type="text" name="mea<%= i+""+k %>" value="<%= mea%>"/></td>
                                                                    <td><input type="text" class="keyboardInput" style="font-size: large; display: none" id ="idi<%=i+k%>" name="idi<%=i+""+k%>" value=""/><input type="checkbox" onclick="hide('idi<%=i+k%>')"/></td></tr>
                                                                    <% kk = ""+i+k;
                                                                        phon.add(kk);
                                                                          }
                                                                } else {%>
                                                                    <tr><td><input type="text" name="ort<%= i %>" value="<%=ort%> " readonly="readonly" /></td>
                                                                    <td><input type="text" name="pos<%= i %>" value="<%= pos %>"/></td>
                                                                    <td><input type="text" name="pon<%= i %>" class="keyboardInput" style="font-size: x-large;" value="<%= write.getPon(ort, pos, lan)%>"/></td>
                                                                    <td><input type="text" name="mea<%= i %>" value="<%= mea%>"/></td>
                                                                    <td><input type="text" class="keyboardInput" style="font-size: x-large; display: none" id ="idi<%=i%>" name="idi<%=i%>" value=""/><input type="checkbox" onclick="hide('idi<%=i%>')"/></td></tr>
                                                                  <%  kk=""+i;
                                                                    phon.add(kk);
                                                                     }
                                                            }%>
                                                           </table>
                                                                <% request.getSession().setAttribute("idxxx", phon);%>
                                                <input type="hidden" name="lan" value="<%=lan%>" />
                                            </td>
                                        </tr>
                                        <tr><td align="right" ><input type="submit" value="Save" name="Save" style="height: 50px;"/></td></tr>
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
