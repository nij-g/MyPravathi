<%-- 
    Document   : checkeligibility
    Created on : 1 Dec, 2019, 9:51:50 PM
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
        <link rel="stylesheet" href="formstyle.css">
        <script src="script.js"></script>
        <style>
            .radio1{
                text-align: left;
            }
            hr{
                border: 0;
                height: 1px;
                background-image: linear-gradient(to right, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.75), rgba(0, 0, 0, 0));
            }
            @media screen and (max-width: 720px){
                .col-md-3{
                    float: left;
                }
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
                            <li class="active"><a href="#"><span class="glyphicon glyphicon-edit"></span> Register as a blood donor</a></a></li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>
        <%
            if(request.getParameter("eligible") != null){
                String disease, allergy, positive, cardiac, bleeding, medication;
                disease = request.getParameter("rbDisease");
                allergy = request.getParameter("rbAllergies");
                positive = request.getParameter("rbHIV");
                cardiac = request.getParameter("rbCardiac");
                bleeding = request.getParameter("rbBleeding");
                medication = request.getParameter("rbMedication");
                if(disease.equals("no") && allergy.equals("no") && positive.equals("no") && cardiac.equals("no") && bleeding.equals("no") && medication.equals("no")){
                    out.println("<script type='text/javascript'>");
                    out.println("Swal.fire({title: 'Success!',text: 'You are eligible to be a blood donor',type: 'success',confirmButtonText: 'OK', timer: 3000,onAfterClose: function() {location.assign('donateblood.jsp')}})");
                    out.println("</script>");
                }else{
                    out.println("<script type='text/javascript'>");
                    out.println("Swal.fire({title: 'Sorry!',text: 'You are not eligible',type: 'error',confirmButtonText: 'Okay', timer: 3000,onAfterClose: function() {location.assign('index.jsp')}})");
                    out.println("</script>");
                }
            }else{
        %>
        <div class="container-fluid  loginwhite" style="text-align:center; padding-top:50px; color: #004d4d;">
            <h3>HEALTH SECURITY CHECK</h3><br>
            <hr><br>
            <form action="" method="POST">
                <div class="row" style="margin-left: 2%;">
                    <div class="radio1 col-md-6">
                        Do you suffer of any diseases?
                    </div>
                    <div class="col-md-3"><input type="radio" name="rbDisease" value="Yes" required/> Yes </div>
                    <div class="col-md-3"><input type="radio" name="rbDisease" value="no"/> No</div>
                </div>
                <div class="row" style="margin-left: 2%;">
                    <div class="radio1 col-md-6">
                        Do you have allergies?
                    </div>
                    <div class="col-md-3"><input type="radio" name="rbAllergies" value="Yes" required/> Yes </div>
                    <div class="col-md-3"><input type="radio" name="rbAllergies" value="no"/> No</div>
                </div>
                <div class="row" style="margin-left: 2%;">
                    <div class="radio1 col-md-6">
                        Have you ever had positive Blood test for HbsAg, Hcv, HIV?
                    </div>
                    <div class="col-md-3"><input type="radio" name="rbHIV" value="Yes" required/> Yes </div>
                    <div class="col-md-3"><input type="radio" name="rbHIV" value="no"/> No</div>
                </div>
                <div class="row" style="margin-left: 2%;">
                    <div class="radio1 col-md-6">
                        Do you have any cardiac problems?
                    </div>
                    <div class="col-md-3"><input type="radio" name="rbCardiac" value="Yes" required/> Yes </div>
                    <div class="col-md-3"><input type="radio" name="rbCardiac" value="no"/> No</div>
                </div>
                <div class="row" style="margin-left: 2%;">
                    <div class="radio1 col-md-6">
                        Do you suffer any bleeding disorders?
                    </div>
                    <div class="col-md-3"><input type="radio" name="rbBleeding" value="Yes" required/> Yes </div>
                    <div class="col-md-3"><input type="radio" name="rbBleeding" value="no"/> No</div>
                </div>
                <div class="row" style="margin-left: 2%;">
                    <div class="radio1 col-md-6">
                        Do you take medication?
                    </div>
                    <div class="col-md-3"><input type="radio" name="rbMedication" value="Yes" required/> Yes </div>
                    <div class="col-md-3"><input type="radio" name="rbMedication" value="no"/> No</div>
                </div>
                <br><button type="submit" name='eligible' class="mybtn">CHECK ELIGIBILITY</button>
            </form>
        </div>
        <% } %>
    </body>
</html>
