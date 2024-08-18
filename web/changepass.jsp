<%-- 
    Document   : changepass
    Created on : Jul 2, 2024, 1:09:34 AM
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
        <link rel="stylesheet" href="css/page.css"/><link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"><!-- comment -->
        <style type="text/css">
            body{
                background-color:#f2f6fc;
                color:#69707a;
            }
            .img-account-profile {
                height: 10rem;
            }
            .rounded-circle {
                width: 150px;
                border-radius: 50% !important;
            }
            .card .card-header {
                font-weight: 500;
            }
            .card-header:first-child {
                border-radius: 0.35rem 0.35rem 0 0;
            }
            .card-header {
                padding: 1rem 1.35rem;
                margin-bottom: 0;
                background-color: rgba(33, 40, 50, 0.03);
                border-bottom: 1px solid rgba(33, 40, 50, 0.125);
            }

            #buttonVip2{
                display: none;
            }

            .form-control, .dataTable-input {
                display: block;
                width: 100%;
                padding: 0.875rem 1.125rem;
                font-size: 0.875rem;
                font-weight: 400;
                line-height: 1;
                color: #69707a;
                background-color: #fff;
                background-clip: padding-box;
                border: 1px solid #c5ccd6;
                -webkit-appearance: none;
                -moz-appearance: none;
                appearance: none;
                border-radius: 0.35rem;
                transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
            }

            .nav-borders .nav-link.active {
                color: #0061f2;
                border-bottom-color: #0061f2;
            }
            .nav-borders .nav-link {
                color: #69707a;
                border-bottom-width: 0.125rem;
                border-bottom-style: solid;
                border-bottom-color: transparent;
                padding-top: 0.5rem;
                padding-bottom: 0.5rem;
                padding-left: 0;
                padding-right: 0;
                margin-left: 1rem;
                margin-right: 1rem;
            }

            body {
                justify-content: center;
                align-items: center;
                min-height: 100vh;
                width: 100%;
                font-family: "Nunito", sans-serif;
                background-image: url(images/magic.gif);
                background-repeat: no-repeat;
                background-position: center;
                background-size: cover;
            }

            .card{
                border: none;
                border-radius: 10px;
                width: 100%;
                margin-top: 10%;
            }

            .fa-ellipsis-v{
                font-size: 10px;
                color: #C2C2C4;
                margin-top: 6px;
                cursor: pointer;
            }
            .text-dark{
                font-weight: bold;
                margin-top: 8px;
                font-size: 13px;
                letter-spacing: 0.5px;
            }
            .card-bottom{
                background: #3E454D;
                border-radius: 6px;
            }
            .flex-column{
                color: #adb5bd;
                font-size: 13px;
            }
            .flex-column p{
                letter-spacing: 1px;
                font-size: 18px;
            }
            .btn-secondary{
                height: 40px!important;
                margin-top: 3px;
            }
            .btn-secondary:focus{
                box-shadow: none;
            }
        </style>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div>
            <center>
                <h1 class="mt-auto p-3 p-md-4 text-center" style="font-family: sans-serif; background-color: #3b71ca; color: white; width: 80%">Thay đổi mật khẩu</h1>
            </center>

            <div class="container">
                <center>
                    <form action="changepass" method="post">
                        <div style="width: 600px">  
                            <label class="mb-1" for="inputUsername"></label>
                            <input class="form-control" id="inputUsername"  name="op"  type="password" placeholder="Nhập mật khẩu cũ" value="${sessionScope.op}" >
                        </div>

                        <div style="width: 600px">  
                            <label class="mb-1" for="inputUsername"></label>
                            <input class="form-control" id="inputUsername"  name="np"  type="password" placeholder="Nhập mật khẩu mới" required="">
                        </div>
                        <div style="width: 600px">  
                            <label class="mb-1" for="inputUsername"></label>
                            <input class="form-control" id="inputUsername"  name="cpp"  type="password" placeholder="Xác nhận mật khẩu" required="">
                        </div>
                        <c:if test="${sessionScope.errop != null}">
                            <p style="color: red; margin-top: 10px">${sessionScope.errop}</p>
                        </c:if>
                        <c:if test="${sessionScope.ercpp != null}">
                            <p style="color: red; margin-top: 10px">${sessionScope.errcpp}</p>
                        </c:if>
                        <c:if test="${sessionScope.errnp != null}">
                            <p style="color: red; margin-top: 10px">${sessionScope.errnp}</p>
                        </c:if>
                        <c:if test="${sessionScope.changesc != null}">
                            <p style="color: green; margin-top: 10px">${sessionScope.changesc}</p>
                        </c:if>
                        <input type="submit" value="Lưu mật khẩu mới" style="margin-top: 40px; height: 40px; border: none; border-radius: 8px; background-color: green; color: white;"/>
                    </form>
                </center>
            </div>
        </div>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous">

        </script>
    </body>
</html>
