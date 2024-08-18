<%-- 
    Document   : vieworderdetail
    Created on : Jul 7, 2024, 7:07:16 PM
    Author     : DELL-PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
    </head>
    <body>
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
            <div style="background-color: pink; font-weight: bold" class="col-lg-3 text-center border">
                Thành tiền
            </div>
            <c:forEach items="${sessionScope.listodd}" var="li">

                <div class="col-lg-2 text-center border center-content"><img src="${li.p.image}" style="width: 90px"/></div>
                <div class="col-lg-3 text-center border center-content">
                    ${li.p.productName}
                </div>

                <div class="col-lg-2 text-center border center-content" style="">


                    <c:if test="${li.p.discount > 0}">
                        <del style="color: gray">${Integer(li.p.salePrice / 1000)}.000đ</del>&nbsp;<span id="eprice" style="color: red; font-weight: bold">${Integer(li.p.salePrice * (1 - li.p.discount) / 1000)}.000đ</span>
                    </c:if>
                    <c:if test="${li.p.discount == 0}">
                        <span id="eprice" style="color: red; font-weight: bold">${Integer(li.p.salePrice / 1000)}.000đ</span>
                    </c:if>

                </div>
                <div class="col-lg-2 text-center border center-content">
                    Số lượng:
                    <input value="${li.quantity}" name="quantity${li.p.pid}" min="0" style="width: 30px; text-align: center" readonly />

                    &nbsp;

                    <div id="outofrange${li.p.pid}" style="color: red">

                    </div>



                </div>
                <div class="col-lg-3 text-center border center-content">
                    <c:if test="${li.p.discount > 0}">
                        <span id="tp${li.p.pid}" style="color: red; font-weight: bold">${Integer(li.p.salePrice * (1 - li.p.discount) * li.quantity / 1000)}.000đ</span>
                    </c:if>
                    <c:if test="${li.p.discount == 0}">
                        <span id="tp${li.p.pid}" style="color: red; font-weight: bold">${Integer(li.p.salePrice / 1000)}.000đ</span>
                    </c:if>
                </div>  

            </c:forEach>
            <center>
                <div class="col-lg-8 text-center border center-content cart_info" style="float: right;">
                    Tổng tiền: &nbsp;
                    <span style="color: red; font-weight: bold;  border: none" id="tpp">
                        ${Integer(sessionScope.o.getTotalPrice() / 1000)}.000đ

                    </span>
                    <br>
                    Ngày đặt: &nbsp;
                    <span style=" font-weight: bold;  border: none" id="tpp">
                        ${sessionScope.o.getDate()}

                    </span>
                    <br><!-- comment -->
                    <c:if test="${sessionScope.v != null}">
                        <a href="admin?manage=order">Quay lại</a>
                    </c:if>
                    <c:if test="${sessionScope.v == null}">
                        <a href="od">Quay lại</a>
                    </c:if>
                    
                </div>
            </center>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous">

            </script>
            <script>
                function formatToThreeDecimalPlaces(number) {
                    return Number(number.toFixed(3));
                }


            </script>
    </body>
</html>
