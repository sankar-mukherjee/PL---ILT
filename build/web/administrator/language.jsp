<%--
    Document   : newjsp
    Created on : 19 May, 2011, 2:15:10 PM
    Author     : Sankar
--%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page import="java.io.*,java.util.*,javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="shortcut icon" type="image/x-icon" href="../Images/favicon.ico"></link>
        <title>Add New Languages</title>
        <link rel="stylesheet" href="../css/nivo-slider.css" type="text/css" media="screen" />
        <style type="text/css">

            a.dropt {border-bottom: thin dotted; background: #ffeedd;}
            a.dropt:hover {text-decoration: none; background: #ffffff; z-index: 6; }
            a.dropt span {position: absolute; left: -9999px;
                          margin: 20px 0 0 0px; padding: 3px 3px 3px 3px;
                          border-style:solid; border-color:black; border-width:1px; z-index: 6;}
            a.dropt:hover span {left: 2%; background: #ffffff;}
            a.dropt span {position: absolute; left: -9999px;
                          margin: 4px 0 0 0px; padding: 3px 3px 3px 3px;
                          border-style:solid; border-color:black; border-width:1px;}
            a.dropt:hover span {margin: 10px 0 0 100px; background: #ffffff; z-index:6;}

        </style>
        <script type="text/javascript">
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
            
            function validateForm()
            {
                var x= document.forms["myform"]["lan"].value
                var y= document.forms["myform"]["gtop"].value
                if(x==null || x=="" || y==null || y=="" )
                {
                    alert("This two form must be filled out");
                    return false;
                }                 
            }
        </script>
        <script type="text/javascript">
            function validateForm(file)
            {
                var filename = document.getElementById("file").value;
                var extension = filename.substring(filename.lastIndexOf(".") + 1, filename.length);
                var TEXT = "txt";
                var x= document.getElementById(file).value;
                if(x.valueOf().length<1)
                {
                    alert(" Please Upload your file");
                    return false;
                }else if(TEXT !== extension){alert("Not a TEXT file");}
                else{ alert("Submitted Successfully");}
            }
        </script>
    </head>
    <body>
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
                                                    <td><img src="../assets/logo.png" width="80" height="80" /></td>
                                                    <td align="center">
                                                        <a style="color: white; font-size:200%"> Add New Language in Master Database 
                                                            as well as Temporary Database</a>
                                                        </br>
                                                    </td>
                                                    <td><img src="../assets/gov.jpg" width="80" height="80" /></td>
                                                </tr>
                                            </table>
                                        </td>                                        
                                    </tr>
                                </table>
                            </td>
                        </tr>                                                                                                                                
                        <tr>
                            <td height="250" align="center" valign="top">
                                <table cellspacing="5" cellpadding="5" border="0" align="center">                                    
                                    <tr>
                                        <td colspan="2" align="center"><h3><b>Add Languages</b></h3><hr></hr></td>
                                    </tr>
                                    <%String file_name = request.getParameter("FILE_NAME");
                                        if (file_name != null) {
                                    %>
                                    <P>UPLOAD FILE NAME:- <%=file_name%></P>
                                    <%
                                        }
                                    %>
                                    <form name="add_language" action="add_language.jsp" method="POST" enctype="multipart/form-data">
                                        <tr>
                                            <td style="float: left;display: block" colspan="1" id="doc2" height="30px">
                                                <b>Upload File:-</b><input name="file" id="file" type="file" style="border:2px solid #777777 ;  "/>
                                                <td><input type="submit" value="Submit"  name="submit" onclick= "return validateForm('file')"/></td>
                                            </td>
                                        </tr>
                                    </form>
                                    <tr>
                                        <td><a style="color: red">(*Uploaded File name should be in smaller case)</a></td>
                                    </tr>
                                    <tr><p></p>
                                        <td><a style="color: red">(*Uploaded File should be in .txt format)</a></td>
                                        <td><a href="../files/assamese.txt" class="dropt" style="color: #000" >Show Format</a></td>
                                    </tr>                                        
                                    </form>
                                </table>
                                <hr></hr>
                                <p>&nbsp;</p>
                                <a class="link2" href="administrator.jsp" >Back to ADMIN page</a>
                            </td>
                        </tr>
                    </table>
                    </body>
                    </html>
