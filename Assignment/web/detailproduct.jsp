<%-- 
    Document   : detailproduct
    Created on : Jul 2, 2024, 4:36:14 PM
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

        <section>

            <div class="container">
                <h1 style="font-family: sans-serif; font-weight: bold; color: black">Thông tin sản phẩm</h1><br>
                <c:set value="${sessionScope.dp}" var="dp"/>
                <div class="row"  style="border: 1px gainsboro solid; margin-bottom: 30px">
                    <div style=" border: 1px gray solid; padding: 0 " class="col-lg-6 col-md-6 col-sm-6 prd_view_slide">
                        <img src="${dp.image}" style="width: 100%"/>
                    </div>
                    <div style="color: black; padding: 20px; text-align: justify" class="col-lg-6 col-md-6 col-sm-6 ">
                        <form action="cart" method="get">
                            <input type="text" name="pi" value="${dp.pid}" readonly="" style="text-align: center; border: none; width: 30px; display: none"/>
                            <h3>${dp.productName}</h3>
                            <p style="font-family: sans-serif">Ngày ra mắt: &nbsp;${dp.releaseDate}</p>
                            <div style="color: #D3006D; font-weight: bolder; font-size: 30px; margin-top: 20px">
                                <c:if test="${dp.discount != 0}">

                                    <div style="display: flex; justify-content: space-between; ">
                                        <p class="card-text"><del style="color: grey; ">${Integer(dp.salePrice / 1000)}.000đ</del>&nbsp; ${Integer((dp.salePrice - (dp.salePrice  * dp.discount)) / 1000)}.000đ</p>
                                        <span style="width: 110px; border-radius: 8px; color: white; background-color: red; padding-left: 5px; height: 40px; font-weight: bold; padding-bottom: 3px">-${dp.discount * 100}%</span>
                                    </div>
                                </c:if>
                                <c:if test="${dp.discount == 0}">
                                    <p class="card-text">${Integer(dp.salePrice / 1000)}.000đ</p>
                                </c:if>
                            </div>

                            <div>
                                <h5 style="font-family: sans-serif; font-weight: bold">Mô tả</h5><br><!-- comment -->
                                ${dp.description}
                            </div>

                            <div style="margin-top: 100px; height: 50px">
                                <hr>
                                <div>
                                    Số lượng còn lại: ${dp.quantity}
                                </div>
                                Số lượng: 
                                <button ${dp.quantity == 0 ? 'disabled':''} type="button" style="border: 1px grey solid; height: 100%; width: 40px" onclick="if (parseInt(document.getElementById('quan').value) > 1)
                                        {
                                            var a = parseInt(document.getElementById('quan').value) - 1;
                                            document.getElementById('quan').value = a;
                                            document.getElementById('outofrange').innerHTML = '';
                                        }">-</button>
                                <input id="quan" value="${dp.quantity == 0 ? 0:1}"  name="quantity" min="0" style="width: 30px; text-align: center;  height: 100%; width: 40px" readonly=""/>
                                <button type="button" ${dp.quantity == 0 ? 'disabled':''} style="border: 1px grey solid;  height: 100%; width: 40px" onclick="

                                        var a = parseInt(document.getElementById('quan').value);
                                        if (a >= ${dp.quantity}) {
                                            document.getElementById('outofrange').innerHTML = 'Đã đạt số lượng hàng tối đa còn lại';
                                        } else {
                                            document.getElementById('quan').value = a + 1;
                                            document.getElementById('outofrange').innerHTML = '';
                                        }

                                        ">+</button>
                                &nbsp;
                                <span>
                                    <c:if test="${dp.quantity == 0}">
                                        <button type="submit" disabled=""  style="background-color: #D3006D; color: white; border: 1px pink solid; margin-left: 60px; height: 100%; ; width: 190px; font-weight: bold; "> Hết hàng</button>

                                    </c:if>
                                    <c:if test="${dp.quantity > 0}" >
                                        <button type="submit"   style="background-color: #D3006D; color: white; border: 1px pink solid; margin-left: 60px; height: 100%; ; width: 190px; font-weight: bold; "><img src="//bizweb.dktcdn.net/100/232/658/themes/562231/assets/cart_details.png?1717820562774" style="color: white">  Thêm vào giỏ</button>
                                    </c:if>
                                </span>
                                <div id="outofrange${li.pid}" style="color: red">

                                </div>
                            </div>
                        </form>
                    </div>
                </div>


            </div>
        </section>
        <div>
            <center>
                <h5 style="font-family: sans-serif; font-weight: bold">Các sản phẩm tương tự</h5><br>


                <div class="row container">
                    <c:forEach items="${sessionScope.rlist}" var="li">
                        <div class="col-lg-3 col-md-3 col-sm-3 d-flex">
                            <div class="card w-100 my-2 shadow-2-strong">
                                <img src="${li.image}" class="card-img-top" style="aspect-ratio: 1 / 1" />
                                <div class="card-body d-flex flex-column">
                                    <a href="detail?pid=${li.pid}" style="text-decoration: none; color: black"><p class="card-title">${li.productName}</p></a>
                                        <c:if test="${li.discount != 0}">

                                        <div style="display: flex; justify-content: space-around; ">
                                            <p class="card-text"><del style="color: grey;margin-right: 10px; ">${Integer(li.salePrice / 1000)}.000đ</del>${Integer((li.salePrice - (li.salePrice  * li.discount)) / 1000)}.000đ</p>
                                            <span style="width: 60px; border-radius: 8px; color: white; background-color: red; padding: 4px 0; height: 25px; font-weight: bold; padding-bottom: 3px">-${li.discount * 100}%</span>
                                        </div>
                                    </c:if>
                                    <c:if test="${li.discount == 0}">
                                        <p class="card-text">${Integer(li.salePrice / 1000)}.000đ</p>
                                    </c:if>

                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </center>
        </div>


        <%@include file="footer.jsp" %>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous">

        </script>
    </body>
</html>
