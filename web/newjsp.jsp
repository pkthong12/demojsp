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
        <title>Nhà sách ĐB</title>
        <link REL="SHORTCUT ICON" HREF="img\icon.png">
        <link href="css/styles.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <style>
            .card:hover{
                box-shadow:rgba(0, 0, 0, 0.35) 0px 5px 15px;
                transform: translateY(-20px);
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
            .category_block li:hover a {
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

        <div style="margin-top:5%" class="container">
            <div class="row">
                <div class="col-12 col-sm-3">
                    <div class="card bg-light mb-3">
                        <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-list"></i> Danh mục sản phẩm</div>
                        <ul class="list-group category_block">
                            <c:forEach items="${sessionScope.listCategory}" var="c">
<li class="list-group-item"><a href="category.html">${c.tenloai}</a></li>
                                </c:forEach>

                        </ul>
                    </div>
                </div>
                <div class="col">
                    <div class="row">
                        <c:forEach items="${sessionScope.listBook}" var="book">

                            <div style="margin-bottom: 5%;" class="col-12 col-md-6 col-lg-4">
                                <a href="product?id=${book.id}">
                                    <div class="card">
                                        <img style="height: 0%;" class="card-img-top" src="${book.img}" alt="Card image cap">
                                        <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">-${book.giamgia}%</div>
                                        <div class="card-body">
                                            <h5
                                                
                                                style="display: -webkit-box;
                                                -webkit-line-clamp: 2;
                                                -webkit-box-orient: vertical;
                                                overflow: hidden;" class="card-title">${book.tensach}</h5>

                                            <div class="row">
                                                <div class="col">
                                                    <p class="btn btn-danger btn-block  text-decoration-line-through" style="color: white" class=""><fmt:formatNumber pattern="###,###" value="${book.giaban}"/>₫</p>
                                                </div>
                                                <div class="col">
                                                    <a class="btn btn-success btn-block"><fmt:formatNumber pattern="###,###" value="${book.giaban - book.giaban*book.giamgia/100}"/>₫</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>
                        
                        
                    </div>
                </div>

            </div>
        </div>


        <%@include file="/pages/footer.jsp" %>
    </body>
</html>