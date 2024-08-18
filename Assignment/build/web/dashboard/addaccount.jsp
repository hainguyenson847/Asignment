<%-- 
    Document   : addaccount
    Created on : Jul 6, 2024, 2:13:13 PM
    Author     : DELL-PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .format{
                margin-top: 40px;

            }
        </style>
    </head>
    <body>
    <center>
        <div style="border: 1px gray solid; width: 700px; height: 400px">
            <form action="addaccount" method="post">
                <div class="format">
                    Tên người dùng
                    <input style="margin-left: 20px" name="username" type="text" required=""/>
                </div>
                <div class="format">
                    Tên đầy đủ
                    <input style="margin-left: 50px" name="fullname" type="text" required=""/>
                </div>
                <div class="format">
                    Mật khẩu
                    <input style="margin-left: 60px" name="password" type="text" required=""/>
                </div>
                <div class="format">
                    Loại tài khoản
                    <input style="margin-left: 33px" name="role" type="radio" value="1" required=""/>Người dùng &nbsp;
                    <input name="role" type="radio" value="2" required=""/>Admin
                </div>
                <div class="format">
                    Email
                    <input style="margin-left: 80px" name="email" type="email" required=""/>
                </div>
                <c:if test="${sessionScope.addf != null}">
                    <p style="color: red">${sessionScope.addf}</p>
                </c:if>
                <div class="format">
                    <input type="submit" value="Xong"/>&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="admin?manage=account">Trở về</a>
                </div>
            </form>
        </div>
    </center>
</body>
</html>
