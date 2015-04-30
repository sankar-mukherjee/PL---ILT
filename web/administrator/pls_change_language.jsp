<%--
    Document   : newjsp
    Created on : 19 May, 2011, 2:15:10 PM
    Author     : Sankar
--%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!
    public int nullIntconv(String str) {
        int conv = 0;
        if (str == null) {
            str = "0";
        } else if ((str.trim()).equals("null")) {
            str = "0";
        } else if (str.equals("")) {
            str = "0";
        }
        try {
            conv = Integer.parseInt(str);
        } catch (Exception e) {
        }
        return conv;
    }
%>
<%

    String language = request.getParameter("language");

    String ORT = request.getParameter("ser");
    String connectionURL = "jdbc:mysql://localhost:3306/ide_temp?useUnicode=true&characterEncoding=UTF-8";
    Connection connection = null;
    PreparedStatement pstatement = null;
    ResultSet rs = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    connection = DriverManager.getConnection(connectionURL, "root", "root");

    int iShowRows = 20;  // Number of records show on per page
    int iTotalSearchRecords = 10;  // Number of pages index shown
    int iTotalRows = nullIntconv(request.getParameter("iTotalRows"));
    int iTotalPages = nullIntconv(request.getParameter("iTotalPages"));
    int iPageNo = nullIntconv(request.getParameter("iPageNo"));
    int cPageNo = nullIntconv(request.getParameter("cPageNo"));

    if (ORT != null && ORT.length() > 0) {
        String resultString = "SELECT * FROM " + language + " ORDER BY ORTHOGRAPHY";
        pstatement = connection.prepareStatement(resultString);
        rs = pstatement.executeQuery();
        double c = 1;
        double rowcount = 1;
        while (rs.next()) {
            if (rs.getString(2).equals(ORT)) {
                rowcount = c;
                //out.println(rowcount);
                rs.last();
            } else {
                c = c + 1;
            }
        }

        int G = ((int) (Math.ceil(rowcount / 20)));
        iPageNo = Math.abs((int) (G - 1) * iShowRows);

    } else {
        if (iPageNo == 0) {
            iPageNo = 0;
        } else {
            iPageNo = Math.abs((iPageNo - 1) * iShowRows);
        }
    }


    int iStartResultNo = 0;
    int iEndResultNo = 0;

    ResultSet rsPagination = null;
    ResultSet rsRowCnt = null;
    PreparedStatement psPagination = null;
    PreparedStatement psRowCnt = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    int updateQuery = 0;
    int updateQuery1 = 0;
    String[] up = new String[130000];
    connection = DriverManager.getConnection(connectionURL, "root", "root");
    String sqlPagination = "SELECT SQL_CALC_FOUND_ROWS * FROM " + language + " ORDER BY ORTHOGRAPHY ASC limit " + iPageNo + "," + iShowRows + "";
    psPagination = connection.prepareStatement(sqlPagination);
    rsPagination = psPagination.executeQuery();
    //rsPagination.last();
    //int nrows=rsPagination.getRow();
    //rsPagination.beforeFirst();
    String sqlRowCnt = "SELECT FOUND_ROWS() as cnt";
    psRowCnt = connection.prepareStatement(sqlRowCnt);
    rsRowCnt = psRowCnt.executeQuery();
    if (rsRowCnt.next()) {
        iTotalRows = rsRowCnt.getInt("cnt");
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

        <link rel="shortcut icon" type="image/x-icon" href="../Images/favicon.ico">
        <script type="text/javascript" src="../JavaScript/keyboard_admin.js" charset="UTF-8"></script>
        <link rel="stylesheet" type="text/css" href="../css/keyboard.css" />
        <link rel="stylesheet" href="../css/nivo-slider.css" type="text/css" media="screen" />
        <script type="text/javascript" src="../JavaScript/chainedselects.js"></script>
        <script type="text/javascript"  language="javascript" src="../ii.txt"></script>
        <title><% out.print(language);%></title>
        <style type="text/css">
            #postable td, #postable select, #postable option {font-size:12pt; color:#000000; font-weight:normal; font-family:sans-serif,verdana,helvetica;}
            #postable select { width:150px; }
            #postable
            {
                position:absolute;
                z-index: 100;
            }

        </style>
        <script type="text/javascript">
            checked=false;
            value="off";
            function value_v(id){
                var aa= document.getElementById(id);
                //alert(aa.value);
                if(aa.value=="off"){

                    aa.value="on";
                }else{
                    aa.value="off";
                }
            }

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
    <body onload="initListGroup('pos', document.forms[0].make2, document.forms[0].type2, document.forms[0].model2, document.forms[0].struct2);">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td width="100%" height="145" align="center" valign="bottom">
                    <table width="900" height="145" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="left" valign="top">
                                <table width="900" height="144" border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td align="center">
                                            <a style="color: white; font-size:300%"><% out.print(language);%></a>
                                            </br>
                                        </td>                                        
                                    </tr>
                                </table>
                            </td>                            
                        </tr>
                        <tr>
                            <td>
                                <p>&nbsp;</p>
                                <a class="link2" href="pls_changes.jsp">Back to Language Select page</a>
                            </td>
                        </tr>
                        <input type="hidden" name="iPageNo" value="<%=iPageNo%>">
                        <input type="hidden" name="cPageNo" value="<%=cPageNo%>">
                        <input type="hidden" name="iShowRows" value="<%=iShowRows%>">                     
                        <tr>
                            <td>                     
                                <table border="0" cellspacing="5" cellpadding="5" align="center" width="70%">
                                    <tbody>
                                        <%
                                            //// calculate next record start record  and end record
                                            try {
                                                if (iTotalRows < (iPageNo + iShowRows)) {
                                                    iEndResultNo = iTotalRows;
                                                } else {
                                                    iEndResultNo = (iPageNo + iShowRows);
                                                }
                                                iStartResultNo = (iPageNo + 1);
                                                iTotalPages = ((int) (Math.ceil((double) iTotalRows / iShowRows)));
                                            } catch (Exception e) {
                                                e.printStackTrace();
                                            }
                                        %>
                                        <tr>
                                            <td colspan="9" style="" align="center" class="data_link">
                                                <%
                                                    int i = 0;
                                                    int cPage = 0;
                                                    if (iTotalRows != 0) {
                                                        cPage = ((int) (Math.ceil((double) iEndResultNo / (iTotalSearchRecords * iShowRows))));

                                                        int prePageNo = (cPage * iTotalSearchRecords) - ((iTotalSearchRecords - 1) + iTotalSearchRecords);
                                                        if ((cPage * iTotalSearchRecords) - (iTotalSearchRecords) > 0) {
                                                %>
                                                <a href="pls_change_language.jsp?iPageNo=<%=prePageNo%>&cPageNo=<%=prePageNo%>&language=<%=language%>"> <b><< Previous&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></a>
                                                <%
                                                    }

                                                    for (i = ((cPage * iTotalSearchRecords) - (iTotalSearchRecords - 1)); i <= (cPage * iTotalSearchRecords); i++) {
                                                        if (i == ((iPageNo / iShowRows) + 1)) {
                                                %>
                                                <a href="pls_change_language.jsp?iPageNo=<%=i%>&language=<%=language%>" style="cursor:pointer;color: red"><b><%=i%></b></a>
                                                <%
                                                } else if (i <= iTotalPages) {
                                                %>
                                                <a href="pls_change_language.jsp?iPageNo=<%=i%>&language=<%=language%>"><%=i%></a>
                                                <%
                                                        }
                                                    }
                                                    if (iTotalPages > iTotalSearchRecords && i < iTotalPages) {
                                                %>
                                                <a href="pls_change_language.jsp?iPageNo=<%=i%>&cPageNo=<%=i%>&language=<%=language%>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Next >> </a>
                                                <%
                                                        }
                                                    }
                                                %>
                                                <br>Showing <%=iStartResultNo%> - <%=iEndResultNo%> of Total  <%=iTotalRows%>
                                            </td>
                                        </tr>
                                        <tr style="background-color: #2F89DF">
                                            <th>ORTHOGRAPHY</th>
                                            <th>POS</th>
                                            <th>PRONUNCIATION</th>
                                            <th>MEANING</th>
                                            <th>Standard</th>
                                            <th>Update</th>
                                            <th>Delete</th>
                                        </tr>
                                    <form method="get" action="edit_Temp_lang_database_success.jsp">
                                        <%int kk = 0;
                                            while (rsPagination.next()) {
                                                if (rsPagination.getString(2).equals(ORT)) {
                                                    out.println("<tr style='background-color: #0475FF'>");
                                                } else {
                                                    out.println("<tr style='background-color: #CCCCCC'>");
                                                }
                                        %>
                                        <input type="hidden" name="language" value="<%=language%>"/>
                                        <input type="hidden" name="id<%= kk%>" value="<%=rsPagination.getString(1)%>"/>
                                        <input type="hidden" name="iPageNo" value="<%=((iPageNo / 20) + 1)%>">
                                        <input type="hidden" name="iShowRows" value="<%=iShowRows%>">
                                        <td><input type="text" class="keyboardInput" name="ort<%= kk%>" value="<%=rsPagination.getString(2)%>"/></td>
                                        <td><input type="text"  name="pos<%= kk%>" value= "<%=rsPagination.getString(5)%>" id="divid<%=kk%> " onclick="show(this)"/></td>
                                        <td><input type="text" name="pro<%= kk%>" class="keyboardInput" value="<%=rsPagination.getString(3)%>" /></td>
                                        <td><input type="text" name="mean<%= kk%>" value= "<%=rsPagination.getString(4)%>"/></td>
                                        <td><%if (rsPagination.getString(6).equals("1")) {
                                                out.print("<input type='radio' name='attr" + kk + "' value='1' checked='yes'/>True<br>"
                                                        + "<input type='radio' name='attr" + kk + "' value='0'/>False");                                                
                                            } else {
                                                out.print("<input type='radio' name='attr" + kk + "' value='1' />True<br>"
                                                        + "<input type='radio' name='attr" + kk + "' value='0' checked='yes'/>False");                                               
                                            }%></td>
                                        <td><input type="checkbox" id="confirm<%= kk%>" name="confirm<%= kk%>" value="off" onclick="value_v(this.id)"/>
                                        </td>
                                        <td><input type="checkbox" id="delete<%= kk%>" name="delete<%= kk%>" value="off" onclick="value_v(this.id)"/>
                                        </td>
                                        <%
                                                out.println("</tr>");
                                                kk++;
                                            }
                                            request.getSession().setAttribute("regis111", kk);%>
                                        <tr><td align="right" colspan="6"> <input type="submit" value="Update" /></td></tr>
                                        <div id="postable" style="display: none">

                                        </div>
                                    </form>
                                    </tbody>
                                </table>
                                <hr></hr>
                                <a class="link2" href="pls_changes.jsp">Back to Language Select page</a>
                    </table>    
                    </body>
                    </html>
                    <%
                        try {
                            if (psPagination != null) {
                                psPagination.close();
                            }
                            if (rsPagination != null) {
                                rsPagination.close();
                            }

                            if (psRowCnt != null) {
                                psRowCnt.close();
                            }
                            if (rsRowCnt != null) {
                                rsRowCnt.close();
                            }

                            if (connection != null) {
                                connection.close();
                            }
                        } catch (Exception ex) {
                            out.println("Unable to connect to Database." + ex.getMessage());
                        }%>