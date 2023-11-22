<%-- 
    Document   : seekblood
    Created on : 20 Nov, 2019, 5:56:19 AM
    Author     : DELL
--%><%@page import="java.net.URLEncoder"%>
<%@page import="dbo.PravthiDBO"%>


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
                background-image: linear-gradient(to right, #01d8c4, #4a77a6 );
            }
            #imageUpload
            {
                display: none;
            }
            #profileImage
            {
                cursor: pointer;
            }
            #profile-container {
                width: 200px;
                height: 200px;
                overflow: hidden;
                margin: 0 auto;
            }
            #profile-container img {
                width: 200px;
                height: 200px;
            }
            #profile-container:hover {
                opacity:0.5;
            }
            h6{
                margin-bottom: 2%;
            }
            h3{
                color: #004d4d;
                margin-top: 2%; 
            }
            h4{
                color:#004d4d;
                margin-top:2%;

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
            .mybtn {
                color: white;
                background-color: #004d4d;
            }
            .mybtn:hover {
                opacity: 0.8;
            }
            @media screen and (min-width: 320px){
                .mybtn{
                    margin-bottom: 2%;
                }
            }
            @media screen and (min-width: 600px){
            }
            @media screen and (min-width: 1050px){
            }
            .radio1{
                position: relative;
                font-family: Arial, Helvetica, sans-serif;

            }		
            .table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th {
                border-top: 0px;
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
                            <li class="active"><a href="#"><span class="glyphicon glyphicon-edit"></span> Seek Blood</a></a></li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>
        <%
            if (request.getParameter("btnSubmit") != null) {
                String s_name, dob, email, phone, bgroup, address, gender, state, regdate;
                s_name = request.getParameter("txtName");
                email = request.getParameter("txtEmail");
                phone = request.getParameter("txtPhone");
                bgroup = request.getParameter("bloodgroup");
                address = request.getParameter("txtAddress");
                int pin = Integer.parseInt(request.getParameter("txtPIN"));
                state = request.getParameter("txtState");
                state = WordUtils.capitalize(state);
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                regdate = sdf.format(new Date());
                String statelist[] = {"Andhra Pradesh", "Arunachal Pradesh", "Assam", "Bihar", "Chhattisgarh", "Goa", "Gujarat", "Haryana", "Himachal Pradesh","Jammu and Kashmir", "Jharkhand", "Karnataka", "Kerala", "Madhya Pradesh", "Maharashtra", "Manipur", "Meghalaya", "Mizoram","Nagaland", "Odisha", "Punjab", "Rajasthan", "Sikkim", "Tamil Nadu", "Telangana", "Tripura", "Uttar Pradesh", "Uttarakhand","West Bengal"};
                boolean isState = Arrays.asList(statelist).contains(state);
                if (!isState) {
                    out.println("<script type='text/javascript'>");
                    out.println("Swal.fire({title: 'Error!',text: 'Please select the correct state!',type: 'error',confirmButtonText: 'Okay', timer: 3000,onAfterClose: function() {location.assign('donateblood.jsp')}})");
                    out.println("</script>");
                }else{
                    PravthiDBO db = new PravthiDBO();
                    if (db.insertBloodSeeker(s_name, bgroup, email, phone, pin, address, state, regdate)) {
                        String bg = URLEncoder.encode(bgroup, "UTF-8");
                        out.println("<script type='text/javascript'>");
                        out.println("Swal.fire({title: 'Success!',text: 'Your request has been saved',type: 'success',confirmButtonText: 'OK', timer: 3000,onAfterClose: function() {location.assign('blooddonorlist.jsp?bgroup="+URLEncoder.encode(bgroup, "UTF-8") +"&pin="+pin+"&state="+state+"')}})");
                        out.println("</script>");            
                    } else {
                        out.println("<script type='text/javascript'>");
                        out.println("Swal.fire({title: 'Sorry!',text: 'There was some technical issues please try again later',type: 'warning',confirmButtonText: 'OK', timer: 3000,onAfterClose: function() {location.assign('index.jsp')}})");
                        out.println("</script>");
                    }
                }
            } else {
        %>
        <div class="loginwhite" style="text-align:center;">
            <h3 class="page-header">Request For Blood</h3>
            <h6 style="color:grey">[All the fields are mandatory]</h6>
            <form action="" method="POST">
                <input type="text" placeholder="Your name " name="txtName" required>
                <select name="bloodgroup" class="category">
                    <option selected>Select your blood group</option>
                    <option value="A+">A+</option>
                    <option value="A-">A-</option>
                    <option value="B+">B+</option>
                    <option value="B-">B-</option>
                    <option value="O+">O+</option>
                    <option value="O-">O-</option>
                    <option value="AB+">AB+</option>
                    <option value="AB-">AB-</option>
                </select><br>
                <input type="email" placeholder="Enter Email *" name="txtEmail" required>
                <input type="text" placeholder="Enter Phone number *" name="txtPhone" pattern="[7-9]{1}[0-9]{9}" required/><br>
                <input type="text" name="txtPIN" placeholder="PIN Code *" pattern="^[1-9]{1}[0-9]{5}$" required/><br>
                <textarea name="txtAddress" placeholder="Address [Where exactly blood should be given]" required></textarea>
                <div class="autocomplete">
                    <input type="text" id="myInput" placeholder="State *" name="txtState" autocomplete="off" required/>
                </div>
                <button type="submit" name='btnSubmit' class="mybtn">SUBMIT</button>
            </form> 
        </div>
        <%    }
        %>
        <script>
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

           /* $(function () {
                $(".mybtn").bind("click", function () {
                    window.open('blooddonorlist.jsp');
                });
            });*/
        </script>
    </body>
</html>

