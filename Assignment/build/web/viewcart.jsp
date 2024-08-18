<%-- 
    Document   : viewcart
    Created on : Jul 3, 2024, 3:36:07 PM
    Author     : DELL-PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>The world of Cats</title>
    </head>
    <link rel="stylesheet" href="css/nav.css"/>
    <link rel="stylesheet" href="css/page.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"><!-- comment -->

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.carousel.min.css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css">
    <style>
        .sear {
            border: none;
            height: 30px;
            margin-top: 10px;
            border-radius: 8px;
            cursor: pointer;
        }
        .sear:hover {
            background: gray;
            color: wheat;
        }

        .center-content {
            padding: 50px 0;

        }


    </style>
    <body style="margin: 0; padding: 0">
        <%@include file="header.jsp" %>
    <center>
        <h1 class="mt-auto p-3 p-md-4 text-center" style="font-family: sans-serif; background-color: pink; color: black; font-weight: bold; width: 80%">Giỏ hàng</h1>
    </center>

    <div class="container-xl" style="margin-bottom: 90px">
        <c:if test="${sessionScope.account != null}">
            <div  class="container-xl" style="background-color: greenyellow; width: 200px; text-align: center; border-radius: 8px">
                <a href="od" style="text-decoration: none; color: #58240c">Xem tất cả đơn hàng</a>
            </div>
            <br>
        </c:if>
        <c:if test="${sessionScope.orderss != null}">
            <div style="text-align: center; margin-bottom: 60px">
                <span style="color: green">${sessionScope.orderss}</span><br><!-- comment -->
                <center>
                    <div style="border: 1px gray solid; width: 600px">
                        Mã hóa đơn: <span>${sessionScope.oddt.oid}</span><br>
                        Thành tiền: <span style="color: red; font-weight: bold">${sessionScope.oddt.totalPrice}đ</span><br>
                        Ngày đặt hàng: <span>${sessionScope.oddt.date}</span><br>
                    </div>
                </center>
            </div>

        </c:if>
        <c:if test="${(sessionScope.cart.listItems == null || sessionScope.cartsize == 0) && sessionScope.orderss == null}">
            <h1 style="font-family: sans-serif; text-align: center; margin-bottom: 900px">Chưa có sản phẩm nào! Thêm sản phẩm vào giỏ <a href="home">tại đây</a></h1>
        </c:if>

        <c:if test="${sessionScope.cart != null && sessionScope.cart.listItems != null && sessionScope.cartsize != 0}">

            <form action="pay" method="post" style="">
                <div class="row " style="margin-bottom: 500px">
                    <div style="background-color: pink; font-weight: bold" class="col-lg-2 text-center border">
                        Hình ảnh
                    </div>
                    <div style="background-color: pink; font-weight: bold" class="col-lg-3 text-center border">
                        Tên sản phẩm
                    </div>
                    <div style="background-color: pink; font-weight: bold" class="col-lg-2 text-center border">
                        Đơn giá
                    </div>
                    <div style="background-color: pink; font-weight: bold" class="col-lg-2 text-center border">
                        Số lượng
                    </div>
                    <div style="background-color: pink; font-weight: bold" class="col-lg-2 text-center border">
                        Thành tiền
                    </div>
                    <div style="background-color: pink; font-weight: bold" class="col-lg-1 text-center border">
                        Xóa
                    </div>
                    <c:forEach items="${sessionScope.cart.listItems}" var="li">

                        <div class="col-lg-2 text-center border center-content"><img src="${li.product.image}" style="width: 90px"/></div>
                        <div class="col-lg-3 text-center border center-content">
                            <a href="detail?pid=${li.product.pid}" style="text-decoration: none; color: black">${li.product.productName}</a>
                        </div>
                        
                        <div class="col-lg-2 text-center border center-content" style="">


                            <c:if test="${li.product.discount > 0}">
                                <del style="color: gray">${Integer(li.product.salePrice / 1000)}.000đ</del>&nbsp;<span id="eprice" style="color: red; font-weight: bold">${Integer(li.product.salePrice * (1 - li.product.discount) / 1000)}.000đ</span>
                            </c:if>
                            <c:if test="${li.product.discount == 0}">
                                <span id="eprice" style="color: red; font-weight: bold">${Integer(li.product.salePrice / 1000)}.000đ</span>
                            </c:if>

                        </div>
                        <div class="col-lg-2 text-center border center-content">
                            Số lượng: 
                            <button type="button" style="border: 1px grey solid; " onclick="if (parseInt(document.getElementById('quan${li.product.pid}').value) > 1)
                                    {
                                        var a = parseInt(document.getElementById('quan${li.product.pid}').value) - 1;
                                        document.getElementById('quan${li.product.pid}').value = a;
                                        var h = document.getElementById('tp${li.product.pid}');
                                        var ty = parseInt(document.getElementById('quan${li.product.pid}').value);
                                        var tb = document.getElementById('tp');
                                        var tm = parseInt(tb.value) - ${Integer(li.product.salePrice * (1 - li.product.discount))};
                                        var tt = ${Integer(li.product.salePrice * (1 - li.product.discount) / 1000)} * ty;
                                        var tr;
                                        var m = document.getElementById('tpp');
                                        var kk;
                                        if (tt >= 1000) {

                                            tr = (tt / 1000).toFixed(3) + '.000đ';
                                        } else if (tt < 1000) {
                                            tr = tt + '.000đ';
                                        }
                                        if (parseInt(tm / 1000) >= 1000) {
                                            kk = (tm / 1000 / 1000).toFixed(3) + '.000đ';
                                        } else {
                                            kk = parseInt(parseInt(tm) / 1000) + '.000đ';
                                        }
                                        m.innerHTML = kk;
                                        tb.value = tm;
                                        h.innerHTML = tr;
                                        document.getElementById('outofrange${li.product.pid}').innerHTML = '';
                                    }">-</button>
                            <input id="quan${li.product.pid}" value="${li.quantity}" name="quantity${li.product.pid}" min="0" style="width: 30px; text-align: center" readonly />
                            <button type="button" style="border: 1px grey solid; " onclick="

                                    var a = parseInt(document.getElementById('quan${li.product.pid}').value);
                                    if (a === ${li.product.quantity}) {
                                        document.getElementById('outofrange${li.product.pid}').innerHTML = 'Đã đạt số lượng hàng tối đa còn lại';
                                    } else {
                                        document.getElementById('quan${li.product.pid}').value = a + 1;
                                        var h = document.getElementById('tp${li.product.pid}');
                                        var ty = parseInt(document.getElementById('quan${li.product.pid}').value);
                                        var tt = ${Integer(li.product.salePrice * (1 - li.product.discount) / 1000)} * parseInt(ty);
                                        var tb = document.getElementById('tp');
                                        var tm = parseInt(${Integer(li.product.salePrice * (1 - li.product.discount))}) + parseInt(tb.value);
                                        var tr;
                                        var m = document.getElementById('tpp');
                                        var kk;
                                        if (tt >= 1000) {

                                            tr = (tt / 1000).toFixed(3) + '.000đ';
                                        } else if (tt < 1000) {
                                            tr = tt + '.000đ';
                                        }
                                        if (parseInt(tm / 1000) >= 1000) {
                                            kk = (tm / 1000 / 1000).toFixed(3) + '.000đ';
                                        } else {
                                            kk = parseInt((tm) / 1000) + '.000đ';
                                        }
                                        m.innerHTML = kk;
                                        tb.value = tm;
                                        h.innerHTML = tr;
                                        document.getElementById('outofrange${li.product.pid}').innerHTML = '';
                                    }

                                    ">+</button>
                            &nbsp;

                            <div id="outofrange${li.product.pid}" style="color: red">

                            </div>



                        </div>
                        <div class="col-lg-2 text-center border center-content">
                            <c:if test="${li.product.discount > 0}">
                                <span id="tp${li.product.pid}" style="color: red; font-weight: bold">${Integer(li.product.salePrice * (1 - li.product.discount) * sessionScope.cart.getQuantityByID(li.product.pid) / 1000)}.000đ</span>
                            </c:if>
                            <c:if test="${li.product.discount == 0}">
                                <span id="tp${li.product.pid}" style="color: red; font-weight: bold">${Integer(li.product.salePrice / 1000)}.000đ</span>
                            </c:if>
                        </div>  
                        <div class="col-lg-1 text-center border center-content">
                            <a href="cart?role=delete&pid=${li.product.pid}" style="color: red" onclick="return confirm('Bạn có muốn xóa sản phẩm này khỏi giỏ hàng?');"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                                <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0z"/>
                                <path d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4zM2.5 3h11V2h-11z"/>
                                </svg></a>
                        </div>

                    </c:forEach>
                    <center>
                        <div class="col-lg-8 text-center border center-content cart_info" style="float: right;">
                            <h5 style="font-family: sans-serif">Thanh toán</h5>
                            Tổng tiền: &nbsp;
                            <span style="color: red; font-weight: bold;  border: none" id="tpp">
                                ${Integer(sessionScope.cart.getTotalMoney() / 1000)}.000đ

                            </span>


                            <input type="text" id="tp" style="color: red; font-weight: bold;  border: none; display: none" name="totalp" value="${Integer(sessionScope.cart.getTotalMoney())}" readonly=""/>
                            <button type="submit" onclick="return confirm('Bạn có muốn đặt hàng không?');" ${sessionScope.account == null ? 'disabled':''}  style="margin-top: 20px; border: none; border-radius: 8px;width: 120px; height: 40px; background-color: #D3006D; color: white">Đặt hàng</button>
                            <c:if test="${sessionScope.account == null}">
                                <div>
                                    <a href="login">Đăng nhập</a> để đặt hàng
                                </div>
                            </c:if>


                        </div>
                    </center>
                </div>
            </form>
        </c:if>
    </div>

    <%@include file="footer.jsp" %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous">

    </script>
    <script>
        function formatToThreeDecimalPlaces(number) {
            return Number(number.toFixed(3));
        }


    </script>
</body>
</html>
