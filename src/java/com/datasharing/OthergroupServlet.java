/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.datasharing;

import com.commondb.Common_DB;
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import java.util.Random;
import javax.naming.*;
import javax.mail.*;
import javax.mail.internet.*;
import com.sun.mail.smtp.*;
import java.util.Properties;

/**
 *
 * @author sentamilpandi.m
 */
@WebServlet(name = "OthergroupServlet", urlPatterns = {"/OthergroupServlet"})
public class OthergroupServlet extends HttpServlet {    
    Connection con=null;
    Statement st=null;
    ResultSet rs=null;
    RequestDispatcher rd=null;
    String group="";
    String pending="pending";
    
    

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
            out.println("<title>Servlet OthergroupServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OthergroupServlet at " + request.getContextPath() + "</h1>");
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
        HttpSession session1=request.getSession(true);        
        String Requestgroup=request.getParameter("Requestgroup");
        String filename=request.getParameter("filename");
        String UserName=session1.getAttribute("username").toString();
        String group=session1.getAttribute("group").toString();        
        String regemail=(String)session1.getAttribute("regemail");
        //HttpSession sn=request.getSession(true);
	//String e=(String)sn.getAttribute("email");
        System.out.println(""+regemail);
        Connection con=null;
        Statement st=null;
        ResultSet rs1=null;
        int counting=0;                 
              try {
//                  Class.forName("com.mysql.jdbc.Driver");
//                  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mona","root","password");
//                  st=con.createStatement();
//                  rs1=st.executeQuery("Select count(*) from login where groupname='"+Requestgroup+"'");
//                  while(rs1.next())
//                  {
//                      counting=rs1.getInt(0);
//                  }
//                  System.out.println("@@@@@@@@@"+rs1);
                  int rs=Common_DB.InsertTable("mona", "INSERT INTO othergroup(username,groupname,Requestgroup,filename,Status,usercount) VALUES('"+UserName+"','"+group+"','"+Requestgroup+"','"+filename+"','"+pending+"','"+counting+"')");                  
                  
                  if(rs>0)
                  {                                
                  response.sendRedirect("success1.jsp");
                  }
                  else
                  {
                      response.sendRedirect("Error.jsp");
                  }
                   session1.setAttribute("Requestgroup", Requestgroup);
                  
              }
             
                 
      
              catch (Exception ex)
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
