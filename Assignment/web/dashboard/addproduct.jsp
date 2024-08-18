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
        <div style="border: 1px gray solid; width: 700px; height: 600px">
            <form action="addproduct" method="post">
                <div class="format">
                    Tên sản phẩm
                    <input style="margin-left: 30px" name="name" type="text" required=""/>
                </div>
                <div class="format"style="margin-right: 99px">
                    Phân loại
                    <select name="cate" style="margin-left: 58px">
                        <c:forEach items="${sessionScope.listcgg}" var="li">
                            <option value="${li.cid}">${li.categoryName}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="format">
                    Số lượng
                    <input style="margin-left: 60px" name="quantity" type="text" required=""/>
                </div>
                <div class="format">
                    Giá bán
                    <input style="margin-left: 70px" name="saleprice" type="text" required=""/>
                </div>
                <div class="format">
                    Giảm giá(%)
                    <input style="margin-left: 40px" name="discount" type="text" required=""/>
                </div>
                <div class="format">
                    Mô tả
                    <input style="margin-left: 85px" name="description" type="" required=""/>
                </div>
                <div class="format">
                    <input type="submit" value="Xong"/>&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="admin?manage=product">Trở về</a>
                </div>
            </form>
        </div>
    </center>
</body>
</html>
