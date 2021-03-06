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

                <div class="col-lg-9 w">

                    <jsp:include page="Content/slide.jsp"/>

                    <div class="row white">
                       
                        <c:forTokens items = "1,2,3,4" delims = "," var = "id">
                            <div class="col-md-6 mb-4">
                                <div class="card h-100">
                                    <c:set var="field" value='${q.getFieldInfo(id)}'/>
                                    <a href="book.jsp?id=${field.id}"><img class="card-img-top" src="images/san1.jpg" alt=""></a>
                                    <div class="card-body">
                                        <h4 class="card-title">
                                            <a href="book.jsp?id=${field.id}">Sân ${field.id}</a>
                                        </h4>

                                        <p class="card-text">${field.desc}</p>
                                    </div>
                                    <div class="card-footer">
                                        <h5>269k - 549k / giờ</h5>
                                    </div>
                                </div>
                            </div>
                        </c:forTokens>
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
                <p class="m-0 text-center text-white">Copyright &copy; Your Website 2017</p>
            </div>
            <!-- /.container -->
        </footer>


        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    </body>

</html>
