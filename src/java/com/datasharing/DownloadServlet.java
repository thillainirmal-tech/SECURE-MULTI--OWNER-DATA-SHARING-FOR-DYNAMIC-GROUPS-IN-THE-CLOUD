/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.datasharing;

import com.commondb.Common_DB;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import java.io.*;
import javax.servlet.ServletOutputStream;
import java.security.Key;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author sentamilpandi.m
 */
@WebServlet(name = "DownloadServlet", urlPatterns = {"/DownloadServlet"})
public class DownloadServlet extends HttpServlet {   
    static String filename;
   private static Key generateKey(String keyvalidation) {
         String keyValue=keyvalidation;         
        Key key = new SecretKeySpec(keyValue.getBytes(), "AES");        
        return key;
    }   
          private static final String dCase = "abcdefghijklmnopqrstuvwxyz";
          private static final String uCase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
          private static final String sChar = "!@#$%^&*";
          private static final String intChar = "0123456789";

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
            out.println("<title>Servlet DownloadServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DownloadServlet at " + request.getContextPath() + "</h1>");
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
        try {
            HttpSession session1=request.getSession(true);
            //String group1=request.getParameter("goupname");
            String keyvalidation=request.getParameter("keyvalidation");
            String group=session1.getAttribute("group").toString();
            String fn = request.getParameter("slist3");
            filename=request.getParameter("filename");       
            //final String Download_Directory="D:/";      
            String TempDownloadDirectory="D:/temp1/";
            File file=new File(TempDownloadDirectory);
            if(!(file.exists())) {
                file.mkdir();           
            }
            Key key1 = generateKey(keyvalidation);
                    System.out.println(keyvalidation+" ######### "+TempDownloadDirectory+filename+"????? "+group);
                             AESEncrypter Decrypter = new AESEncrypter((SecretKey)key1);
                             Decrypter.decrypt(new FileInputStream("D:/"+group+"/"+ filename),new FileOutputStream(TempDownloadDirectory+filename));
//            if(ServletFileUpload.isMultipartContent(request)){
//                try {
//                    String nn="";
//                    List<FileItem> multiparts = new ServletFileUpload(
//                                             new DiskFileItemFactory()).parseRequest(request);
//                  
//                    for(FileItem item : multiparts){
//                        if(!item.isFormField()){
//                            String name = new File(item.getName()).getName();                        
//                            item.write( new File(TempDownloadDirectory+name));
//                            nn=name; 
//                            
//                        }
//                    }
//                   
//                   request.setAttribute("message", "File download Successfully");
//                   System.out.println("???????");
//                } catch (Exception ex) {
//                   request.setAttribute("message", "File download Failed due to " + ex);
//                } 
//                
//            }        
//             Key key1 = generateKey(keyvalidation);
//                    System.out.println("#########"+TempDownloadDirectory+filename);
//                             AESEncrypter Decrypter = new AESEncrypter((SecretKey)key1);
//                             Decrypter.decrypt(new FileInputStream("D:/"+group+"/"+ filename),new FileOutputStream(TempDownloadDirectory+filename));
               
            String filepath1=TempDownloadDirectory+filename;   
            System.out.println(filepath1+"???????"+filename+"....."+TempDownloadDirectory);
            System.out.println("********* "+fn);
            FileInputStream filetoDownload=new FileInputStream(filepath1);        
            ServletOutputStream output=response.getOutputStream();        
            response.setContentType("images/jpg");
            response.addHeader("Content-Disposition","attachment;filename="+filename);
            response.setContentLength(filetoDownload.available());
            int readBytes=0;                
            byte[] buffer=new byte[1024];              
            //while((readBytes=filetoDownload.read(buffer,0,100))!=-1)
            while(filetoDownload.available()>0)
            {
                output.write(filetoDownload.read()); 
                                
            
            }       
            session1.setAttribute("keyvalidation1", keyvalidation);
            output.close();
            filetoDownload.close();                          
           // response.sendRedirect("Downsuccess.jsp");
            //request.setAttribute("message", "File Downloaded Successfully");
        } catch (Exception ex) {
            ex.printStackTrace();
           //request.setAttribute("message", "File Download Failed due to " + ex);
        }
           //request.getRequestDispatcher("/resultdownload.jsp").forward(request, response);       
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
