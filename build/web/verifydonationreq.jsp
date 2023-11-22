<%-- 
    Document   : viewrequest
    Created on : 3 Dec, 2019, 2:43:47 PM
    Author     : hp
--%>

<%@page import="java.util.Locale"%>
<%@page import="java.text.Format"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
            @media screen and (max-width: 768px) {
                .modal:before{
                    margin-top: 0%;
                    height: 0%;
                }
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
            <nav class="navbar navbar-inverse" style=" margin:0%; background-color: #004d4d; border: 0%; border-radius:0%;">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="index.php" style="color:white;">P R A V A T H I</a>
                    </div>
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            <li><a href="volunteer.jsp" ><span class="glyphicon glyphicon-home"></span> Home</a></li>
                            <li class="active"><a href="#">View Requests <span class="glyphicon glyphicon-edit"></span></a></li>
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
        %>
        <div class = "jumbotron">
            <h2 style="text-align:center; color: #004d4d;">List Of All Recent Donation Requests</h2>
        </div>
        <%
                PravthiDBO dbo = new PravthiDBO();
                ResultSet rs = dbo.getSeekersList();
                if(rs.next()){
        %>
        <div style="overflow-x:auto;" class="container">
            <table class="table table-striped" id="table1">
                <thead>
                    <tr>
                        <th>Sl.No</th>
                        <th>Category</th>
                        <th>Date</th>
                        <th>Name</th>
                        <th>State</th>
                        <th>Contact</th>
                        <th>Amount</th>
                        <th>Validate</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                                int count = 0;
                                String name, phone, email, category, state, date, datetime, amount;
                                do{
                                    count++;
                                    int id = rs.getInt("d_id");
                                    name = rs.getString("d_name");
                                    category = rs.getString("d_type");
                                    phone = rs.getString("d_number");
                                    email = rs.getString("d_email");
                                    datetime = rs.getString("reg_date");
                                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                                    Date d1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(datetime);
                                    date = sdf.format(d1);
                                    state = rs.getString("d_state");
                                    amount = rs.getString("d_amount");
                                    Format format = com.ibm.icu.text.NumberFormat.getCurrencyInstance(new Locale("en", "in"));
                                    amount = format.format(new BigDecimal(amount));
                    %>
                    <tr>
                        <td><%= count %></td>
                        <td><%= category %></td>
                        <td><%= date %></td>
                        <td><%= name %></td>
                        <td><%= state %></td>
                        <td>
                            <a href="tel:+91<%= phone %>">
                                <i class="fa fa-phone fa-lg" style="color:#004d4d;" aria-hidden="true"></i> <%= phone %>
                            </a> 
                            <a href="mailto:<%= email %>?Subject=Pravathi%20Report" target="_top">
                                <i class="fa fa-envelope fa-lg" style="color:#004d4d; margin-left:5%;" aria-hidden="true"></i> <%= email %>
                            </a>
                        </td>
                        <td><%= amount %></td>
                        <td>
                            <button name="verifybtn" class="btn btn-sm btn-outline btn-success" <%= "onClick='validate(`"+id+"`)'"%>>
                                Mark Valid
                            </button>
                            <button name="spambtn" class="btn btn-outline btn-danger btn-sm" <%= "onClick='spam(`"+id+"`)'"%>>
                                Mark Spam
                            </button>
                        </td>
                    </tr>
                    <%
                                }while(rs.next());
                    %>
                </tbody>
            </table>
        </div>
        <%      }else{
                    //out.println("<script type='text/javascript'>");
                    //out.println("Swal.fire({title: 'Warning!',text: 'There was some connection error! Try again later',type: 'warning',confirmButtonText: 'Okay', timer: 3000,onAfterClose: function() {location.assign('volunteer.jsp')}})");
                    //out.println("</script>");
        %>
        <h3 style="color:red; text-align:center;">No pending donation requests to be verified</h3>
        <%
                }
            }
        %>
        <script>
            function validate(id) {
              const swalWithBootstrapButtons = Swal.mixin({
                    customClass: {
                      confirmButton: 'btn btn-success',
                      cancelButton: 'btn btn-danger'
                    },
                    buttonsStyling: false
                  })
                  swalWithBootstrapButtons.fire({
                    title: 'Are you sure?',
                    text: "Your request will be marked and cannot be reverted!",
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonText: 'Yes, Verify It',
                    cancelButtonText: 'No, Cancel!',
                    reverseButtons: true
                  }).then((result) => {
                    if (result.value) {
                       var result = deleteAction(id);
                      if(result){
                          swalWithBootstrapButtons.fire({
                            title: 'Success',
                            text: "Your response has been successfully marked!",
                            icon: 'success',
                            confirmButtonText: 'Okay!',
                        //onAfterClose: function() {location.assign('verifyincoming.jsp')}
                    }) }
                    } else if (
                      /* Read more about handling dismissals below */
                      result.dismiss === Swal.DismissReason.cancel
                    ) {
                      swalWithBootstrapButtons.fire(
                        'Cancelled',
                        'Your action is not marked :)',
                        'error',
                        
                      )
                    }
                })
            }
            function deleteAction(id){
                $.ajax({
                    url: "verifyincoming.jsp",
                    type: "post",
                    data: {id: id},
                    success: function (response) {
                        $("#table1").load(location.href+" #table1>*","");
                        return true;
                        //$("#table1").load("volunteer.jsp #table1");
                        //$("#card").load("volunteer.jsp #card");
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log(textStatus, errorThrown);
                        return false;
                    }

                });
            }
            
            function spam(id) {
              const swalWithBootstrapButtons = Swal.mixin({
                    customClass: {
                      confirmButton: 'btn btn-success',
                      cancelButton: 'btn btn-danger'
                    },
                    buttonsStyling: false
                  })
                  swalWithBootstrapButtons.fire({
                    title: 'Are you sure?',
                    text: "Your request will be marked and cannot be reverted!",
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonText: 'Yes, Mark It Spam!',
                    cancelButtonText: 'No, Cancel!',
                    reverseButtons: true
                  }).then((result) => {
                    if (result.value) {
                       var result = spamAction(id);
                      if(result){
                          swalWithBootstrapButtons.fire({
                            title: 'Success',
                            text: "Your response has been successfully marked!",
                            icon: 'success',
                            confirmButtonText: 'Okay!',
                        //onAfterClose: function() {location.assign('verifyincoming.jsp')}
                    }) }
                    } else if (
                      /* Read more about handling dismissals below */
                      result.dismiss === Swal.DismissReason.cancel
                    ) {
                      swalWithBootstrapButtons.fire(
                        'Cancelled',
                        'Your action is not marked :)',
                        'error',
                        
                      )
                    }
                })
            }
            function spamAction(id){
                $.ajax({
                    url: "verifyincomingspam.jsp",
                    type: "post",
                    data: {id: id},
                    success: function (response) {
                        $("#table1").load(location.href+" #table1>*","");
                        return true;
                        //$("#table1").load("volunteer.jsp #table1");
                        //$("#card").load("volunteer.jsp #card");
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log(textStatus, errorThrown);
                        return false;
                    }

                });
            }
        </script>
    </body>
</html>
