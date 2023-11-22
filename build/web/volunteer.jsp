<%-- 
    Document   : volunteer.jsp
    Created on : 29 Oct, 2019, 8:38:42 PM
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
        <!--script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script-->
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
        <style>
            .welcome{
                background-image: linear-gradient(to right,  rgba(0, 110, 245, 0.8), rgba(3, 166, 120, 0.8)), url(image/volimg.jpg);
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
        <%
            boolean flag;
            flag = session.getAttribute("Volusername") == null;
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
                            <li><a href="signupform.jsp">Add new volunteer</a></li>  
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">View Requests <span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="viewrequest.jsp">View Blood Request</a></li>
                                    <li><a href="verifydonationreq.jsp">Verify Donation Requests</a></li>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">My account <span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="voledit.jsp">Edit your account</a></li>
                                    <li><a href="volchangepass.jsp">Change your password</a></li>
                                    <li role="separator" class="divider"></li>
                                    <li><a href="voldelete.jsp">Delete your account</a></li>
                                </ul>
                            </li>
                            <li><a href="logout.jsp">Log out <span class="glyphicon glyphicon-log-out"></span></a></li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>
        <%            
            String username = "", dop;
            int numpending = 0, numtoday = 0, verifiedby = 0, spam = 0;
            PravthiDBO dbo = new PravthiDBO();
            try {
                PreparedStatement ps;
                //PreparedStatement ps = dbo.con.prepareStatement("SELECT name FROM pravathitb WHERE Email=?");
                //ps.setString(1, session.getAttribute("Volusername").toString());
                ResultSet rs = dbo.getUserName(session.getAttribute("Volusername").toString());
                if (rs.next()) {
                    username = rs.getString("name");
                }
                ps = dbo.con.prepareStatement("SELECT COUNT(*) FROM reporttb WHERE verified=?");
                ps.setString(1, "n");
                rs = ps.executeQuery();
                if (rs.next()) {
                    numpending = rs.getInt(1);
                }
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd 00:00:00");
                dop = sdf.format(new Date());
                ps = dbo.con.prepareStatement("SELECT COUNT(*) FROM reporttb WHERE datetime>=?");
                ps.setString(1, dop);
                rs = ps.executeQuery();
                if (rs.next()) {
                    numtoday = rs.getInt(1);
                }
                ps = dbo.con.prepareStatement("SELECT COUNT(*) FROM reporttb WHERE verifiedby=?");
                ps.setString(1, session.getAttribute("Volusername").toString());
                rs = ps.executeQuery();
                if (rs.next()) {
                    verifiedby = rs.getInt(1);
                }
                ps = dbo.con.prepareStatement("SELECT COUNT(*) FROM reporttb WHERE verifiedby=? and verified=?");
                ps.setString(1, session.getAttribute("Volusername").toString());
                ps.setString(2, "f");
                rs = ps.executeQuery();
                if (rs.next()) {
                    spam = rs.getInt(1);
                }
                
            } catch (Exception e) {
                dbo.closeDB();
                out.println("<script type='text/javascript'>");
                out.println("Swal.fire({title: 'Warning!',text: 'Some technical issues encountered\nPlease try again after some time',type: 'warning',confirmButtonText: 'Cool', timer: 3000,onAfterClose: function() {location.assign('index.jsp')}})");
                out.println("</script>");
                out.print("Exception generated: " + e);
                e.printStackTrace();
            }
        %>
        <div class="container-fluid welcome">
            <div class="welcometext">
                <h2>VOLUNTEER DASHBOARD</h2>
                <h3>Welcome <%= username%></h3>
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
                    <a class="dashboard-stat purple" href="volcard.jsp?name=issuever">
                        <div class="visual"><i class="fa fa-hourglass-start"></i></div>
                        <div class="details">
                            <div class="number"><span><%= numpending%></span></div>
                            <div class="desc">Issues to be verified</div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                    <a class="dashboard-stat blue" href="volcard.jsp?name=issuetod">
                        <div class="visual"><i class="fa fa-line-chart"></i></div>
                        <div class="details">
                            <div class="number"><span><%= numtoday%></span></div>
                            <div class="desc">Issues Reported Today</div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                    <a class="dashboard-stat hoki" href="volcard.jsp?name=issueyou">
                        <div class="visual"><i class="fa fa-thumbs-up"></i></div>
                        <div class="details">
                            <div class="number"><span><%= verifiedby%></span></div>
                            <div class="desc">Verified Issues by you</div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                    <a class="dashboard-stat red" href="volcard.jsp?name=issuespam">
                        <div class="visual"><i class="fa fa-exclamation-triangle"></i></div>
                        <div class="details">
                            <div class="number"><span><%= spam%></span></div>
                            <div class="desc">Issues marked spam by you</div>
                        </div>
                    </a>
                </div>  
            </div>
        </div>
        <div class="container-fluid" style="background-color:#d3d3d3; margin-top:0%;">
            <h2 style="color:black;">Recent issues reported</h2>
        </div>
        <div style="overflow-x:auto;">
            <table class="table table-hover" id="table1">
                <tr style="background-color: #f2f2f2;">
                    <th>Name</th>
                    <th>Category</th>
                    <th>Title</th>
                    <th>Details</th>
                    <th>State</th>
                    <th>Verification status</th>
                    <th>Contact</th>
                    <th>Verify</th>
                </tr>
                <%
                    try {
                        PreparedStatement ps = dbo.con.prepareStatement("SELECT * FROM reporttb ORDER BY datetime DESC");
                        ResultSet rs = ps.executeQuery();
                        int id;
                        String name, issuecat, title, state, phone, mailid, verified, ver, rowcolor;
                        while (rs.next()) {
                            id = rs.getInt("id");
                            name = rs.getString("name");
                            issuecat = rs.getString("issuecat");
                            title = rs.getString("title");
                            state = rs.getString("state");
                            phone = rs.getString("phone");
                            mailid = rs.getString("email");
                            verified = rs.getString("verified");
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
                %>
                <tr>
                    <td><%= name%></td>
                    <td><%= issuecat%></td>
                    <td><%= title%></td>
                    <td>
                        <a href="#myModal" class="btn btn-info" id="custId" data-toggle="modal" data-id="<%= id%>">More Info <i class="fa fa-angle-double-right"></i></a>
                    </td>
                    <td><%= state%></td>
                    <td style="color: <%= rowcolor%>"><%= ver%></td>
                    <td>
                        <a href="tel:+91<%= phone%>">
                            <i class="fa fa-phone fa-lg" style="color:#004d4d;" aria-hidden="true"></i>
                        </a> 
                        <a href="mailto:<%= mailid%>?Subject=Pravathi%20Report" target="_top">
                            <i class="fa fa-envelope fa-lg" style="color:#004d4d; margin-left:5%;" aria-hidden="true"></i>
                        </a>
                    </td>
                    <td>
                        <div id="buttondiv">
                            <%
                                if (verified.equals("n")) {
                            %>
                            <button name="verifybtn" class="btn btn-default btn-sm" style="border: solid 1px green;" <%= "onClick='verify(`"+id+"`)'"%>>
                                VERIFY
                            </button>
                            <button name="spambtn" class="btn btn-default btn-sm" style="border: solid 1px red;" <%= "onClick='spam(`"+id+"`)'"%>>
                                MARK SPAM
                            </button>
                            <%
                            } else {
                            %>
                            <button name="verifybtn" class="btn btn-default btn-sm" style="background:#004d4d; color:white;" <%= "onClick='unverify(`"+id+"`)'"%>>
                                CLICK TO INVALIDATE
                            </button>
                            <% } %>
                        </div>
                    </td>
                </tr>
                <%
                        }
                    } catch (Exception e) {
                        out.println("<script type='text/javascript'>");
                        out.println("Swal.fire({title: 'Warning!',text: 'Some technical issues encountered\nPlease try again after some time',type: 'warning',confirmButtonText: 'Cool', timer: 3000,onAfterClose: function() {location.assign('index.jsp')}})");
                        out.println("</script>");
                        out.print("Exception generated: " + e);
                        e.printStackTrace();
                    }
                %>
            </table>
        </div>
        <footer class="page-footer font-small " style="background-color:#004d4d; color:white;">
            <div class="footer-copyright text-center"> Copyright © <font style="color: #99ffe6;">Pravathi.</font> All Rights Reserved.   </div>
        </footer>
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
        <% }%>
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
            function verify(id) {
                $.ajax({
                    url: "verify.jsp",
                    type: "post",
                    data: {id: id},
                    success: function (response) {
                        $("#table1").load("volunteer.jsp #table1");
                        $("#card").load("volunteer.jsp #card");
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log(textStatus, errorThrown);
                    }

                });
            }
            function spam(id) {
                $.ajax({
                    url: "verify.jsp",
                    type: "post",
                    data: {spid: id},
                    success: function (response) {
                        $("#table1").load("volunteer.jsp #table1");
                        $("#card").load("volunteer.jsp #card");
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log(textStatus, errorThrown);
                    }

                });
            }
            function unverify(id) {
                $.ajax({
                    url: "verify.jsp",
                    type: "post",
                    data: {uvid: id},
                    success: function (response) {
                        $("#table1").load("volunteer.jsp #table1");
                        $("#card").load("volunteer.jsp #card");
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log(textStatus, errorThrown);
                    }

                });
            }
        </script>
    </body>
</html>