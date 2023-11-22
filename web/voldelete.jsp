<%-- 
    Document   : voldelete
    Created on : 25 Nov, 2019, 9:33:25 PM
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
                            <li><a href="volunteer.jsp" ><span class="glyphicon glyphicon-home"></span> Home</a></li>
                            <li class="active"><a href="#">Delete your account <span class="glyphicon glyphicon-trash"></span></a></li>
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
            String pass="";
            flag = session.getAttribute("Volusername") == null;
            if (flag) {
                out.println("<script type='text/javascript'>");
                out.println("Swal.fire({title: 'Spam Error!',text: 'Unauthorized access',type: 'error',confirmButtonText: 'OK', timer: 3000,onAfterClose: function() {location.assign('index.jsp')}})");
                out.println("</script>");
            } else {
                if(request.getParameter("volpass") != null){
                    String existpass = request.getParameter("existpass");
                    PravthiDBO db = new PravthiDBO();
                    ResultSet rs = db.getPassword(session.getAttribute("Volusername").toString());
                    if(rs.next()){
                        pass = rs.getString("password");
                        if(existpass.equals(pass)){
                            if(db.deleteVolunteer(session.getAttribute("Volusername").toString())){
                                out.println("<script type='text/javascript'>");
                                out.println("Swal.fire({title: 'Success!',text: 'Succesfully deleted!',type: 'success',confirmButtonText: 'Okay', timer: 3000,onAfterClose: function() {location.assign('index.jsp')}})");
                                out.println("</script>");
                            }else{
                                out.println("<script type='text/javascript'>");
                                out.println("Swal.fire({title: 'Error!',text: 'There was some connection error!',type: 'error',confirmButtonText: 'Okay', timer: 3000,onAfterClose: function() {location.assign('voldelete.jsp')}})");
                                out.println("</script>");
                            }
                        }else{
                            out.println("<script type='text/javascript'>");
                            out.println("Swal.fire({title: 'Error!',text: 'Wrong password!',type: 'error',confirmButtonText: 'Okay', timer: 3000,onAfterClose: function() {location.assign('voldelete.jsp')}})");
                            out.println("</script>");
                        }
                    }else{
                            out.println("<script type='text/javascript'>");
                            out.println("Swal.fire({title: 'Error!',text: 'There was some connection error!',type: 'error',confirmButtonText: 'Okay', timer: 3000,onAfterClose: function() {location.assign('voldelete.jsp')}})");
                            out.println("</script>");
                    }
                }else{
        %>
        <div class="container-fluid" style="text-align:center; padding-top:50px; color: #004d4d;">
            <h3>DELETE YOUR ACCOUNT</h3>
            <div style="color:grey;">[All the account information will be deleted permanently!]</div><br>
            <form action="" method="POST">
                <input type="password" placeholder="Please Re-Enter Your Password *" name="existpass" required><br>
                <br><button type="submit" name='volpass' class="mybtn">PERMANENTLY DELETE MY ACCOUNT</button>
            </form>
        </div>
        <% } 
        }
        %>
    </body>
</html>