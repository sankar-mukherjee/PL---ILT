<%--
    Document   : newjsp
    Created on : 19 May, 2011, 2:15:10 PM
    Author     : Sankar
--%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%

            if (session.getAttribute("username") == null) {
%>
<jsp:forward page="login.jsp"/>
<%                        //response.sendRedirect("login.jsp"); // GO TO LOGIN PAGE
            }
%>
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
            request.setCharacterEncoding("UTF-8");
            String pos = request.getParameter("pos");
            String atr = request.getParameter("mor");
            String or = request.getParameter("ort");
            String pon = request.getParameter("pon");
            String mea = request.getParameter("mea");
            String chk = request.getParameter("chk");
            String go = request.getParameter("go");

            int iShowRows = 1;  // Number of records show on per page
            int iTotalSearchRecords = 1;  // Number of pages index shown

            int iTotalRows = nullIntconv(request.getParameter("iTotalRows"));
            int iTotalPages = nullIntconv(request.getParameter("iTotalPages"));
            int iPageNo = nullIntconv(request.getParameter("iPageNo"));
            int cPageNo = nullIntconv(request.getParameter("cPageNo"));

            int iStartResultNo = 0;
            int iEndResultNo = 0;

            if (iPageNo == 0) {
                iPageNo = 0;
            } else {
                iPageNo = Math.abs((iPageNo - 1) * iShowRows);
            }

            String connectionURL = "jdbc:mysql://localhost:3306/ide?useUnicode=true&characterEncoding=UTF-8";

            Connection connection = null;

            PreparedStatement pstatement = null;
            PreparedStatement pstatement1 = null;

            ResultSet rsPagination = null;
            ResultSet rsRowCnt = null;

            PreparedStatement psPagination = null;
            PreparedStatement psRowCnt = null;

            Class.forName("com.mysql.jdbc.Driver").newInstance();
            int updateQuery = 0;
            int updateQuery1 = 0;

            connection = DriverManager.getConnection(connectionURL, "root", "root");
            if (go == null) {
                if (pos != null && or != null && pon != null) {
                    String queryString = "UPDATE banglaorthography SET MEANING = ? , MORPHOLOGY = ? , POS = ? , PRONUNCIATION = ? WHERE ORTHOGRAPHY = '" + or + "'";

                    pstatement = connection.prepareStatement(queryString);
                    pstatement.setString(1, mea);
                    pstatement.setString(2, atr);
                    pstatement.setString(3, pos);
                    //pstatement.setString(4, or);
                    pstatement.setString(4, pon);

                    updateQuery = pstatement.executeUpdate();
                }

                //if (chk != null) {
                //     String queryString1 = "DELETE FROM banglaorthography WHERE ID = '" + chk + "' ";
                //       pstatement1 = connection.prepareStatement(queryString1);
                //        updateQuery1 = pstatement1.executeUpdate();
                //     }
                if (chk != null) {
                    String sqlPagination1 = "SELECT SQL_CALC_FOUND_ROWS * FROM banglaorthography WHERE ID > '" + chk + "' ORDER BY ID ASC limit " + iPageNo + "," + iShowRows + "";
                    psPagination = connection.prepareStatement(sqlPagination1);
                } else {
                    String sqlPagination2 = "SELECT SQL_CALC_FOUND_ROWS * FROM banglaorthography ORDER BY ID ASC limit " + iPageNo + "," + iShowRows + "";
                    psPagination = connection.prepareStatement(sqlPagination2);
                }
            } else {
                String sqlPagination3 = "SELECT SQL_CALC_FOUND_ROWS * FROM banglaorthography WHERE ID >=(SELECT ID FROM banglaorthography WHERE ORTHOGRAPHY = '" + go + "' )ORDER BY ID ASC limit " + iPageNo + "," + iShowRows + "";
                psPagination = connection.prepareStatement(sqlPagination3);
            }
            rsPagination = psPagination.executeQuery();


            //// this will count total number of rows
            String sqlRowCnt = "SELECT FOUND_ROWS() as cnt";
            psRowCnt = connection.prepareStatement(sqlRowCnt);
            rsRowCnt = psRowCnt.executeQuery();

            if (rsRowCnt.next()) {
                iTotalRows = rsRowCnt.getInt("cnt");
            }

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="css/Style.css" />
        <script type="text/javascript" src="JavaScript/keyboard_1.js" charset="UTF-8"></script>
        <link rel="stylesheet" type="text/css" href="css/keyboard.css">
        <title>All</title>
        <script type="text/javascript" src="JavaScript/chainedselects.js"></script>
        <script type="text/javascript"  language="javascript" src="ii.txt"></script>
        <script type="text/javascript" >
            var i;
            function show(id){
                var row = document.getElementById("ff");
                if (row.style.display == 'none') row.style.display = '';
                else row.style.display = 'none';
                i = id;

            }
            function addvalue(frm){                
                i.atr.value = frm.type3.value + ", " + i.atr.value;
                
                var b = frm.type3.selectedIndex;
                
                frm.type3.remove(b);
            }
            function change(obj) {
                var tr=obj.parentNode.parentNode; // this may change depending on the html used
                tr.style.backgroundColor=(obj.checked)? 'red' : 'scrollbar';
            }
        </script>

    </head>

    <body onload="initListGroup('attribute', document.forms.ff.make3, document.forms.ff.type3);" style="background-image: none">
        <div id="container">
            <div id="menu">
                <ul>
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="pls.jsp">PLS</a></li>
                    <li><a href="ipa.jsp">IPA Symbol</a></li>
                    <li><a href="newipamain.jsp">New IPA Symbol</a></li>
                    <li><a href="IDEMAIN.jsp">IDE</a></li>
                    <li><a href="comments.jsp">Comments</a></li>
                    <li><a href="help.jsp">Help</a></li>
                    <li><a href="publish.jsp">Publish</a></li>
                </ul>
            </div>
            <input type="hidden" name="iPageNo" value="<%=iPageNo%>">
            <input type="hidden" name="cPageNo" value="<%=cPageNo%>">
            <input type="hidden" name="iShowRows" value="<%=iShowRows%>">
            <%out.print(go);%>
            <form action="xxx.jsp" method="get">
                <table border="1">
                    <tbody>
                        <tr>
                            <td>GO to:</td>
                            <td><input type="text" name="go" id="go" value="" class="keyboardInput"/></td>
                            <td><input type="submit" value="submit" name="submit" /></td>
                        </tr>
                    </tbody>
                </table>
            </form>
            <div id="database">
                <table border="1" cellspacing="5" cellpadding="5">
                    <thead>
                        <tr>
                            <th style="display: none">Select to delete</th>
                            <th>Orthography</th>
                            <th>POS</th>
                            <th>Pronunciation</th>
                            <th>Meaning</th>
                            <th>Morphology</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%while (rsPagination.next()) {%>
                    <form action="xxx.jsp" method="get" id="<%=rsPagination.getString(1)%>">
                        <tr style="background-color: scrollbar">
                            <td style="display: none"><input type="checkbox" name="chk" checked="true" value="<%=rsPagination.getString(1)%>" onclick="change(this);"/></td>
                            <td><input type="text" name="ort" id="" value="<%=rsPagination.getString(2)%>" /></td>
                            <td><input type="text" name="pos" id="" value="<%=rsPagination.getString(3)%>" /></td>
                            <td><input type="text" name="pon" id="" value="<%=rsPagination.getString(4)%>" class="keyboardInput"/></td>
                            <td><input type="text" name="mea" id="" value="<%=rsPagination.getString(5)%>" /></td>
                            <td><input type="text" name="mor" id="atr" value="<%=rsPagination.getString(6)%>" /></td>
                        </tr>
                        <tr>
                            <td colspan="2"><input type="button" value="change" name="Change" onclick="show(this.form)"/></td>
                            <td colspan="2"><input type="submit" value="submit" name="submit" /></td>
                        </tr>
                    </form>
                    <%}%>
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
                        <td colspan="9">
                            <div>
                                <%
                                            //// index of pages

                                            int i = 0;
                                            int cPage = 0;
                                            if (iTotalRows != 0) {
                                                cPage = ((int) (Math.ceil((double) iEndResultNo / (iTotalSearchRecords * iShowRows))));

                                                int prePageNo = (cPage * iTotalSearchRecords) - ((iTotalSearchRecords - 1) + iTotalSearchRecords);
                                                if ((cPage * iTotalSearchRecords) - (iTotalSearchRecords) > 0) {
                                %>
                                <a href="xxx.jsp?iPageNo=<%=prePageNo%>&cPageNo=<%=prePageNo%>"> <b><< Previous</b></a>
                                <%
                                                                                }

                                                                                for (i = ((cPage * iTotalSearchRecords) - (iTotalSearchRecords - 1)); i <= (cPage * iTotalSearchRecords); i++) {
                                                                                    if (i == ((iPageNo / iShowRows) + 1)) {
                                %>
                                <a href="xxx.jsp?iPageNo=<%=i%>" style="cursor:pointer;color: red"><b><%=i%></b></a>
                                <%
                                                                                                                    } else if (i <= iTotalPages) {
                                %>
                                <a href="xxx.jsp?iPageNo=<%=i%>"><%=i%></a>
                                <%
                                                                                    }
                                                                                }
                                                                                if (iTotalPages > iTotalSearchRecords && i < iTotalPages) {
                                %>
                                <a href="xxx.jsp?iPageNo=<%=i%>&cPageNo=<%=i%>"> >> Next</a>
                                <%
                                                }
                                            }
                                %>
                                <br>Rows <%=iStartResultNo%> - <%=iEndResultNo%>   Total Result  <%=iTotalRows%>
                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div id="attribute">
                <div id="postable">
                    <form action="" method="get" id="ff" style="display: none">
                        <table border="0" cellspacing="5" cellpadding="5" style="background-color: #ECE5B6" >
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
                                    <td>
                                        <select multiple="multiple" size="12" name="type3" id="type3">
                                            <option  selected="selected" value="Masculine">Masculine</option>
                                            <option value="Feminine">Feminine</option>
                                            <option value="Neuter">Neuter</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr><td><input value="Reset" onclick="resetListGroup('attribute',1)" type="button"></td>
                                    <td><input type="button" value="Add" onclick="addvalue(this.form)"/></td></tr>
                            </tbody>
                        </table>
                    </form>
                </div>
            </div>
            <p>&nbsp;</p>
        </div>
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
            } finally {
                // close all the connections.

                if (pos != null && or != null && pon != null) {
                    pstatement.close();
                }
                if (chk != null) {
                    pstatement1.close();
                }
            }%>