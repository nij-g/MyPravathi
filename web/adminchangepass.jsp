<%-- 
    Document   : volchangepass
    Created on : 25 Nov, 2019, 10:59:19 PM
    Author     : hp
--%>

<%@page import="java.sql.ResultSet"%>
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
        <link rel="stylesheet" href="formstyle.css">
        <script src="script.js"></script>
    </head>
    <body>
        <button onclick="topFunction()" id="myBtn" title="Go to top"><span class="glyphicon glyphicon-arrow-up"></span></button>
        <header>
            <nav class="navbar navbar-inverse" style=" margin:0%; background-color: #004d4d; border: 0%; border-radius:0%;">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="index.php" style="color:white;">P R A V A T H I</a>
                    </div>
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            <li><a href="admin.jsp" ><span class="glyphicon glyphicon-home"></span> Home</a></li>
                            <li class="active"><a href="#">Change your password <span class="glyphicon glyphicon-lock"></span></a></li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="logout.jsp">Log out <span class="glyphicon glyphicon-log-out"></span></a></li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>
        <%
            boolean flag;
            String oldpass="", newpass="", renewpass="";
            flag = session.getAttribute("Adminusername") == null;
            if (flag) {
                out.println("<script type='text/javascript'>");
                out.println("Swal.fire({title: 'Spam Error!',text: 'Unauthorized access',type: 'error',confirmButtonText: 'OK', timer: 3000,onAfterClose: function() {location.assign('index.jsp')}})");
                out.println("</script>");
            } else {
                if(request.getParameter("adminpass") != null){
                    oldpass = request.getParameter("oldpass");
                    newpass = request.getParameter("newpass");
                    renewpass = request.getParameter("cnewpass");
                    PravthiDBO db = new PravthiDBO();
                    ResultSet rs = db.getPassword(session.getAttribute("Adminusername").toString());
                    if(rs.next()){
                        String existpass = rs.getString("Password");
                        if(existpass.equals(oldpass) && newpass.equals(renewpass)){
                            if(db.changePasswordVolunteer(newpass, session.getAttribute("Adminusername").toString())){
                                out.println("<script type='text/javascript'>");
                                out.println("Swal.fire({title: 'Success!',text: 'Succesfully updated!',type: 'success',confirmButtonText: 'Okay', timer: 3000,onAfterClose: function() {location.assign('admin.jsp')}})");
                                out.println("</script>");
                            }else{
                                out.println("<script type='text/javascript'>");
                                out.println("Swal.fire({title: 'Error!',text: 'There was some connection error!',type: 'error',confirmButtonText: 'Okay', timer: 3000,onAfterClose: function() {location.assign('adminchangepass.jsp')}})");
                                out.println("</script>");
                            }
                        }else{
                            out.println("<script type='text/javascript'>");
                            out.println("Swal.fire({title: 'Error!',text: 'Wrong password or new pass and re-entered password does not match!',type: 'error',confirmButtonText: 'Okay', timer: 3000,onAfterClose: function() {location.assign('adminchangepass.jsp')}})");
                            out.println("</script>");
                        }
                    }else{
                            out.println("<script type='text/javascript'>");
                            out.println("Swal.fire({title: 'Error!',text: 'There was some connection error!',type: 'error',confirmButtonText: 'Okay', timer: 3000,onAfterClose: function() {location.assign('adminchangepass.jsp')}})");
                            out.println("</script>");
                    }
                }else{
        %>
        <div class="container-fluid" style="text-align:center; padding-top:50px; color: #004d4d;">
            <h3>CHANGE YOUR PASSWORD</h3><br>
            <form action="" method="POST">
                <input type="password" placeholder="Enter Old Password*" name="oldpass" required><br>
                <input type="password" placeholder="Enter New Password*" name="newpass" required><br>
                <input type="text" placeholder="Re-Enter New Password*" name="cnewpass" autocomplete="off" required><br>
                <br><button type="submit" name='adminpass' class="mybtn">MAKE CHANGES</button>
            </form>
        </div>
        <% } } %>
    </body>
</html>