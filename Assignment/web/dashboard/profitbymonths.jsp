<%-- 
    Document   : profitbymonths
    Created on : Jul 5, 2024, 4:08:24 PM
    Author     : DELL-PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/page.css"/><link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"><!-- comment -->
        
    </head>
    <body>
        <div>
            <form action="profitinfo" >
                Chọn tháng
                <select name="mon" onchange="this.form.submit()">
                    <c:forEach items="${sessionScope.months}" var="m" >
                        <option value="${m}" ${m == sessionScope.currmonth ? 'selected':''}>${m}</option>
                    </c:forEach>
                    
                </select>
                
                <noscript><input type=”submit” value=”Submit”></noscript>
            </form>
            <div class="row">
                <div class="col-lg-4 border center-content" style="background-color: #00d084">
                    <span style="font-weight: bold">Số đơn hàng được đặt</span><br>
                    
                </div>
                <div class="col-lg-4 border center-content" style="background-color: #00d084">
                    <span style="font-weight: bold"> Doanh thu</span><br>
                   
                </div>
                <div class="col-lg-4 border center-content" style="background-color: #00d084">
                    <span style="font-weight: bold">Số lượng hàng bán được</span><br>
                    
                </div>
                <div class="col-lg-4 border center-content">
                    <span style="font-weight: bold; color: red">${sessionScope.numoom}</span><br>
                    
                </div>
                <div class="col-lg-4 border center-content">
                    <span style="font-weight: bold; color: red">${sessionScope.proM}</span><br>
                    
                </div>
                <div class="col-lg-4 border center-content">
                    <span style="font-weight: bold; color: red">${sessionScope.quansold}</span><br>
                    
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous">

        </script>
    </body>
</html>
