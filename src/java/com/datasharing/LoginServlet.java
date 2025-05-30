/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.datasharing;

import com.commondb.Common_DB;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.ArrayList;


/**
 *
 * @author sentamilpandi.m
 */
public class LoginServlet extends HttpServlet {
    String UserName="";
    String Password="";
    String Requestgroup;
    String filename;
    String Email="";
    
    Connection con=null;
    Statement st=null;
    ResultSet rs=null;
    RequestDispatcher rd=null;
    

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
            out.println("<title>Servlet LoginServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
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
        
        UserName=request.getParameter("UserName");    
        Password=request.getParameter("Password"); 
        Requestgroup=request.getParameter("Requestgroup");
        filename=request.getParameter("filename");       
        try {        
            ArrayList list=new ArrayList();
            ResultSet rs1=Common_DB.LoginCheck("mona", "Login", "UserName","Password",UserName, Password);
             //rs1=Common_DB.LoginCheck("mona", "groupadmin", "UserName","Password",UserName, Password);
            if(rs1.next()) {
                 String group=rs1.getString("groupname");
                 System.out.println(">>>>>>>>>"+group);
                File[] files=new File("D:/"+group).listFiles();  
                 System.out.println(">>>>>>>>>"+files.length);     
                    //if(files!=null && files.length>0)                    
                        for(int i=0;i<files.length;i++) {
                            String filename0=files[i].getName();                                
                            list.add(filename0);                            
                       } 
                        
             session1.setAttribute("group", group);
             session1.setAttribute("filename", list);
             session1.setAttribute("username", UserName); 
             response.sendRedirect("download.jsp");
  
            }
//            else if(rs2.next())
//            {
//                String group2=rs2.getString("groupname");
//                 System.out.println(">>>>>>>>>"+group2);
//                File[] files=new File("D:/"+group2).listFiles();  
//                 System.out.println(">>>>>>>>>"+files.length);     
//                    //if(files!=null && files.length>0)                    
//                        for(int i=0;i<files.length;i++) {
//                            String filename0=files[i].getName();                                
//                            list.add(filename0);                            
//                       } 
//                        
//             session1.setAttribute("group", group2);
//             session1.setAttribute("filename", list);
//             session1.setAttribute("username", UserName); 
//             response.sendRedirect("download.jsp");
//            }
            else
            {
                response.sendRedirect("Error.jsp");   
            }
            
        } 
        catch (Exception ex)
        {
            ex.printStackTrace();
            //Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        //processRequest(request, response);
        
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
