<%-- 
    Document   : profile
    Created on : Jul 1, 2024, 2:08:51 PM
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
                <h1 class="mt-auto p-3 p-md-4 text-center" style="font-family: sans-serif; background-color: #3b71ca; color: white; width: 80%">Thông tin cá nhân</h1>
            </center>
        </div>
        <c:set value="${sessionScope.account}" var="acc"/>
        <div class="container-xl px-4 mt-4">
            <hr class="mt-0 mb-4">
            <c:if test="${acc.role == 2}">
                <a href="admin">Quản lý</a><br>

            </c:if>
            <div class="row">
                <div class="col-xl-4">
                    <div class="card mb-4 mb-xl-0">
                        <div class="card-header">Ảnh đại diện</div>
                        <div class="card-body text-center box_info">
                            <form action="changeavt" enctype="multipart/form-data" >
                                <c:if test="${sessionScope.errimg != null}">
                                    <p style="color: red">${sessionScope.errimg}</p>
                                </c:if>
                                <c:if test="${acc.image!=null}">
                                    <div class="avatar">
                                        <img class="user_image" src="${acc.image}"  alt="" id="iUser" style="border: 1px solid #0D6EFD; width: 90px"/>
                                        <input type="file" accept="img/*" name="file" id="form_file" value=""/>
                                    </div>
                                </c:if>
                                <br>
                                <input type="submit" id="sub" name="imagelink" value="Thay đổi" />
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-xl-8" style="margin: -45px 0">

                    <div class="card mb-4">
                        <div class="card-header" style="font-weight: 700">THÔNG TIN CÁ NHÂN</div>
                        <div class="card-body">
                            <div style="background-color: green; width: 190px;text-align: center; border-radius: 8px;"><a href="changepass" style="text-decoration: none; color: white;">Thay đổi mật khẩu</a></div>
                            <form action="profile" method="post">

                                <c:if test="${sessionScope.changeprofile != null}">
                                    <p style="color: green">${sessionScope.changeprofile}</p>
                                </c:if>
                                <div class="mb-3">  
                                    <label class="mb-1" for="inputUsername">Tên đăng nhập</label>
                                    <input class="form-control" id="inputUsername" style="background-color: #c5ccd6" readonly="" name="username"  type="text" placeholder="Enter your username" value="${acc.username}">
                                </div>
                                <div class="gx-3 mb-3">
                                    <label class="mb-1" for="inputFirstName">Tên đầy đủ</label>
                                    <c:if test="${acc.fullname!=null}">
                                        <input class="form-control acceptEdit" ${sessionScope.change? 'required':'readonly  style="background-color: #c5ccd6"'}   name="name" id="inputFirstName" type="text" placeholder="Full Name" value="${acc.fullname}">
                                    </c:if>
                                </div>

                                <div class="row gx-3 mb-3">

                                    <div class="col-md-6">
                                        <label class="mb-1" for="inputOrgName">Loại tài khoản</label>
                                        <c:if test="${acc.role == 1}">
                                            <input class="form-control" id="inputOrgName" readonly style="background-color: #c5ccd6" type="text" placeholder="Enter your organization name" value="Khách hàng">
                                        </c:if>
                                        <c:if test="${acc.role == 2}">
                                            <input class="form-control" id="inputOrgName" readonly style="background-color: #c5ccd6"  type="text" placeholder="Enter your organization name" value="Admin">
                                        </c:if>
                                    </div>

                                    <div class="col-md-6">
                                        <label class="mb-1" for="inputLocation">Địa chỉ</label>
                                        <input class="form-control acceptEdit" ${sessionScope.change? 'required':'readonly style="background-color: #c5ccd6"'}  name="address" id="inputFirstName"  type="text" placeholder="..." value="${acc.address}">
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <label class="mb-1" for="inputEmailAddress">Email</label>
                                    <input class="form-control acceptEdit" ${sessionScope.change? 'required':'readonly style="background-color: #c5ccd6"'}   name="email" id="inputFirstName"  type="text" placeholder="Email" value="${acc.email}">

                                </div>

                                <div class="row gx-3 mb-3">

                                    <div class="col-md-6">
                                        <label class="mb-1" for="inputPhone">Số điện thoại</label>
                                        <input class="form-control acceptEdit" ${sessionScope.change? 'required':'readonly style="background-color: #c5ccd6"'}  name="phone" id="inputFirstName"  type="text" placeholder="..." value="${acc.phone}">

                                    </div>

                                    <div class="col-md-6">
                                        <label class="mb-1" for="inputBirthday">Ngày sinh</label>
                                        <input class="form-control acceptEdit" ${sessionScope.change? 'required':'readonly style="background-color: #c5ccd6"'}  name="birthday" id="inputFirstName"  type="text" placeholder="..." value="${acc.birth}">
                                        <c:if test="${sessionScope.errD != null}">
                                            <p style="color: red">${sessionScope.errD}</p>
                                        </c:if>

                                    </div>
                                </div>
                                <c:if test="${!sessionScope.change}" >
                                    <button style="" class="btn btn-primary"  id="buttonVip" type="submit" name="edit" value="edit">Chỉnh sửa</button>
                                </c:if>
                                <c:if test="${sessionScope.change}" >
                                    <button style="padding-right: 20px ;padding-left: 20px" class="btn btn-primary"   type="submit" name="edit" value="save">Lưu</button>
                                </c:if>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous">

        </script>
    </body>
</html>
