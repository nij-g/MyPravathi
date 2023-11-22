<%-- 
    Document   : reportissue
    Created on : 25 Oct, 2019, 2:49:01 PM
    Author     : hp
--%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
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
        <title>PRAVATHI - Report</title><link rel="icon" href="logo.png" type="image/x-icon">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-sweetalert/1.0.1/sweetalert.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-sweetalert/1.0.1/sweetalert.min.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet" type="text/css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.carousel.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.carousel.css" rel="stylesheet"/>
        <link rel="stylesheet" href="myStyle.css">
        <script src="script.js"></script>
        <style>
            @media screen and (min-width:320px){ 
                .hero-image-issue {
                    height: 70%;
                    background-position: center;
                    background-repeat: no-repeat;
                    background-size: cover;
                    position: relative;
                }
                .w3-card-4{
                    width: 90%;
                    margin:0 auto;
                    padding: 0%;
                    margin-top:3%;
                }
                .postimg{
                    width: 100%;
                    max-height:400px;
                    -o-object-fit: contain;
                }
                h2{
                    color: dimgrey;
                    font-size: 18px;
                }
                h3{
                    font-size: 12px;
                }
            }
            @media screen and (min-width:600px){  
                .hero-image-issue{
                    height: 68%;
                }
                .w3-card-4{
                    width: 60%;
                }
                h2{
                    font-size: 20px;
                }
                h3{
                    font-size: 18px;
                }
            }
            @media screen and (min-width:1050px){  
                .hero-image{
                    height: 94%;
                }
                .w3-card-4{
                    width: 50%;
                }
                .postimg{
                    width: 100%;
                    max-height:400px;
                    -o-object-fit: contain;
                }
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
        <%
            String issue = request.getParameter("issue");
            String pic, des;
            if (issue.equals("childlabour")) {
                issue = "Child Labour";
                pic = "issues/childlabour.jpg";
                des = "Child labor and poverty are inevitably bound together, and if you continue to use the labor of children as the treatment for the social disease of poverty, you will have both poverty and child labor to the end of time.";
            } else if (issue.equals("womenharassment")) {
                issue = "Women Harassment";
                pic = "issues/womenharassment.jpg";
                des = "Beauty provokes harassment, the law says, but it looks through men's eyes when deciding what provokes it.";
            } else if (issue.equals("sorrounding")) {
                issue = "Sorrounding Issues";
                pic = "issues/sorrounding.jpg";
                des = "Stay positive and happy. Work hard and don't give up hope. Be open to criticism and keep learning. Surround yourself with happy, warm and genuine people.";
            } else if (issue.equals("social")) {
                issue = "Social Injustice";
                pic = "issues/social.jpg";
                des = "The ends you serve that are selfish will take you no further than yourself but the ends you serve that are for all, in common, will take you into eternity.";
            } else {
                issue = "Other Issues";
                pic = "issues/save.jpg";
                des = "No one is useless in this world who lightens the burdens of another.";
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
                            <li><a href="index.jsp"><span class="glyphicon glyphicon-home"></span> Home</a></a></li>
                            <li class="active"><a href="#" ><span class="glyphicon glyphicon-cog"></span> <%= issue%></a></li-->
                        </ul>
                    </div>
                </div>
            </nav>
        </header>
        <div class="hero-image-issue" style="background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url(<%= pic%>);">
            <div class="hero-text">
                <h1 style="color:white;"><%= issue.toUpperCase()%></h1>
                <p class="headpara" style="color: white; font-family:calibri;"><%= des%></p>
            </div>
        </div>
        <div class="container-fluid" style="background-color:#d3d3d3; margin-top:0%;">
            <h2 style="color:black;">Recent issues</h2>
        </div>
        <%
            PravthiDBO db = new PravthiDBO();
            ResultSet rs = db.generateOneReport(issue);
            if(rs.next()){
                do{
                String title, description, name, state, datetime, sdate, photourl, type, typeshown, verified, color;
                issue = rs.getString("issuecat").toUpperCase();
                title = rs.getString("title").toUpperCase();
                description = rs.getString("description");
                name = rs.getString("name");
                String[] arr = name.split(" ");
                name = arr[0];
                state = rs.getString("state");
                datetime = rs.getString("datetime");
                SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                Date d1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(datetime);
                sdate = sdf.format(d1);
                photourl = rs.getString("photo");
                type = rs.getString("type");
                if(type.equals("")){
                    typeshown = "empty";
                }else if(type.equals("gif") || type.equals("jpg") || type.equals("jpeg") || type.equals("png") || type.equals("image/gif") || type.equals("image/jpg") || type.equals("image/jpeg") || type.equals("image/png")){
                    typeshown = "image";
                }else if (type.equals("")) {
                    typeshown = "empty";
                }else{
                    typeshown = "video";
                }
                if(rs.getString("anonymous").equals("y")){
                    name = "Anonymous";
                }
                verified = rs.getString("verified");
                if(verified.equals("y")){
                    verified = "VERIFIED";
                    color = "green";
                }else{
                    verified = "NOT VERIFIED";
                    color = "red";
                }
                //db.closeDB();
        %>
        <div class="w3-container">
            <div class="w3-card-4">
                <% if(typeshown.equals("image")){ %>
                    <img id="#myimg" src="<%= photourl %>" class="postimg" alt="Image of the report">
                <% } 
                else if(typeshown.equals("video")){ %>
                <video class="postimg" controls>
                    <source src="<%= photourl %>" type="video/mp4">
                </video>
                <% } %>
                <div style="padding:1%;color:dimgrey;"><%= issue %></div>
                <h2 style="padding:0% 1%;color:black;"><%= title %></h2>
                <div style="padding:1%;color:dimgrey;"><%= description %></div>
                <div style="padding:1%;color:white; background-color:dimgrey;float:left">POSTED BY: <%= name %></div>
                <div style="padding:1%;color:white; background-color:dimgrey;float:right"><%= sdate %></div>
                <div style="padding:1%;color:white; background-color:<%= color %>;float:right"><%= verified %></div>
                <div class="w3-container w3-center">	
                </div>
            </div>
        </div>
        <% }while(rs.next());
            db.closeDB();
            }else{ 
            db.closeDB();
        %>
        <div class="jumbotron">
            <h2 style="text-align:center;color:red;">Sorry there are no post yet in the selected category</h2>
        </div>
        <% } %>
    </body>
</html>