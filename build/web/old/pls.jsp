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
        <title>PLS</title>
        <link rel="stylesheet" href="css/nivo-slider.css" type="text/css" media="screen" />
        <script language="javascript">
            function toggle(toggleText, displayText) {
                var ele = document.getElementById(toggleText);
                var text = document.getElementById(displayText);
                if(ele.style.display == "block") {
                    ele.style.display = "none";
                    text.innerHTML = " ";
                }
                else {
                    ele.style.display = "block";
                    text.innerHTML = " ";
                }
            }
        </script>
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
                                                        <a style="color: white; font-size:200%">PLS DEVELOPMENT ENVIRONMENT</a><br>
                                                            <sub>Sponsored By Department of Electronics and Information Technology (DEITY),</sub><br>
                                                           <sub> Ministry of Communication & Information Technology (MC&IT), Govt. of India</sub>
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
                    <table width="900" height="37" border="0" cellpadding="0" cellspacing="0">
                        <tr align="center" valign="middle" class="style20">
                            <td width="10%" align="center" class="tab"><a href="about.jsp"><span>ABOUT</span></a></t</td>
                            <td width="10%" align="center" class="selected"><a href="pls.jsp">PLS</a></td>
                            <td width="10%" align="center" class="tab"><a href="ipa.jsp">IPA</a></td>
                            <td width="30%" align="center" class="tab"><a href="IDEMAIN.jsp">IDE</a></td>
                            <td width="10%" align="center" class="tab"><a href="publish.jsp">PUBLISH</a></td>
                            <td width="10%" align="center" class="tab"><a href="help.jsp">HELP</a></td>
                            <td width="10%" align="center" class="tab"><a href="registration.jsp">REGISTRATION</a></td>
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
                                        <td align="left" valign="top" class="style18">What is PLS of W3C?<br /><br /></td>
                                    </tr>
                                    <tr>
                                        <td align="left" valign="top" class="style19">
                                            <p class="style30">The PLS is the standard format of the documents referenced by the &lt;lexicon&gt; element of SSML
                                                The PLS engine will load the external PLS document and transparently apply the pronunciations
                                                during the processing of the SSML document. An application may contain several distinct PLS
                                                documents to be used in different points of the application.</p>
                                            <p class="style30">If a pronunciation lexicon is referenced by a SRGS grammar it can allow multiple pronunciations
                                                of the word in the grammar to accommodate different speaking styles</p>
                                        </td>
                                    </tr>                                    
                                    <tr>
                                        <td align="left" valign="top" class="style19">
                                            <p><a href="javascript:toggle('toggleText2','switchText2');" rel="nofollow">
                                                    <span class="link2" style="font-size: 18pt;">Why do we need such a markup language?</span>
                                                    <div id="switchText2" style="display: inline;"></div></a><div id="toggleText2" style="display: none">&nbsp;
                                                    <p><div class="style32">
                                                            <p>In voice browsing applications there is often a need to use proper nouns or other unusual words
                                                                within speech recognition grammars and in text to be read out by Text-to-Speech processors.
                                                                These words may not be present in the platforms' built-in lexicons. In such cases voice
                                                                browsers typically resort to automatic pronunciation generation algorithms, which may be
                                                                improved by manually specificied pronunciations. The goal of the pronunciation lexicon markup
                                                                is to provide a mechanism for application developers to supply high quality additional
                                                                pronunciations in a platform independent manner.</p>
                                                            <p>In many cases application developers will need to only provide one or two additional
                                                                pronunciations inline within other voice markup languages, but there are other cases where an
                                                                application may make use of large pronunciation lexicons that cannot conveniently be specified
                                                                inline and have to be provided as separate documents. The pronunciation lexicon markup will
                                                                address both communities.</p>
                                                            <p> The markup language for pronunciation lexicons will be developed within the following broad
                                                                design criteria. They are ordered from higher to lower priority. In the event that two goals
                                                                conflict, the higher priority goal takes precedence. Specific technical requirements are
                                                                addressed in the following sections.</p>
                                                            <ol>
                                                                <li>The pronunciation lexicon markup language will enable consistent, platform independent
                                                                    control of pronunciations for use by voice browsing applications.</li>
                                                                <li>The pronunciation lexicon markup language should be sufficient to cover the
                                                                    requirements of speech recognition and speech synthesis systems within a voice
                                                                    browser.</li>
                                                                <li>The pronunciation lexicon markup language will be an XML language and shall be
                                                                    interoperable with relevant W3C specifications (see section 2 Interoperability
                                                                    Requirements for details).</li>
                                                                <li>The pronunciation lexicon markup language will be usable in a large number of human
                                                                    languages (see the requirements 3.4 and 3.5).</li>
                                                                <li>It should be easy and computationally efficient to automatically generate and process
                                                                    documents using the pronunciation lexicon markup language.</li>
                                                                <li>All features of the pronunciation lexicon markup language should be implementable with
                                                                    existing, generally available technology. Anticipated capabilities should be considered to
                                                                    ensure future extensibility (but are not required to be covered in the specification).</li>
                                                                <li>The pronunciation lexicon markup language should be easy to author, where appropriate
                                                                    deriving from existing pronunciation lexicons formats and using existing pronunciation
                                                                    alphabets.</li>
                                                            </ol>
                                                        </div>
                                                    </p></div>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" valign="top" class="style19">
                                            <p><a href="javascript:toggle('toggleText3','switchText3');" rel="nofollow">
                                                    <span class="link2" style="font-size: 18pt;">Background of PLS for Indian Languages</span>
                                                    <div id="switchText3" style="display: inline;"></div></a><div id="toggleText3" style="display: none">&nbsp;
                                                    <p><div class="style32"><p>Man machine communication in speech mode involves the integration of all technologies
                                                                needed for both speech input, as well as output, as per all the attributes demanded by the
                                                                discipline of associated language. In this context, as explained earlier for India, Speech
                                                                Synthesis and Speech Recognition are considered to be of primary need not only to empower
                                                                disabled people, but also to functionally literate population.</p>
                                                            <p>One of the important components for the speech technology development for the particular
                                                                language is the pronunciation dictionary. This is because it represents the interface between
                                                                speech analysis on the acoustic level and speech interpretation. For example in automatic
                                                                speech recognition (ASR), the search module relies on phonetic transcriptions to select
                                                                appropriate acoustic models against which to score the input utterance. Likewise, in text-tospeech
                                                                (TTS) synthesis, phonemic transcriptions are required for the selection of the proper
                                                                units from which to generate the desired waveform.</p>
                                                            <p>Consistent specification of word pronunciation is critical to the success of many speech
                                                                technology applications. Most state-of-the-art Automatic Speech Recognition (ASR) and Text-
                                                                To-Speech (TTS) systems rely on lexicons, which contain pronunciation information for many
                                                                words. To provide for a maximum coverage of the words, multi-word expressions or even
                                                                phrases, which commonly occur in a given application.-domain, application-specific word or
                                                                phrase pronunciations may be required, especially for application-specific proper nouns, such
                                                                as personal names or location names.</p>

                                                            <p>Several guidelines have been reported to define the structure of a pronunciation lexicon, ranging from simple two-column
                                                                ASCII lexicons providing the mapping between graphemic and phonemic transcriptions, to more general de-facto standards and
                                                                new standardization attempts, which are also handling multiple orthographies and multiple pronunciations.</p>
                                                            <p>The ISO-TC37 initiative, which started at LREC 2002, initiated work on a family of ISO standards related to natural language
                                                                processing (Romary et al., 2006). Currently these standards are available in working drafts of high-level specifications for
                                                                word segmentation, feature structures, annotations, and also for lexicons. The high-level specifications build on lower-level
                                                                specifications in form of language and country codes, data categories, code scripts, and Unicode. Lexicon specifications are
                                                                covered by the "Lexical Markup Framework" under ISO 24613 (Romary et al., 2006). The same description structure in terms of
                                                                morphology, syntax and semantics (and translation) applies to monolingual up to multilingual lexicons. Multi-word expressions
                                                                are given special attention.</p>
                                                            <p>Another initiative, the W3C Voice Browser Activity, has recently published a Pronunciation Lexicon Specification (PLS)
                                                                Version 1.0.</p>
                                                            <p>PLS is designed to enable interoperable specification of pronunciation information for both speech recognition and speech
                                                                synthesis engines within voice browsing applications. The language is intended to be easy to use by developers while supporting
                                                                the accurate specification of pronunciation information for international use.</p>
                                                            <p>The language allows one or more pronunciations for a word or phrase to be specified using a standard pronunciation alphabet
                                                                or if necessary using vendor specific alphabets. Pronunciations are grouped together into a PLS document which may be referenced
                                                                from other markup languages, such as the Speech Recognition Grammar Specification SRGS and the Speech Synthesis Markup Language
                                                                SSML.</p>
                                                            <p>In case of Indian Languages grapheme to phoneme conversion is not of much problem as there
                                                                is very little or almost no discrepancy between written text and pronunciation. So phonological
                                                                rules are comparatively less complex in most of the Indian Languages. But it is not true for
                                                                Bangla language. The main problem of Bangla, Hindi and other Indian languages lies in the
                                                                neutral vowel [/ɔ/ in case of Bangla] deletion or modification . Bangla, as other Indian
                                                                languages, is a syllabic script. Each consonant in written Bangla is associated with an “inherent”
                                                                neutral vowel. If one wants to represent a consonant without a vowel then one has to attach the
                                                                sign halant. But in practice the neutral vowel is deleted even if halant information is not attached
                                                                with the consonant. The problem is that this neutral vowel is sometimes pronounced and
                                                                sometimes not. For example in case of the word আচমকা/AchamakA/ the schwa with the medial
                                                                /m/ is deleted whereas retains in /ch/ though there is no halant information attached with both
                                                                the consonants. This is also true in case of word final consonant. In word final position if a
                                                                single consonant without any ligature is present then the neutral vowel is not pronounced, like in
                                                                the word কেঠার /kaThora/ is pronounced as /kaThor/(/kɔʈʰor/) instead of /kaThora/.It is also
                                                                observed that in case of compound word some times the neutral vowel attached with the end
                                                                consonant of the first member word is not pronounced like রাজপুত্র /rAjaputra/ is pronounced as
                                                                /rAjputro/ (/rɑjpuʈro/) the neutral vowel /a/ of first member word /rAja/ is deleted.</p>
                                                        </div>
                                                    </p></div>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" valign="top" class="style19">
                                            <p><a href="javascript:toggle('toggleText4','switchText4');" rel="nofollow">
                                                    <span class="link2" style="font-size: 18pt;">An Example of Bangla PL in PLS standard</span>
                                                    <div id="switchText4" style="display: inline;"></div></a><div id="toggleText4" style="display: none">&nbsp;
                                                    <p><div class="style32">
                                                            &lt;?xml version="1.0" encoding="UTF-8"?&gt;<br>
                                                            &lt;!-- This pronunciation lexicon is licensed under the GPL. --&gt;<br>
                                                            &lt;lexiconversion="1.0" xmlns="http://www.w3.org/2005/01/pronunciation-lexicon"<br>
                                                            xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"<br>
                                                            xsi:schemaLocation="http://www.w3.org/2005/01/pronunciation-lexicon<br>
                                                            http://www.w3.org/TR/2007/CR-pronunciation-lexicon-20071212/pls.xsd"<br>
                                                            alphabet="ipa" xml:lang="bn"&gt;<br>
                                                            &lt;lexeme&gt;<br>
                                                            &lt;grapheme&gt;আমি&lt;/grapheme&gt;<br>
                                                            &lt;POS&gt;PPR.n-Nml.n-Neg.1p.Sg&lt;/POS&gt;<br>
                                                            &lt;phoneme&gt;ɐmi&lt;/phoneme&gt;<br>
                                                            &lt;/lexeme&gt;<br>
                                                            &lt;lexeme&gt;<br>
                                                            &lt;grapheme&gt;অবিমৃশ্যকারিতা&lt;/grapheme&gt;<br>
                                                            &lt;POS&gt;NC.n-Nml.Neg&lt;/POS&gt;<br>
                                                            &lt;phoneme&gt;ɔbimriʃʃokarita&lt;/phoneme&gt;<br>
                                                            &lt;/lexeme&gt;<br>
                                                            &lt;lexeme&gt;<br>
                                                            &lt;grapheme&gt;অংশ্যমান&lt;/grapheme&gt;<br>
                                                            &lt;POS&gt;NC.n-Nml.Ord&lt;/POS&gt;<br>
                                                            &lt;phoneme&gt;ɔŋʃoman&lt;/phoneme&gt;<br>
                                                            &lt;/lexeme&gt;<br>
                                                            &lt;/lexicon&gt;
                                                        </div>
                                                    </p></div>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" valign="bottom" class="style18">Reference<br /><br /></td>
                                    </tr>
                                    <br />
                                    <tr>
                                        <td align="left" valign="top" class="style19">
                                            <p class="style30">Use of Part Of Speech (POS) and morphological information for resolving
                                                Multiple Pronunciations in Pronunciation Lexicon Specification (PLS) for
                                                Indian Languages – Bengali as a Case Study</p>
                                            <p>Shyamal Das Mandal, Somnath Chandra and Swaran Lata
                                                <span class="style32"><a href="files/Position-Paper_-India-W3C_Workshop-PLS-final.pdf" target="_blank" class="link2">PDF</a></span>
                                            </p>
                                        </td>
                                    </tr>
                                </table>
                                <p><br /></p>
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
