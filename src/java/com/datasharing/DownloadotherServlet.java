/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.datasharing;

import com.commondb.Common_DB;
import java.io.*;
import java.sql.*;
import javax.servlet.http.HttpSession;
import java.security.Key;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author sentamilpandi.m
 */
public class DownloadotherServlet extends HttpServlet {
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
            out.println("<title>Servlet DownloadotherServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DownloadotherServlet at " + request.getContextPath() + "</h1>");
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
        try{
            Connection con=null;
            Statement st=null;
            ResultSet rs=null;
        HttpSession session=request.getSession(true);
        String UserName=session.getAttribute("username").toString();
        String group=session.getAttribute("group").toString();
        
        
//        String Requestgroup=session.getAttribute("Requestgroup").toString();
       
        String filename=request.getParameter("gname");
        
        System.out.println("*********************************"+filename);
        String TempDownloadotherDirectory="D:/temp2/";
        System.out.println("D:/temp2/");
        File file=new File(TempDownloadotherDirectory);
        
        if(!(file.exists()))
        {
            file.mkdir();
        }  
        String filename1=filename;
        filename1=filename.substring(0,filename.indexOf("("));
        System.out.println("uuuuuuuuu"+filename1);
        String filename2=filename;
        String keyvalidation = session.getAttribute("keyvalidation").toString();
        System.out.println("MMMMMMMM"+keyvalidation);
        String RequestGroup=filename.substring(filename.indexOf("(")+1,(filename.length()-1));
        System.out.println("ZZZZZZZZZZ"+RequestGroup);
        System.out.println("IIIIIIIIII"+filename1+filename2);
        Key key1 = generateKey(keyvalidation);
                    System.out.println("#########"+TempDownloadotherDirectory+filename1);
                             AESEncrypter Decrypter = new AESEncrypter((SecretKey)key1);
                             Decrypter.decrypt(new FileInputStream("D:/"+RequestGroup+"/"+ filename1),new FileOutputStream(TempDownloadotherDirectory+filename1));
        
//        Class.forName("com.mysql.jdbc.Driver");
//        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mona","root","password");
//        st=con.createStatement();
//        String qry="select Requestgroup from othergroup where username='"+UserName+"' Requestgroup='"+Requestgroup+"'";
//        rs=st.executeQuery(qry);
//        String reqname="";
//        while(rs.next())
//        {
//            reqname=rs.getString("Requestgroup");
//        }
//        System.out.println("^^^^^^"+qry);
//        String count="select count(*) from login where groupname='"+reqname+"'";
//        rs=st.executeQuery(count);
//        int gcount=0;
//        while(rs.next())
//        {
//            gcount=rs.getInt(1);
//        }
//        System.out.println("QQQQQQQQQQQ"+gcount);
//        String count1="select usercount from othergroup where username='"+UserName+"' and Requestgroup='"+reqname+"'";
//        rs=st.executeQuery(count1);
//        int acount=0;
//        while(rs.next())
//        {
//            acount=rs.getInt(1);
//        }
//        System.out.println("RRRRRRRRRRR"+acount);
//           if(acount==gcount)     
//           {
        String filepath1=TempDownloadotherDirectory;
        System.out.println(filepath1+"??????"+filename1+"......"+TempDownloadotherDirectory);
        FileInputStream filetoDownload=new FileInputStream("D:/temp2/"+filename1);
        ServletOutputStream output=response.getOutputStream();
        System.out.println(filepath1+"SSSSSSSSSSSSSSSSS");
        response.setContentType("images/jpg");
            response.addHeader("Content-Disposition","attachment;filename="+filename1);
            response.setContentLength(filetoDownload.available());            
            int readBytes=0;                
            byte[] buffer=new byte[1024];              
            //while((readBytes=filetoDownload.read(buffer,0,100))!=-1)
            while(filetoDownload.available()>0)
            {
                output.write(filetoDownload.read()); 
                                
            
            }                
            output.close();
            filetoDownload.close();
//            response.sendRedirect("");
//           }
//           else
//           {
//               response.sendRedirect("pending.jsp");
//           }
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
