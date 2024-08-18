<%-- 
    Document   : viewcart
    Created on : Jul 3, 2024, 3:36:07 PM
    Author     : DELL-PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <h1 class="mt-auto p-3 p-md-4 text-center" style="font-family: sans-serif; background-color: pink; color: black; font-weight: bold; width: 80%">Đơn hàng của bạn</h1>
    </center>

    <div class="container-xl" style="margin-bottom: 90px">
        <c:forEach items="${sessionScope.listao}" var="li">
            <div style="text-align: center; margin-bottom: 60px">
                <center>
                    <div style="border: 1px gray solid; width: 600px">
                        Mã hóa đơn: <span>${li.oid}</span><br>
                        Thành tiền: <span style="color: red; font-weight: bold">${li.totalPrice}đ</span><br>
                        Ngày đặt hàng: <span>${li.date}</span><br>
                        <c:if test="${li.status == 1}">
                            <p style="color: green; font-weight: bold">Hoàn thành</p>
                            <p><a href="pay?role=view&oid=${li.oid}">Xem đơn hàng</a></p>
                        </c:if>
                        <c:if test="${li.status == 0}">
                            <p style="color: gray">Đang xử lý...</p>
                            <p><a href="pay?role=view&oid=${li.oid}">Xem đơn hàng</a></p>
                            <p><a href="pay?role=delete&oid=${li.oid}" onclick="return confirm('Bạn có muốn hủy đơn không?');">Hủy đơn</a></p>
                        </c:if>
                    </div>

                </center>
            </div>
            <br>
        </c:forEach>
    </div>

    <br>
    <br>
    <br>
    <br>
    <br><br>
    <br>
    <br>
    <br>
    <br><br>
    <br>
    <br>
    <br>
    <br>
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
