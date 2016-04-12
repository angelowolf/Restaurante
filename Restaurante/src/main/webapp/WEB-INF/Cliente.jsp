<%-- 
    Document   : Cliente
    Created on : 07/04/2016, 21:52:38
    Author     : ang_2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <s:property value="cliente.nombre"/>
        <s:property value="cliente.apellido"/>
        <s:property value="cliente.id"/>
    </body>
</html>
