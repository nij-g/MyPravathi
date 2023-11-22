<%-- 
    Document   : signupform
    Created on : 31 Oct, 2019, 12:23:35 PM
    Author     : hp
--%>

<%@page import="dbo.PravthiDBO"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.Period"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.apache.commons.text.WordUtils"%>
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
            body{
                background-image: linear-gradient(to right, #205072, #329D9C );
            }
            h6{
                margin-bottom: 2%;
            }
            h3{
                color: #004d4d;
                margin-top: 2%; 
            }
            .autocomplete {
                position: relative;
                font-family: Arial, Helvetica, sans-serif;
            }
            .autocomplete-items {
                position: absolute;
                margin: 0 auto;
                border: 1px solid #d4d4d4;
                border-bottom: none;
                border-top: none;
                z-index: 99;
                /*position the autocomplete items to be the same width as the container:*/
                left: 0;
                right: 0;
            }
            .autocomplete-items div {
                padding: 10px;
                cursor: pointer;
                background-color: #fff; 
                border-bottom: 1px solid #d4d4d4; 
            }
            /*when hovering an item:*/
            .autocomplete-items div:hover {
                background-color: #e9e9e9; 
            }
            /*when navigating through the items using the arrow keys:*/
            .autocomplete-active {
                background-color: #004d4d !important; 
                color: #ffffff; 
            }
            @media screen and (min-width: 320px){
                #eye{
                    visibility: hidden;
                }
                .mybtn{
                    margin-bottom: 2%;
                }
            }
            @media screen and (min-width: 600px){
                #pass{
                    margin-left: 15px;
                }
                #eye{
                    visibility: visible;
                    left:-35px; 
                    color:grey;
                }
            }
            @media screen and (min-width: 1050px){
            }
        </style>
    </head>
    <body>
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
                            <li><a href="volunteer.jsp"><span class="glyphicon glyphicon-home"></span> Home</a></a></li>
                            <li class="active"><a href="#" ><span class="glyphicon glyphicon-user"></span> Add a volunteer</a></li-->
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Log out</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>
        <%
            boolean flag;
            flag = session.getAttribute("Volusername") == null;
            if (flag) {
                out.println("<script type='text/javascript'>");
                out.println("Swal.fire({title: 'Spam Error!',text: 'Unauthorized access',type: 'error',confirmButtonText: 'OK', timer: 3000,onAfterClose: function() {location.assign('index.jsp')}})");
                out.println("</script>");
            } else {
                if(request.getParameter("addvolunteer")!=null){
                    String name, dob, gender, email, phone, pass, address, state, doj, status, details;
                    name = request.getParameter("name");
                    name = WordUtils.capitalize(name);
                    dob = request.getParameter("dateofbirth");
                    LocalDate dateofbirth = LocalDate.parse(dob);
                    LocalDate today = LocalDate.now();
                    int agediff = Period.between(dateofbirth, today).getYears();
                    gender = request.getParameter("gender");
                    email = request.getParameter("email");
                    phone = request.getParameter("phone");
                    pass = request.getParameter("pass");
                    address = request.getParameter("address");
                    state = request.getParameter("state");
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    doj = sdf.format(new Date());
                    status = "v";
                    details = "active";
                    String statelist[] = {"Andhra Pradesh", "Arunachal Pradesh", "Assam", "Bihar", "Chhattisgarh", "Goa", "Gujarat", "Haryana", "Himachal Pradesh","Jammu and Kashmir", "Jharkhand", "Karnataka", "Kerala", "Madhya Pradesh", "Maharashtra", "Manipur", "Meghalaya", "Mizoram","Nagaland", "Odisha", "Punjab", "Rajasthan", "Sikkim", "Tamil Nadu", "Telangana", "Tripura", "Uttar Pradesh", "Uttarakhand","West Bengal"};
                    boolean isState = Arrays.asList(statelist).contains(state);
                    if(dob == null){
                        out.println("<script type='text/javascript'>");
                        out.println("Swal.fire({title: 'Error!',text: 'Please select your date of birth!',type: 'error',confirmButtonText: 'Okay', timer: 3000,onAfterClose: function() {location.assign('reportnow.jsp')}})");
                        out.println("</script>");
                    }else if(agediff<18 || agediff>60){
                        out.println("<script type='text/javascript'>");
                        out.println("Swal.fire({title: 'Error!',text: 'Sorry you are not eligible!',type: 'error',confirmButtonText: 'Okay', timer: 3000,onAfterClose: function() {location.assign('reportnow.jsp')}})");
                        out.println("</script>");
                    }
                    else if(gender == "Select your gender"){
                        out.println("<script type='text/javascript'>");
                        out.println("Swal.fire({title: 'Error!',text: 'Please select your gender!',type: 'error',confirmButtonText: 'Okay', timer: 3000,onAfterClose: function() {location.assign('reportnow.jsp')}})");
                        out.println("</script>");
                    }
                    else if (!isState) {
                        out.println("<script type='text/javascript'>");
                        out.println("Swal.fire({title: 'Error!',text: 'Please select the correct state!',type: 'error',confirmButtonText: 'Okay', timer: 3000,onAfterClose: function() {location.assign('reportnow.jsp')}})");
                        out.println("</script>");
                    }else{
                        PravthiDBO db = new PravthiDBO();
                        if(db.insertvolunteer(name, email, pass, dob, gender, phone, address, state, status, doj, details, session.getAttribute("Volusername").toString())){
                            db.closeDB();
                            out.println("<script type='text/javascript'>");
                            out.println("Swal.fire({title: 'Success!',text: 'Report has been uploaded successfully',type: 'success',confirmButtonText: 'OK', timer: 3000,onAfterClose: function() {location.assign('volunteer.jsp')}})");
                            out.println("</script>");
                        }
                        else{
                            db.closeDB();
                            out.println("<script type='text/javascript'>");
                            out.println("Swal.fire({title: 'Sorry!',text: 'Cannot be registered Please try again later',type: 'error',confirmButtonText: 'Okay', timer: 3000,onAfterClose: function() {location.assign('reportnow.jsp')}})");
                            out.println("</script>");
                        }
                    }
                }else{
                                    
        %>
        <div class="loginwhite" style="text-align:center;">
            <h3>VOLUNTEER REGISTRATION FORM</h3>
            <h6 style="color:grey">[Fields marked with * are mandatory]</h6>
            <form action="">
                <input type="text" placeholder="Enter volunteer name *" name="name" required>
                <input placeholder="Date of Birth *" name="dateofbirth" min="1950-12-31" max="2015-12-31" class="textbox-n" type="text" onfocus="(this.type = 'date')" onblur="(this.type = 'text')" id="date">
                <select name="gender" class="category">
                    <option selected>Select your gender *</option>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Other">Other</option>
                </select><br>
                <input type="email" placeholder="Enter Email *" name="email" required>
                <input type="text" placeholder="Enter Phone number *" name="phone" pattern="[7-9]{1}[0-9]{9}" required>
                <input type="password" placeholder="Enter Password *" name="pass" id="pass" data-toggle="tooltip" title="Must consist of smallcase character, one capital, one number or special character and must be minimum 8 characters long!" pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$" required>
                <span id="eye" class="glyphicon glyphicon-eye-close" onclick="togglePass()"></span>
                <textarea name="address" placeholder="Address"></textarea>
                <div class="autocomplete">
                    <input type="text" id="myInput" placeholder="State *" name="state" autocomplete="off" required>
                </div>
                <button type="submit" name="addvolunteer" class="mybtn">SIGNUP</button>
            </form>
        </div>
        <%
                }
            }
        %>
        <script>
            function togglePass() {
                var x = document.getElementById("pass");
                if (x.type === "password") {
                    x.type = "text";
                    document.getElementById("eye").className = "glyphicon glyphicon-eye-open";
                } else {
                    x.type = "password";
                    document.getElementById("eye").className = "glyphicon glyphicon-eye-close";
                }
            }
            function autocomplete(inp, arr) {
                /*the autocomplete function takes two arguments,
                 the text field element and an array of possible autocompleted values:*/
                var currentFocus;
                /*execute a function when someone writes in the text field:*/
                inp.addEventListener("input", function (e) {
                    var a, b, i, val = this.value;
                    //close any already open lists of autocompleted values/
                    closeAllLists();
                    if (!val) {
                        return false;
                    }
                    currentFocus = -1;
                    //create a DIV element that will contain the items (values):/
                    a = document.createElement("DIV");
                    a.setAttribute("id", this.id + "autocomplete-list");
                    a.setAttribute("class", "autocomplete-items");
                    //append the DIV element as a child of the autocomplete container:/
                    this.parentNode.appendChild(a);
                    //for each item in the array.../
                    for (i = 0; i < arr.length; i++) {
                        //check if the item starts with the same letters as the text field value:/
                        if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
                            //create a DIV element for each matching element:/
                            b = document.createElement("DIV");
                            //make the matching letters bold:/
                            b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
                            b.innerHTML += arr[i].substr(val.length);
                            //insert a input field that will hold the current array item's value:/
                            b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
                            //execute a function when someone clicks on the item value (DIV element):/
                            b.addEventListener("click", function (e) {
                                //insert the value for the autocomplete text field:/
                                inp.value = this.getElementsByTagName("input")[0].value;
                                /*close the list of autocompleted values,
                                 (or any other open lists of autocompleted values:*/
                                closeAllLists();
                            });
                            a.appendChild(b);
                        }
                    }
                });
                //execute a function presses a key on the keyboard:/
                inp.addEventListener("keydown", function (e) {
                    var x = document.getElementById(this.id + "autocomplete-list");
                    if (x)
                        x = x.getElementsByTagName("div");
                    if (e.keyCode == 40) {
                        /*If the arrow DOWN key is pressed,
                         increase the currentFocus variable:*/
                        currentFocus++;
                        /*and and make the current item more visible:*/
                        addActive(x);
                    } else if (e.keyCode == 38) { //up
                        /*If the arrow UP key is pressed,
                         decrease the currentFocus variable:*/
                        currentFocus--;
                        /*and and make the current item more visible:*/
                        addActive(x);
                    } else if (e.keyCode == 13) {
                        /*If the ENTER key is pressed, prevent the form from being submitted,*/
                        e.preventDefault();
                        if (currentFocus > -1) {
                            /*and simulate a click on the "active" item:*/
                            if (x)
                                x[currentFocus].click();
                        }
                    }
                });
                function addActive(x) {
                    /*a function to classify an item as "active":*/
                    if (!x)
                        return false;
                    /*start by removing the "active" class on all items:*/
                    removeActive(x);
                    if (currentFocus >= x.length)
                        currentFocus = 0;
                    if (currentFocus < 0)
                        currentFocus = (x.length - 1);
                    /*add class "autocomplete-active":*/
                    x[currentFocus].classList.add("autocomplete-active");
                }
                function removeActive(x) {
                    /*a function to remove the "active" class from all autocomplete items:*/
                    for (var i = 0; i < x.length; i++) {
                        x[i].classList.remove("autocomplete-active");
                    }
                }
                function closeAllLists(elmnt) {
                    /*close all autocomplete lists in the document,
                     except the one passed as an argument:*/
                    var x = document.getElementsByClassName("autocomplete-items");
                    for (var i = 0; i < x.length; i++) {
                        if (elmnt != x[i] && elmnt != inp) {
                            x[i].parentNode.removeChild(x[i]);
                        }
                    }
                }
                /*execute a function when someone clicks in the document:*/
                document.addEventListener("click", function (e) {
                    closeAllLists(e.target);
                });
            }
            var statelist = ["Andhra Pradesh", "Arunachal Pradesh", "Assam", "Bihar", "Chhattisgarh", "Goa", "Gujarat", "Haryana", "Himachal Pradesh",
                "Jammu and Kashmir", "Jharkhand", "Karnataka", "Kerala", "Madhya Pradesh", "Maharashtra", "Manipur", "Meghalaya", "Mizoram",
                "Nagaland", "Odisha", "Punjab", "Rajasthan", "Sikkim", "Tamil Nadu", "Telangana", "Tripura", "Uttar Pradesh", "Uttarakhand",
                "West Bengal"];
            //initiate the autocomplete function on the "myInput" element, and pass along the statelist array as possible autocomplete values:/
            autocomplete(document.getElementById("myInput"), statelist);
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script>
    </body>
</html>