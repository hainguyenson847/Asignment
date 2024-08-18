<%-- 
    Document   : headerbottom
    Created on : Jul 1, 2024, 1:26:06 PM
    Author     : DELL-PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/nav.css"/>
        <link rel="stylesheet" href="css/page.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"><!-- comment -->

        <style>
            .sear {
                border: none;
                height: 30px;
                margin-top: 10px;
                border-radius: 8px;
                cursor: pointer;
            }
            .sear:hover {
                background: gray;
                color: wheat;
            }
        </style>
    </head>
    <body>
        <div class="breeds-header fullscreen-section">
            <div class="container">
                <div class="breeds-header-content">
                    <h1 class="breeds-header-title">
                        Cat's Shop </h1>
                    <form action="search">
                        <div class="breeds-header-find">
                            <input type="text" class="breed-search" placeholder="Tìm kiếm theo tên sản phẩm..." name="sk">
                        </div>
                        <input class="sear" type="submit" value="Tìm kiếm"/>
                    </form>


                </div>

            </div>

        </div>
        


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous">

        </script>
    </body>
</html>
