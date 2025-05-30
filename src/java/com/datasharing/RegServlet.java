/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.datasharing;

import com.commondb.Common_DB;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.PublicKey;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.management.Query;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
/**
 *
 * @author sentamilpandi.m
 */
@WebServlet(name = "RegServlet", urlPatterns = {"/RegServlet"})
public class RegServlet extends HttpServlet {  
    String alive="alive";
static Properties properties = new Properties();
   static
   {
      properties.put("mail.smtp.host", "smtp.gmail.com");
      properties.put("mail.smtp.socketFactory.port", "465");
      properties.put("mail.smtp.socketFactory.class",
                     "javax.net.ssl.SSLSocketFactory");
      properties.put("mail.smtp.auth", "true");
      properties.put("mail.smtp.port", "465");
   }
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
            out.println("<title>Servlet RegServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegServlet at " + request.getContextPath() + "</h1>");
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
        HttpSession session1=request.getSession();
        try
        {   
       String reguser=request.getParameter("reguser");
       String regpass=request.getParameter("regpass");
       String regemail=request.getParameter("regemail"); 
       String group=request.getParameter("groupname");
       System.out.println("????????"+reguser+","+regpass+","+regemail);
       session1.setAttribute("regemail", regemail);
      
     //Common_DB.InsertTable("mona", "INSERT INTO group (groupname) VALUES (groupname)");

       
    int k=Common_DB.InsertTable("mona","INSERT INTO login(UserName,Password,Email,groupname) VALUES('"+reguser+"','"+regpass+"','"+regemail+"','"+group+"')");
    if(k>0)  
    {
//    String query="CREATE TABLE IF NOT EXISTS "+group+"(username varchar(50) PRIMARY KEY NOT NULL, privatekey blob , publickey blob)";
//    System.out.println(query);
//    int q1=Common_DB.InsertTable("mona","USE mona");
//    int q=Common_DB.InsertTable("mona",query);
//    System.out.println("********"+q);
//     if(q==0)
//     {
        ResultSet gp=Common_DB.ViewParticularData("mona","groupname","groupname",group);
        if(gp.next()){            
        String key=gp.getString(2);
         
  
   // String encry=rsa.encrypt("hello world is the first java program for the java beginners",key);
 
    //String decry=rsa.decrypt(encry,rsa.getPrivateKeyFromString(pri));
   
      final String  from="datasharingkey@gmail.com";
      final String password="datasharing444";
      final String to="datamaincent@gmail.com";
         Session session = Session.getInstance(properties, new javax.mail.Authenticator() 
         {
            protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(from, password);
            }});
         
         Message message = new MimeMessage(session);
         message.setFrom(new InternetAddress(from));
         message.setRecipients(Message.RecipientType.TO, 
         InternetAddress.parse(regemail));
         message.setSubject("public key" + "Private key");
         //message.setSubject("private key");
         
         message.setText("public key is: " +key );
         //message.setText("private key is "+"\n"+pri);
   
        Multipart multipart = new MimeMultipart();

      //addAttachments(multipart);
      //message.setContent(multipart);
      // Send message
      Transport.send(message);
    
     System.out.println("Email sent successfully");
 
             response.sendRedirect("Login.jsp");     
     }
     else
     {
         response.sendRedirect("Error.jsp");
     }
    }
     else
     {
         response.sendRedirect("userexist.jsp");
     }
    }
        catch(Exception ex)
        {
            ex.printStackTrace();
            response.sendRedirect("userexist.jsp");
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
