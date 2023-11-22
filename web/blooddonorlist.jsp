<%-- 
    Document   : blooddonorlist
    Created on : 20 Nov, 2019, 7:23:22 AM
    Author     : DELL
--%>

<%@page import="java.net.URLDecoder"%>
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
        <button onclick="topFunction()" id="myBtn" title="Go to top"><span class="glyphicon glyphicon-arrow-up"></span></button>
        <header>
            <nav class="navbar navbar-inverse" style=" margin:0%; background-color: #004d4d; border: 0%;">
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
                            <li class="active"><a href="#"><span class="glyphicon glyphicon-user"></span> List of Donors</a></a></li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>
        <div class = "jumbotron">
            <h2 style="text-align:center; color: #004d4d;">List Of Blood Donors Matching Your Request</h2>
        </div>
        <%
            String pin = request.getParameter("pin");
            String bgrp = request.getParameter("bgroup");  
            String state = request.getParameter("state");
            PravthiDBO db = new PravthiDBO();
            ResultSet rs = db.showBloodDonors(bgrp, pin);
            ResultSet rs1 = db.showBloodDonorsVol(bgrp, state);
            int rowcount = rs.getRow();
            int count = 1;
            int volfind = 0;
            int donorfind = 0;
            if (rs.next()) {
                donorfind = 1;
                rs.beforeFirst();
            }
            if (rs1.next()){
                volfind = 1;
                rs1.beforeFirst();
            }
            if(volfind == 1 || donorfind == 1){
        %>
        <div style="overflow-x:auto;" class="container">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Sl.No</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Title</th>
                    </tr>
                </thead>
                <tbody>
                    <%                        
                        while (rs.next()) {
                    %>
                    <tr>
                        <td><%= count++%></td>
                        <td><%=rs.getString("donor_name")%></td>
                        <td>
                            <%= rs.getString("donor_email")%>
                            <a href="mailto:<%= rs.getString("donor_email") %>?Subject=Pravathi%20Blood%20Donation" target="_top">
                                <i class="fa fa-envelope fa-lg" style="color:#004d4d; margin-left:5%;" aria-hidden="true"></i>
                            </a>
                        </td>
                        <td>
                            <%=rs.getString("donor_phone")%>&nbsp;&nbsp;
                            <a href="tel:+91<%= rs.getString("donor_phone") %>">
                                <i class="fa fa-phone fa-lg" style="color:#004d4d;" aria-hidden="true"></i>
                            </a> 
                        </td>
                        <td>Blood Donor</td>
                    </tr>
                    <% } %>
                    <%                        
                        while (rs1.next()) {
                    %>
                    <tr>
                        <td><%= count++%></td>
                        <td><%=rs1.getString("Name")%></td>
                        <td>
                            <%= rs1.getString("Email")%>
                            <a href="mailto:<%= rs1.getString("Email") %>?Subject=Pravathi%20Blood%20Donation" target="_top">
                                <i class="fa fa-envelope fa-lg" style="color:#004d4d; margin-left:5%;" aria-hidden="true"></i>
                            </a>
                        </td>
                        <td>
                            <%=rs1.getString("phone")%>&nbsp;&nbsp;
                            <a href="tel:+91<%= rs1.getString("phone") %>">
                                <i class="fa fa-phone fa-lg" style="color:#004d4d;" aria-hidden="true"></i>
                            </a> 
                        </td>
                        <td>Pravathi Volunteer</td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
        <%
            } else {
        %>
        <h3 style="color:red; text-align:center;">Sorry! No blood donors available matching your request</h3>
        <%
            }
        %>
    </body>
</html>
