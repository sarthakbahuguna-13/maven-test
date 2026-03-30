<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DigiErasTechnologes- Home Page</title>
<link href="images/unnamed.jpg" rel="icon">
</head>
<body>
    <h1 align="center">Welcome to DigEas Tchnooges. Ph No: +91-7017756881,+91-8126636879</h1>
    <h1 align="center">DigiEras Technologies - Very Good Training center for DevOps & Cloud, Python, Java & Node JS</h1>

    <h2>Trainer Name: Sanchit Raj</h2>
    <hr><br>

    <h3>Server Side IP Address</h3>
    <%
        String ip = "";
        InetAddress inetAddress = InetAddress.getLocalHost();
        ip = inetAddress.getHostAddress();
        out.println("Server Host Name :: " + inetAddress.getHostName());
    %>
    <br>
    <%= "Server IP Address :: " + ip %>

    <br><br>
    <h3>Client Side IP Address</h3>
    <%= "Client IP Address :: " + request.getRemoteAddr() %><br>
    <%= "Client Name Host :: " + request.getRemoteHost() %><br>

    <hr>
    <div style="text-align: center;">
        <span>
            <img src="images/mithunlogo.jpg" alt="Logo" width="100">
        </span>
        <span style="font-weight: bold;">
            DigiEras Technologies,
            Vrindavan yojna, Sector2,
            Lucknow,
            +91-7017756881,+91-8126636879
            contact@digieras.com
            <br>
            <a href="mailto:contact@digieras.com">Mail to DigiEras Technologies</a>
        </span>
    </div>
    <hr>

    <p>Service : <a href="services/employee/getEmployeeDetails">Get Employee Details</a></p>

    <hr>
    <p align="center">DigiEras Technologies - Consultant, Training, Development Center.</p>
    <p align="center"><small>Copyrights 2022 by <a href="http://digieras.com/">DigiEras Technologies, Lucknow</a></small></p>
</body>
</html>
