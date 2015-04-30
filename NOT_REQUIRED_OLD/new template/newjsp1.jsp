<%-- 
    Document   : newjsp1
    Created on : 8 Aug, 2012, 2:53:52 PM
    Author     : Sankar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript">
            var cc= "poss";
            function positionInfo(object) {

                var p_elm = object;

                this.getElementLeft = getElementLeft;
                function getElementLeft() {
                    var x = 0;
                    var elm;
                    if(typeof(p_elm) == "object"){
                        elm = p_elm;
                    } else {
                        elm = document.getElementById(p_elm);
                    }
                    while (elm != null) {
                        if(elm.style.position == 'relative') {
                            break;
                        }
                        else {
                            x += elm.offsetLeft;
                            elm = elm.offsetParent;
                        }
                    }
                    return parseInt(x);
                }

                this.getElementWidth = getElementWidth;
                function getElementWidth(){
                    var elm;
                    if(typeof(p_elm) == "object"){
                        elm = p_elm;
                    } else {
                        elm = document.getElementById(p_elm);
                    }
                    return parseInt(elm.offsetWidth);
                }

                this.getElementRight = getElementRight;
                function getElementRight(){
                    return getElementLeft(p_elm) + getElementWidth(p_elm);
                }

                this.getElementTop = getElementTop;
                function getElementTop() {
                    var y = 0;
                    var elm;
                    if(typeof(p_elm) == "object"){
                        elm = p_elm;
                    } else {
                        elm = document.getElementById(p_elm);
                    }
                    while (elm != null) {
                        if(elm.style.position == 'relative') {
                            break;
                        }
                        else {
                            y+= elm.offsetTop;
                            elm = elm.offsetParent;
                        }
                    }
                    return parseInt(y);
                }

                this.getElementHeight = getElementHeight;
                function getElementHeight(){
                    var elm;
                    if(typeof(p_elm) == "object"){
                        elm = p_elm;
                    } else {
                        elm = document.getElementById(p_elm);
                    }
                    return parseInt(elm.offsetHeight);
                }

                this.getElementBottom = getElementBottom;
                function getElementBottom(){
                    return getElementTop(p_elm) + getElementHeight(p_elm);
                }
            }

            function showSearchOptions(id){
                
                var fieldPos = new positionInfo(id);
                //var calendarPos = new positionInfo(cc);

                var x = fieldPos.getElementLeft();
                var y = fieldPos.getElementBottom();
                //alert(x+"=="+y);
                var img = document.getElementById("poss");
                img.style.top = y+"px";
                img.style.left = x+"px";
                img.style.display='block';
            }
        </script>

        <style>

            #postable
            {
                position: fixed;
            }

        </style>
    </head>
    <body>
        <table border="1">
            <tbody>
                <tr>
                    <td><input type="text" name="ss" value="" id ="possi1" onclick="showSearchOptions(this)"/></td>
                    <td></td>
                </tr>
                <tr>
                    <td><input type="text" name="ss" value="" id ="possi2" onclick="showSearchOptions(this)"/></td>
                    <td></td>
                </tr>
                <tr>
                    <td><input type="text" name="ss" value="" id ="possi3" onclick="showSearchOptions(this)"/></td>
                    <td></td>
                </tr>
                <tr>
                    <td><input type="text" name="ss" value="" id ="possi4" onclick="showSearchOptions(this)"/></td>
                    <td></td>
                </tr>
                <tr>
                    <td><input type="text" name="ss" value="" id ="possi5" onclick="showSearchOptions(this)"/></td>
                    <td></td>
                </tr>
            </tbody>
        </table>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <input type="text" name="" value="" />

        <div id="postable" >
            <table border="0" cellspacing="5" cellpadding="5" style="background-color: #2F89DF; display: none" id="poss">
                <tbody><tr><td colspan="4" align="center">Add POS with corresponding Attribute</td></tr>
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
                        <td colspan="2" align="right"><input value="ADD" onclick="" type="button" /></td>
                    </tr>
                </tbody>
            </table>
        </div>

    </body>
</html>
