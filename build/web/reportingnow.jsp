<%-- 
    Document   : login
    Created on : 21 Oct, 2019, 1:12:05 AM
    Author     : hp
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="dbo.PravthiDBO"%>
<%@page import="org.apache.commons.text.WordUtils"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>PRAVATHI - The Helping Hands</title><link rel="icon" href="image/logo.png" type="image/x-icon">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
        <link href="https://fonts.googleapis.com/css?family=Itim" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="myStyle.css">
        <script src="script.js"></script>
    </head>
    <body>
        <%
            try {
                String issue, title, details, name, email, phone, address, state, anonymous, dop, verified, target_file, type;
                issue = request.getParameter("issue");
                title = request.getParameter("title");
                details = request.getParameter("details");
                name = request.getParameter("name");
                email = request.getParameter("email");
                phone = request.getParameter("phone");
                address = request.getParameter("address");
                state = request.getParameter("state");                
                state = WordUtils.capitalize(state);
                //out.println("Issue"+issue+"title"+title);
                if (request.getParameter("anonymous") != null) {
                    anonymous = request.getParameter("anonymous");
                } else {
                    anonymous = "n";
                }
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                dop = sdf.format(new Date());
                verified = "n";
                target_file = ""; //to store the location of file in database
                type = "";        //to store the content of the file
                String statelist[] = {"Andhra Pradesh", "Arunachal Pradesh", "Assam", "Bihar", "Chhattisgarh", "Goa", "Gujarat", "Haryana", "Himachal Pradesh","Jammu and Kashmir", "Jharkhand", "Karnataka", "Kerala", "Madhya Pradesh", "Maharashtra", "Manipur", "Meghalaya", "Mizoram","Nagaland", "Odisha", "Punjab", "Rajasthan", "Sikkim", "Tamil Nadu", "Telangana", "Tripura", "Uttar Pradesh", "Uttarakhand","West Bengal"};
                boolean isState = Arrays.asList(statelist).contains(state);
                if (!isState) {
                    out.println("<script type='text/javascript'>");
                    out.println("Swal.fire({title: 'Error!',text: 'Please select the correct state!',type: 'error',confirmButtonText: 'Okay', timer: 3000,onAfterClose: function() {location.assign('reportnow.jsp')}})");
                    out.println("</script>");
                }
                else{
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
        %>
    </body>
</html>
