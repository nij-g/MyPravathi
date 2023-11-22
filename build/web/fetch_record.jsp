<%-- 
    Document   : fetch_record
    Created on : 29 Oct, 2019, 11:28:49 PM
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
        <style>
            .w3-card-4{
                width: 100%;
                margin:0 auto;
                padding: 0%;
                margin-top:3%;
            }
            .postimg{
                width: 100%;
                max-height:350px;
                -o-object-fit: contain;
            }
            .button {
                background-color: #4CAF50; /* Green */
                border: none;
                color: white;
                padding: 10px 10px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 14px;
                margin: 4px 2px;
                -webkit-transition-duration: 0.4s; /* Safari */
                transition-duration: 0.4s;
                cursor: pointer;
            }
            .button5 {
                margin-left: 2%;
                background-color: white;
                color: #CC2541;
                border: 1px solid #CC2541;
            }
            .button5:hover {
                background-color: #CC2541;
                color: white;
            }
            .button4{
                background-color: white;
                color: green;
                border: 1px solid green;
            }
            .button4:hover {
                background-color: green;
                color: white;
            }
            @media screen and (min-width:320px){  
                h2{
                    font-size: 18px;
                }
                h3{
                    font-size: 12px;
                }
            }
            @media screen and (min-width:600px){ 
                h2{
                    font-size: 20px;
                } 
                h3{
                    font-size: 18px;
                }
            }
            @media screen and (min-width:1050px){ 
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
            boolean flag;
            //flag = session.getAttribute("Volusername") == null;
            if ((session.getAttribute("Volusername") == null) && (session.getAttribute("Adminusername") == null)) {
                out.println("<script type='text/javascript'>");
                out.println("Swal.fire({title: 'Spam Error!',text: 'Unauthorized access',type: 'error',confirmButtonText: 'OK', timer: 3000,onAfterClose: function() {location.assign('index.jsp')}})");
                out.println("</script>");
            } else {
                if (request.getParameter("rowid") != null) {
                    int id;
                    String issue="", title="", description="", name="", state="", datetime="", sdate="", photourl="", type="", typeshown="", verified="", color="";
                    try {
                        id = Integer.parseInt(request.getParameter("rowid"));
                        PravthiDBO dbo = new PravthiDBO();
                        PreparedStatement ps = dbo.con.prepareStatement("SELECT * FROM reporttb WHERE id=?");
                        ps.setInt(1, id);
                        ResultSet rs = ps.executeQuery();
                        if (rs.next()) {
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
                            type = rs.getString("type");
                            if (type.equals("")) {
                                typeshown = "empty";
                            } else if (type.equals("gif") || type.equals("jpg") || type.equals("jpeg") || type.equals("png")) {
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
                            }else if(verified.equals("f")){
                                verified = "REPORTED SPAM";
                                color = "red";
                            }else{
                                verified = "NOT VERIFIED";
                                color = "blue";
                            }
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
        %>
        <div class="w3-container">
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
                <div style="padding:1%;color:white; background-color:dimgrey;width:100%;">POSTED BY: <%= name%>
                    <div style="float:right;"><%= sdate%></div>
                </div>
                <div style="padding:1%;color:white; background-color:<%= color%>;width:100%;"><%= verified%></div>
                <div class="w3-container w3-center">	
                </div>
            </div>
        </div>
        <% }
            }
        %>
    </body>
</html>