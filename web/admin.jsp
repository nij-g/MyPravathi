<%-- 
    Document   : admin
    Created on : 26 Nov, 2019, 2:18:10 PM
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
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>PRAVATHI - The Helping Hands</title><link rel="icon" href="image/logo.png" type="image/x-icon">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
        <link href="https://fonts.googleapis.com/css?family=Itim" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="myStyle.css">
        <script src="script.js"></script>
        <link rel="stylesheet/less" type="text/css" href="styles.less" />
        <script src="//cdnjs.cloudflare.com/ajax/libs/less.js/3.9.0/less.min.js" ></script>
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css">
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap.min.js"></script>
        <style>
            .welcome{
                background-image: linear-gradient(to right,  rgba(2, 44, 45, 0.8), rgba(0,119,102,0.5)), url(image/adminimg.jpg);
                background-position: center;
                background-repeat: no-repeat;
                background-size: cover;
                position: relative;  
            }
            .welcometext{
                color: white;
                position: absolute;
                color: white;
            }
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
                .welcome{
                    height: 25%;
                }
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
                .welcome{
                    height: 30%;
                }
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
                .welcometext{
                    top: 40%;
                }
            }
            .badge {position: absolute; top: 5px; right: 2%;}
            a:hover{
                opacity: 0.8;
            }
            .modal {
                text-align: center;
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
        <script>
            $(document).ready(function() {
                $('#table1').DataTable();
            } );
        </script>
    </head>
    <body>
        <%
            boolean flag;
            flag = session.getAttribute("Adminusername") == null;
            if (flag) {
                out.println("<script type='text/javascript'>");
                out.println("Swal.fire({title: 'Spam Error!',text: 'Unauthorized access',type: 'error',confirmButtonText: 'OK', timer: 3000,onAfterClose: function() {location.assign('index.jsp')}})");
                out.println("</script>");
            } else {

        %>
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
                        <a class="navbar-brand" href="index.jsp" style="color:white;">P R A V A T H I</a>
                    </div>
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            <li class="active"><a href="#" ><span class="glyphicon glyphicon-home"></span> Home</a></li-->
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="viewrequests.jsp">View Requests</a></li>
                            <li><a href="viewmessages.jsp">View Messages</a></li>
                            <li><a href="adminchangepass.jsp">Change your password</a></li>
                            <li><a href="logout.jsp">Log out <span class="glyphicon glyphicon-log-out"></span></a></li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>
        <%            
            PreparedStatement ps;
            ResultSet rs;
            String dop;
            int totalissues = 0, numtoday = 0, totalvol = 0, blockedvol = 0;
            PravthiDBO dbo = new PravthiDBO();
            ps = dbo.con.prepareStatement("SELECT COUNT(*) FROM reporttb");
            rs = ps.executeQuery();
            if (rs.next()) {
                totalissues = rs.getInt(1);
            }
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd 00:00:00");
            dop = sdf.format(new Date());
            ps = dbo.con.prepareStatement("SELECT COUNT(*) FROM reporttb WHERE datetime>=?");
            ps.setString(1, dop);
            rs = ps.executeQuery();
            if (rs.next()) {
                numtoday = rs.getInt(1);
            }
            ps = dbo.con.prepareStatement("SELECT COUNT(*) FROM pravathitb WHERE Status = ?");
            ps.setString(1, "v");
            rs = ps.executeQuery();
            if (rs.next()) {
                totalvol = rs.getInt(1);
            }
            ps = dbo.con.prepareStatement("SELECT COUNT(*) FROM pravathitb WHERE Status = ? AND Details = ?");
            ps.setString(1, "v");
            ps.setString(2, "block");
            rs = ps.executeQuery();
            if (rs.next()) {
                blockedvol = rs.getInt(1);
            }
        %>
        <div class="container-fluid welcome">
            <div class="welcometext">
                <h2>ADMIN DASHBOARD</h2>
                <h3>Welcome Administrator</h3>
            </div>
        </div>
        <div class="wrapper container" id="card">
            <div class="row">
                <div class="col-lg-12">
                    <h2 class="heading"></h2>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                    <a class="dashboard-stat green" href="admincard.jsp?name=issuetod">
                        <div class="visual"><i class="fa fa-hourglass-start"></i></div>
                        <div class="details">
                            <div class="number"><span><%= numtoday%></span></div>
                            <div class="desc">Issues posted today</div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                    <a class="dashboard-stat hoki" href="admincard.jsp?name=issuetot">
                        <div class="visual"><i class="fa fa-line-chart"></i></div>
                        <div class="details">
                            <div class="number"><span><%= totalissues%></span></div>
                            <div class="desc">Total issues</div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                    <a class="dashboard-stat yellow" href="admincard1.jsp?name=voltot">
                        <div class="visual"><i class="fa fa-thumbs-up"></i></div>
                        <div class="details">
                            <div class="number"><span><%= totalvol%></span></div>
                            <div class="desc">Total volunteers</div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                    <a class="dashboard-stat orange" href="admincard1.jsp?name=volblocked">
                        <div class="visual"><i class="fa fa-exclamation-triangle"></i></div>
                        <div class="details">
                            <div class="number"><span><%= blockedvol%></span></div>
                            <div class="desc">Volunteers temporarily blocked</div>
                        </div>
                    </a>
                </div>  
            </div>
        </div>
        <div class="container-fluid" style="background-color:#d3d3d3; margin-top:0%;">
            <h2 style="color:black;">List Of All Volunteers</h2>
        </div>
        <div style="overflow-x:auto;">
            <table class="table table-hover" id="table1">
                <thead>
                    <tr style="background-color: #f2f2f2;">
                        <th>ID</th>
                        <th>Name</th>
                        <th>Join Date</th>
                        <th>Status</th>
                        <th>State</th>
                        <th>Invited By</th>
                        <th>Contact</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        ps = dbo.con.prepareStatement("SELECT * FROM pravathitb where Status=? ORDER BY CreationDate desc");
                        ps.setString(1, "v");
                        rs = ps.executeQuery();
                        int id;
                        String name, doj, status, invitedby, mailid, phone, state, joindate, btncolor;
                        id = 0;
                        while(rs.next()){
                            id++;
                            name = rs.getString("Name");
                            doj = rs.getString("CreationDate");
                            sdf = new SimpleDateFormat("dd/MM/yyyy");
                            Date d1 = new SimpleDateFormat("yyyy-MM-dd").parse(doj);
                            joindate = sdf.format(d1);
                            status = rs.getString("Details");
                            if(status.equals("active")){
                                btncolor = "green";
                            }else if(status.equals("inactive")){
                                btncolor = "dimgrey";
                            }else{
                                btncolor = "red";
                            }
                            state = rs.getString("state");
                            invitedby = rs.getString("InvitedBy");
                            phone = rs.getString("Phone");
                            mailid = rs.getString("Email");
                    %>
                    <tr>
                        <td><%= id %></td>
                        <td><%= name %></td>
                        <td><%= joindate %></td>
                        <td style="color:<%=btncolor%>;"><%= status %></td>
                        <td><%= state %></td>
                        <td><%= invitedby %></td>
                        <td>
                            <a href="tel:+91<%= phone%>">
                                <i class="fa fa-phone fa-lg" style="color:#004d4d;" aria-hidden="true"></i>
                            </a> 
                            <a href="mailto:<%= mailid%>?Subject=Pravathi%20Report" target="_top">
                                <i class="fa fa-envelope fa-lg" style="color:#004d4d; margin-left:5%;" aria-hidden="true"></i>
                            </a>
                        </td>
                    </tr>
                    <%
                        }
                        dbo.closeDB();
                    %>
                </tbody>
            </table>
        </div>
        <% }%>
    </body>
</html>
