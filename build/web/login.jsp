<%-- 
    Document   : login
    Created on : 21 Oct, 2019, 1:12:05 AM
    Author     : hp
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="dbo.PravthiDBO"%>
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

                try{
                    String username = request.getParameter("username");
                    String userpassword = request.getParameter("userpassword");
                    
                    PravthiDBO db = new PravthiDBO();
                    PreparedStatement ps = db.con.prepareStatement("SELECT Status,Details FROM pravathitb WHERE Email=? and Password=?");
                    ps.setString(1, username);
                    ps.setString(2, userpassword);
                    ResultSet rs = ps.executeQuery();
                    if(rs.next())
                    {
                        String status = rs.getString("Status");
                        String details = rs.getString("Details");
                        if(details.equals("active")){
                            if(status.equals("v")){
                                db.closeDB();
                                session.setAttribute("Volusername",username);
                                response.addHeader("Refresh", "0;url=volunteer.jsp");
                            }else{
                                db.closeDB();
                                session.setAttribute("Adminusername", username);
                                response.addHeader("Refresh", "0;url=admin.jsp");
                            }
                        }else{
                            db.closeDB();
                            out.println("<script type='text/javascript'>");
                            out.println("Swal.fire({title: 'Error!',text: 'Your account has been temporarily blocled ny the admin',type: 'error',confirmButtonText: 'Cool', timer: 3000,onAfterClose: function() {location.assign('index.jsp')}})");
                            out.println("</script>");
                        }
                        db.closeDB();
                        //out.println("<script type='text/javascript'>");
                        //out.println("Swal.fire({title: 'Error!',text: 'Do you want to continue',type: 'error',confirmButtonText: 'Cool', timer: 3000,onAfterClose: function() {location.assign('index.jsp')}})");
                        //out.println("setTimeout(function () { swal('Oops!','You have succesfully logged in','error');'");
                        //out.println("</script>");
                    }
                    else{
                        db.closeDB();
                        out.println("<script type='text/javascript'>");
                        out.println("Swal.fire({title: 'Invalid credentials!',text: 'Please check your username and password',type: 'error',confirmButtonText: 'Cool', timer: 3000,onAfterClose: function() {location.assign('index.jsp')}})");
                        out.println("</script>");
                    }
                }
                catch(Exception e){
                    out.println("<script type='text/javascript'>");
                    out.println("Swal.fire({title: 'Warning!',text: 'Some technical issues encountered\nPlease try again after some time',type: 'warning',confirmButtonText: 'Cool', timer: 3000,onAfterClose: function() {location.assign('index.jsp')}})");
                    out.println("</script>");
                    out.print("Exception generated: "+e);
                    e.printStackTrace();
                }
        %>
    </body>
</html>
