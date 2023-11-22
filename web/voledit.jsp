<%-- 
    Document   : voledit
    Created on : 22 Nov, 2019, 5:37:41 AM
    Author     : hp
--%>

<%@page import="java.util.Arrays"%>
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
        <link rel="stylesheet" href="formstyle.css">
        <script src="script.js"></script>
        <style>
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
                        <a class="navbar-brand" href="index.jsp" style="color:white;">P R A V A T H I</a>
                    </div>
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            <li><a href="volunteer.jsp" ><span class="glyphicon glyphicon-home"></span> Home</a></li>
                            <li class="active"><a href="#">Edit your account <span class="glyphicon glyphicon-edit"></span></a></li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="logout.jsp">Log out <span class="glyphicon glyphicon-log-out"></span></a></li>
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
                String phone=null, address=null, state=null, bg=null;
                PravthiDBO db = new PravthiDBO();
                ResultSet rs = db.getVolDetails(session.getAttribute("Volusername").toString());
                if(rs.next()){
                    phone = rs.getString("Phone");
                    address = rs.getString("address");
                    state = rs.getString("State");
                    bg = rs.getString("BloodGroup");
                }
                if(request.getParameter("voledit") != null){
                    phone = request.getParameter("phone");
                    address = request.getParameter("address");
                    state = request.getParameter("state");
                    bg = request.getParameter("bloodgroup");
                    String statelist[] = {"Andhra Pradesh", "Arunachal Pradesh", "Assam", "Bihar", "Chhattisgarh", "Goa", "Gujarat", "Haryana", "Himachal Pradesh","Jammu and Kashmir", "Jharkhand", "Karnataka", "Kerala", "Madhya Pradesh", "Maharashtra", "Manipur", "Meghalaya", "Mizoram","Nagaland", "Odisha", "Punjab", "Rajasthan", "Sikkim", "Tamil Nadu", "Telangana", "Tripura", "Uttar Pradesh", "Uttarakhand","West Bengal"};
                    boolean isState = Arrays.asList(statelist).contains(state);
                    if (!isState) {
                        out.println("<script type='text/javascript'>");
                        out.println("Swal.fire({title: 'Error!',text: 'Please select the correct state!',type: 'error',confirmButtonText: 'Okay', timer: 3000,onAfterClose: function() {location.assign('voledit.jsp')}})");
                        out.println("</script>");
                    }else if(bg =="Select your blood group"){
                        out.println("<script type='text/javascript'>");
                        out.println("Swal.fire({title: 'Error!',text: 'Please select your blood group!',type: 'error',confirmButtonText: 'Okay', timer: 3000,onAfterClose: function() {location.assign('voledit.jsp')}})");
                        out.println("</script>");
                    }else{
                        if(db.updateVolunteer(phone, address, state, bg, session.getAttribute("Volusername").toString())){
                            out.println("<script type='text/javascript'>");
                            out.println("Swal.fire({title: 'Success!',text: 'Succesfully updated!',type: 'success',confirmButtonText: 'Okay', timer: 3000,onAfterClose: function() {location.assign('voledit.jsp')}})");
                            out.println("</script>");
                        }else{
                            out.println("<script type='text/javascript'>");
                            out.println("Swal.fire({title: 'Error!',text: 'Details cannot be updated! Try again later!',type: 'error',confirmButtonText: 'Okay', timer: 3000,onAfterClose: function() {location.assign('voledit.jsp')}})");
                            out.println("</script>");
                        }
                    }
                }else{
        %>
        <div class="container-fluid" style="text-align:center; padding-top:50px; color: #004d4d;">
            <h3>EDIT YOUR ACCOUNT</h3>
            <div style="color:grey;">[Make the required changes! <span class="glyphicon glyphicon-pencil"></span> ]</div><br>
            <form action="" method="POST">
                <input type="text" value="<%=phone %>" placeholder="Enter New Phone number" name="phone" pattern="[7-9]{1}[0-9]{9}" required>
                <textarea name="address" placeholder="Add a new address.." required><%= address%></textarea>
                <div class="autocomplete">
                    <input type="text" id="myInput" placeholder="State *" name="state" autocomplete="off" value="<%= state%>" required>
                </div>
                <select name="bloodgroup" class="category">
                    <% if(bg.equals("")){ %>
                    <option value="Select your blood group" selected>Select your blood group</option>
                    <% }else{ %>
                    <option value="<%=bg%>" selected><%=bg%></option>
                    <% } %>
                    <option value="A+">A+</option>
                    <option value="A-">A-</option>
                    <option value="B+">B+</option>
                    <option value="B-">B-</option>
                    <option value="O+">O+</option>
                    <option value="O-">O-</option>
                    <option value="AB+">AB+</option>
                    <option value="AB-">AB-</option>
                </select><br>
                <br><button type="submit" name="voledit" class="mybtn">MAKE CHANGES</button>
            </form>
        </div>
        <% } }%>
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
        </script>
    </body>
</html>