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
            function addvalue(frm){
                frm.atr.value = frm.type3.value + ", " + frm.atr.value;

                var b = frm.type3.selectedIndex;

                frm.type3.remove(b);
            }
            function addvalue1(){
                document.getElementById('files').addEventListener('change', handleFileSelect, false);
            }

            function clk(fry){
                fry.atr.value = " ";
            }

            function nullvalue(n){
                n.mea.value = " ";
            }
            
            function loadtextFile(){
                if (document.getElementById("Textfiles").files.length === 0) { return; }
                var oFile = document.getElementById("Textfiles").files[0];
                var oFReader = new FileReader();
                oFReader.onload = function (oFREvent) {document.getElementById("multitext").value = oFREvent.target.result;};
                oFReader.readAsText(oFile);
            }
            function SplitWord(){
                var container = document.getElementById('container');
                var TotalWord = document.getElementById("multitext").value;
                var stringToArray = new Array;
                stringToArray = TotalWord.split(" ");
                var len = stringToArray.length;
                for (var i = 0; i < len; i++)
                {
                    var input = document.createElement('input'),
                    div = document.createElement('div');
                    input.type = "text";
                    input.value = stringToArray[i];
                    div.appendChild(input);
                    container.appendChild(div);
                }

            }
        </script>
    </head>
    <body onload=" initListGroup('pos', document.forms[0].make2, document.forms[0].type2);
        initListGroup('attribute', document.forms[0].make3, document.forms[0].type3); loadtextFile();" style="background-image: none">
        <%
                    request.setCharacterEncoding("UTF-8");
                    String pos = request.getParameter("pos1");
                    String atr = request.getParameter("atr1");
                    String or = request.getParameter("or3");
                    String lan = request.getParameter("langu");
                    String pon = request.getParameter("pon");
                    String pon2 = request.getParameter("pon2");
                    String bb = request.getParameter("bb");
                    String mea = request.getParameter("mea3");
                    String n = request.getParameter("n3");

                    if (bb == "y") {
                        pon = pon + ";" + pon2;
                    } else if (bb == "n") {
                        pon = pon2 + ";" + pon;
                    }%>
        <%if (pos != null && or != null && pon != null) {
                        if (pos != "" && or != "" && pon != "") {
                            String connectionURL = "jdbc:mysql://localhost:3306/ide?useUnicode=true&characterEncoding=UTF-8";
                            Connection connection = null;
                            PreparedStatement pstatement = null;
                            ResultSet rs = null;
                            Statement statement = null;
                            Class.forName("com.mysql.jdbc.Driver").newInstance();
                            int updateQuery = 0;
                            try {
                                connection = DriverManager.getConnection(connectionURL, "root", "root");
                                String resultString = "SELECT ORTHOGRAPHY, PRONUNCIATION FROM " + lan + " WHERE ORTHOGRAPHY = '" + or + "' AND PRONUNCIATION = '" + pon + "'";
                                statement = connection.createStatement();
                                rs = statement.executeQuery(resultString);
                                String queryString = "INSERT INTO " + lan + "(ORTHOGRAPHY, POS, PRONUNCIATION, MEANING, MORPHOLOGY) VALUES(?,?,?,?,?)";
                                pstatement = connection.prepareStatement(queryString);
                                pstatement.setString(1, or);
                                pstatement.setString(2, pos);
                                pstatement.setString(3, pon);
                                pstatement.setString(4, mea);
                                pstatement.setString(5, atr);

                                if (!rs.next()) {
                                    updateQuery = pstatement.executeUpdate();%>
        <a style="font-size: large; color: #DF0000">Successfully Inserted</a>
        <%} else {%>
        <a style="font-size: large; color: #DF0000">Data Already exists </a>
        <%                                                                }


                                        if (updateQuery == 0) {%>
        <a style="font-size: large; color: #DF0000"> No update</a>
        <%                                                        }

                            } catch (Exception ex) {
                                out.println("Unable to connect to Database." + ex.getMessage());

                            } finally {
                                rs.close();
                                statement.close();

                                pstatement.close();
                                connection.close();
                            }
                        }
                    }%>
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td height="251" align="center" valign="top">
                    <table width="900" height="366" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="center" valign="top">
                                <table width="900" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td>
                                            <form action="PHON.jsp" method="get" >
                                                <table border="1" >
                                                    <tbody>                    
                                                        <tr style="background-color: #2F89DF">
                                                            <td>
                                                                <table border="0" cellspacing="5" cellpadding="5">
                                                                    <tbody>
                                                                        <tr>
                                                                            <td>Select Language<br>
                                                                                    <select name="lan"  style="width: 170px">
                                                                                        <option></option>
                                                                                        <option value="banglaorthography">Bangla</option>
                                                                                        <option value="hindiorthography">Hindi</option>
                                                                                        <option>Tamil</option>
                                                                                        <option>Telegu</option>
                                                                                        <option>Punjabi</option>
                                                                                    </select>
                                                                            </td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </td>                                                            
                                                            <td>
                                                                <table border="0" cellspacing="5" cellpadding="5" >
                                                                    <tbody>
                                                                        <tr>
                                                                            <td>Orthography<br>
                                                                                    <input type="text" name="ort" value="" style="font-size: xx-large" class="keyboardInput"/></td>
                                                                            <td><input type="file" id="Textfiles" onchange="loadtextFile();"/></td>
                                                                        </tr>
                                                                        <tr><td>
                                                                                <textarea id="multitext" rows="6" cols="25">
                                                                                </textarea><input type="button" id="add" value="Calculate" onclick="SplitWord();"/>
                                                                            </td>
                                                                        </tr>
                                                                        <tr><td><div id="container"></div></td></tr>
                                                                    </tbody>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <div id="postable">
                                                    <table border="1">
                                                        <tbody>
                                                            <tr>
                                                                <td>
                                                                    <table border="0" cellspacing="5" cellpadding="5" style="background-color: #2F89DF">
                                                                        <tbody><tr><td colspan="3">POS:</td></tr>
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
                                                                            </tr>
                                                                            <tr><td colspan="3"><input value="Reset" onclick="resetListGroup('pos',1)" type="button" /></td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </td>
                                                                <td>
                                                                    <table border="0" cellspacing="5" cellpadding="5" style="background-color: #2F89DF">
                                                                        <tbody><tr><td colspan="3">Attribute:</td></tr>
                                                                            <tr>
                                                                                <td><select multiple="multiple" size="12" name="make3" id="make3">
                                                                                        <option selected="selected" value="Gender">Gender</option>
                                                                                        <option value="Number">Number</option>
                                                                                        <option value="Person">Person</option>
                                                                                        <option value="Tense">Tense</option>
                                                                                        <option value="Case">Case</option>
                                                                                        <option value="Case-marker">Case-marker</option>
                                                                                        <option value="Aspect">Aspect</option>
                                                                                        <option value="Mood">Mood</option>
                                                                                        <option value="Finite">Finite</option>
                                                                                        <option value="Non-Finite">Non-Finite</option>
                                                                                        <option value="Emphatic">Emphatic</option>
                                                                                        <option value="Negative">Negative</option>
                                                                                        <option value="Distances">Distances</option>
                                                                                        <option value="Incl/Excl">Incl/Excl</option>
                                                                                        <option value="Honorificity">Honorificity</option>
                                                                                        <option value="Intimacy">Intimacy</option>
                                                                                        <option value="Numeral">Numeral</option>
                                                                                    </select>
                                                                                </td>
                                                                                <td><select multiple="multiple" size="12" name="type3" id="type3">
                                                                                        <option  selected="selected" value="Masculine">Masculine</option>
                                                                                        <option value="Feminine">Feminine</option>
                                                                                        <option value="Neuter">Neuter</option>
                                                                                    </select>
                                                                                </td>
                                                                            </tr>
                                                                            <tr><td><input value="Reset" onclick="resetListGroup('attribute',1)" type="button" /></td>
                                                                                <td><input type="button" value="Add" onclick="addvalue(this.form)"/></td></tr>
                                                                        </tbody>
                                                                    </table>
                                                                </td>
                                                                <td style="background-color: #2F89DF">
                                                                    <table border="0" cellspacing="5" cellpadding="5">
                                                                        <tbody>
                                                                            <tr><td>Attribute</td></tr>
                                                                            <tr><td><textarea name="atr" rows="6" cols="10" ></textarea></td></tr>
                                                                            <tr><td><input value="Clear" onclick="clk(this.form)" type="button"/></td></tr>                                        
                                                                            <tr><td><textarea name="mea" rows="3" cols="10" ></textarea></td></tr>
                                                                            <tr><td>Meaning</td></tr>
                                                                        </tbody>
                                                                    </table>
                                                                </td>
                                                                <td style="border: #DF0000; background-color: #2F89DF"><input type="submit" value="Convert" name="save" style="height: 50px"/></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
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
