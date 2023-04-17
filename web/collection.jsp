<%-- 
    Document   : index
    Created on : Feb 22, 2023, 3:22:47 PM
    Author     : ThinkPad X1 G4
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>  
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${sessionScope.configs.tenweb}</title>
        <link REL="SHORTCUT ICON" HREF="img\icon.png">
        <link href="css/styles.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <link href="css/sb-admin-2.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
        <style>
            .searchbar{
                margin-bottom: auto;
                margin-top: auto;
                height: 50px;
                background-color: #353b48;
                border-radius: 20px;
                padding: 6px;
            }

            .search_input{
                color: white;
                border: 0;
                outline: 0;
                background: none;
                width: 0;
                line-height: 30px;
                transition: width 0.4s linear;
            }

            .searchbar:hover > .search_input{
                /*padding: 0 10px;*/
                width: 200px;
                caret-color:red;
                transition: width 0.4s linear;
            }

            .searchbar:hover > .search_icon{
                background: white;
                color: #e74c3c;
            }

            .search_icon{
                height: 40px;
                width: 40px;
                float: right;
                display: flex;
                justify-content: center;
                align-items: center;
                border-radius: 50%;
                color:white;
                text-decoration:none;
            }
            .card:hover{
                box-shadow:rgba(0, 0, 0, 0.35) 0px 5px 15px;
                transform: translateY(-10px);
            }
            .card{
                transition: 0.6s;
            }
            .bloc_left_price {
                color: #c01508;
                text-align: center;
                font-weight: bold;
                font-size: 150%;
            }
            .category_block li:hover {
                background-color: #007bff;
            }
            .category_block a:hover .list-group-item {
                color: #ffffff;
            }
            .category_block li a {
                color: #343a40;
            }
            .add_to_cart_block .price {
                color: #c01508;
                text-align: center;
                font-weight: bold;
                font-size: 200%;
                margin-bottom: 0;
            }
            .add_to_cart_block .price_discounted {
                color: #343a40;
                text-align: center;
                text-decoration: line-through;
                font-size: 140%;
            }
            .product_rassurance {
                padding: 10px;
                margin-top: 15px;
                background: #ffffff;
                border: 1px solid #6c757d;
                color: #6c757d;
            }
            .product_rassurance .list-inline {
                margin-bottom: 0;
                text-transform: uppercase;
                text-align: center;
            }
            .product_rassurance .list-inline li:hover {
                color: #343a40;
            }
            .reviews_product .fa-star {
                color: gold;
            }
            .pagination {
                margin-top: 20px;
            }
            .clmm{
                width: 47%;
            }
            .btn-block{
                --mdb-btn-margin-top: 0;
            }
        </style>
    </head>
    <body>
        <%@include file="/pages/navbar.jsp" %>


        <header class="bg-dark py-5">
            <div id="carouselExampleIndicators" class="carousel slide" data-mdb-ride="carousel">
                <div class="carousel-indicators">
                    <button type="button" data-mdb-target="#carouselExampleIndicators" data-mdb-slide-to="0"
                            class="active" aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-mdb-target="#carouselExampleIndicators" data-mdb-slide-to="1"
                            aria-label="Slide 2"></button>
                    <button type="button" data-mdb-target="#carouselExampleIndicators" data-mdb-slide-to="2"
                            aria-label="Slide 3"></button>
                    <button type="button" data-mdb-target="#carouselExampleIndicators" data-mdb-slide-to="3"
                            aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="img/banner/ms_banner_img2.webp" class="d-block w-100"
                             alt="Hội chứng tuổi thanh xuân - tập 9" />
                    </div>
                    <div class="carousel-item">
                        <img src="img/banner/ms_banner_img3.webp" class="d-block w-100" alt="Camera" />
                    </div>
                    <div class="carousel-item">
                        <img src="img/banner/ms_banner_img4.webp" class="d-block w-100"
                             alt="Học viện siêu anh hùng - Tập 31" />
                    </div>
                    <div class="carousel-item">
                        <img src="img/banner/ms_banner_img5.webp" class="d-block w-100"
                             alt="Học viện siêu anh hùng - Tập 31" />
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-mdb-target="#carouselExampleIndicators"
                        data-mdb-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-mdb-target="#carouselExampleIndicators"
                        data-mdb-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </header>
        <div style="width: fit-content;
             margin-left: 4%;
             margin-top: 3%;">
            <a style="text-decoration: none;" href="index">
                <h6><i class="fa fa-long-arrow-left" ></i>&nbsp;Trở lại</h6>
            </a>
        </div>

        <div style="margin-top:5%" class="container">
            <div class="row">
                <div  class="col-12 col-sm-3">
                    <div style="margin-bottom: 5.5%;" class="input-group">

                        <div class="searchbar">
                            <input id="search" onkeyup="timkiem()" class="search_input" type="text" name="" placeholder="Tìm kiếm...">
                            <p href="#" class="search_icon"><i class="fas fa-search"></i></p>
                        </div>
                    </div>
                    <div class="card bg-light mb-3">
                        <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-list"></i> Danh mục sản phẩm</div>
                        <ul class="list-group category_block">
                            <a href="collection"><li style="font-weight: bold; color: red " class="list-group-item">Tất cả sản phẩm</li></a>
                                    <c:forEach items="${sessionScope.listCategory}" var="c">
                                <a href="collection?categoryid=${c.id}"><li class="list-group-item">${c.tenloai}</li></a>
                                    </c:forEach>
                        </ul>
                    </div>
                </div>
                <div class="col">
                    <div class="row">
                        <h4 style="margin-bottom: 3%">${requestScope.loai}</h4>

                        <h1 id="noti" style="<c:if test="${ requestScope.listbookID.size()!=0}">display: none </c:if>">Không có kết quả nào</h1>


                        <c:if test="${requestScope.listbookID.size()!=0}">

                            <c:forEach items="${requestScope.listbookID}" var="book">

                                <div  style="margin-bottom: 5%;" class="col-12 col-md-6 col-lg-4 item">
                                    <a href="product?id=${book.id}">

                                        <div class="card">
                                            <img style="height: 0%;" class="card-img-top" src="${book.img}" alt="${book.tensach}">
                                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">-${book.giamgia}%</div>
                                            <div class="card-body">
                                                <h5
                                                    style="display: -webkit-box;
                                                    -webkit-line-clamp: 2;
                                                    -webkit-box-orient: vertical;
                                                    overflow: hidden;" class="card-title" >${book.tensach}</h5>
                                                <div class="row">
                                                    <div style="display: flex;
                                                         justify-content: space-between;" class="col">
                                                        <p class="clmm btn btn-danger text-decoration-line-through" style="color: white;--mdb-btn-margin-top: 0;" class=""><fmt:formatNumber pattern="###,###" value="${book.giaban}"/>₫</p>
                                                        <p class="clmm btn btn-success "><fmt:formatNumber pattern="###,###" value="${book.giaban - book.giaban*book.giamgia/100}"/>₫</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </c:forEach>
                        </c:if>

                        <div class="col-12">
                            <nav aria-label="...">
                                <ul class="pagination">
                                    <li class="page-item disabled">
                                        <a class="page-link" href="#" tabindex="-1">Previous</a>
                                    </li>
                                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                                    <li class="page-item active">
                                        <a class="page-link" href="#">2 <span class="sr-only">(current)</span></a>
                                    </li>
                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                    <li class="page-item">
                                        <a class="page-link" href="#">Next</a>
                                    </li>
                                </ul>
                            </nav>
                        </div>

                    </div>
                </div>

            </div>
        </div>
        <button style="position: fixed;
                bottom: 20px;
                right: 20px;
                display: none;"
                type="button"
                class="btn btn-danger btn-floating btn-lg"
                id="btn-back-to-top"
                >
            <i class="fas fa-arrow-up"></i>
        </button>
        <script>

            let mybutton = document.getElementById("btn-back-to-top");

// When the user scrolls down 20px from the top of the document, show the button
            window.onscroll = function () {
                scrollFunction();
            };

            function scrollFunction() {
                if (
                        document.body.scrollTop > 100 ||
                        document.documentElement.scrollTop > 100
                        ) {
                    mybutton.style.display = "block";
                } else {
                    mybutton.style.display = "none";
                }
            }
// When the user clicks on the button, scroll to the top of the document
            mybutton.addEventListener("click", backToTop);

            function backToTop() {
                document.body.scrollTop = 0;
                document.documentElement.scrollTop = 0;
            }
            function timkiem() {
                var search, filter, li, a, i, count = 0, txtValue;
                const show = document.querySelector(".search_input");
                const noti = document.querySelector("#noti");
                search = document.getElementById("search");
                if (search !== '' || search !== null) {
                    show.style.width = "200px";
                    filter = search.value.toUpperCase();
                    li = document.getElementsByClassName("item");
                    for (i = 0; i < li.length; i++) {
                        a = li[i].getElementsByTagName("h5")[0];
                        txtValue = a.textContent || a.innerText;
                        if (txtValue.toUpperCase().indexOf(filter) > -1) {
                            count++;
                            li[i].style.display = "";
                        } else {
                            li[i].style.display = "none";
                        }
                    }
                    if (count === 0) {
                        noti.style.display = "block";
                    } else {
                        noti.style.display = "none";
                    }
                }

            }
        </script>

        <%@include file="/pages/footer.jsp" %>
    </body>
</html>
