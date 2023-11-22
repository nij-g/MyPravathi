<%-- 
    Document   : logout.jsp
    Created on : 29 Oct, 2019, 8:41:31 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            session.removeAttribute("Volusername");
            session.removeAttribute("Adminusername");
            session.invalidate();
            response.sendRedirect("index.jsp");
        %>
    </body>
</html>
