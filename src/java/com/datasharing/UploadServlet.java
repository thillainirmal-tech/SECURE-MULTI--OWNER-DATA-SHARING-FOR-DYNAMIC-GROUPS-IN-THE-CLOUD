/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.datasharing;

import com.commondb.Common_DB;
import java.io.*;
import java.security.Key;
import java.sql.*;
import java.sql.ResultSet;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.output.*;


/**
 *
 * @author sentamilpandi.m
 */
public class UploadServlet extends HttpServlet { 
    Connection con=null;
    Statement st=null;
    ResultSet rs=null;
    RequestDispatcher rd=null;
     
   private static Key generateKey(String group) throws Exception
   {
       
       String keyValue="";
        ResultSet rs1=Common_DB.ViewParticularData("mona", "groupname", "groupname",group);
                 String group2="";  
                 if(rs1.next())
                 {                   
                     group2=rs1.getString(2);
                 }
       Key key = new SecretKeySpec(group2.getBytes(), "AES");                   
        return key;        
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
            out.println("<title>Servlet UploadServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UploadServlet at " + request.getContextPath() + "</h1>");
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
        String name = null;
         HttpSession session1=request.getSession(true);         
         String UserName=session1.getAttribute("username").toString();         
         String list=session1.getAttribute("filename").toString();           
        String group=session1.getAttribute("group").toString();               
        final String UPLOAD_DIRECTORY = "D:/"+group; 
        String TempUploadDirectory="D:/temp";
        System.out.println("????????????"+TempUploadDirectory); 
        
        File file=new File(TempUploadDirectory);
        if(!(file.exists())) {
            file.mkdir();            
        }           
        // Check that we have a file upload request
      if(ServletFileUpload.isMultipartContent(request)){
            try {
                  
                String nn="";
                List<FileItem> multiparts = new ServletFileUpload(
                                         new DiskFileItemFactory()).parseRequest(request);
              
                for(FileItem item : multiparts){
                    if(!item.isFormField()){
                         name = new File(item.getName()).getName();                        
                        item.write( new File(TempUploadDirectory + File.separator + name));
                        nn=name; 
                        
                    }
                }            
                Key key1 = generateKey(group);
                
                         AESEncrypter encrypter = new AESEncrypter((SecretKey)key1);
                         encrypter.encrypt(new FileInputStream(TempUploadDirectory + File.separator + nn),new FileOutputStream(UPLOAD_DIRECTORY+ File.separator+nn));
           
               request.setAttribute("message", "File Uploaded Successfully");
            } catch (Exception ex) {
               request.setAttribute("message", "File Upload Failed due to " + ex);
            }          
         
        }else{
            request.setAttribute("message",
                                 "Sorry this Servlet only handles file upload request");
        }
      try {
          
            int rs=Common_DB.InsertTable("mona", "INSERT INTO userprofile(UserName,groupname,filename) VALUES('"+UserName+"','"+group+"','"+name+"')");
            if(rs>0)
            {
                
            }            
        } catch (Exception ex) {
            ex.printStackTrace();
            //Logger.getLogger(UploadServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    
        request.getRequestDispatcher("/resultupload.jsp").forward(request, response);
        
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
