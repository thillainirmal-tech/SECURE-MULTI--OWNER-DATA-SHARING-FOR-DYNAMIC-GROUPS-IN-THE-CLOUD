/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.datasharing;

import com.commondb.Common_DB;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;
/**
 *
 * @author java
 */
public class UserRevocationServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /*
             * TODO output your page here. You may use following sample code.
             */
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UserRevocationServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserRevocationServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {            
            out.close();
        }
    }

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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session=request.getSession();
        String username=request.getParameter("username");
        System.out.println("ZZZZZZZZZZ"+username);
        //String gname=session.getAttribute("gname").toString();
        Connection con=null;
        Statement st=null;
        ResultSet rs=null;        
        try
        {
//            Class.forName("com.mysql.jdbc.Driver");
//            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mona","root","password");
//            st=con.createStatement();
//            String qry="Delete from login where UserName='"+username+"'";
//            rs=st.executeQuery(qry);
//            System.out.println("JJJJJJJJJJJJ"+qry);
            Common_DB.FreeQuery("mona","delete from login where username='"+username+"'");
            Common_DB.FreeQuery("mona","delete from userprofile where username='"+username+"'");
            Common_DB.FreeQuery("mona","delete from othergroup where username='"+username+"'");
//            if(rs.next())
//            {
//                
//            }
            response.sendRedirect("Revsuccess.jsp");
        }
        catch(Exception ex)
        {
            
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
