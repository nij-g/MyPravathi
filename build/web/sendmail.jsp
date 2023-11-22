<%-- 
    Document   : sendmail
    Created on : 19-Oct-2019, 8:23:19 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="dbo.Checkmail" %>
<%
    String contactname = request.getParameter("contactname");
    String contactemail = request.getParameter("contactemail");
    String contactmessage = request.getParameter("contactmessage");
    dbo.Checkmail obj = new dbo.Checkmail();
    String val = obj.sendmail(contactname, contactemail, contactmessage);
    out.print(val);
%>