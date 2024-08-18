<%-- 
    Document   : search
    Created on : Jul 1, 2024, 11:26:26 PM
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
        <link rel="stylesheet" href="css/page.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"><!-- comment -->

    </head>
    <body>
        <%@include file="header.jsp" %>
        <%@include file="headerbottom.jsp" %>
        <!-- Products -->
        <section>
            <header class="container-xl mb-4">
                <h3>Kết quả cho "${sessionScope.skey}"</h3>
            </header>

            <c:if test="${sessionScope.notfound != null}" >
                <center>
                    <h1 style="font-family: sans-serif">${sessionScope.notfound}</h1>
                </center>
            </c:if>
            <div class="container my-5">
                <div class="row">
                    <c:forEach items="${sessionScope.slist}" var="li">
                        <div class="col-lg-3 col-md-6 col-sm-6 d-flex">
                            <div class="card w-100 my-2 shadow-2-strong">
                                <img src="${li.image}" class="card-img-top" style="aspect-ratio: 1 / 1" />
                                <div class="card-body d-flex flex-column">
                                    <h5 class="card-title">${li.productName}</h5>
                                    <c:if test="${li.discount != 0}">

                                        <div style="display: flex; justify-content: space-around">
                                            <p class="card-text"><del style="color: grey;margin-right: 10px">${Integer(li.salePrice / 1000)}.000đ</del>${Integer((li.salePrice - (li.salePrice  * li.discount)) / 1000)}.000đ</p>
                                            <span style="width: 60px; border-radius: 8px; color: white; background-color: red; padding: 4px 0; height: 30px; font-weight: bold">-${li.discount * 100}%</span>
                                        </div>
                                    </c:if>
                                    <c:if test="${li.discount == 0}">
                                        <p class="card-text">${Integer(li.salePrice / 1000)}.000đ</p>
                                    </c:if>
                                    <div class="card-footer d-flex align-items-end pt-3 px-0 pb-0 mt-auto">
                                        <button type="button" ${li.quantity == 0 ? 'disabled':''}  class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal${li.pid}" onclick="document.getElementById('quan${li.pid}').value = '1';" 
                                                style="${li.quantity == 0 ? 'background-color: #8b1b46':'background-color: #007aff'}  color: black; border: 1px pink solid">
                                            ${li.quantity == 0 ? 'Hết hàng':'Thêm vào giỏ'}
                                        </button>

                                        <!-- Modal -->
                                        <form action="cart">
                                            <div class="modal fade" id="exampleModal${li.pid}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h1 class="modal-title fs-5" id="exampleModalLabel">Chi tiết sản phẩm</h1>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body">
                                                            Mã sản phẩm: <input type="text" name="pi" value="${li.pid}" readonly="" style="text-align: center; border: none; width: 30px"/>
                                                            <img src="${li.image}" class="card-img-top" style="aspect-ratio: 1 / 1" />
                                                            <h5 class="card-title">${li.productName}</h5>
                                                            <p>${li.description}</p>
                                                            <c:if test="${li.discount != 0}">

                                                                <div style="display: flex; justify-content: space-evenly">
                                                                    <p class="card-text"><del style="color: grey;margin-right: 10px">${Integer(li.salePrice / 1000)}.000đ</del>${Integer((li.salePrice - (li.salePrice  * li.discount)) / 1000)}.000đ</p>
                                                                    <span style="width: 60px; border-radius: 8px; color: white; background-color: red; padding: 4px 0; height: 30px; font-weight: bold">-${li.discount * 100}%</span>
                                                                </div>
                                                            </c:if>
                                                            <c:if test="${li.discount == 0}">
                                                                <p class="card-text">${Integer(li.salePrice / 1000)}.000đ</p>
                                                            </c:if>
                                                            <div>
                                                                Số lượng còn lại: ${li.quantity}
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                                            <button type="submit" class="btn btn-primary" style="background-color: #F3D1E2; color: black; border: 1px pink solid">Thêm vào giỏ</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                        <a href="detail?pid=${li.pid}" class="btn border px-2 icon-hover">Chi tiết</i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                </div>
            </div>
        </section>
        <!-- Products -->
        <%@include file="footer.jsp" %>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous">

        </script>
    </body>
</html>
