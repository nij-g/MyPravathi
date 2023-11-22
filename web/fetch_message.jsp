<%-- 
    Document   : fetch_record
    Created on : 29 Oct, 2019, 11:28:49 PM
    Author     : hp
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
        <link rel="stylesheet" href="formstyle.css">
        <script src="script.js"></script>
        <style>
            .w3-card-4{
                width: 100%;
                margin:0 auto;
                padding: 0%;
                margin-top:3%;
            }
            .postimg{
                width: 100%;
                max-height:350px;
                -o-object-fit: contain;
            }
            .button {
                background-color: #4CAF50; /* Green */
                border: none;
                color: white;
                padding: 10px 10px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 14px;
                margin: 4px 2px;
                -webkit-transition-duration: 0.4s; /* Safari */
                transition-duration: 0.4s;
                cursor: pointer;
            }
            .button5 {
                margin-left: 2%;
                background-color: white;
                color: #CC2541;
                border: 1px solid #CC2541;
            }
            .button5:hover {
                background-color: #CC2541;
                color: white;
            }
            .button4{
                background-color: white;
                color: green;
                border: 1px solid green;
            }
            .button4:hover {
                background-color: green;
                color: white;
            }
            @media screen and (min-width:320px){  
                h2{
                    font-size: 18px;
                }
                h3{
                    font-size: 12px;
                }
            }
            @media screen and (min-width:600px){ 
                h2{
                    font-size: 20px;
                } 
                h3{
                    font-size: 18px;
                }
            }
            @media screen and (min-width:1050px){ 
                h2{
                    font-size: 25px;
                } 
                h3{
                    font-size: 20px;
                }
            }
        </style>
    </head>
    <body>
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
            <h2>VIEW MESSAGES</h2><br>
            <%
                boolean flag;
                //flag = session.getAttribute("Volusername") == null;
                if (session.getAttribute("Adminusername") == null) {
                    out.println("<script type='text/javascript'>");
                    out.println("Swal.fire({title: 'Spam Error!',text: 'Unauthorized access',type: 'error',confirmButtonText: 'OK', timer: 3000,onAfterClose: function() {location.assign('index.jsp')}})");
                    out.println("</script>");
                } else {
                    String date, time, datetime, name, email, message;
                    int rowid = Integer.parseInt(request.getParameter("rowid"));
                    PravthiDBO dbo = new PravthiDBO();
                    ResultSet rs = dbo.getMessage(rowid);
                    PreparedStatement ps = dbo.con.prepareStatement("UPDATE contacttb SET viewstatus=? WHERE id=?");
                    ps.setString(1, "1");
                    ps.setInt(2, rowid);
                    ps.executeUpdate();
                    if (rs.next()) {
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
            <div class="w3-container">
                <div class="w3-card-4" style="width:70%">
                    <header class="w3-container w3-light-grey">
                        <h3><%= name %></h3>
                    </header>
                    <div class="w3-container">
                        <p>Date: <%=date%> <br>Time: <%=time%></p>
                        <hr>
                        <p><%= message %></p><br>
                    </div>
                    <button class="w3-button w3-block w3-dark-grey">
                        <a href="mailto:<%= email%>?Subject=Pravathi%20Report" target="_top">
                            <span class="glyphicon glyphicon-share-alt"></span>
                                Reply
                        </a>
                    </button>
                </div>
            </div>
            <%
                    }
                }
            %>
        </div>
    </body>
</html>