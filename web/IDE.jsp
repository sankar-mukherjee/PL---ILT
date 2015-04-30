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
        <script type="text/javascript" > 
            function loadtextFile(){
                if (document.getElementById("Textfiles").files.length === 0) { return; }
                var filename = document.getElementById("Textfiles").value;
                var extension = filename.substring(filename.lastIndexOf(".") + 1, filename.length);
                var TEXT = "txt";
                if(TEXT !== extension){
                    alert("Not a TEXT file");
                    return;}
                var oFile = document.getElementById("Textfiles").files[0];
                var oFReader = new FileReader();
                oFReader.onload = function (oFREvent) {document.getElementById("multitext").value = oFREvent.target.result;};
                oFReader.readAsText(oFile);
            }
            function addvalue(frm){
                if(frm.model2.value == ""){
                    frm.pos33.value =  frm.make2.value + "" + frm.type2.value +  "/" + frm.pos33.value ;
                }else{
                    frm.pos33.value =  frm.make2.value + "" + frm.type2.value + "." + frm.model2.value + "." + frm.struct2.value + "/" + frm.pos33.value ;
                }
            }
            function addvalue1(){
                document.getElementById('files').addEventListener('change', handleFileSelect, false);
            }

            function clk(fry){
                fry.pos33.value = " ";
            }

            function nullvalue(n){
                n.mea.value = " ";
            }
            
            function chMd(id)
            {
                if(id == "b"){
                    document.getElementById("td1").style.display="table-row";
                    document.getElementById("td").style.display="none";
                }
                else{
                    document.getElementById("td1").style.display="none";
                    document.getElementById("td").style.display="table-row";
                }
            }
        </script>
    </head>
    <body onload="loadtextFile(); initListGroup('pos', document.forms[0].make2, document.forms[0].type2, document.forms[0].model2, document.forms[0].struct2);" style="background-image: none">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td height="251" align="center" valign="top">
                    <table width="90%" height="366" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                            <td valign="top">
                                <table width="100%" border="0" cellspacing="0" align="center" cellpadding="0">
                                    <tr>
                                        <td>
                                            <table width="100%"><tr>
                                                    <td align="center">Load File OR Type a Single word<br>
                                                            File<input type="radio" name="aa" onClick="chMd('a')" />&nbsp;
                                                            Type Word<input type="radio" name="aa" onClick="chMd('b')"/>
                                                    </td>
                                                </tr></table>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table border="1" width="100%">
                                                <tbody>
                                                    <form action="ORT.jsp" method="get">
                                                        <tr id="td1" style="display: none">
                                                            <td>
                                                                <table width="100%" style="background-color: #2F89DF">
                                                                    <tr>
                                                                        <td>Select Language
                                                                            <select name="language">
                                                                                <option></option>
                                                                                <%
                                                                                    String email = session.getAttribute("username").toString();
                                                                                    request.setCharacterEncoding("UTF-8");
                                                                                    String connectionURL = "jdbc:mysql://localhost:3306/ide?useUnicode=true&characterEncoding=UTF-8";
                                                                                    Connection connection = null;
                                                                                    PreparedStatement pstatement = null;
                                                                                    ResultSet rs = null;
                                                                                    Statement statement = null;
                                                                                    int updateQuery = 0;
                                                                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                                                                    connection = DriverManager.getConnection(connectionURL, "root", "root");
                                                                                    try {
                                                                                        String resultString = "SELECT roles FROM userregister WHERE email='" + email + "'";
                                                                                        statement = connection.createStatement();
                                                                                        rs = statement.executeQuery(resultString);
                                                                                        while (rs.next()) {
                                                                                            String languages[] = rs.getString(1).split("\\.");
                                                                                            for (int i = 0; i < languages.length; i++) {
                                                                                                out.println("<option>" + languages[i] + "</option>");
                                                                                            }
                                                                                        }
                                                                                    } catch (Exception ex) {
                                                                                        out.println("Unable to connect to Database." + ex.getMessage());
                                                                                    } finally {
                                                                                        rs.close();
                                                                                        statement.close();
                                                                                        connection.close();
                                                                                    }
                                                                                %>
                                                                            </select>
                                                                        </td>
                                                                        <td>Orthography<br>
                                                                                <input type="text" name="ort" value="" style="font-size: xx-large" class="keyboardInput"/>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <div id="postable">
                                                                                <table border="0" cellspacing="5" cellpadding="5" style="background-color: #2F89DF;" id="poss">
                                                                                    <tbody>
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
                                                                        </td>
                                                                        <td>
                                                                            <div id="postable">
                                                                                <table width="100%">
                                                                                    <tr>
                                                                                        <td>POS<br>
                                                                                                <textarea name="pos33" rows="5" cols="30" ></textarea>
                                                                                                <input value="Clear" onclick="clk(this.form)" type="button"/>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td>Meaning<br>
                                                                                                <textarea name="mea" rows="5" cols="30" ></textarea>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr><td colspan="2" align="right">
                                                                                            <input type="submit" value="G2P" name="save" style="height: 50px; width: 200px"/>
                                                                                        </td></tr>
                                                                                </table>
                                                                            </div>
                                                                        </td>
                                                                    </tr>


                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </form>
                                                    <form action="CALCULATE.jsp" method="get">
                                                        <tr id="td" style="display: none"><td>
                                                                <table width="100%" style="background-color: #2F89DF">
                                                                    <tr>
                                                                        <td>Select Language
                                                                            <select name="language">
                                                                                <option></option>
                                                                                <%
                                                                                    request.setCharacterEncoding("UTF-8");
                                                                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                                                                    connection = DriverManager.getConnection(connectionURL, "root", "root");
                                                                                    try {
                                                                                        String resultString = "SELECT roles FROM userregister WHERE email='" + email + "'";
                                                                                        statement = connection.createStatement();
                                                                                        rs = statement.executeQuery(resultString);
                                                                                        while (rs.next()) {
                                                                                            String languages[] = rs.getString(1).split("\\.");
                                                                                            for (int i = 0; i < languages.length; i++) {
                                                                                                out.println("<option>" + languages[i] + "</option>");
                                                                                            }
                                                                                        }
                                                                                    } catch (Exception ex) {
                                                                                        out.println("Unable to connect to Database." + ex.getMessage());
                                                                                    } finally {
                                                                                        rs.close();
                                                                                        statement.close();
                                                                                        connection.close();
                                                                                    }
                                                                                %>
                                                                            </select>
                                                                            Upload a TEXT file from your Computer :&nbsp;
                                                                            <input type="file" id="Textfiles" onchange="loadtextFile();"/>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <textarea id="multitext" name="multitext" style="width: 95%;" rows="5" ></textarea>
                                                                        </td>
                                                                    </tr>
                                                                    <tr><td align="right"><input type="submit" value="Next" name="save" style="height: 50px"/></td></tr>
                                                                </table>
                                                            </td></tr>
                                                    </form>
                                                </tbody>
                                            </table>
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
