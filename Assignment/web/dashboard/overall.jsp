<%-- 
    Document   : overall
    Created on : Jul 5, 2024, 10:26:33 AM
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
        <style>
            .text-content{
                color: #D3006D;
                font-weight: bold
            }
        </style>
    </head>
    <body>
        <div class="row">
            <div class="col-lg-4 border ">
                <span style="font-weight: bold">Tổng số hàng hóa</span><br>
                <div class=" text-content">
                    ${sessionScope.quanp}
                </div>
            </div>
            <div class="col-lg-4 border">
                <span style="font-weight: bold">Tổng số đơn hàng</span><br>
                <div class=" text-content">
                    ${sessionScope.quano}
                </div>
            </div>
            <div class="col-lg-4 border">
                <span style="font-weight: bold">Doanh thu</span><br>
                <div class=" text-content">
                    ${sessionScope.profit}đ
                </div>
            </div>
            <div class="col-lg-9">
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous">

        </script>
    </body>
</html>
