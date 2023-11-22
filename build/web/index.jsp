<%-- 
    Document   : report
    Created on : 18-Oct-2019, 8:55:50 PM
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
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
        <link href="https://fonts.googleapis.com/css?family=Itim" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="myStyle.css">
        <script src="script.js"></script>
        <style>
            body{
             padding-right: 0 !important;   
            }
            button:hover{
                opacity:0.7;
            }
            .button {
                background-color: #4CAF50; 
                border: none;
                color: white;
                padding: 16px 32px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                margin: 4px 2px;
                -webkit-transition-duration: 0.4s; 
                transition-duration: 0.4s;
                cursor: pointer;
            }
            .button5 {
                background-color: white;
                color: black;
                border: 2px solid #555555;
            }
            .button5:hover {
                background-color: #555555;
                color: white;
            }
            .button4{
                background-color: white;
                color: #004d4d;;
                border: 2px solid #004d4d;
            }
            .button4:hover {
                background-color: #004d4d;
                color: white;
            }
            .parallax {
                background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.6)), url("image/road.jpg");
                height: 40%; 
                background-attachment: fixed;
                background-position: center;
                background-repeat: no-repeat;
                background-size: cover;

            }
            .column {
                float: left;
                width: 50%;
                margin-top: 6px;
                padding: 20px;
            }
            .row:after {
                content: "";
                display: table;
                clear: both;
            }
            @media screen and (max-width: 600px) {
                .column, input[type=submit] {
                    width: 100%;
                    margin-top: 0;
                }
            }
            @media (min-width: 768px){
                .col-sm-6 {
                    width: 50%;
                    margin: 2%;
                }
            }
            .navbar-inverse .navbar-nav>.open>a, .navbar-inverse .navbar-nav>.open>a:focus, .navbar-inverse .navbar-nav>.open>a:hover {
                color: #fff;
                background-color: #004d4d;
            }
            .navbar-inverse .navbar-nav>.active>a, .navbar-inverse .navbar-nav>.active>a:focus, .navbar-inverse .navbar-nav>.active>a:hover {
                color: #fff;
                background-color: #004d4d;
            }
            .navbar-inverse {
                border-color: #004d4d;
            }
            .navbar-inverse .navbar-toggle {
                border-color: #004d4d;
            }
            /*.no-js #loader { display: none;  }
            .js #loader { display: block; position: absolute; left: 100px; top: 0; }
            .se-pre-con {
                position: fixed;
                left: 0px;
                top: 0px;
                width: 100%;
                height: 100%;
                z-index: 9999;
                background: url(image/ballon_loader.gif) center no-repeat #fff;
            }*/
            #whatwedo{
                padding-top: 2%;
                padding-bottom: 2%;
            }
            #contactus{
                padding-top: 2%;
            }
        </style>
    </head>
    <%
        if (request.getParameter("loginbtn") != null) {
            String username = request.getParameter("username");
            String userpassword = request.getParameter("userpassword");
            PravthiDBO db = new PravthiDBO();
            ResultSet rs = db.checkUser(username, userpassword);
            if (rs.next()) {
                String status = rs.getString("Status");
                String details = rs.getString("Details");
                if (details.equals("active")) {
                    if (status.equals("v")) {
                        db.closeDB();
                        session.setAttribute("Volusername", username);
                        response.addHeader("Refresh", "0;url=volunteer.jsp");
                    } else {
                        db.closeDB();
                        session.setAttribute("Adminusername", username);
                        response.addHeader("Refresh", "0;url=admin.jsp");
                    }
                } else {
                    db.closeDB();
                    out.println(".");
                    out.println("<script type='text/javascript'>");
                    out.println("Swal.fire({title: 'Error!',text: 'Your account has been temporarily blocked by the admin or permanently deleted',type: 'error',confirmButtonText: 'Cool', timer: 3000,onAfterClose: function() {location.assign('index.jsp')}})");
                    out.println("</script>");
                }
                db.closeDB();
            } else {
                db.closeDB();
                out.println(".");
                out.println("<script type='text/javascript'>");
                out.println("Swal.fire({title: 'Invalid credentials!',text: 'Please check your username and password',type: 'error',confirmButtonText: 'Okay', timer: 3000,onAfterClose: function() {location.assign('index.jsp')}})");
                out.println("</script>");
            }
        }else if(request.getParameter("contactbtn")!=null){
            String contactname, contactemail, contactmessage;
            contactname = request.getParameter("contactname");
            contactemail = request.getParameter("contactemail");
            contactmessage = request.getParameter("contactmessage");
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String doj = sdf.format(new Date());
            PravthiDBO db = new PravthiDBO();
            if(db.insertmessage(contactname, contactemail, contactmessage, doj)){
                db.closeDB();
                out.println(".");
                out.println("<script type='text/javascript'>");
                out.println("Swal.fire({title: 'Success!',text: 'Your message has been successfully sent',type: 'success',confirmButtonText: 'Cool', timer: 3000,onAfterClose: function() {location.assign('index.jsp')}})");
                out.println("</script>");
            }else{
                db.closeDB();
                out.println(".");
                out.println("<script type='text/javascript'>");
                out.println("Swal.fire({title: 'Error!',text: 'The message could not be send. Try again later!!',type: 'error',confirmButtonText: 'Cool', timer: 3000,onAfterClose: function() {location.assign('index.jsp')}})");
                out.println("</script>");
            }
        }else{
    %>
    <body style="margin:0;" id="mypage" data-spy="scroll" data-target=".navbar" data-offset="60">
        <div class="se-pre-con"></div>
        <button onclick="topFunction()" id="myBtn" title="Go to top"><span class="glyphicon glyphicon-arrow-up"></span></button>
        <header>
            <nav class="navbar navbar-inverse navbar-fixed-top" style=" margin:0%; background-color: #004d4d; border: 0%; border-radius:0%;">
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

                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="#whatwedo" >What we do?</a></li>
                            <li><a href="#about">About Us</a></li>
                            <li><a href="#contactus">Contact Us</a></li>
                            <li><a href="#" role="button"  data-toggle="modal" data-target="#exampleModal"><span class="glyphicon glyphicon-log-in"></span> Log in</a></li>
                        </ul>
                    </div>
                </div>
            </nav>		
        </header>
        <div class="hero-image">
            <div class="hero-text">
                <h1 style="color:#99ffe6; " class="animated fadeInLeft">P R A V A T H I</h1><br>
                <p class="headpara" style="color: #ccfff2; font-family:calibri;"><b>WE CAN HELP YOU!!</b><br>Are you troubled? Having problems that you cannot share with anyone else? Depressed? Lonely?<br> Dont worry we are with you!!</p>
            </div>
        </div>
        <div class="container-fluid" id="whatwedo" style="background-color: #eff5f5; padding-bottom: 1%;">     
            <div class="serviceheader" style="text-align:center;">WHAT WE DO?</div>
            <p class="headpara" style="text-align:center; color: dimgrey; font-family:calibri;">Below are given some of the major services that we do offer</p>
            <div class="flip">
                <div class="flip-box slideanim">
                    <div class="flip-box-inner">
                        <div class="flip-box-front">
                            <img src="image/b2.png" style="height: 90px; width: 100px; object-fit:contain;margin: 1%;"/>
                            <p style="font-weight:bold;">DONATE BLOOD</p>
                            <p style="color:dimgrey;">Support blood donation and be a donor. Its your responsibility to bring a life back to its power.</p>
                            <p style="color:darkslategray;">"There is no great joy than saving a soul."</p>				
                        </div>
                        <div class="flip-box-back" style="background-image: linear-gradient(to right, #f5f5f0 , white);">
                            <!--p style="font-weight:bold;">BE A BLOOD DONOR</p-->
                            <p style="color:darkslategray;">“Blood is that fragile scarlet tree we carry within us.” </p><p style="font-style:italic;">— Osbert Sitwell</p>
                            <a href="checkeligibility.jsp"><button class="button button5">REGISTER</button></a>
                            <a href="seekblood.jsp"><button class="button button5">SEEK DONATION</button></a>
                        </div>
                    </div>
                </div>
                <div class="flip-box slideanim">
                    <div class="flip-box-inner">
                        <div class="flip-box-front">
                            <img src="image/money.png" style="height: 90px; width: 100px; margin: 1%; object-fit:contain;"/>
                            <p style="font-weight:bold;">SEEK DONATIONS</p>
                            <p style="color:dimgrey;">Not every child gets an oppurtunity to study. Not everyone gets a shelter or proper food. Are you in need of any help?</p>
                            <p style="color:darkslategray;">“Happiness is not a goal...it's a by-product of a life well lived.”</p>		
                        </div>
                        <div class="flip-box-back" style="background-image: linear-gradient(to right, #f5f5f0 , white);">
                            <p style="color:darkslategray;">“Education is the most powerful weapon which you can use to change the world.” </p><p style="font-style:italic;">— Nelson Mandela</p>
                            <a href="donatenow.jsp"><button class="button button5">DONATE NOW</button></a>
                            <a href="seekdonation.jsp"><button class="button button5">SEEK DONATIONS</button></a>
                        </div>
                    </div>
                </div>
                <div class="flip-box slideanim">
                    <div class="flip-box-inner">
                        <div class="flip-box-front">
                            <img src="image/pen.png" style="height: 90px; width: 100px; object-fit:contain;margin: 1%;"/>
                            <p style="font-weight:bold;">REACT TO VARIOUS ISSUES</p>
                            <p style="color:dimgrey;">Are you having a problem that you are not daring to speak out?? We provide you a platform to do so.</p>
                            <p style="color:darkslategray;">“No cries should be left unheard.”</p>	
                        </div>
                        <div class="flip-box-back" style="background-image: linear-gradient(to right, #f5f5f0 , white);">
                            <p style="font-weight:bold;">SHARE AN ISSUE</p>
                            <p style="color:darkslategray;">“Raise your words, not your voice.” </p><p style="font-style:italic;">— Rumi</p>
                            <a href="report.jsp"><button class="button button5">REPORT</button></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="parallax" id="about"></div>
        <div class="bgimg-2 w3-display-container w3-opacity-min">
            <div class="w3-display-middle">
                <span class="w3-xlarge w3-text-white w3-wide">ABOUT US</span>
                <p class="aboutp slideanim">There are a lot of instances where the people want to raise their voice against certain social issues. Most of the times they are forced to shut their mouth or their voices are left unheard. And at critical times where people badly need help there might be none to help them out. They are left all alone, shattered and depressed. We povide an online platform so that our volunteers could be able to provide the required help. </p>
            </div>
        </div>
        <div class="parallax"></div>
        <div id="contactus" class="container-fluid text-center">
            <div class="serviceheader" style="text-align:center;">CONTACT US</div>
            <p style="color:darkslategray; text-align:center;">Got a question? We'd love to hear from you</p>
            <div class="row">
                <div class="col-sm-6 c1 slideanim">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d7779.786559818448!2d74.84302807439339!3d12.850168913742376!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ba35bb9118adc71%3A0x61d722082c13920a!2sMangala+Nagar%2C+Mangaluru%2C+Karnataka!5e0!3m2!1sen!2sin!4v1565021653719!5m2!1sen!2sin" width="100%" height="375" frameborder="0" style="border:0" allowfullscreen></iframe>
                </div>
                <div class="col-sm-5 c1 slideanim" style="display: inline-block;">
                    <form action="" method="POST">
                        <div class="input-group">
                            <input type="text" name="contactname" required>
                            <span class="highlight"></span>
                            <span class="bar"></span>
                            <label>Your name</label>
                        </div>
                        <div class="input-group">
                            <input type="email" name="contactemail" required>
                            <span class="highlight"></span>
                            <span class="bar"></span>
                            <label>Email</label>
                        </div>
                        <div class="input-group">
                            <textarea name="contactmessage" required></textarea>
                            <span class="highlight"></span>
                            <span class="bar"></span>
                            <label>Message</label>
                        </div>
                        <input type="submit" value="SEND MESSAGE" class="button button5 pull-left" name="contactbtn"/>
                    </form>
                </div>
            </div>
        </div>
        <footer class="container-fluid text-center" style="background-color:#004d4d; color:white;">
            <a href="#mypage" title="To Top">
                <span class="glyphicon glyphicon-chevron-up" style="color:white; padding-top: 1%;"></span>
            </a><br>
            <p>Invite Your Friends To Also Be A Part</p>
            <div class="a2a_kit a2a_kit_size_32 a2a_default_style" style="display: inline-block;">
                <a class="a2a_dd" href="https://www.addtoany.com/share"></a>
                <a class="a2a_button_line"></a>
                <a class="a2a_button_twitter"></a>
                <a class="a2a_button_email"></a>
                <a class="a2a_button_whatsapp"></a>
            </div>
            <script async src="https://static.addtoany.com/menu/page.js"></script>
            <p>Copyright © <font style="color: #99ffe6;">Pravathi</font><br> All Rights Reserved.</p>
        </footer>
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel" style="color:#004d4d;">LOGIN FORM</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="loginForm" action="index.jsp" method="POST">
                            <div class="input-group">
                                <input type="text" name="username" required>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>Username</label>
                            </div>
                            <div class="input-group">
                                <input type="password" name="userpassword" required>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>Password</label>
                            </div>
                            <input type="submit" value="LOGIN" name="loginbtn" class="button button4" style="width:35%;"/>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <% } %>
        <script>
            $(window).load(function () {
                // Animate loader off screen
                $(".se-pre-con").fadeOut("slow");
                ;
            });
        </script>
    </body>
</html>