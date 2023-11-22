/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package report;

import dbo.PravthiDBO;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.apache.commons.text.WordUtils;
/**
 *
 * @author hp
 */
@MultipartConfig(fileSizeThreshold=1024*1024*10, 	// 10 MB 
                 maxFileSize=1024*1024*50,      	// 50 MB
                 maxRequestSize=1024*1024*100)          //100 MB
public class reportingnow extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static String getSubmittedFileName(Part part) {
        for (String cd : part.getHeader("content-disposition").split(";")) {
            if (cd.trim().startsWith("filename")) {
                String fileName = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
                return fileName.substring(fileName.lastIndexOf('/') + 1).substring(fileName.lastIndexOf('\\') + 1); // MSIE fix.
            }
        }
        return null;
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<meta charset=\"utf-8\">");
            out.println("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">");
            out.println("<title>PRAVATHI - The Helping Hands</title><link rel=\"icon\" href=\"image/logo.png\" type=\"image/x-icon\">");
            out.println("<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css\">");
            out.println("<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js\"></script>");
            out.println("<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js\"></script>");
            out.println("<script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js\"></script>");
            out.println("<link rel=\"stylesheet\" href=\"https://www.w3schools.com/w3css/4/w3.css\">");
            out.println("<link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css\">");
            out.println("<script src=\"https://cdn.jsdelivr.net/npm/sweetalert2@8\"></script>");
            out.println("<link href=\"https://fonts.googleapis.com/css?family=Itim\" rel=\"stylesheet\" type=\"text/css\">");
            out.println("<link rel=\"stylesheet\" href=\"myStyle.css\">");
            out.println("<script src=\"script.js\"></script>");
            out.println("<title>Servlet reportingnow</title>");            
            out.println("</head>");
            out.println("<body>");
            try {
                
                String target_file = "";
                Part mypart = request.getPart("Image");
                String appPath = request.getServletContext().getRealPath("");
                String savePath = appPath + File.separator + "ReportImages";
                File f = new File(savePath);
                if(!f.exists()){
                    f.mkdirs();
                }
                String issue, title, details, name, email, phone, address, state, anonymous, dop, verified, type;
                issue = request.getParameter("issue");
                title = request.getParameter("title");
                details = request.getParameter("details");
                name = request.getParameter("name");
                email = request.getParameter("email");
                phone = request.getParameter("phone");
                address = request.getParameter("address");
                state = request.getParameter("state");                
                state = WordUtils.capitalize(state);
                if (request.getParameter("anonymous") != null) {
                    anonymous = request.getParameter("anonymous");
                } else {
                    anonymous = "n";
                }
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                dop = sdf.format(new Date());
                verified = "n";
                //target_file = ""; //to store the location of file in database
                //type = "";        //to store the content of the file
                String statelist[] = {"Andhra Pradesh", "Arunachal Pradesh", "Assam", "Bihar", "Chhattisgarh", "Goa", "Gujarat", "Haryana", "Himachal Pradesh","Jammu and Kashmir", "Jharkhand", "Karnataka", "Kerala", "Madhya Pradesh", "Maharashtra", "Manipur", "Meghalaya", "Mizoram","Nagaland", "Odisha", "Punjab", "Rajasthan", "Sikkim", "Tamil Nadu", "Telangana", "Tripura", "Uttar Pradesh", "Uttarakhand","West Bengal"};
                boolean isState = Arrays.asList(statelist).contains(state);
                if (!isState) {
                    out.println("<script type='text/javascript'>");
                    out.println("Swal.fire({title: 'Error!',text: 'Please select the correct state!',type: 'error',confirmButtonText: 'Okay', timer: 3000,onAfterClose: function() {location.assign('reportnow.jsp')}})");
                    out.println("</script>");
                }
                else{
                    OutputStream outer = null;
                    InputStream filecontent = null;
                    //outer = new FileOutputStream(new File(savePath + File.separator + getSubmittedFileName(mypart)));
                    //filecontent = mypart.getInputStream();
                    int read = 0;
                    final byte[] bytes = new byte[1024];
                   /*while ((read = filecontent.read(bytes)) != -1) {
                        outer.write(bytes, 0, read);
                    }*/
                    //out.println("New file " + getSubmittedFileName(mypart) + " created at " + savePath);
                    if(mypart.getContentType().equals("image/png") ||
                            mypart.getContentType().equals("image/jpg")||
                            mypart.getContentType().equals("image/jpeg")||
                            mypart.getContentType().equals("image/pjpg")||
                            mypart.getContentType().equals("image/gif")||
                            mypart.getContentType().equals("image/x-png")){
                        //mypart.write(savePath + File.separator + getSubmittedFileName(mypart));
                        String filename = new Date().getTime() + "-" + getSubmittedFileName(mypart);
                        outer = new FileOutputStream(new File(savePath + File.separator + filename));
                        filecontent = mypart.getInputStream();
                        while ((read = filecontent.read(bytes)) != -1) {
                            outer.write(bytes, 0, read);
                        }
                        target_file = "ReportImages" + File.separator + filename;
                        type = mypart.getContentType();
                    }else if(mypart.getContentType().equals("video/mpeg") ||
                            mypart.getContentType().equals("video/mp4")){
                        String filename = new Date().getTime() + "-" + getSubmittedFileName(mypart);
                        outer = new FileOutputStream(new File(savePath + File.separator + filename));
                        filecontent = mypart.getInputStream();
                        while ((read = filecontent.read(bytes)) != -1) {
                            outer.write(bytes, 0, read);
                        }
                        target_file = "ReportImages" + File.separator + filename;
                        type = mypart.getContentType();
                    }else{
                        type = "";
                        target_file = "";
                    }
                    PravthiDBO dbo = new PravthiDBO();
                    PreparedStatement ps = dbo.con.prepareStatement("insert into reporttb(issuecat, title, description, name, email, phone, address, state, anonymous, datetime, photo, verified, type, verifiedby) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
                    ps.setString(1, issue);
                    ps.setString(2, title);
                    ps.setString(3, details);
                    ps.setString(4, name);
                    ps.setString(5, email);
                    ps.setString(6,phone);
                    ps.setString(7, address);
                    ps.setString(8, state);
                    ps.setString(9, anonymous);
                    ps.setString(10, dop);
                    ps.setString(11, target_file);
                    ps.setString(12, verified);
                    ps.setString(13, type);
                    ps.setString(14, "");
                    if(ps.executeUpdate()>0){
                        dbo.closeDB();
                        out.println("<script type='text/javascript'>");
                        out.println("Swal.fire({title: 'Success!',text: 'Report has been uploaded successfully',type: 'success',confirmButtonText: 'OK', timer: 3000,onAfterClose: function() {location.assign('report.jsp')}})");
                        out.println("</script>");
                    }else{
                        dbo.closeDB();
                        out.println("<script type='text/javascript'>");
                        out.println("Swal.fire({title: 'Sorry!',text: 'Cannot be uploaded',type: 'error',confirmButtonText: 'Okay', timer: 3000,onAfterClose: function() {location.assign('reportnow.jsp')}})");
                        out.println("</script>");
                    }  
                }
            }
            catch (Exception e) {
                out.println("<script type='text/javascript'>");
                out.println("Swal.fire({title: 'Warning!',text: 'Some technical issues encountered\nPlease try again after some time',type: 'warning',confirmButtonText: 'Cool', timer: 3000,onAfterClose: function() {location.assign('reportnow.jsp')}})");
                out.println("</script>");
                out.print("Exception generated: " + e);
                e.printStackTrace();
            }
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
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
     * Handles the HTTP <code>POST</code> method.
     *
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
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
