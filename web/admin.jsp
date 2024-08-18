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

        .align-col{
            margin:30px ;
        }


    </style>
    <body style="margin: 0; padding: 0">
    <center>
        <h1 class="mt-auto p-3 p-md-4 text-center" style="font-family: sans-serif; background-color: #00d084; color: black; font-weight: bold; width: 80%">Quản lý</h1>
        <div style=" background-color: #D3006D; width: 100px; height: 30px; border-radius: 8px; color: white ; padding: 3px 0">
            <a href="home" style="text-decoration: none; background-color: #D3006D; width: 100rem; height: 60rem; border-radius: 8px; color: white ">Trở về</a>
        </div>
    </center>

    <div class="container-fluid" style="margin-bottom: 90px; margin-top: 40px; ">
        <div class="row" >
            <div class="col-lg-2" style="background-color: #00d084; font-weight: bold">
                <div class="align-col" style="text-decoration: none; ">
                    ${sessionScope.mag == 'overall'? '=>':''}
                    <a href="admin?manage=overall" style="text-decoration: none;">Tổng quan</a>
                </div>
                <div class="align-col" style="text-decoration: none;">
                    ${sessionScope.mag == 'account'? '=>':''}
                    <a href="admin?manage=account" style="text-decoration: none;">Người dùng</a>
                </div>
                <div class="align-col" style="text-decoration: none;">
                    ${sessionScope.mag == 'order'? '=>':''}
                    <a href="admin?manage=order" style="text-decoration: none;">Đơn hàng</a>
                </div>
                <div class="align-col" style="text-decoration: none;">
                    ${sessionScope.mag == 'product'? '=>':''}
                    <a href="admin?manage=product" style="text-decoration: none;">Sản phẩm</a>
                </div>
            </div>
            <div class="col-lg-10" style="text-align: center">
                <c:if test="${sessionScope.mag == 'overall'}">
                    <%@include file="dashboard/overall.jsp" %>
                    <br>
                    <br>
                    <br>
                    <%@include file="dashboard/profitbymonths.jsp" %>
                </c:if>
                <c:if test="${sessionScope.mag == 'account'}">
                    <%@include file="dashboard/accountm.jsp" %>
                </c:if>
                <c:if test="${sessionScope.mag == 'order'}">
                    <%@include file="dashboard/allorder.jsp" %>
                </c:if>
                <c:if test="${sessionScope.mag == 'product'}">
                    <%@include file="dashboard/allproduct.jsp" %>
                </c:if>

            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous">

    </script>
    <script>
        function formatToThreeDecimalPlaces(number) {
            return Number(number.toFixed(3));
        }


    </script>
</body>
</html>
