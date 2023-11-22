<%-- 
    Document   : reportnow.jsp
    Created on : 26 Oct, 2019, 12:34:28 PM
    Author     : hp
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="dbo.PravthiDBO"%>
<%@page import="org.apache.commons.text.WordUtils"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>PRAVATHI - Report Form</title><link rel="icon" href="logo.png" type="image/x-icon">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
        <link href="https://fonts.googleapis.com/css?family=Itim" rel="stylesheet" type="text/css">
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
                left: 0;
                right: 0;
            }
            .autocomplete-items div {
                padding: 10px;
                cursor: pointer;
                background-color: #fff; 
                border-bottom: 1px solid #d4d4d4; 
            }
            .autocomplete-items div:hover {
                background-color: #e9e9e9; 
            }
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
        </style>
        <script type="text/javascript">
            function checkFunc() {
                $('.formfield').on('blur', function () {
                    var id = $(this).attr('id'); // gets the id of a clicked link that has a class of menu
                    //console.log(id);
                    if (id == "issue") {
                        var issue = $('#' + $(this).attr('id')).val();
                        console.log(issue);
                        //var issue = $('#issue').val();
                        if (issue == "Select your issue" || issue == null) {
                            $("#iresult").fadeIn("slow");
                            $("#iresult").addClass("text-danger");
                            $("#iresult").text("Please select a correct issue");
                        } else {
                            $("#iresult").removeClass("text-danger");
                            $("#iresult").fadeOut("slow");
                        }
                    }
                    else if (id == "title") {
                        var title = $('#' + $(this).attr('id')).val();
                        if (title == "") {
                            $("#tresult").fadeIn("slow");
                            $("#tresult").addClass("text-danger");
                            $("#tresult").text("Please enter the title of the issue");
                        } else {
                            $("#tresult").removeClass("text-danger");
                            $("#tresult").fadeOut("slow");
                        }
                    }
                    else if (id == "details") {
                        var title = $('#' + $(this).attr('id')).val();
                        if (title == "") {
                            $("#dresult").fadeIn("slow");
                            $("#dresult").addClass("text-danger");
                            $("#dresult").text("Please enter the details of the issue");
                        } else {
                            $("#dresult").removeClass("text-danger");
                            $("#dresult").fadeOut("slow");
                        }
                    }
                    else if (id == "uname") {
                        var title = $('#' + $(this).attr('id')).val();
                        if (title == "") {
                            $("#uresult").fadeIn("slow");
                            $("#uresult").addClass("text-danger");
                            $("#uresult").text("Please enter your name");
                        } else {
                            $("#uresult").removeClass("text-danger");
                            $("#uresult").fadeOut("slow");
                        }
                    }
                    else if (id == "address") {
                        var title = $('#' + $(this).attr('id')).val();
                        if (title == "") {
                            $("#aresult").fadeIn("slow");
                            $("#aresult").addClass("text-danger");
                            $("#aresult").text("Please enter your address");
                        } else {
                            $("#aresult").removeClass("text-danger");
                            $("#aresult").fadeOut("slow");
                        }
                    }
                    else if(id == "email"){
                        var email = $('#' + $(this).attr('id')).val();
                        var reg = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
                        if (email == "" || reg.test(email) === false) {
                            $("#eresult").fadeIn("slow");
                            $("#eresult").addClass("text-danger");
                            $("#eresult").text("Please enter your valid email address");
                        } else {
                            $("#eresult").removeClass("text-danger");
                            $("#eresult").fadeOut("slow");
                        }
                    }
                    else if(id == "phonenum"){
                        var phone = $('#' + $(this).attr('id')).val();
                        var reg = /^[6-9]\d{9}$/;
                        if (phone == "" || reg.test(phone) === false) {
                            $("#presult").fadeIn("slow");
                            $("#presult").addClass("text-danger");
                            $("#presult").text("Please enter your valid phone number");
                        } else {
                            $("#presult").removeClass("text-danger");
                            $("#presult").fadeOut("slow");
                        }
                    }
                    else if(id == "myInput"){
                        var state = $('#' + $(this).attr('id')).val();
                        if (state == "") {
                            $("#sresult").fadeIn("slow");
                            $("#sresult").addClass("text-danger");
                            $("#sresult").text("Please enter your state");
                        } else {
                            $("#sresult").removeClass("text-danger");
                            $("#sresult").fadeOut("slow");
                        }
                    }
                });
            }
        </script>
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
                            <li><a href="index.jsp"><span class="glyphicon glyphicon-home"></span> Home</a></a></li>
                            <li class="active"><a href="#" ><span class="glyphicon glyphicon-pencil"></span> Register an issue</a></li-->
                        </ul>
                    </div>
                </div>
            </nav>
        </header>
        <div class="loginwhite" style="text-align:center;">
            <h3>REPORT AN ISSUE</h3>
            <h6 style="color:grey">[All the fields are mandatory]</h6>
            
            <form id="subForm" method="POST" action="reportingnow" enctype="multipart/form-data">
                <span class="result" id="iresult"></span>
                <br>
                <select name="issue" class="category formfield" id="issue" onblur="checkFunc()">
                    <option selected>Select your issue</option>
                    <option value="Child Labour">Child employment</option>
                    <option value="Women Harassment">Women Harassment</option>
                    <option value="Sorrounding Issues">Surrounding Issues</option>
                    <option value="Social Injustice">Social Injustice</option>
                    <option value="Other Issues">Other</option>
                </select><br>
                <span class="result" id="tresult"></span>
                <br>
                <input type="text" placeholder="Enter issue title " id="title" name="title" required onblur="checkFunc()" class="formfield" >
                <br>
                <span class="result" id="dresult"></span>
                <br>
                <textarea name="details" placeholder="Describe your issue in detail " id="details" required onblur="checkFunc()" class="formfield" ></textarea><br>
                <label for="Image" style="color:#004d4d;">Add a photo or a video regarding your issue [ optional ] </label>
                <div id="profile-container">
                    <img id="profileImage" src="image/addpic.png" alt=" Uploaded file"/>
                </div>
                <input id="imageUpload" type="file" name="Image" placeholder="Photo" accept="image/*,video/*" />
                <br>
                <span class="result" id="uresult"></span>
                <br>
                <input type="text" placeholder="Your name " name="name" id="uname" title="Name can contain only alphabets" required onblur="checkFunc()" class="formfield" >
                <br>
                <span class="result" id="eresult"></span>
                <br>
                <input type="email" placeholder="Enter Email " id="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" name="email" title="Enter a valid email id" required onblur="checkFunc()" class="formfield" >
                <br>
                <span class="result" id="presult"></span>
                <br>
                <input type="text" placeholder="Enter Phone number " id="phonenum" name="phone" pattern="[7-9]{1}[0-9]{9}" required onblur="checkFunc()" class="formfield" >
                <br>
                <span class="result" id="aresult"></span>
                <br>
                <textarea name="address" placeholder="Address " id="address" required onblur="checkFunc()" class="formfield" ></textarea>
                <br>
                <span class="result" id="sresult"></span>
                <br>
                <div class="autocomplete">
                    <input type="text" id="myInput" placeholder="State " name="state" autocomplete="off" required onblid="state" nur="checkFunc()" class="formfield" >
                </div>
                <label for="toggle" style="color:#004d4d;">Stay anonymous</label> &nbsp;
                <input type="checkbox" name="anonymous" id="anonymous" value="y"><br><br>
                <input type="submit" value="REPORT" name='submitall' class="mybtn"/>
            </form>
        </div>
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
            autocomplete(document.getElementById("myInput"), statelist);
            $("#profileImage").click(function (e) {
                $("#imageUpload").click();
            });
            function fasterPreview(uploader) {
                if (uploader.files && uploader.files[0]) {
                    $('#profileImage').attr('src', window.URL.createObjectURL(uploader.files[0]));
                }
            }
            $("#imageUpload").change(function () {
                fasterPreview(this);
            });
        </script>
    </body>
</html>