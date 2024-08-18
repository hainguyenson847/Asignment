<%-- 
    Document   : login
    Created on : Jun 26, 2024, 8:30:53 PM
    Author     : DELL-PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="jakarta.servlet.http.Cookie"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <script src="https://use.fontawesome.com/f59bcd8580.js"></script>
        <link rel="stylesheet" href="css/login.css"/>

    </head>
    <body>
        <div class="container">
            <div class="row m-5 no-gutters shadow-lg">
                <div class="col-md-6 d-none d-md-block">
                    <a href="home">
                        <img src="img/logo_en.png" style="min-height:10%; margin-top: 200px; margin-left: 50px" />
                    </a>
                    
                </div>
                <div class="col-md-6 bg-white p-5">
                    <h3 class="pb-3">Login Form</h3>
                    <div class="form-style">
                        <form action="login" method="post">
                            <c:set value="${pageContext.request.cookies}" var="cookie" />
                            <div class="form-group pb-3"> 
                                <c:if test="${sessionScope.u != null}">
                                    <input type="text" name="Username" placeholder="Username" class="form-control" id="exampleInputEmail1" value="${sessionScope.u}"  >   
                                </c:if>
                                <c:if test="${sessionScope.u == null}">
                                    <input type="text" name="Username" placeholder="Username" class="form-control" id="exampleInputEmail1" value="${cookie.cu.value}"  >   
                                </c:if> 
                                
                            </div>
                            <c:if test="${sessionScope.errU != null}">
                                <p style="color: red">${sessionScope.errU}</p>
                            </c:if>
                            <div class="form-group pb-3">   
                                <input type="password" name="Password" placeholder="Password" class="form-control" id="exampleInputPassword1" value="${cookie.cp.value}">
                            </div>
                            <c:if test="${sessionScope.errP != null}">
                                <p style="color: red">${sessionScope.errP}</p>
                            </c:if>
                            <div class="d-flex align-items-center justify-content-between">
                                <div class="d-flex align-items-center"><input name="rem" ${cookie.cr.value != null? 'checked':''} type="checkbox" value=""  /> <span class="pl-2 font-weight-bold">&nbsp Remember Me</span></div>
                                <div><a href="#">Forget Password?</a></div>
                            </div>

                            <div class="pb-2">
                                <button type="submit" class="btn btn-dark w-100 font-weight-bold mt-2">Log In</button>
                            </div>
                        </form>
                        <div class="sideline">OR</div>
                        <div>
                            <button type="submit" class="btn btn-primary w-100 font-weight-bold mt-2"><i class="fa fa-facebook" aria-hidden="true"></i> Login With Facebook</button>
                        </div>
                        <div class="pt-4 text-center">
                            Dont't have an account? <a href="signup">Sign Up</a>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </body>
</html>
