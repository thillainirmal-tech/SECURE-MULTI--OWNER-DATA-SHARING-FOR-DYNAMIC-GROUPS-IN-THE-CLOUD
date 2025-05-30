/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.datasharing;

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
 * @author sentamilpandi.m
 */
public class ApprovedServlet extends HttpServlet {

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
            out.println("<title>Servlet ApprovedServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ApprovedServlet at " + request.getContextPath() + "</h1>");
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
       String UserName=session.getAttribute("username").toString();
       String group=session.getAttribute("group").toString();
     //  String filename=session.getAttribute("filename").toString();
       String uname = request.getParameter("slist1");
       
       String filename = request.getParameter("slist3");
//       String Requestgroup=session.getAttribute("Requestgroup").toString();
       System.out.println("&&& "+filename +"&&&&&& "+uname);
       String Approved="Approved";
       
       
       int counting=0;
     
       Connection con=null;
       Statement st=null;
       ResultSet rs=null;        
       try
       {
           Class.forName("com.mysql.jdbc.Driver");
           con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mona","root","password");
           st=con.createStatement();
           String qry = "select * from othergroup where username='"+uname+"' && groupname='"+group+"' && filename='"+filename+"'";
           //System.out.println("***** "+qry);
           rs=st.executeQuery(qry);
           rs=st.executeQuery("select usercount from othergroup where groupname='"+group+"' and username='"+UserName+"' ");
           //System.out.println("@@@@@"+rs);
           if(rs.next())
           {
               counting=Integer.parseInt(rs.getString("usercount"));
               
               //response.sendRedirect("success1.jsp");
           }
           System.out.println("@@@@@"+counting);
           int rs1=st.executeUpdate("update othergroup SET usercount='"+(counting+1)+"',status='"+Approved+"' where username='"+uname+"' && filename='"+filename+"'");
           if(rs1>0)
           {
               response.sendRedirect("AppSuccess.jsp");
           }
           else
           {
               response.sendRedirect("AppFail.jsp");
               
           }
                      
           
       }
       catch(Exception ex)
       {
           ex.printStackTrace();
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
