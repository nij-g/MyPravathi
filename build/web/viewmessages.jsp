<%-- 
    Document   : viewmessages
    Created on : 1 Dec, 2019, 12:33:54 PM
    Author     : hp
--%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
        <style>
            .alert.unread {background-color: #99ccff;}
            .alert.read{background-color: #ccccff}
            .text {
                display: block;
                width: 200px;
                overflow: hidden;
                white-space: nowrap;
                text-overflow: ellipsis;
            }

            .replybtn{
                float:right;
            }
        </style>
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
                            <li class="active"><a href="#"><span class="glyphicon glyphicon-envelope"></span> View Messages</a></li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="logout.jsp">Log out <span class="glyphicon glyphicon-log-out"></span></a></li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>
        <div class="container" style="text-align:center; padding-top:50px; color: #004d4d;">
            <h3>MESSAGES</h3><br>
            <%
                boolean flag;
                String date, time, datetime, name, email, message;
                int id;
                flag = session.getAttribute("Adminusername") == null;
                if (flag) {
                    out.println("<script type='text/javascript'>");
                    out.println("Swal.fire({title: 'Spam Error!',text: 'Unauthorized access',type: 'error',confirmButtonText: 'OK', timer: 3000,onAfterClose: function() {location.assign('index.jsp')}})");
                    out.println("</script>");
                } else {
                    PravthiDBO dbo = new PravthiDBO();
                    ResultSet rs = dbo.getunreadMessages();
                    while (rs.next()) {
                        id = rs.getInt("id");
                        datetime = rs.getString("date");
                        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                        Date d1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(datetime);
                        date = sdf.format(d1);
                        SimpleDateFormat sdf1 = new SimpleDateFormat("HH:mm");
                        time = sdf1.format(d1);
                        name = rs.getString("name");
                        email = rs.getString("email");
                        message = rs.getString("message");

            %>
            <div class="alert unread row" style="text-align: left; margin-left: 5%; margin-right: 5%;">
                <em class="col-md-3"><%= date%> <%= time%></em>
                <strong class="col-md-3"><%= name%></strong>
                <em class="col-md-3 text"><%= message%></em>
                <a href="fetch_message.jsp?rowid=<%=id%>">View More <i class="fa fa-angle-double-right"></i></a>
                <a href="mailto:<%= email%>?Subject=Pravathi%20Report" target="_top" class="col-md-1 replybtn">
                    <span class="glyphicon glyphicon-share-alt"></span>
                    Reply
                </a>
            </div>
            <%      }
                rs = dbo.getreadMessages();
                while (rs.next()) {
                    id = rs.getInt("id");
                    datetime = rs.getString("date");
                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                    Date d1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(datetime);
                    date = sdf.format(d1);
                    SimpleDateFormat sdf1 = new SimpleDateFormat("HH:mm");
                    time = sdf1.format(d1);
                    name = rs.getString("name");
                    email = rs.getString("email");
                    message = rs.getString("message");
            %>
            <div class="alert read row" style="text-align: left; margin-left: 5%; margin-right: 5%;">
                <em class="col-md-3"><%= date%> <%= time%></em>
                <strong class="col-md-3"><%= name%></strong>
                <em class="col-md-3 text"><%= message%></em>
                <a href="fetch_message.jsp?rowid=<%=id%>">View More <i class="fa fa-angle-double-right"></i></a>
                <a href="mailto:<%= email%>?Subject=Pravathi%20Report" target="_top" class="col-md-1 replybtn">
                    <span class="glyphicon glyphicon-share-alt"></span>
                    Reply
                </a>
            </div>
            <%      }
                }
            %>
        </div>
    </body>
</html>
