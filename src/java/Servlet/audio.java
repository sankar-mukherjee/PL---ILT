/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import java.io.*;

import javax.servlet.ServletException;

import java.io.PrintWriter;


import javax.servlet.http.*;
import java.sql.*;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.ServletOutputStream;

/**
 *
 * @author Prasanta
 */
public class audio extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String FLAG = null;
        response.setContentType("audio/wav");

        response.setContentType("audio/wav");
        response.addHeader("Content-Disposition", "attachment; filename=\"wave.wav\"");
       
        ServletOutputStream os = response.getOutputStream();
        File source = new File("D:\\IDE_acceess\\wave.wav");
        File dest = new File("C:\\Users\\Sankar\\Desktop\\IDEWEB necessary\\IDEWeb_31.07.13\\web\\sound\\wave.wav");
        if (dest.exists()) {
            dest.delete();
        }
        InputStream is = null;
//        OutputStream os = null;
        try {
            is = new FileInputStream(source);
//            os = new FileOutputStream(dest);
            byte[] buffer = new byte[1024];
            int length;
            while ((length = is.read(buffer)) > 0) {
                os.write(buffer, 0, length);
            }
        } finally {
            is.close();
            os.close();
        }
    }
}
