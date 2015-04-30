<%--
    Document   : newjsp
    Created on : 19 May, 2011, 2:15:10 PM
    Author     : Sankar
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="shortcut icon" type="image/x-icon" href="Images/favicon.ico"></link>
        <title>Administrator</title>

        <script type="text/javascript" src="JavaScript/chainedselects.js"></script>
        <script type="text/javascript"  language="javascript" src="ii.txt"></script>
        <link rel="stylesheet" href="css/nivo-slider.css" type="text/css" media="screen" />
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
            var self = this;
            function show(id){
                var newid = id.id;
                //var nid = newid.replace("divid","morphid");
                //var nidd = document.getElementById(nid);
               
                //img.style.display='block';
                //DOC1 = id;
                //DOC2 = nidd;
                var position=VKI_findPos(id), wDim = VKI_innerDimensions(), sDis = VKI_scrollDist();
                //alert(position,wDim,sDis);
                var img = document.getElementById("postable");
                //var position1=VKI_findPos(id);
                img.style.display="";
                img.style.left = position[0]+"px";img.style.top = position[1]+id.offsetHeight+"px";

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
            function VKI_innerDimensions() {
                if (self.innerHeight) {
                    return [self.innerWidth, self.innerHeight];
                } else if (document.documentElement && document.documentElement.clientHeight) {
                    return [document.documentElement.clientWidth, document.documentElement.clientHeight];
                } else if (document.body)
                    return [document.body.clientWidth, document.body.clientHeight];
                return [0, 0];
            }

            function VKI_scrollDist() {
                var html = document.getElementsByTagName('html')[0];
                if (html.scrollTop && document.documentElement.scrollTop) {
                    return [html.scrollLeft, html.scrollTop];
                } else if (html.scrollTop || document.documentElement.scrollTop) {
                    return [html.scrollLeft + document.documentElement.scrollLeft, html.scrollTop + document.documentElement.scrollTop];
                } else if (document.body.scrollTop)
                    return [document.body.scrollLeft, document.body.scrollTop];
                return [0, 0];
            }
        </script>

    </head>
    <body onload=" initListGroup('pos', document.forms[0].make2, document.forms[0].type2, document.forms[0].model2, document.forms[0].struct2);">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td width="100%" height="145" align="center" valign="bottom">
                    <table width="900" height="145" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="left" valign="top">
                                <table width="900" height="144" border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="750" align="left" valign="middle">
                                            <table width="100%" height="63" border="0" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td><img src="assets/logo.png" width="50" height="50" /></td>
                                                    <td align="center">
                                                        <a style="color: white; font-size:200%">PLS DEVELOPMENT ENVIRONMENT</a><br>
                                                            <sub>Sponsored By Department of Information Technology (DIT),</sub><br>
                                                                <sub> Ministry of Communication & Information Technology (MC&IT), Govt. of India</sub>
                                                                </td>
                                                                <td><img src="assets/gov.jpg" width="50" height="50" /></td>
                                                                </tr>
                                                                </table>
                                                                </td>
                                                                <td width="150" align="right" valign="top"><br />
                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                        <tr>
                                                                            <td align="right" valign="top">
                                                                                <span class="style16"><a href="index.jsp">HOME</a>
                                                                                    <span class="style17">.</span> <a href="contact.jsp">CONTACT US</a></span>
                                                                                    <%if (session.getAttribute("username") != null && session.getAttribute("username") != "" && session.getAttribute("password") != "" && session.getAttribute("password") != null) {
                                                                                            String user = session.getAttribute("username").toString();
                                                                                            String pass = session.getAttribute("password").toString();
                                                                                    %>
                                                                                Welcome &nbsp;
                                                                                <a style="font-size: large"><%= user%></a>
                                                                                &nbsp;&nbsp;<a href="logout.jsp">Logout</a>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                    <%}%>
                                                                </td>
                                                                </tr>
                                                                </table>
                                                                </td>
                                                                </tr>
                                                                </table>
                                                                </td>
                                                                </tr>
                                                                <tr>
                                                                    <td height="39" align="center" valign="middle">
                                                                        <table width="900" height="37" border="0" cellpadding="0" cellspacing="0">
                                                                            <tr align="center" valign="middle" class="style16">
                                                                                <td width="10%"><a href="about.jsp">ABOUT</a></td>
                                                                                <td width="10%"><a href="pls.jsp">PLS</a></td>
                                                                                <td width="10%"><a href="ipa.jsp">IPA</a></td>
                                                                                <td width="30%"><a href="IDEMAIN.jsp">IDE</a></td>
                                                                                <td width="10%"><a href="publish.jsp">PUBLISH</a></td>
                                                                                <td width="10%"><a href="help.jsp">HELP</a></td>
                                                                                <td width="10%"><a href="registration.jsp">Registration</a></td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                <form action="PHON.jsp" method="get" >
                                                                    <tr>
                                                                        <td height="251" align="center" valign="top"><br/>

                                                                            <table border="1">

                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td><input type="text" id="divid1" value="" onclick="show(this)"/></td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td><input type="text" id="divid2" value="" onclick="show(this)"/></td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td><input type="text" id="divid3" value="" onclick="show(this)"/></td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td><input type="text" id="divid4" value="" onclick="show(this)"/></td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td><input type="text" id="divid5" value="" onclick="show(this)"/></td>
                                                                                    </tr>
                                                                                </tbody>
                                                                            </table>


                                                                        </td>
                                                                    </tr>


                                                                    <tr>
                                                                        <td>
                                                                            <div id="postable" style="display: none">
                                                                                <table border="0" cellspacing="5" cellpadding="5" style="background-color: #2F89DF;" id="poss">
                                                                                    <tbody>
                                                                                        <tr>
                                                                                            <td colspan="4" align="center">Add POS with corresponding Attribute&nbsp;&nbsp;&nbsp;&nbsp;
                                                                                                <a href='javascript:hide();'>Close</a>
                                                                                            </td>
                                                                                        </tr>
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
                                                                    </tr>
                                                                </form>


                                                                <tr>
                                                                    <td height="184" align="center" valign="top" background="Images/bckbottom.png">
                                                                        <table width="900" height="28" border="0" cellpadding="0" cellspacing="0">
                                                                            <tr>
                                                                                <td>&nbsp;</td>
                                                                            </tr>
                                                                        </table>
                                                                        <table width="900" height="84" border="0" cellpadding="0" cellspacing="0">
                                                                            <tr align="left" valign="top">
                                                                                <td width="300" height="27" class="style22"><br />
                                                                                    <img src="assets/bel2.png" width="200" height="100" />
                                                                                </td>
                                                                                <td width="200" class="style22">
                                                                                    <p class="style1">ABOUT IDE</p>
                                                                                    <p class="style16">
                                                                                        <a href="about.jsp#switchText4">Some useful definition</a><br />
                                                                                        <a href="pls.jsp#switchText4">An Example of Bangla PL</a>
                                                                                    </p>
                                                                                </td>
                                                                                <td width="200" class="style22">
                                                                                    <p class="style1">IPA</p>
                                                                                    <p><span class="style16">
                                                                                            <a href="xml.jsp">Show Last Added word in PLS</a><br />
                                                                                            <a href="newipamain.jsp">Add New IPA Symbol</a>
                                                                                        </span><br />
                                                                                    </p>
                                                                                </td>
                                                                                <td width="100" class="style22">
                                                                                    <p class="style1">HELP</p>
                                                                                    <p class="style16">
                                                                                        <a href="help.jsp">Abbreviation</a><br />
                                                                                    </p>
                                                                                </td>
                                                                                <td width="100" align="left" class="style22">
                                                                                    <p class="style1">CONTACTS</p>
                                                                                    <p class="style16">
                                                                                        <a href="contact.jsp">Contact Us</a>
                                                                                    </p>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        <br />
                                                                        <table width="900" height="26" border="0" cellpadding="0" cellspacing="0">
                                                                            <tr>
                                                                                <td align="center" valign="bottom">
                                                                                    <span class="style24">© 2012 All Rights Reserved. | <a href="http://www.iitkgp.ac.in/cet/index.html">CET-IITKGP</a>
                                                                                    </span>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                </table>
                                                                </body>
                                                                </html>
