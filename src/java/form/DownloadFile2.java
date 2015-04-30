package form;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DownloadFile2 extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String FLAG = null;
        

        response.setContentType("application/xml; charset=utf-8");
        response.addHeader("Content-Disposition", "attachment; filename=\"PLS.xml\"");
        try {
            PrintWriter xml = response.getWriter();
            Connection connection = null;
            // declare object of Statement interface that uses for executing sql statements.
            PreparedStatement pstatement = null;
            Statement statement = null;
            ResultSet rs = null;
            ResultSet rs1 = null;
            ResultSet rs2 = null;

            String[][] a1 = new String[230000][6];
            String[][][] b1 = new String[230000][5][6];
            long[] c1;
            c1 = new long[130000];
            String[][] temp = new String[230000][6];
            String [] g1= new String[13];
            String [][] po1= new String[230000][6];
             ArrayList<String> pos1= new ArrayList<String>();
            ArrayList<String> d1= new ArrayList<String>();
            try {


                String connectionURL = "jdbc:mysql://localhost:3306/ide";
                // declare a connection by using Connection interface
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                /* Create a connection by using getConnection() method that takes
                parameters of string type connection url, user name and password to connect
                to database. */
                connection = DriverManager.getConnection(connectionURL, "root", "root");
                // sql query to insert values in the secified table.
                String res = "SELECT * FROM bangla GROUP BY ORTHOGRAPHY LIMIT 100000,50000 ";
                pstatement = connection.prepareStatement(res);
                rs = pstatement.executeQuery();
                xml.write("<lexicon version='1.0' xmlns='http://www.w3.org/2005/01/pronunciation-lexicon' "
                        + "xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xsi:schemaLocation='http://www.w3.org/2005/01/pronunciation-lexicon "
                        + "http://www.w3.org/TR/2007/CR-pronunciation-lexicon-20071212/pls.xsd'"
                        + " alphabet='ipa' xml:lang='bn'>" + "\r\n");
                //create the root element
                rs.last();
                long nrows = rs.getRow();
                rs.beforeFirst();

                for (int i = 0; i < nrows; i++) {
                    rs.next();
                    a1[i][0] = rs.getString(1);
                    a1[i][1] = rs.getString(2);
                    a1[i][2] = rs.getString(3);
                    a1[i][3] = rs.getString(4);
                    a1[i][4] = rs.getString(5);
                    a1[i][5] = rs.getString(6);
                }
                for (int p = 0; p < nrows; p++) {
                    String result = "SELECT * FROM bangla where ORTHOGRAPHY='" + a1[p][1] + "'";
                    statement = connection.createStatement();
                    rs1 = statement.executeQuery(result);
                    rs1.last();
                    c1[p] = rs1.getRow();
                    rs1.beforeFirst();

                    for (int j = 0; j < c1[p]; j++) {
                        rs1.next();
                        b1[p][j][0] = rs1.getString(1);
                        b1[p][j][1] = rs1.getString(2);
                        b1[p][j][2] = rs1.getString(3);
                        b1[p][j][3] = rs1.getString(4);
                        b1[p][j][4] = rs1.getString(5);
                        b1[p][j][5] = rs1.getString(6);
                    }
                }
                for (int r = 0; r < nrows; r++) {
                    if (c1[r] == 1) {
                        xml.write("<lexeme>" + "\r\n" + "<grapheme>" + a1[r][1] + "</grapheme>" + "\r\n");
                        xml.write("<POS>" + a1[r][4] + "</POS>" + "\r\n");
                        xml.write("<phoneme Standard='True'>" + a1[r][2] + "</phoneme>" + "\r\n");
                        xml.write("<meaning>" + a1[r][3] + "</meaning>" + "\r\n");
                        xml.write("</lexeme>" + "\r\n");
                    } else {
                        //rs1.beforeFirst();
                        //while(rs1.next())
                        xml.write("<lexeme>" + "\r\n" + "<grapheme>" + a1[r][1] + "</grapheme>" + "\r\n");
                        for (int m = 0; m < c1[r]; m++) {
                            if (b1[r][m][4].equals("null")) {
                            temp[r][m]="null";
                            } else {
                                String ME = b1[r][m][4];
                               g1= ME.split("\\.");
                                 temp[r][m]=g1[0];
                            }
                        }
                      
                        d1.clear();
                        for(int u=0;u<c1[r];u++)
                        {

                            if(!d1.contains(temp[r][u]))
                            {
                                d1.add(temp[r][u]);
                            }
                        
                        }
                        d1.toArray(po1[r]);
                        //int f=po.length;
                        for(int j=0;j<d1.size();j++)
                        {
                                String resest = "SELECT * FROM bangla where ORTHOGRAPHY='" + a1[r][1] + "' AND POS like'%" + po1[r][j] + "%'";
                                //statement=connection.createStatement();
                                rs2 = statement.executeQuery(resest);
                                rs2.last();
                                int prows = rs2.getRow();
                                rs2.beforeFirst();
                               
                                rs2.next();
                                    if (prows >= 2) {
                                        rs2.next();
                                        if(rs2.getString(6).equals("2"))
                                        {
                                     rs2.previous();
                                        //if (rs2.getString(6).equals("1")) {
                                            xml.write("<POS>" + rs2.getString(5) + "</POS>" + "\r\n");
                                            xml.write("<phoneme Standard='True'>" + rs2.getString(3) + "</phoneme>" + "\r\n");
                                            xml.write("<meaning>" + rs2.getString(4) + "</meaning>" + "\r\n");
                                       // } else

                                            for(int o=0;o<(prows-1);o++)
                                            {
                                                rs2.next();
                                            xml.write("<phoneme Standard='False'>" + rs2.getString(3) + "</phoneme>" + "\r\n");
                                            xml.write("<meaning>" + rs2.getString(4) + "</meaning>" + "\r\n");
                                        }

                                    }
                                    else
                                        {
                                            rs2.previous();
                                            xml.write("<POS>" + rs2.getString(5) + "</POS>" + "\r\n");
                                            xml.write("<phoneme Standard='True'>" + rs2.getString(3) + "</phoneme>" + "\r\n");
                                            xml.write("<meaning>" + rs2.getString(4) + "</meaning>" + "\r\n");
                                    }
                                }
                                        else {
                                        xml.write("<POS>" + rs2.getString(5) + "</POS>" + "\r\n");
                                        xml.write("<phoneme Standard='True'>" + rs2.getString(3) + "</phoneme>" + "\r\n");
                                        xml.write("<meaning>" + rs2.getString(4) + "</meaning>" + "\r\n");
                                    }

                               // }
                            }
                        
                        xml.write("</lexeme>" + "\r\n");
                        }
                    
                }
                    xml.write ("</lexicon>");



            } catch (Exception ex) {
                System.out.println("Unable to connect to Database." + ex.getMessage());
            } finally {
                // close all the connections.
                rs.close();
                rs1.close();
                rs2.close();
                //pstatement.close();
                connection.close();
                xml.close();
            }

            //Close the output stream

        } catch (Exception e) {//Catch exception if any
            System.err.println("Error: " + e.getMessage());
        }



    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
