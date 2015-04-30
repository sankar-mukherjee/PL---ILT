<%--
    Document   : newjsp
    Created on : 19 May, 2011, 2:15:10 PM
    Author     : Sankar
--%>

<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="shortcut icon" type="image/x-icon" href="Images/favicon.ico"></link>
        <title>Help</title>
        <link rel="stylesheet" href="css/nivo-slider.css" type="text/css" media="screen" />
    </head>
    <body>
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td width="100%" height="145" align="center" valign="bottom">
                    <table width="100%" height="145" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="center" valign="top">
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
                    <table width="80%" height="37" border="0" cellpadding="0" cellspacing="0">
                        <tr align="center" valign="middle" class="style20">
                            <td width="10%" align="center" class="tab"><a href="files/PLS.pdf"><span>PLS Document</span></a></t</td>
                            <td width="20%" align="center" class="tab"><a href="ipa.jsp">Indian Languages IPA Symbols</a></td>
                            <td width="20%" align="center" class="pls_tab"><a href="IDEMAIN.jsp">PLS Development Environment</a></td>
                            <td width="10%" align="center" class="tab"><a href="publish.jsp">PLS Database</a></td>
                            <td width="5%" align="center" class="selected"><a href="help.jsp">HELP</a></td>
                            <td width="15%" align="center" class="tab"><a href="registration.jsp">Register</a></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td><br/>
                    <table width="80%" border="0" cellpadding="5" cellspacing="0" align="center">
                        <tr><td><a class="style18">For Everyone</a><br>
                                If you want to see or download the already developed Pronunciation Lexicon for Indian languages 
                                go to the PLS Database.</td>
                            <td><a class="style18">For Developer</a><br>
                                If you want to develop Pronunciation Lexicon for new languages you have to register. 
                                Admin will send you the access.</td>
                        </tr>
                        <tr>
                            <td align="left" valign="top" class="style18">Abbreviation of the Parts-of-Speech Tags:<br />
                                </td>
                        </tr>                      
                        
                        <tr>
                            <td colspan="2">
                                <div id="abbri">
                                    <table border="1">

                                        <tbody>
                                            <tr>
                                                <td>NC </td><td>      Common Noun</td>
                                            </tr>
                                            <tr><td>NP</td><td>        Proper Noun</td>
                                            </tr>
                                            <tr><td>
                                                    NV </td><td>      Verbal Noun</td>
                                            </tr>
                                            <tr><td>NST </td><td> Spatiotemporal Noun</td>
                                            </tr>
                                            <tr><td>
                                                    VM</td><td>   Main Verb</td>
                                            </tr>
                                            <tr><td>VA</td><td>    Auxiliary Verb</td>
                                            </tr>
                                            <tr><td>
                                                    PPR</td><td>  Pronominal Pronoun</td>
                                            </tr>
                                            <tr><td>PRF</td><td>  Reflexive Pronoun</td>
                                            </tr>
                                            <tr><td>
                                                    PRC</td><td> Reciprocal Pronoun</td>
                                            </tr>
                                            <tr><td>PRL</td><td> Relative Pronoun</td>
                                            </tr>
                                            <tr><td>
                                                    PWH</td><td>Wh Pronoun</td>
                                            </tr>
                                            <tr><td>JJ</td><td>     Adjective</td>
                                            </tr>
                                            <tr><td>
                                                    JQ</td><td>   Quantifiers</td>
                                            </tr>
                                            <tr><td>DAB </td><td>Absolute Demon-strative</td>
                                            </tr>
                                            <tr><td>
                                                    DRL</td><td> Relative Demon-strative</td>
                                            </tr>
                                            <tr><td>DWH</td><td>Wh Demon-strative</td>
                                            </tr>
                                            <tr><td>AMN</td><td>Manner Adverb</td>
                                            </tr>
                                            <tr><td>ALC</td><td> Location Adverb</td>
                                            </tr>
                                            <tr><td>ATI</td><td>  Time Adverb</td>
                                            </tr>
                                            <tr><td>n-Nml</td><td>   non-Numeral     </td></tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div id="abbri">
                                    <table border="1">

                                        <tbody>

                                            <tr><td>PPPP</td><td>Postposition</td>
                                            </tr>
                                            <tr><td>PPPE</td><td>Postpositional Endings</td>
                                            </tr>
                                            <tr><td>PREF</td><td>Preposition</td>
                                            </tr><tr><td>Mas</td><td>   Masculine </td></tr><tr><td>Fem</td><td>   Feminine</td></tr><tr><td>Neu</td><td>   Neuter</td></tr><tr><td>Sg</td><td>      Singular</td></tr><tr><td>Pl</td><td>       Plural</td></tr><tr><td>Du</td><td>     Dual</td></tr><tr><td>1p</td><td>      First Person</td></tr><tr><td>2p</td><td>      Second Person</td></tr><tr><td>3p</td><td>      Third Person</td></tr><tr><td>Prs</td><td>     Present Tense</td></tr><tr><td>Pst</td><td>     Past Tense</td></tr><tr><td>Fut</td><td>     Future Tense</td></tr><tr><td>Dir</td><td>     Direct Case</td></tr><tr><td>Obl</td><td>    Oblique Case</td></tr><tr><td>Erg</td><td>    Ergative Case-marker</td></tr><tr><td>Acc</td><td>   Accusative Case-marker</td></tr>
                                            <tr><td>INTJ</td><td>   Interjection    </td></tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div id="abbri">
                                    <table border="1">

                                        <tbody>

                                            <tr><td>Inst</td><td>    Instrumental Case-marker</td></tr><tr><td>Dat</td><td>    Dative Case-marker</td></tr><tr><td>Gen</td><td>   Genitive Case-marker       </td></tr><tr><td>Soc </td><td>   Sociative Case-marker</td></tr><tr><td>Loc</td><td>    Locative Case-marker</td></tr><tr><td>Abl</td><td>    Ablative Case-marker</td></tr><tr><td>Bnf</td><td>    Benefecative Case-marker</td></tr><tr><td>Voc</td><td>   Vocative Case-marker</td></tr><tr><td>Pur</td><td>    Purposive Case-marker</td></tr><tr><td>Sim</td><td>   Simple Aspect</td></tr><tr><td>Prog</td><td>  Progressive Aspect</td></tr><tr><td>Purp</td><td>  Purposive Aspect</td></tr><tr><td>Dcl</td><td>    Declarative Mood</td></tr><tr><td>Sbj</td><td> Subjunctive Mood</td></tr><tr><td>Cnd</td><td>   Condtional Mood</td></tr><tr><td>Imp</td><td>   Imperative mood</td></tr><tr><td>Psm</td><td>   Presumptive Mood</td></tr><tr><td>Abt</td><td>    Abilitative Mood</td></tr><tr><td>Hab   </td><td>Habitual Mood</td></tr>
                                            <tr><td>CONJ</td><td>   Conjunction     </td></tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div id="abbri">
                                    <table border="1">

                                        <tbody>
                                            <tr><td>Fin</td><td>     Finite</td></tr><tr><td>Inf</td><td>      Infinitive</td></tr><tr><td>Ger</td><td>     Gerund</td></tr><tr><td>Prt</td><td>      Participle </td></tr><tr><td>Emph</td><td> Emphatic</td></tr><tr><td>n-Emph </td><td>  non-Emphatic</td></tr><tr><td>Neg</td><td>    Negative</td></tr><tr><td>n-Neg </td><td>    non-Negative</td></tr><tr><td>Prox</td><td>    Proximal Distance</td></tr><tr><td>Dist</td><td>     Distal Distance</td></tr><tr><td>Seq</td><td>      Sequel Distance</td></tr><tr><td>Incl</td><td>      Inclusive</td></tr><tr><td>Excl</td><td>     Exclusive</td></tr><tr><td>Hon</td><td>     Honorific</td></tr><tr><td>n-Hon</td><td>  non-Honorific</td></tr><tr><td>Inti</td><td>       Intimate</td></tr><tr><td>n-Inti</td><td>    non-Intimate</td></tr><tr><td>Ord</td><td>       Ordinal</td></tr><tr><td>Card</td><td>      Cardinal</td></tr>

                                        </tbody>
                                    </table>
                                </div>
                            </td>
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
                                    <tr>
                                        <td align="left" valign="top" class="style18">Font Download<br />
                                            <br /></td>
                                    </tr>
                                    <tr>
                                        <td align="left" valign="top" class="style19">
                                            <table border="0" cellpadding="5" cellspacing="5">
                                                <thead>
                                                    <tr>
                                                        <th>Vrinda</th>
                                                        <th>Mangal</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td><a href="font/vrinda.ttf"><img alt=""  src="Images/download.png"/></a></td>
                                                        <td><a href="font/MANGAL.TTF"><img alt=""  src="Images/download.png"/></a></td>
                                                    </tr>
                                                    <tr>
                                                        <td><img alt="" width="300" src="Images/vrinda.png"/></td>
                                                        <td><img alt="" width="300" src="Images/MANgal.png"/></td>
                                                    </tr>
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
