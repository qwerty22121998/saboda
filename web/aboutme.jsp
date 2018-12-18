<%-- 
    Document   : index
    Created on : Dec 16, 2018, 3:12:50 PM
    Author     : qwert
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <jsp:include page="Content/header.jsp"/>
    </head>

    <body>

        <!-- Navigation -->
        <jsp:include page="Content/nav.jsp"/>

        <!-- Page Content -->
        <div class="container">

            <div class="row">

                <jsp:include page="Content/sidebar.jsp"/>
                <!-- /.col-lg-3 -->

                <div class="col-lg-9">

                    <jsp:include page="Content/slide.jsp"/>

                    <div class="row">
                       
                            <div class="col-md-12 mb-4 white">
                                Nhóm SaBoDa - Lớp SYB.M3
                            </div>
                       
                    </div>
                    <!-- /.row -->

                </div>
                <!-- /.col-lg-9 -->

            </div>
            <!-- /.row -->

        </div>
        <!-- /.container -->

        <!-- Footer -->
        <footer class="py-5 bg-green">
            <div class="container">
                <p class="m-0 text-center text-white">Copyright &copy; SaBoDa 2018</p>
            </div>
            <!-- /.container -->
        </footer>


        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    </body>

</html>
