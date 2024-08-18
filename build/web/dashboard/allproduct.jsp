<%-- 
    Document   : allproduct
    Created on : Jul 6, 2024, 2:16:27 AM
    Author     : DELL-PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link rel="stylesheet" href="css/page.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"><!-- comment -->

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.carousel.min.css">
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css">
        <style>
            .text-content{
                color: #D3006D;
                font-weight: bold
            }
        </style>
    </head>
    <body>
        <div style="width: 200px; height: 25px; background-color: #D3006D; text-align: center; border-radius: 8px">
            <a href="addproduct" style="margin: 50% 0; text-decoration: none; color: white">Thêm sản phẩm</a>
        </div>
        <div class="row" style="background-color: #7bdcb5">
            <div class="col-lg-1 border text-content">
                Mã sản phẩm
            </div>
            <div class="col-lg-1 border text-content">
                Hình ảnh
            </div>
            <div class="col-lg-2 border text-content">
                Tên sản phẩm
            </div>
            <div class="col-lg-2 border text-content">
                Giá bán
            </div>
            <div class="col-lg-1 border text-content">
                Giảm giá
            </div>
            <div class="col-lg-1 border text-content">
                Số lượng
            </div>
            <div class="col-lg-1 border text-content">
                Đã bán
            </div>
            <div class="col-lg-1 border text-content">
                Phân loại
            </div>
            <div class="col-lg-2 border text-content">
                Quản lý
            </div>
        </div>
        <%--
        private int pid;
        private String productName;
        private String image;
        private int salePrice;
        private String description;
        private int quantity;
        private double discount;
        private int sold;
        private String releaseDate;
        private Category category;
        private boolean status;    
        --%>
        <c:forEach items="${sessionScope.allp}" var="li">
            <div class="row">
                <div class="col-lg-1 border ">
                    ${li.pid}
                </div>
                <div class="col-lg-1 border ">
                    <img src="${li.image}" alt="alt" style="width: 70px"/>
                </div>
                <div class="col-lg-2 border ">
                    ${li.productName}
                </div>
                <div class="col-lg-2 border ">
                    ${li.salePrice}đ
                </div>
                <div class="col-lg-1 border ">
                    ${li.discount * 100}%
                </div>
                <div class="col-lg-1 border ">
                    ${li.quantity}
                </div>
                <div class="col-lg-1 border ">
                    ${li.sold}
                </div>
                <div class="col-lg-1 border ">
                    ${li.category.categoryName}
                </div>
                <div class="col-lg-2 border ">

                    <a href="dashboard?role=update&pid=${li.pid}" style="color: black" >
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pen" viewBox="0 0 16 16">
                        <path d="m13.498.795.149-.149a1.207 1.207 0 1 1 1.707 1.708l-.149.148a1.5 1.5 0 0 1-.059 2.059L4.854 14.854a.5.5 0 0 1-.233.131l-4 1a.5.5 0 0 1-.606-.606l1-4a.5.5 0 0 1 .131-.232l9.642-9.642a.5.5 0 0 0-.642.056L6.854 4.854a.5.5 0 1 1-.708-.708L9.44.854A1.5 1.5 0 0 1 11.5.796a1.5 1.5 0 0 1 1.998-.001m-.644.766a.5.5 0 0 0-.707 0L1.95 11.756l-.764 3.057 3.057-.764L14.44 3.854a.5.5 0 0 0 0-.708z"/>
                        </svg>
                    </a>
                    &nbsp;
                    <a href="dashboard?role=delete&pid=${li.pid}" style="color: red" onclick="return confirm('Bạn có muốn xóa sản phẩm này?');"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                        <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0z"/>
                        <path d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4zM2.5 3h11V2h-11z"/>
                        </svg></a>



                </div>
            </div>
        </c:forEach>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous">

        </script>
    </body>
</html>
