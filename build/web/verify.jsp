<%-- 
    Document   : verify
    Created on : 29 Oct, 2019, 11:59:33 PM
    Author     : hp
--%>

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
    </head>
    <body>
        <%
            boolean flag;
            flag = session.getAttribute("Volusername") == null;
            if (flag) {
                out.println("<script type='text/javascript'>");
                out.println("Swal.fire({title: 'Spam Error!',text: 'Unauthorized access',type: 'error',confirmButtonText: 'OK', timer: 3000,onAfterClose: function() {location.assign('index.jsp')}})");
                out.println("</script>");
            } else {
                try {
                    PravthiDBO dbo = new PravthiDBO();
                    int id;
                    if (request.getParameter("id") != null) {
                        id = Integer.parseInt(request.getParameter("id"));
                        PreparedStatement ps = dbo.con.prepareStatement("UPDATE reporttb SET verified=?,verifiedby=? where id=?");
                        ps.setString(1, "y");
                        ps.setString(2, session.getAttribute("Volusername").toString());
                        ps.setInt(3, id);
                        ps.executeUpdate();
                        dbo.closeDB();
                    } else if (request.getParameter("spid") != null) {
                        id = Integer.parseInt(request.getParameter("spid"));
                        PreparedStatement ps = dbo.con.prepareStatement("UPDATE reporttb SET verified=?,verifiedby=? where id=?");
                        ps.setString(1, "f");
                        ps.setString(2, session.getAttribute("Volusername").toString());
                        ps.setInt(3, id);
                        ps.executeUpdate();
                        dbo.closeDB();
                    } else if (request.getParameter("uvid") != null) {
                        id = Integer.parseInt(request.getParameter("uvid"));
                        PreparedStatement ps = dbo.con.prepareStatement("UPDATE reporttb SET verified=?,verifiedby=? where id=?");
                        ps.setString(1, "n");
                        ps.setString(2, "");
                        ps.setInt(3, id);
                        ps.executeUpdate();
                        dbo.closeDB();
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        %>
    </body>
</html>