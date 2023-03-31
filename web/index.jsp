

<%@page import="java.util.Base64"%>
<%@ page import="java.sql.*"%>

<%@ page import="java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>File Upload</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            *{
                font-family: 'Roboto Condensed', Arial;
                box-sizing: border-box;
            }

            #input {
                width: 100%;
                font-size: 16px;
                padding: 12px 20px 12px 40px;
                border: 1px solid
                    margin-bottom: 12px;
                #ddd;
            }
            #myUL {
                list-style-type: none;
                padding: 0;
                margin: 0;
            }
            #myUL li a {
                border: 1px solid #ddd;
                margin-top: -1px;
                background-color:
                    padding: 12px;
                #eae2b7;
                text-decoration: none;
                font-size: 18px;
                color: black;
                display: block
            }
            #myUL li a:hover:not(.header) {
                background-color:
                    #003049;
                color: white;
            }
        </style>
    </head>
    <body>
        <h2>DANH BẠ</h2>
        <input type="text" id="input" onkeyup="timkiem()" placeholder="Search for names.."> 
        <ul id="myUL">
            <li><a href="#">An</a></li> 
            <li><a href="#">Bảo</a></li> 
            <li><a href="#">Bình</a></li> 
            <li><a href="#">Hiền</a></li> 
            <li><a href="#">Huyền</a></li> 
            <li><a href="#">Mai</a></li> 
            <li><a href="#">Minh</a></li> 
            <li><a href="#">Tuấn</a></li>
            <li><a href="#">Văn</a></li> 
            <li><a href="#">Yến</a></li>
        </ul>

    </body>
    <script type="text/javascript">
        function timkiem() {
// Khai báo các biến
            var input, filter, ul, li, a, i, txtValue;
            input = document.getElementById("input");
            
            filter = input.value.toUpperCase();
            ul = document.getElementById("myUL");
            li = ul.getElementsByTagName("li");
//Lặp lại tất cả các mục trong danh sách và ẩn những mục không khớp với truy vấn tìm kiếm 
            for (i = 0; i < li.length; i++) {
                a = li[i].getElementsByTagName("a")[0];
                txtValue = a.textContent || a.innerText;
                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                    li[i].style.display="";
                }
                
                else {
                    li[i].style.display = "none";
                }
            }
        }
    </script>

</html>
