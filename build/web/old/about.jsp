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
        <title>About IDE</title>
        <link rel="stylesheet" href="css/nivo-slider.css" type="text/css" media="screen" />
        <script type="text/javascript">
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
                                                                                    <%
                                                                                        if (session.getAttribute("username") != null && session.getAttribute("username") != "" && session.getAttribute("password") != "" && session.getAttribute("password") != null) {
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
                                                                                <td width="10%" align="center" class="selected"><a href="about.jsp"><span>ABOUT</span></a></td>
                                                                                <td width="10%" align="center" class="tab"><a href="pls.jsp">PLS</a></td>
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
                                                                                            <td align="left" valign="top" class="style18">IPA representation of Indian language phonemes (Version 1.0)<br /><br /></td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td align="left" valign="top" class="style19">
                                                                                                <p class="style30">Document is created as per the discussion on the 1st meeting of creation of PLS for Indian languages on 5th May 2011 at JNU, New Delhi</p>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td align="left" valign="top" class="style19">
                                                                                                <p><a href="javascript:toggle('toggleText1','switchText1');" rel="nofollow">
                                                                                                        <span class="link2" style="font-size: 18pt;">Abstract</span>
                                                                                                        <div id="switchText1" style="display: inline;"></div></a><div id="toggleText1" style="display: none">&nbsp;
                                                                                                        <p class="style30">This document is used for preparing the IPA representation of all the
                                                                                                            phoneme in all Indian languages. This document is meant for a guide to prepare or listed
                                                                                                            out all the phoneme exist in all Indian languages with their articulatoray description
                                                                                                            along with example uses and sound sample.
                                                                                                        </p></div>
                                                                                                </p>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td align="left" valign="top" class="style19">
                                                                                                <p><a href="javascript:toggle('toggleText2','switchText2');" rel="nofollow">
                                                                                                        <span class="link2" style="font-size: 18pt;">Background</span>
                                                                                                        <div id="switchText2" style="display: inline;"></div></a><div id="toggleText2" style="display: none">&nbsp;
                                                                                                        <p><div class="style32"><p>The importance of sounds as vehicles of meaning is something people have been aware of for thousands of years.
                                                                                                                    However, systematic studies on the speech sound only appeared with the development of modern sciences.
                                                                                                                    The term phonetics used in connection with such studies comes from Greek φωνή, phōnē, "sound, voice".
                                                                                                                    It is a branch of linguistics that comprises the study of the sounds of human speech. It is concerned with the
                                                                                                                    physical properties of speech sounds, and the processes of their physiological production, auditory reception,
                                                                                                                    and neurophysiological perception.</p>
                                                                                                                <p>Phonetics was studied as early as 2500 years ago in ancient India. In ancient India, the Sanskrit grammarian
                                                                                                                    Pāṇini (c. 520–460 BC) in his text of Sanskrit phonology, the Shiva Sutras, discusses something like the concepts of
                                                                                                                    the phoneme. The Shiva Sutras of Pāṇini describe a phonemic notational system in the fourteen initial lines of the
                                                                                                                    Aṣṭādhyāyī in which he gave an account of the place and mannner of articulation of consonants.</p>
                                                                                                                <p>Besides the Indians, the Greeks, the Romans, the Egyptians and the Arabs also took interest in speech around the seventh
                                                                                                                    century A.D in connection with the Koran and Arabic studies leading to the developments in lexicography, the study of
                                                                                                                    pronunciation and the language history.</p>
                                                                                                                <p>Some of the writers of sixteenth century whose work was concerned with the relation between the sounds of English and
                                                                                                                    those of another language were John Palgrave, William Salesbury, Thomas Hurt, John Wallis etc. Hart not only made spelling
                                                                                                                    reform, he also took interest in describing the organs of speech and defining vowels and consonants. The purpose of Wallis
                                                                                                                    was to enable his countrymen to understand the true nature of their native language more elaborately.</p>
                                                                                                                <p> Christopher Cooper was the most prominent among the seventeenth century phoneticians. He wanted to set out some phonological
                                                                                                                    rules for English. Unlike Hart, his aim was to describe English, as it was existed, not to reform spelling system.
                                                                                                                    The trend of seventeenth century was continued in the eighteenth century. The main aim of the eighteenth century writers was to
                                                                                                                    standardize the language. The dictionaries of Samuel Johnson, Thomas Sheridan and John Walker were the praiseworthy contributions
                                                                                                                    of this age.</p>
                                                                                                                <p>The basic building block of any discussion of articulatory phonetics is phoneme. The technical term phoneme is usually used
                                                                                                                    to refer to sound segments. Linguists define phoneme as the minimal unit of sound (or sometimes syntax). The study of
                                                                                                                    phonemes is the study of the sounds of speech in their primary function, which is to make vocal signs that refer to the
                                                                                                                    fact that different things sound different.  The phonemes of a particular language are those minimal distinct units of
                                                                                                                    sound that can distinguish meaning in that language.</p>
                                                                                                                <p>It is quite clear that ordinary writing systems (i.e., alphabet or orthography) cannot illustrate pronunciation differences.
                                                                                                                    There are many words that are written with the same set of alphabet but pronounced differently. There are also some words,
                                                                                                                    which are written with different sets of alphabet but pronounced the same. As such, phonologists and phoneticians felt the
                                                                                                                    need for a new writing system, one in which the symbols fully represent the sounds of any language.</p>
                                                                                                                <p>Since the Renaissance the language teachers, language enthusiasts had taken serious interest in phonetics. In England
                                                                                                                    Alexandar J. Ellis (1814-90) presented to English people as well as to foreigners an alphabet (Phonotype, 1847). At the
                                                                                                                    end of nineteenth century with the development of physiology and acoustics and the accompanying progress in instrumentation,
                                                                                                                    experimental research in all branches of phonetics took place. Also in the late nineteenth century some of scholars like
                                                                                                                    Henry Sweet attempted in producing a phonetic alphabet and ultimately in 1889 International Phonetic Alphabet came to be
                                                                                                                    formulated. Till date the most commonly used alphabet is known as the Phonetic Alphabet designed by the International Phonetic
                                                                                                                    Association (IPA).</p>
                                                                                                                <p>To show how a speech sound is articulated, all the vocal activities involved in the production of a sound need not be
                                                                                                                    described. Only a selection of them such as the place and manner of articulation is enough. Phonetic symbols and their
                                                                                                                    articulatory definitions are abbreviated descriptions of these selected activities. So phonetic symbol represent the place
                                                                                                                    and manner of articulation of the Phoneme.</p>
                                                                                                                <p>In the present century phonetics has developed immensely in various directions and established his status as a separate
                                                                                                                    discipline. The aim of phonetics in this present age is not to provide only notation but to analyse speech into its basic
                                                                                                                    units, which may thereafter be transcribed in some way. The contribution of Daiel Jones, Abercrombie, or among the more
                                                                                                                    recent researchers the name of Chomsky, Morris Halle, Trager and Smith are noteworthy in this connection [1].</p>
                                                                                                                <p>Phonetics has three main branches: 1) Articulatory Phonetics 2) Acoustic Phonetics and 3) Auditory Phonetics.</p>
                                                                                                                <p>Articulatory Phonetics is concerned with the articulation of speech. The production of vowels and consonants in various parts
                                                                                                                    of the mouth and throat is discussed in this branch.</p>
                                                                                                                <p>Acoustic phonetics is concerned with acoustics of speech. It studies the sound waves that transmit the vowels and consonants
                                                                                                                    through the air from the speaker to the hearer.</p>
                                                                                                                <p>Auditory phonetics is concerned with speech perception. How sound is received by the inner ear and perceived by the brain.</p>
                                                                                                                <p>Though there is no universally accepted point of view about a clear-cut border line between the respective domains of
                                                                                                                    phonetics and phonology as, indeed, it is not possible to talk about a phonological system ignoring the phonetic
                                                                                                                    aspects it involves and, on the other hand, any phonetic approach should take into account the phonological system
                                                                                                                    that is represented by any language, most linguists will agree about some fundamental distinctions between the two.</p>
                                                                                                            </div>
                                                                                                        </p></div>
                                                                                                </p>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td align="left" valign="top" class="style19">
                                                                                                <p><a href="javascript:toggle('toggleText3','switchText3');" rel="nofollow">
                                                                                                        <span class="link2" style="font-size: 18pt;">Why this document?</span>
                                                                                                        <div id="switchText3" style="display: inline;"></div></a><div id="toggleText3" style="display: none">&nbsp;
                                                                                                        <p><div class="style32"><p>Man machine communication in speech mode involves the integration of all technologies needed for both speech input,
                                                                                                                    as well as output, as per all the attributes demanded by the discipline of associated language. In this context, as
                                                                                                                    explained earlier for India, Speech Synthesis and Speech Recognition are considered to be of primary need not only to
                                                                                                                    empower disabled people, but also to functionally literate population.</p>
                                                                                                                <p>One of the important components for the speech technology development for the particular language is the pronunciation
                                                                                                                    dictionary. This is because it represents the interface between speech analysis on the acoustic level and speech interpretation.
                                                                                                                    For example in automatic speech recognition (ASR), the search module relies on phonetic transcriptions to select appropriate
                                                                                                                    acoustic models against which to score the input utterance. Likewise, in text-to-speech (TTS) synthesis, phonemic transcriptions
                                                                                                                    are required for the selection of the proper units from which to generate the desired waveform.</p>
                                                                                                                <p>Consistent specification of word pronunciation is critical to the success of many speech technology applications.
                                                                                                                    Most state-of-the-art Automatic Speech Recognition (ASR) and Text-To-Speech (TTS) systems rely on lexicons, which contain
                                                                                                                    pronunciation information for many words. To provide for a maximum coverage of the words, multi-word expressions or even
                                                                                                                    phrases, which commonly occur in a given application.-domain, application-specific word or phrase pronunciations may be
                                                                                                                    required, especially for application-specific proper nouns, such as personal names or location names.</p>
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
                                                                                                                    SSML.
                                                                                                                    The above PLS is used IPA symbol to represent phoneme and it was decided that IPA will be used for creation of PL for
                                                                                                                    Indian language</p>
                                                                                                                <p>For the creation of Pronunciation Lexicon in Indian language it is required to listing out the IPA symbols witch will be used for
                                                                                                                    Indian languages.</p>
                                                                                                            </div>
                                                                                                        </p></div>
                                                                                                </p>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td align="left" valign="top" class="style19">
                                                                                                <p><a href="javascript:toggle('toggleText4','switchText4');" rel="nofollow">
                                                                                                        <span class="link2" style="font-size: 18pt;">Some useful definition</span>
                                                                                                        <div id="switchText4" style="display: inline;"></div></a><div id="toggleText4" style="display: none">&nbsp;
                                                                                                        <p><div class="style32"><h3>Place of articulation:</h3> <p>During the articulation the air-streams passing through the vocal tract must be obstructed in
                                                                                                                    some way. The place where the obstruction takes place is called the place of articulation.</p>
                                                                                                                <h3>Bilabial:</h3> <p>Bilabial sounds are produced when the two lips make the constriction</p>
                                                                                                                <h3>Labiodentals:</h3> These sounds are produced by contacting lower lip with the upper teeth.
                                                                                                                <h3>Dental:</h3> Dental sounds are produced by the constriction of tip or blade of the tongue with the upper teeth.
                                                                                                                <h3>Alveolar:</h3> The sound made by the tip or the blade of the tongue in contact against the alveolar ridge, which is the bony
                                                                                                                prominence immediately behind the upper teeth.
                                                                                                                <h3>Post alveolar:</h3> The sound, which is articulated by the tip or the blade of the tongue with the back area of the alveolar ridge.
                                                                                                                <h3>Retroflex:</h3> Retroflex sounds are made when the tip of the tongue curled back in the direction of the front part of the hard
                                                                                                                palate- in other words just behind the alveolar ridge. Depending on how far the tongue curls back, retroflexed could be
                                                                                                                apico-postalveolar or apico-palatal.
                                                                                                                <h3>Palatal:</h3> This sound is produced when the constriction is made by the front part of the tongue with the hard palate.
                                                                                                                <h3>Velar:</h3> It refers to a sound made by the back of the tongue against the soft palate.
                                                                                                                <h3>Uvular:</h3> This sound is produced when the back of the tongue touches the uvula.
                                                                                                                <h3>Pharyngeal:</h3> It refers to a sound produced in the pharynx, the tubular cavity, which constitutes the throat above the larynx.
                                                                                                                <h3>Glottal:</h3> These are the sounds, which made in the larynx due to the closure or narrowing of the glottis.

                                                                                                                <h3>Manner of articulation</h3>
                                                                                                                Manner of articulation is concerned with the airflow; the paths it take and the nature of obstruction in the pathway.
                                                                                                                The manner of articulation is particularly defined by four major factors: (a) whether there is vibration of the vocal cords
                                                                                                                (voiced vs. voiceless), (b) whether there is obstruction of the air-stream at any point above the glottis (consonant vs. vowel),
                                                                                                                (c) whether the air-stream passes through the nasal cavity in addition to the oral cavity (nasal vs. oral), and (d) whether the
                                                                                                                air-stream passes through the middle of the oral cavity or along the side(s) (non-lateral vs. lateral).
                                                                                                                <h3>Plosive, or oral stop:</h3> It is a type of consonant segment produced by a complete closure accompanied simultaneously by a
                                                                                                                velic closure. Because of these two closures the air-stream if egressive is momentarily completely dammed up and unable to get through
                                                                                                                the vocal tract. The air is therefore compressed behind the point of articulation and will escape with a small explosion if the
                                                                                                                consonant is immediately followed by a vowel. But if the consonant is in the position before a pause then only the active articulator
                                                                                                                touches the passive articulator but no explosion sound is produced. In case of pulmonic ingressive stop the air behind the point of
                                                                                                                articulation is rarified and there will be a sudden rush of air inwards instead of outwards.
                                                                                                                <h3>Nasal stop:</h3> Nasal Stop usually shortened to nasal, where there is complete occlusion of the oral cavity, and the air passes
                                                                                                                instead through the nose. The shape and position of the tongue determine the resonant cavity that gives different nasal stops their
                                                                                                                characteristic sounds. Examples include English /m, n/. Nearly all languages have nasals
                                                                                                                <h3>Fricative:</h3> In the production of Fricative (sometimes called spirant) sounds two articulators come so close that the airstream
                                                                                                                moving between them produces an audible friction.
                                                                                                                <h3>Affricate:</h3> Which begins like a plosive, but this releases into a fricative rather than having a separate release of its own.
                                                                                                                <h3>Lateral:</h3> To produce a lateral sound, air is obstructed by the tongue at a point along the center of the mouth but the sides
                                                                                                                of the tongue are left low so that air can escape over its sides. In fact, the tongue is strongly flexed and the air is forced through
                                                                                                                a narrow oval cavity, producing a hushing sound.
                                                                                                                <h3>Approximant: </h3>An approximant is a consonant that makes very little obstruction to the airflow. Approximants are divided into
                                                                                                                two main groups: semivowels (also called glides) and liquids.
                                                                                                                <h3>Trill:</h3> In which the articulator (usually the tip of the tongue) is held in place, and the airstreams causes it to vibrate.
                                                                                                                Trills and flaps, where there are one or more brief occlusions, constitute a class of consonant called rhotics.
                                                                                                                <h3>Flap:</h3> Often called a tap, is a momentary closure of the oral cavity. Many linguists distinguish taps from flaps, but there
                                                                                                                is no consensus on what the difference might be. No language relies on such a difference. There are also lateral flaps.
                                                                                                            </div>
                                                                                                        </p></div>
                                                                                                </p>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td align="left" valign="top" class="style19">
                                                                                                <p class="style30">All the phonetic symbols are defined based on the place and manner of articulation. The International Phonetic Alphabet recognizes
                                                                                                    the following Place and Manner of articulation. As per the above definition of place and manner of articulation it is required to
                                                                                                    listing out all the phoneme of each of the Indian language and represents it using IPA symbols.  An example work is given bellow
                                                                                                    for the reference. Same kinds of table can be prepare for other Indian languages.</p>
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
