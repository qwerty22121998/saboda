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

                        <form class="col-md-12 white" action="booked">
                            <input type="hidden" name="fieldID" value="${param.id}"/>
                            <h3>Bạn chọn đặt sân <span class="btn btn-info">${param.id}</span></h3>

                            <c:set var="field" value='${q.getFieldInfo(param.id)}'/>
                            <div class="row my-4 white">

                                <div class="col-md-9">

                                    <div class="form-group row">
                                        <label for="name" class="col-sm-2 col-form-label">Họ và Tên</label>
                                        <div class="col-sm-10">
                                            <input onchange="check()" type="text" name="name" class="form-control" id="name" placeholder="Họ tên đầy đủ của bạn">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="phone" class="col-sm-2 col-form-label">SĐT</label>
                                        <div class="col-sm-10">
                                            <input onchange="check()" type="text" name="phone" class="form-control" id="phone" placeholder="Số điện thoại của bạn">
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label for="note" class="col-sm-2 col-form-label">Ghi chú</label>
                                        <div class="col-sm-10">
                                            <input onchange="check()" type="text" name="note" class="form-control" id="note" placeholder="Ghi chú của bạn">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="date" class="col-sm-2 col-form-label">Ngày</label>
                                        <div class="col-sm-10">
                                            <input onchange="check()" name="date" type="date" class="form-control" id="date" placeholder="">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="from" class="col-sm-2 col-form-label">Từ giờ</label>
                                        <div class="col-sm-4">
                                            <input onchange="check()" name="from" type="number" min="1" max="24" class="form-control" id="from" placeholder="Giờ bắt đầu">
                                        </div>
                                        <label for="time" class="col-sm-2 col-form-label">Thời gian</label>
                                        <div class="col-sm-4">
                                            <input onchange="check()" name="time" type="number" class="form-control" id="time" placeholder="Thời gian sử dụng">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="price" class="col-sm-2 col-form-label">Giá tiền</label>
                                        <div class="col-sm-10">
                                            <input onchange="check()" name="price" type="text" class="form-control" id="price"value="0" readonly>
                                            <div>
                                                <p>Lưu ý, chúng tôi tính tiền theo khung giờ</p>
                                                <p>- Trước 18 giờ : 269k / tiếng
                                                <p>- Từ 18 giờ đến 20 giờ: 549k / tiếng
                                                <p>- Từ 20 giờ đến 22 giờ : 399k / tiếng
                                                    
                                            </div>
                                        </div>
                                        
                                    </div>
                                    <fieldset class="form-group">
                                        <div class="row">
                                            <legend class="col-form-label col-sm-2 pt-0">Phương thức thanh toán</legend>
                                            <div class="col-sm-10">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="radio" name="payment" id="cash" value="cash" checked>
                                                    <label class="form-check-label" for="cash">
                                                        Thanh toán tiền mặt
                                                    </label>
                                                </div>
                                                <div class="form-check">
                                                    <input class="form-check-input" type="radio" name="payment" id="visa" value="visa" disabled="true">
                                                    <label class="form-check-label" for="visa">
                                                        Chuyển khoản
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>

                                <div class="col-md-3">
                                    <c:set var="field" value='${q.getFieldInfo(param.id)}'/>
                                    <div class="card h-100">
                                        <a href="book.jsp?id=1"><img class="card-img-top" src="images/san${id%2+1}.jpg" alt=""></a>
                                        <div class="card-body">
                                            <h4 class="card-title">
                                                <a href="book.jsp?id=1">Sân ${field.id}</a>
                                            </h4>

                                            <p class="card-text"><small>${field.desc}</small></p>
                                        </div>
                                        <div class="card-footer">
                                            300k - 500k / giờ</h5>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-10">
                                    <button type="submit" id="submit" class="btn btn-primary" disabled>Đặt lịch</button>
                                </div>
                            </div>

                        </form>
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
        <!--<script src="vendor/jquery/jquery.min.js"></script>-->
        <!--<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>-->
        <script>
            let name = $("#name")
            let phone = $("#phone")
            let date = $("#date")
            let from = $("#from")
            let time = $("#time")
            let submit = $("#submit")
            let price = $("#price")

            $(document).ready(() => {
                date[0].valueAsDate = new Date();
                submit[0].style.backgroundColor = "red"
                setInterval(() => {
                    check()
                }, 100)
            });


            let check = () => {
                submit[0].disabled = true
                submit[0].style.backgroundColor = "red"
                if (name[0].value.length === 0)
                    return
                if (name[0].value.length === 0 || isNaN(phone[0].value))
                    return
                if (date[0].value.length === 0)
                    return
                if (from[0].value.length === 0)
                    return
                if (time[0].value.length === 0)
                    return
                
                let t = parseInt(from[0].value);
                let s = 0
                for(var i = 0; i < time[0].value; i++) {
                    if (t + i < 18) s += 269;
                    else if (t + i < 20) s+= 549
                    else s += 399;
                    
                }
                price[0].value = s + "k vnd";
                submit[0].disabled = false;
                submit[0].style.backgroundColor = "#007bff"
            }
        </script>   


    </body>

</html>
