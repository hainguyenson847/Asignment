<%-- 
    Document   : header
    Created on : Jun 30, 2024, 6:27:56 PM
    Author     : DELL-PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.carousel.min.css">
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"><!-- comment -->

    </head>
    <body style="margin: 0; padding: 0">
        <div id="page" class="hfeed site">
            <header id="header_format"> 
                <div>
                    <nav class="stroke" >
                        <div id="logo" >
                            <a href="home" style="height: 100px">
                                <img src="img/logo_en.png" alt="alt"/>
                            </a>
                        </div>
                        <ul style="padding-top: 20px">
                            <li><a href="allprod?category=all">Tất cả sản phẩm</a></li>
                            <li><a href="allprod?category=catfood" >Thức ăn cho mèo</a></li>
                            <li><a href="allprod?category=catchain" >Vòng cổ mèo</a></li>
                            <li><a href="allprod?category=catcage">Lồng</a></li>
                        </ul>
                        <a href="cart" style="text-decoration: none; color: black; ">
                            <i class="fa fa-shopping-cart" style="font-size:36px"></i>
                        </a>
                        <c:if test="${sessionScope.account == null}">
                            <div>
                                <a href="login" id="log">Đăng nhập</a>/
                                <a href="signup" id="sign">Đăng kí</a>
                            </div>
                        </c:if>

                        <c:if test="${sessionScope.account != null}">
                            <div style="display: block; text-align: center">
                                <div>
                                    <img style="width: 50px; border-radius: 100%" src="${sessionScope.account.image}" alt="alt"/>
                                </div>
                                <div>
                                    <a href="profile" id="log">Xem thông tin</a>/
                                    <a href="logout" id="sign">Đăng xuất</a>
                                </div>
                            </div>

                        </c:if>

                    </nav>

                </div>
            </header>

        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous">

        </script>
    </body>
</html>
