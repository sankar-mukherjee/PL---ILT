<%--
    Document   : newjsp
    Created on : 19 May, 2011, 2:15:10 PM
    Author     : Sankar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%

    if (session.getAttribute("username") == null) {%>
<jsp:forward page="login.jsp"/>
<%                //response.sendRedirect("login.jsp"); // GO TO LOGIN PAGE
    }
%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="shortcut icon" type="image/x-icon" href="Images/favicon.ico"></link>
        <title>Add New IPA Symbol</title>
        <link rel="stylesheet" href="css/nivo-slider.css" type="text/css" media="screen" />
        <script type="text/javascript">

            /***********************************************
             * IFrame SSI script II- © Dynamic Drive DHTML code library (http://www.dynamicdrive.com)
             * Visit DynamicDrive.com for hundreds of original DHTML scripts
             * This notice must stay intact for legal use
             ***********************************************/

            //Input the IDs of the IFRAMES you wish to dynamically resize to match its content height:
            //Separate each ID with a comma. Examples: ["myframe1", "myframe2"] or ["myframe"] or [] for none:
            var iframeids=["myframe"]

            //Should script hide iframe from browsers that don't support this script (non IE5+/NS6+ browsers. Recommended):
            var iframehide="yes"

            var getFFVersion=navigator.userAgent.substring(navigator.userAgent.indexOf("Firefox")).split("/")[1]
            var FFextraHeight=parseFloat(getFFVersion)>=0.1? 16 : 0 //extra height in px to add to iframe in FireFox 1.0+ browsers

            function resizeCaller() {
                var dyniframe=new Array()
                for (i=0; i<iframeids.length; i++){
                    if (document.getElementById)
                        resizeIframe(iframeids[i])
                    //reveal iframe for lower end browsers? (see var above):
                    if ((document.all || document.getElementById) && iframehide=="no"){
                        var tempobj=document.all? document.all[iframeids[i]] : document.getElementById(iframeids[i])
                        tempobj.style.display="block"
                    }
                }
            }

            function resizeIframe(frameid){
                var currentfr=document.getElementById(frameid)
                if (currentfr && !window.opera){
                    currentfr.style.display="block"
                    if (currentfr.contentDocument && currentfr.contentDocument.body.offsetHeight) //ns6 syntax
                        currentfr.height = currentfr.contentDocument.body.offsetHeight+FFextraHeight;
                    else if (currentfr.Document && currentfr.Document.body.scrollHeight) //ie5+ syntax
                        currentfr.height = currentfr.Document.body.scrollHeight;
                    if (currentfr.addEventListener)
                        currentfr.addEventListener("load", readjustIframe, false)
                    else if (currentfr.attachEvent){
                        currentfr.detachEvent("onload", readjustIframe) // Bug fix line
                        currentfr.attachEvent("onload", readjustIframe)
                    }
                }
            }

            function readjustIframe(loadevt) {
                var crossevt=(window.event)? event : loadevt
                var iframeroot=(crossevt.currentTarget)? crossevt.currentTarget : crossevt.srcElement
                if (iframeroot)
                    resizeIframe(iframeroot.id);
            }

            function loadintoIframe(iframeid, url){
                if (document.getElementById)
                    document.getElementById(iframeid).src=url
            }

            if (window.addEventListener)
                window.addEventListener("load", resizeCaller, false)
            else if (window.attachEvent)
                window.attachEvent("onload", resizeCaller)
            else
                window.onload=resizeCaller

        </script>
    </head>
    <body>
        <%
            if (session.getAttribute("username") != null && session.getAttribute("username") != "" && session.getAttribute("password") != "" && session.getAttribute("password") != null) {
                String user = session.getAttribute("username").toString();
                String pass = session.getAttribute("password").toString();
        %>
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
                                                    <td><img src="assets/logo.png" width="80" height="80" /></td>
                                                    <td align="center">
                                                        <a style="color: white; font-size:200%">PLS&nbsp;&nbsp;&nbsp;DEVELOPMENT&nbsp;&nbsp;&nbsp;ENVIRONMENT</a><br>
                                                            <sub style="color:#cccccc ;font-size:100%">Sponsored By <br>
                                                                Department of Electronics and Information Technology (DEITY)<br>
                                                                    Ministry of Communication & Information Technology (MC&IT)<br>
                                                                        Govt. of India</sub>
                                                    </td>
                                                    <td><img src="assets/gov.jpg" width="80" height="80" /></td>
                                                </tr>
                                            </table>
                                                                </td>
                                                                <td width="150" align="right" valign="top"><br />
                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                        <tr>
                                                                            <td align="right" valign="top">
                                                                                <span class="style16"><a href="index.jsp">HOME</a>
                                                                                    <span class="style17">.</span> <a href="contact.jsp">CONTACT US</a></span><br>
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
                    <table width="80%" height="37" border="0" cellpadding="0" cellspacing="0">
                        <tr align="center" valign="middle" class="style20">
                            <td width="10%" align="center" class="tab"><a href="files/PLS.pdf"><span>PLS Document</span></a></t</td>
                            <td width="20%" align="center" class="selected"><a href="ipa.jsp">Indian Languages IPA Symbols</a></td>
                            <td width="20%" align="center" class="pls_tab"><a href="IDEMAIN.jsp">PLS Development Environment</a></td>
                            <td width="10%" align="center" class="tab"><a href="publish.jsp">PLS Database</a></td>
                            <td width="5%" align="center" class="tab"><a href="help.jsp">HELP</a></td>
                            <td width="15%" align="center" class="tab"><a href="registration.jsp">Register</a></td>
                        </tr>
                    </table>
                </td>
            </tr>
                                                                <tr>
                                                                    <td height="251" align="center" valign="top">
                                                                        <table width="900" height="366" border="0" cellpadding="0" cellspacing="0">
                                                                            <tr>
                                                                                <td align="center" valign="top"><p>&nbsp;</p>
                                                                                    <table width="900" border="0" cellspacing="0" cellpadding="0">
                                                                                        <tr><td>Add New IPA Symbol for Indian Languages</td></tr>
                                                                                        <tr>                                                                                            
                                                                                            <td align="left" valign="top" class="style19">
                                                                                                <iframe id="myframe" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" style="overflow:visible; width:100%; display:none"
                                                                                                        src="newipa.jsp"></iframe>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                        </table><br />
                                                                    </td>
                                                                </tr>
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
