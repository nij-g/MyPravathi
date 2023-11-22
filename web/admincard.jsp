<%-- 
    Document   : admincard
    Created on : 28 Nov, 2019, 9:54:17 PM
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
        <link href="https://fonts.googleapis.com/css?family=Itim" rel="stylesheet" type="text/css">
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
        <%
            boolean flag;
            flag = session.getAttribute("Adminusername") == null;
            if (flag) {
                out.println("<script type='text/javascript'>");
                out.println("Swal.fire({title: 'Spam Error!',text: 'Unauthorized access',type: 'error',confirmButtonText: 'OK', timer: 3000,onAfterClose: function() {location.assign('index.jsp')}})");
                out.println("</script>");
            } else {
                String name = request.getParameter("name");
                try {
                    PravthiDBO dbo = new PravthiDBO();
                    PreparedStatement ps;
                    ResultSet rs;
                    if (name.equals("issuetod")) {
                        String dop;
                        name = "Issues reported today";
                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd 00:00:00");
                        dop = sdf.format(new Date());
                        ps = dbo.con.prepareStatement("SELECT * FROM reporttb WHERE datetime>=? ORDER BY datetime DESC");
                        ps.setString(1, dop);
                        rs = ps.executeQuery();
                    } else {
                        name = "Total Issues";
                        ps = dbo.con.prepareStatement("SELECT * FROM reporttb ORDER BY datetime DESC");
                        rs = ps.executeQuery();
                    }
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
                        <a class="navbar-brand" href="#" style="color:white;">P R A V A T H I</a>
                    </div>
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            <li><a href="admin.jsp"><span class="glyphicon glyphicon-home"></span> Home</a></a></li>
                            <li class="active"><a href="#" ><span class="glyphicon glyphicon-cog"></span> <%= name%></a></li-->
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="logout.jsp">Log out <span class="glyphicon glyphicon-log-out"></span></a></li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>
        <div class = "jumbotron">
            <h2 style="text-align:center; color: #004d4d;"><%= name.toUpperCase()%></h2>
        </div>
        <% if (rs.next()) {

        %>
        <div>
            <div style="overflow-x:auto;">
                <table class="table table-hover">
                    <tr style="background-color: #f2f2f2;">
                        <th>Name</th>
                        <th>Category</th>
                        <th>Title</th>
                        <th>Details</th>
                        <th>State</th>
                        <th>Date</th>
                        <th>Time</th>
                        <th>Verification status</th>
                        <th>Verified By</th>
                        <th>Contact</th>
                    </tr>
                    <% do {
                            int id;
                            String issuecat, title, state, phone, mailid, verified, ver, rowcolor, datetime, dateissue, timeissue, verifiedby;
                            id = rs.getInt("id");
                            name = rs.getString("name");
                            issuecat = rs.getString("issuecat");
                            title = rs.getString("title");
                            state = rs.getString("state");
                            phone = rs.getString("phone");
                            mailid = rs.getString("email");
                            verified = rs.getString("verified");
                            verifiedby = rs.getString("verifiedby");
                            if(verifiedby.equals("")){
                                verifiedby = "None";
                            }
                            if (verified.equals("y")) {
                                ver = "Verified";
                                rowcolor = "green";
                            } else if (verified.equals("n")) {
                                ver = "Not verified";
                                rowcolor = "black";
                            } else {
                                ver = "Reported spam";
                                rowcolor = "red";
                            }
                            datetime = rs.getString("datetime");
                            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                            SimpleDateFormat sdf1 = new SimpleDateFormat("HH:mm:ss");
                            Date d1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(datetime);
                            dateissue = sdf.format(d1);
                            timeissue = sdf1.format(d1);
                    %>
                    <tr>
                        <td><%= name %></td>
                        <td><%= issuecat %></td>
                        <td><%= title %></td>
                        <td>
                            <a href="#myModal" class="btn btn-info" id="custId" data-toggle="modal" data-id="<%= id %>">More Info <i class="fa fa-angle-double-right"></i></a>
                        </td>
                        <td><%= state %></td>
                        <td><%= dateissue %></td>
                        <td><%= timeissue %></td>
                        <td style="color: <%= rowcolor %>"><%= ver %></td>
                        <td><%= verifiedby %></td>
                        <td>
                            <a href="tel:+91<%= phone %>">
                                <i class="fa fa-phone fa-lg" style="color:#004d4d;" aria-hidden="true"></i>
                            </a> 
                            <a href="mailto:<%= mailid %>?Subject=Pravathi%20Report" target="_top">
                                <i class="fa fa-envelope fa-lg" style="color:#004d4d; margin-left:5%;" aria-hidden="true"></i>
                            </a>
                        </td>
                    </tr>
                    <% } while (rs.next());
                    } else { %>
                    <h3 style="color:red; text-align:center;">No issues in the selected category</h3>
                    <% } %>
                </table>
            </div>
        </div>
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">REPORTED ISSUE</h4>
                    </div>
                    <div class="modal-body">
                        <div class="fetched-data"></div> 
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>  
        <%
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        %>
        <script>
            $(document).ready(function () {
                $('#myModal').on('show.bs.modal', function (e) {
                    var rowid = $(e.relatedTarget).data('id');
                    $.ajax({
                        type: 'post',
                        url: 'fetch_record.jsp', //Here you will fetch records 
                        data: 'rowid=' + rowid, //Pass $id
                        success: function (data) {
                            $('.fetched-data').html(data);//Show fetched data from database
                        }
                    });
                });
            });
        </script>
    </body>
</html>
