<%-- 
    Document   : report
    Created on : 21 Oct, 2019, 11:41:42 PM
    Author     : hp
--%>

<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
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
            button:hover{
                opacity:0.7;
            }
            .button {
                background-color: #4CAF50; /* Green */
                border: none;
                color: white;
                padding: 16px 32px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                margin: 4px 2px;
                -webkit-transition-duration: 0.4s; /* Safari */
                transition-duration: 0.4s;
                cursor: pointer;
            }
            #owl-demo .item{
                margin: 3px;
            }
            #owl-demo .item img{
                display: block;
                width: 100%;
                height: auto;
                /*filter: brightness(50%);*/
            }
            #owl-demo .item img:hover{
                opacity: 0.5;
            }
            .owl-carousel div h2, .owl-carousel div .textoverlay{
                font-size:12px;
                display:block;
                background-image: linear-gradient(rgba(0, 0, 0, 0.8), rgba(0, 0, 0, 0.7));				
                text-align: center;
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                color: white;
            }
            @media screen and (min-width:320px){  
                h2{
                    color: dimgrey;
                    font-size: 18px;
                }
                #owl-demo .item img{
                    height: 100px;
                }
                h3{
                    font-size: 12px;
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
            }
            @media screen and (min-width:600px){ 
                h2{
                    font-size: 20px;
                } 
                #owl-demo .item img{
                    height: 150px;
                }
                h3{
                    font-size: 18px;
                }
                .w3-card-4{
                    width: 60%;
                }
            }
            @media screen and (min-width:1050px){ 
                h2{
                    font-size: 25px;
                } 
                h3{
                    font-size: 20px;
                }
                #owl-demo .item img{
                    height: 200px;
                }
                .w3-card-4{
                    width: 50%;
                }
                .postimg{
                    width: 100%;
                    max-height:400px;
                    -o-object-fit: contain;
                }
            }
        </style>
    </head>
    <body style="margin:0;" id="mypage" data-spy="scroll" data-target=".navbar" data-offset="60">
        <!--div class="se-pre-con"></div-->
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
                            <li class="active"><a href="#" ><span class="glyphicon glyphicon-pencil"></span> Report various issues</a></li-->
                        </ul>
                    </div>
                </div>
            </nav>
        </header>
        <div class="hero-image-report">
            <div class="hero-text">
                <h1 style="color:white;">WE CAN HELP YOU</h1>
                <p class="headpara" style="color: white; font-family:calibri;">Are you in need of help? Go ahead and report the issue.</p>
                <a href="reportnow.jsp"><button class="mybtn" style="background-color:#1abc9c; color:white;">REPORT NOW</button></a>
            </div>
        </div>
        <div class="container-fluid">
            <h2>Categories</h2>
            <div id="owl-demo">
                <a href="reportissue.jsp?issue=childlabour">
                    <div class="item">
                        <div class="textoverlay">
                            <h3>CHILD LABOUR</h3>
                            <p>Click here</p>
                        </div>
                        <img src="issues/childlabour.jpg" alt="Owl Image"/>
                    </div>
                </a>
                <a href="reportissue.jsp?issue=womenharassment">
                    <div class="item">
                        <div class="textoverlay">
                            <h3>WOMEN HARASSMENT</h3>
                            <p>Click here</p>
                        </div>
                        <img src="issues/womenharassment.jpg" alt="Owl Image">
                    </div>
                </a>
                <a href="reportissue.jsp?issue=sorrounding">
                    <div class="item">
                        <div class="textoverlay">
                            <h3>SORROUNDING ISSUES</h3>
                            <p>Click here</p>
                        </div>
                        <img src="issues/sorrounding.jpg" alt="Owl Image">
                    </div>
                </a>
                <a href="reportissue.jsp?issue=social">
                    <div class="item">
                        <div class="textoverlay">
                            <h3>SOCIAL INJUSTICE</h3>
                            <p>Click here</p>
                        </div>
                        <img src="issues/social.jpg" alt="Owl Image">
                    </div>
                </a>
                <a href="reportissue.jsp?issue=others">
                    <div class="item">
                        <div class="textoverlay">
                            <h3>OTHER ISSUES</h3>
                            <p>Click here</p>
                        </div>
                        <img src="issues/save.jpg" alt="Owl Image">
                    </div>
                </a>
            </div>
        </div>
        <div class="container-fluid" style="background-color:#d3d3d3; margin-top:1%;">
            <h2 style="color:black;">Recent issues</h2>
        </div>
        <%
            PravthiDBO db = new PravthiDBO();
            ResultSet rs = db.generateAllReport();
            while (rs.next()) {
                String issue, title, description, name, state, datetime, sdate, photourl, type, typeshown, verified, color;
                issue = rs.getString("issuecat");
                title = rs.getString("title");
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
                photourl = photourl.replace("\\", "/");
                type = rs.getString("type");
                if (type.equals("")) {
                    typeshown = "empty";
                } else if (type.equals("image/gif") || type.equals("image/jpg") || type.equals("image/jpeg") || type.equals("image/png") ||
                        type.equals("gif") || type.equals("jpg") || type.equals("jpeg") || type.equals("png")) {
                    typeshown = "image";
                } else {
                    typeshown = "video";
                }
                if (rs.getString("anonymous").equals("y")) {
                    name = "Anonymous";
                }
                verified = rs.getString("verified");
                if (verified.equals("y")) {
                    verified = "VERIFIED";
                    color = "green";
                } else if (verified.equals("f")) {
                    verified = "REPORTED SPAM";
                    color = "red";
                } else {
                    verified = "NOT VERIFIED";
                    color = "blue";
                }
        %>
        <div class="w3-container slideanim">
            <div class="w3-card-4">
                <% if (typeshown.equals("image")) {%>
                <img id="#myimg" src="<%= photourl%>" class="postimg" alt="Image of the report">
                <% } else if (typeshown.equals("video")) {%>
                <video class="postimg" controls>
                    <source src="<%= photourl%>" type="video/mp4">
                </video>
                <% }%>
                <div style="padding:1%;color:dimgrey;"><%= issue%></div>
                <h2 style="padding:0% 1%;color:black;"><%= title%></h2>
                <div style="padding:1%;color:dimgrey;"><%= description%></div>
                <div style="padding:1%;color:white; background-color:dimgrey;float:left">POSTED BY: <%= name%></div>
                <div style="padding:1%;color:white; background-color:dimgrey;float:right"><%= sdate%></div>
                <div style="padding:1%;color:white; background-color:<%= color%>;float:right"><%= verified%></div>
                <div class="w3-container w3-center">	
                </div>
            </div>
        </div>
        <% }
        db.closeDB();
        %>
        <script>
            $(document).ready(function () {
                $("#owl-demo").owlCarousel({
                    autoPlay: 3000, //Set AutoPlay to 3 seconds
                    items: 4, //10 items above 1000px browser width
                    itemsDesktop: [1000, 4], //5 items between 1000px and 901px
                    itemsDesktopSmall: [900, 3], // betweem 900px and 601px
                    itemsTablet: [600, 3],
                    itemsMobile: [479, 3],
                });
            });
        </script>
    </body>
</html>