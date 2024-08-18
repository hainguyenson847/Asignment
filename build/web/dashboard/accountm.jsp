<%-- 
    Document   : accountm
    Created on : Jul 5, 2024, 10:45:53 AM
    Author     : DELL-PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title><link rel="stylesheet" href="css/page.css"/>
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
        <%--
        private String username;
        private String fullname;
        private String password;
        private int role;
        private String image;
        private String email;
        private String birth;
        private String address;
        private String phone;
        private boolean status;
        --%>
        <div style="width: 200px; height: 25px; background-color: #D3006D; text-align: center; border-radius: 8px">
            <a href="addaccount" style="margin: 50% 0; text-decoration: none; color: white">Thêm tài khoản</a>
        </div>
        <div class="row" style="background-color: #7bdcb5">
            <div class="col-lg-2 border text-content">
                Tên đăng nhập
            </div>
            <div class="col-lg-2 border text-content">
                Tên đầy đủ
            </div>
            <div class="col-lg-1 border text-content">
                Loại tài khoản
            </div>
            <div class="col-lg-3 border text-content">
                Email
            </div>
            <div class="col-lg-1 border text-content">
                Số điện thoại
            </div>
            <div class="col-lg-2 border text-content">
                Địa chỉ
            </div>
            <div class="col-lg-1 border text-content">
                Xóa
            </div>
        </div>
        <c:forEach items="${sessionScope.allacc}" var="li">
            <div class="row">
                <div class="col-lg-2 border ">
                    ${li.username}
                </div>
                <div class="col-lg-2 border ">
                    ${li.fullname}
                </div>
                <div class="col-lg-1 border ">
                    ${li.role == 1 ? 'Khách hàng':'Admin'}
                </div>
                <div class="col-lg-3 border">
                    ${li.email}
                </div>
                <div class="col-lg-1 border ">
                    ${li.phone}
                </div>
                <div class="col-lg-2 border ">
                    ${li.address}
                </div>
                <div class="col-lg-1 border ">
                    <a href="dashboard?role=delete&username=${li.username}" style="color: red" onclick="return confirm('Bạn có muốn xóa tài khoản này?');"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
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
