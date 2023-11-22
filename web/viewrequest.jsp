<%-- 
    Document   : viewrequest
    Created on : 3 Dec, 2019, 2:43:47 PM
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
        <link rel="stylesheet" href="myStyle.css">
        <script src="script.js"></script>
        <style>
            table {
                border-collapse: collapse;
                border-spacing: 0;
                width: 100%;
                border: 1px solid #ddd;
            }
            th, td {
                text-align: center;
                padding: 8px;
            }
            th{
                text-transform: uppercase;
            }
            .table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th {
                vertical-align: baseline;
                white-space: nowrap;
            }
            @media screen and (min-width:320px){ 
                h2{
                    font-size: 18px;
                }
                h3{
                    font-size: 12px;
                }
                .welcometext{
                    top: 20%;
                }
            }
            @media screen and (min-width:600px){
                h2{
                    font-size: 20px;
                }
                h3{
                    font-size: 18px;
                }
                .welcometext{
                    top: 25%;
                }
            }
            @media screen and (min-width:1050px){
                .welcome{
                    height: 25%;
                }
                h2{
                    font-size: 25px;
                } 
                h3{
                    font-size: 20px;
                }
            }
            a:hover{
                opacity: 0.8;
            }
            .modal {
                text-align: center;
            }
            @media screen and (max-width: 768px) {
                .modal:before{
                    margin-top: 0%;
                    height: 0%;
                }
            }
            @media screen and (min-width: 768px) { 
                .modal:before {
                    display: inline-block;
                    vertical-align: middle;
                    content: " ";
                    height: 100%;
                }
            }
            .modal-dialog {
                display: inline-block;
                text-align: left;
                vertical-align: middle;
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
                            <li><a href="volunteer.jsp" ><span class="glyphicon glyphicon-home"></span> Home</a></li>
                            <li class="active"><a href="#">View Blood Donation Request <span class="glyphicon glyphicon-edit"></span></a></li>
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
            flag = session.getAttribute("Volusername") == null;
            if (flag) {
                out.println("<script type='text/javascript'>");
                out.println("Swal.fire({title: 'Spam Error!',text: 'Unauthorized access',type: 'error',confirmButtonText: 'OK', timer: 3000,onAfterClose: function() {location.assign('index.jsp')}})");
                out.println("</script>");
            } else {
        %>
        <div class = "jumbotron">
            <h2 style="text-align:center; color: #004d4d;">List Of All Recent Blood Donation Requests</h2>
        </div>
        <%
            PravthiDBO dbo = new PravthiDBO();
            ResultSet rs1 = dbo.getVolDetails(session.getAttribute("Volusername").toString());
            String State, bloodGroup="";
            if(rs1.next()){
                State = rs1.getString("State");
                bloodGroup = rs1.getString("BloodGroup");
                if(bloodGroup.equals("")){
                    out.println("<script type='text/javascript'>");
                    out.println("Swal.fire({title: 'Warning!',text: 'You cannot access this page without updating blood group!',type: 'warning',confirmButtonText: 'Okay', timer: 3000,onAfterClose: function() {location.assign('voledit.jsp')}})");
                    out.println("</script>");
                }else{
                    ResultSet rs = dbo.getBloodSeekers(State, bloodGroup);
                    if(rs.next()){
        %>
        <div style="overflow-x:auto;" class="container">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Sl.No</th>
                        <th>Date</th>
                        <th>Time</th>
                        <th>Name</th>
                        <th>Exact Location</th>
                        <th>Contact</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                                int count = 0;
                                String name, phone, email, address, datetime, date, time;
                                do{
                                    count++;
                                    name = rs.getString("s_name");
                                    phone = rs.getString("s_phone");
                                    email = rs.getString("s_email");
                                    address = rs.getString("s_address");
                                    datetime = rs.getString("regdate");
                                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                                    Date d1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(datetime);
                                    date = sdf.format(d1);
                                    SimpleDateFormat sdf1 = new SimpleDateFormat("HH:mm");
                                    time = sdf1.format(d1);
                    %>
                    <tr>
                        <td><%= count %></td>
                        <td><%= date %></td>
                        <td><%= time %></td>
                        <td><%= name %></td>
                        <td><%= address %></td>
                        <td>
                            <a href="tel:+91<%= phone %>">
                                <i class="fa fa-phone fa-lg" style="color:#004d4d;" aria-hidden="true"></i> <%= phone %>
                            </a> 
                            <a href="mailto:<%= email %>?Subject=Pravathi%20Report" target="_top">
                                <i class="fa fa-envelope fa-lg" style="color:#004d4d; margin-left:5%;" aria-hidden="true"></i> <%= email %>
                            </a>
                        </td>
                    </tr>
                    <%
                                }while(rs.next());
                    %>
                </tbody>
            </table>
        </div>
        <%              }else{
                        }
                    }
                }else{
                    out.println("<script type='text/javascript'>");
                    out.println("Swal.fire({title: 'Warning!',text: 'There was some connection error! Try again later',type: 'warning',confirmButtonText: 'Okay', timer: 3000,onAfterClose: function() {location.assign('volunteer.jsp')}})");
                    out.println("</script>");
                }
            }
        %>
    </body>
</html>
