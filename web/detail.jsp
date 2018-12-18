<%-- 
    Document   : index
    Created on : Dec 16, 2018, 3:12:50 PM
    Author     : qwert
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <c:if test="${param.id ne null}">
                        <div class="row white">
                            <c:set var="detail" value="${b.getOrder(param.id)}"/>
                            <c:if test="${detail.id eq null}">
                                <jsp:forward page="index.jsp"/>
                            </c:if>
                            <form class="col-md-12" method="get" action="booked">
                                <h3>Hóa đơn số ${param.id}</h3>
                                <input type="hidden" name="id" value="${param.id}"/>
                                <div class="form-group row">
                                    <label for="name" class="col-sm-2 col-form-label">Đặt sân</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="name" value="${detail.fieldID}">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="name" class="col-sm-2 col-form-label">Họ và Tên</label>
                                    <div class="col-sm-10">
                                        <input type="text"class="form-control" id="name" value="${detail.name}">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="phone" class="col-sm-2 col-form-label">Số điện thoại</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="phone" value="${detail.phone}">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="date" class="col-sm-2 col-form-label">Từ</label>
                                    <div class="col-sm-10">
                                        <input type="string" class="form-control" id="date" value="${detail.from}">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="date" class="col-sm-2 col-form-label">Đến</label>
                                    <div class="col-sm-10">
                                        <input type="string" class="form-control" id="date" value="${detail.to}">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="date" class="col-sm-2 col-form-label">Giá</label>
                                    <div class="col-sm-10">
                                        <input type="string"  class="form-control" value="${detail.price}">
                                    </div>
                                </div>
                                <fieldset class="form-group">
                                    <div class="row">
                                        <legend class="col-form-label col-sm-2 pt-0">Phương thức thanh toán</legend>
                                        <div class="col-sm-10">
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" id="cash" value="cash" checked>
                                                <label class="form-check-label" for="cash">
                                                    Thanh toán tiền mặt
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio"  id="visa" value="visa" disabled="true">
                                                <label class="form-check-label" for="visa">
                                                    Chuyển khoản
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </fieldset>

                                <div class="form-group row">
                                    <c:if test="${detail.status}">
                                        <label class="col-sm-12 col-form-label btn-success">Đã thanh toán</label>
                                    </c:if>
                                    <c:if test="${not detail.status}">
                                        <label class="col-sm-12 col-form-label btn-warning">Chưa thanh toán</label>
                                        <c:if test='${cookie.admin.value == "true"}'>
                                            <center class="col-md-12">
                                                <input type='submit' class='btn btn-success my-4' value="Đã thanh toán"/>
                                            </center>
                                        </c:if>
                                    </c:if>
                                </div>

                            </form>
                        </div>
                        <!-- /.row -->
                        <script>
                            $("input").prop("readonly", true);
                        </script>
                    </c:if>
                    <c:if test="${param.id eq null}">
                        <form method="get">
                            <div class="white container">
                                <h3>Kiểm tra lịch đặt</h3>
                                <div class="form-group row">
                                    <div class="col-sm-10">
                                        <input type="text" name="id" class="form-control" placeholder="Số hóa đơn">
                                    </div>
                                    <div class="col-sm-2">
                                        <button type="submit" class="btn btn-success">Kiểm tra</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </c:if>
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
