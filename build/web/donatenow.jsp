<%-- 
    Document   : donatenow
    Created on : 6 Dec, 2019, 6:20:23 AM
    Author     : hp
--%>

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
        <script src="script.js"></script>   
        <link href="donatestyle.css" rel="stylesheet" type="text/css"/>
        <script src="donatescript.js" type="text/javascript"></script>
        <link rel="stylesheet" href="myStyle.css">
        <style>
            body{
                padding-right: 0 !important;   
            }
            button:hover{
                opacity: 0.7;
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
            #whatwedo{
                padding-top: 2%;
                padding-bottom: 2%;
            }
            #contactus{
                padding-top: 2%;
            }
        </style>
        <script
            src="https://www.paypal.com/sdk/js?client-id=AVsDtsb0zWdm4W0KGP1npDXyFbwi31q1BsL0QtF59vLH1oxwxbtK6hJJ2xIoIVV4z2NN1Xng_Ec7LJH8"> // Required. Replace SB_CLIENT_ID with your sandbox client ID.
        </script>
    </head>
    <body style="margin:0;" id="mypage" data-spy="scroll" data-target=".navbar .slider" data-offset="60">
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
                            <li class="active"><a href="#"><span class="glyphicon glyphicon-edit"></span> Donate Now</a></a></li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>
        <div class="slider" id="slider"  data-width="100">
            <button class="control_next">&rarr;</button>
            <button class="control_prev">&larr;</button>
            <ul>
                <li class="actslide">
                    <div class="slide" style="background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.8)), url(image/edu1.jpg);" >
                        <div class="shadow">
                            <div class="teaser">
                                <h3>Donation Requests on our site</h3>
                                <h2>EDUCATE A CHILD<br>
                                <a href="#paypal"><button class="btn btn-success btn-lg" style="background-color:#1abc9c; color:white;">DONATE NOW</button></a>
                                </h2>
                                <p>Slide #1 of 5</p>
                            </div> 
                        </div>
                    </div>
                </li>
                <li>
                    <div class="slide" style="background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.8)), url(image/food1.png);">
                        <div class="shadow">
                            <div class="teaser">
                                <h3>Donation Requests on our site</h3>
                                <h2>FOOD REQUIREMENTS<br>
                                <a href="#paypal"><button class="btn btn-success btn-lg" style="background-color:#1abc9c; color:white;">DONATE NOW</button></a>
                                </h2>
                                <p>Slide #2 of 5</p>
                            </div> 
                        </div>
                    </div>
                </li>
                <li>
                    <div class="slide" style="background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.8)), url(image/shelter1.jpg);" >
                        <div class="shadow">
                            <div class="teaser">
                                <h3>Donation Requests on our site</h3>
                                <h2>SHELTER REQUIREMENTS<br>
                                <a href="#paypal"><button class="btn btn-success btn-lg" style="background-color:#1abc9c; color:white;">DONATE NOW</button></a>
                                </h2>
                                <p>Slide #3 of 5</p>
                            </div> 
                        </div>
                    </div>
                </li>
                <li>
                    <div class="slide" style="background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.8)), url(image/health.jpg);">
                        <div class="shadow">
                            <div class="teaser">
                                <h3>Donation Requests on our site</h3>
                                <h2>HEALTH CARE REQUIREMENTS<br>
                                <a href="#paypal"><button class="btn btn-success btn-lg" style="background-color:#1abc9c; color:white;">DONATE NOW</button></a>
                                </h2>
                                <p>Slide #4 of 5</p>
                            </div> 
                        </div>
                    </div>
                </li>
                <li>
                    <div class="slide" style="background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.8)), url(image/donate.jpg);">
                        <div class="shadow">
                            <div class="teaser">
                                <h3>Donation Requests on our site</h3>
                                <h2>OTHER REQUIREMENTS<br>
                                <a href="#paypal"><button class="btn btn-success btn-lg" style="background-color:#1abc9c; color:white;">DONATE NOW</button></a>
                                </h2>
                                <p>Slide #5 of 5</p>
                            </div> 
                        </div>
                    </div>
                </li>
            </ul>
            <div class="progress">
                <div class="bar"></div>
            </div>
        </div>
        <div id="paypal" class="jumbotron" style="margin-bottom: 0%;">
            <h2 class="text-center">Donate With Paypal</h2>
            <div class="container text-center"><br>
                <div id="paypal-button-container"></div>
            </div>
        </div>
        <footer class="container-fluid text-center" style="background-color:#004d4d; color:white; margin-top: 0%;">
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
        <script> 
        paypal.Buttons({
                style: {
                    color: 'blue',
                    shape: 'pill',
                    label: 'pay',
                    height: 40
                },
                createOrder: function (data, actions) {
                    return actions.order.create({
                        purchase_units: [{
                                amount: {
                                    value: '0.01'
                                }
                            }]
                    });
                },
                onApprove: function (data, actions) {
                    return actions.order.capture().then(function (details) {
                        alert('Transaction completed by ' + details.payer.name.given_name);
                        // Call your server to save the transaction
                        return fetch('/paypal-transaction-complete', {
                            method: 'post',
                            headers: {
                                'content-type': 'application/json'
                            },
                            body: JSON.stringify({
                                orderID: data.orderID
                            })
                        });
                    });
                }
            }).render('#paypal-button-container');

        </script>
    </body>
</html>