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
        <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/less.js/3.9.0/less.min.js" ></script>
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
                    if (name.equals("voltot")) {
                        String dop;
                        name = "Total list of volunteers";
                        ps = dbo.con.prepareStatement("SELECT * FROM pravathitb WHERE Status=? ORDER BY Name");
                        ps.setString(1, "v");
                        rs = ps.executeQuery();
                    } else {
                        name = "VOLUNTEERS BLOCKED";
                        ps = dbo.con.prepareStatement("SELECT * FROM pravathitb WHERE Status=? AND Details=? ORDER BY Name");
                        ps.setString(1, "v");
                        ps.setString(2, "block");
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
        <%
            int id=0;
            if (rs.next()) {
        %>
        <div>
            <div style="overflow-x:auto;">
                <table class="table table-hover" id="table1">
                    <thead>
                        <tr style="background-color: #f2f2f2;">
                            <th>Name</th>
                            <th>Join Date</th>
                            <th>Invited By</th>
                            <th>State</th>
                            <th>Status</th>
                            <th>Contact</th>
                        </tr>
                    </thead>
                    <tbody>
                    <% do {
                            String volname, state, doj, joindate, invitedby, status, mailid, phone, rowcolor;
                            id++;
                            volname = rs.getString("Name");
                            state = rs.getString("state");
                            doj = rs.getString("CreationDate");
                            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                            Date d1 = new SimpleDateFormat("yyyy-MM-dd").parse(doj);
                            joindate = sdf.format(d1);
                            phone = rs.getString("phone");
                            mailid = rs.getString("email");
                            invitedby = rs.getString("InvitedBy");
                            ps = dbo.con.prepareStatement("SELECT Name FROM pravathitb WHERE Email=?");
                            ps.setString(1, invitedby);
                            ResultSet rs1 = ps.executeQuery();
                            if(rs1.next())
                                invitedby = rs1.getString("Name");
                            else
                                invitedby = "ADMIN";
                            status = rs.getString("Details");
                            if (status.equals("active")) {
                                rowcolor = "green";
                            } else if (status.equals("inactive")) {
                                rowcolor = "black";
                            } else {
                                rowcolor = "red";
                            }
                        %>
                        <tr>
                            <td><%= volname%></td>
                            <td><%= joindate%></td>
                            <td><%= invitedby%></td>
                            <td><%= state%></td>
                            <%
                                if(status.equals("active")){
                            %>
                            <td style="color: <%= rowcolor%>">
                                <button name="blockbtn" class="btn btn-default btn-sm" style="border: solid 1px green;" <%= "onClick='block(`"+mailid+"`)'"%>>
                                    &nbsp;ACTIVE&nbsp;
                                </button>
                            </td>
                            <% }else if(status.equals("inactive")){ %>
                            <td style="color: <%= rowcolor%>">
                                <button name="blockbtn" class="btn btn-default btn-sm" style="border: solid 1px black;">
                                    INACTIVE
                                </button>
                            </td>
                            <% }else { %>
                            <td style="color: <%= rowcolor%>">
                                <button name="blockbtn" class="btn btn-default btn-sm" style="border: solid 1px red;" <%= "onClick='unblock(`"+mailid+"`)'"%>>
                                    UNBLOCK
                                </button>
                            </td>
                            <% } %>
                            <td>
                                <a href="tel:+91<%= phone%>">
                                    <i class="fa fa-phone fa-lg" style="color:#004d4d;" aria-hidden="true"></i>
                                </a> 
                                <a href="mailto:<%= mailid%>?Subject=Pravathi%20Report" target="_top">
                                    <i class="fa fa-envelope fa-lg" style="color:#004d4d; margin-left:5%;" aria-hidden="true"></i>
                                </a>
                            </td>
                        </tr>
                        <% } while (rs.next()); %>
                    </tbody>
                </table>
                <% } else { %>
                <h3 style="color:red; text-align:center;">No volunteers in the selected category</h3>
                <% } %>
            </div>
        </div>
        <%
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        %>
        <script>
            function block(mailid) {
                $.ajax({
                    url: "block.jsp",
                    type: "post",
                    data: {id: mailid, action: "block"},
                    success: function (response) {
                        $("#table1").load(location.href+" #table1>*","");
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log(textStatus, errorThrown);
                    }

                });
            }
            function unblock(mailid) {
                $.ajax({
                    url: "block.jsp",
                    type: "post",
                    data: {id: mailid, action: "unblock"},
                    success: function (response) {
                        $("#table1").load(location.href+" #table1>*","");
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log(textStatus, errorThrown);
                    }

                });
            }
        </script>
    </body>
</html>
