<%-- 
    Document   : CALCULATE
    Created on : 29 Jul, 2012, 4:38:37 PM
    Author     : Sankar
--%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.io.*" %>
<%@ page import="calcu.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="calcu" class="calcu.language_identification" scope="session"/>
<jsp:setProperty name="calcu" property="*"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <script type="text/javascript" src="JavaScript/chainedselects.js"></script>
        <script type="text/javascript"  language="javascript" src="ii.txt"></script>

        <style>
            #postable td, #postable select, #postable option {font-size:12pt; color:#000000; font-weight:normal; font-family:sans-serif,verdana,helvetica;}
            #postable select { width:150px; }
            #postable
            {
                position:absolute;
                z-index: 100;
            }

        </style>
        <script type="text/javascript">
            var DOC1;
            var DOC2;
            function Validate(frm){
                var flag = "N";
                var inp = frm.getElementsByTagName("input");
                for (var i=0;i<inp.length;i++){
                    flag = "N";
                    if(inp[i].value == null || inp[i].value==""){
                        alert("Value Not Given");
                        break;
                    }
                    flag="Y";
                }
                if(flag=="Y"){
                    frm.submit();
                }
            }
            function addvalue(frm){
                if(frm.model2.value == ""){
                    DOC1.value =  frm.make2.value + "" + frm.type2.value +  "/" + DOC1.value ;
                }else{
                    DOC1.value =  frm.make2.value + "" + frm.type2.value + "." + frm.model2.value + "." + frm.struct2.value + "/" + DOC1.value ;
                }
            }

            function show(id){
                var newid = id.id;
                var nid = newid.replace("divid","morphid");
                var nidd = document.getElementById(nid);
                var img = document.getElementById("postable");
                var position=VKI_findPos(id);
                img.style.display="";
                img.style.left = position[0]+"px";img.style.top = position[1]+id.offsetHeight+"px";
                DOC1 = id;
                DOC2 = nidd;

            }
            function hide(){
                document.getElementById("postable").style.display="none";
            }
            function VKI_findPos(obj) {
                var curleft = curtop = 0, scr = obj;
                while ((scr = scr.parentNode) && scr != document.body) {
                    curleft -= scr.scrollLeft || 0;
                    curtop -= scr.scrollTop || 0;
                }
                do {
                    curleft += obj.offsetLeft;
                    curtop += obj.offsetTop;
                } while (obj = obj.offsetParent);
                return [curleft, curtop];
            }
        </script>
    </head>
    <body onload=" initListGroup('pos', document.forms[0].make2, document.forms[0].type2, document.forms[0].model2, document.forms[0].struct2);" style="background: none">
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
                                                            request.setCharacterEncoding("UTF-8");
                                                            String multitext = request.getParameter("multitext");
                                                            String[] LL = multitext.split("[\u09f7\\.]");
                                                            String lan = request.getParameter("language");

                                                            //String lan = calcu.language_identity(multitext);

                                                            if (!lan.equals("ERROR")) {
                                                                ArrayList<String> idx = new ArrayList<String>();
                                                                String[] WW = null;
                                                                String k = null;
                                                                for (int i = 0; i < LL.length; i++) {
                                                                    out.print("<h3>" + LL[i] + "</h3>");
                                                                    WW = LL[i].split("[\\s,;]+");
                                                                    out.print("<table border='0' cellspacing='5' cellpadding='5' width='100%' style='text-align: center'>");
                                                                    out.print("<tr><th>Words</th><th>POS</th><th>Meaning</th></tr>");
                                                                    for (int j = 0; j < WW.length; j++) {
                                                                        if (!WW[j].equals(null) && !WW[j].equals("")) {
                                                                            out.print("<tr><td><input type='text' name='ort" + i + j + "' value='" + WW[j] + "' /></td>");
                                                                            out.print("<td><input type='text' value='' name='pos" + i + j + "' id='divid" + i + j + "' onclick='show(this)'/></td>");
                                                                            out.print("<td><input type='text' value='' name='mea" + i + j + "' /></td></tr>");
                                                                            k = "" + i + j;
                                                                            //qq =  qq.
                                                                            idx.add(k);
                                                                        }
                                                                    }
                                                                    out.print("</table><hr>");
                                                                }
                                                                request.getSession().setAttribute("list", LL);
                                                                request.getSession().setAttribute("wlist", WW);
                                                                request.getSession().setAttribute("idxx", idx);
                                                            }else{out.println("Cannot idntify the Language.");}

                                                            //session.setAttribute("ll", LL);
                                                %>
                                                <input type="hidden" name="lan" value="<%=lan%>" />
                                            </td>
                                        </tr>
                                        <tr><td align="right"><input type="submit" value="G2P" name="Convert" style="height: 50px"/></td></tr>
                                    </table>
                                    <div id="postable" style="display: none">
                                        <table border="0" cellspacing="5" cellpadding="5" style="background-color: #2F89DF;" id="poss">
                                            <tbody><tr><td colspan="4" align="center">Add POS with corresponding Attribute&nbsp;&nbsp;&nbsp;&nbsp;
                                                        <a href='javascript:hide();'>Close</a></td></tr>
                                                <tr>
                                                    <td><select multiple="multiple" size="12" name="make2">
                                                            <option selected="selected" value="Noun">Noun</option>
                                                            <option value="Verb">Verb</option>
                                                            <option value="Pronoun">Pronoun</option>
                                                            <option value="Nominal-Modifiers">Nominal-Modifiers</option>
                                                            <option value="Demon-Stratives">Demon-Stratives</option>
                                                            <option value="Adverb">Adverb</option>
                                                            <option value="Postposition">Postposition</option>
                                                            <option value="Preposition">Preposition</option>
                                                            <option value="Conjunction">Conjunction</option>
                                                            <option value="Interjection">Interjection</option>
                                                        </select>
                                                    </td>
                                                    <td><select multiple="multiple" size="12" name="type2">
                                                            <option  selected="selected" value="Common">Common</option>
                                                            <option value="Proper">Proper</option>
                                                            <option value="Verbal">Verbal</option>
                                                            <option value="Spatiotemporal">Spatiotemporal</option>
                                                        </select>
                                                    </td>
                                                    <td><select multiple="multiple" size="12" name="model2">
                                                            <option selected="selected" value="Gender">Gender</option>
                                                            <option value="Number">Number</option>
                                                            <option value="Person">Person</option>
                                                            <option value="Case">Case</option>
                                                            <option value="Case-marker">Case-marker</option>
                                                            <option value="Numeral">Numeral</option>
                                                        </select>
                                                    </td>
                                                    <td><select multiple="multiple" size="12" name="struct2">
                                                            <option  selected="selected" value="Masculine">Masculine</option>
                                                            <option value="Feminine">Feminine</option>
                                                            <option value="Neuter">Neuter</option>
                                                        </select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2"><input value="Reset" onclick="resetListGroup('pos',1)" type="button" /></td>
                                                    <td colspan="2" align="right"><input value="ADD" onclick="addvalue(this.form)" type="button" /></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </form>
                            </td>
                        </tr>
                    </table><br />
                </td>
            </tr>
        </table>
    </body>
</html>
