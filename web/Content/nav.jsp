<%-- 
    Document   : nav
    Created on : Dec 16, 2018, 3:24:48 PM
    Author     : qwert
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <nav class="navbar navbar-expand-lg navbar-dark bg-green fixed-top ">
        <div class="container">
            <a class="navbar-brand" href="/"><i class='fas fa-futbol'></i> SaBoDa</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="index.jsp">Trang chủ
                            <span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="aboutme.jsp">Về chúng tôi</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="services.jsp">Dịch vụ</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="contact.jsp">Liên hệ</a>
                    </li>
                    <c:if test='${cookie.admin.value == "true"}'>
                    <li class="nav-item">
                        <a class="nav-link" href="admin?admin=false">Log out</a>
                    </li>
                    </c:if>
                    <c:if test='${cookie.admin.value == "false"}'>
                    <li class="nav-item">
                        <a class="nav-link" href="admin?admin=true">Admin</a>
                    </li>
                    </c:if>
                </ul>
            </div>
        </div>
    </nav>
</html>
