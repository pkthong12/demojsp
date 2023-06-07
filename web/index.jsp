

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
        <style>
            #square-buttons {
                width: 10px;
                height: 10px;
                border-radius: 100%
            }
            .card:hover{
                box-shadow:rgba(0, 0, 0, 0.35) 0px 5px 15px;
                transform: translateY(-20px);
            }
            .card{
                transition: 0.6s;
            }
        </style>
    </head>
    <body>
        <%@include file="/pages/navbar.jsp" %>

        <header class="bg-dark py-5">
            <div id="carouselExampleIndicators" class="carousel slide" data-mdb-ride="carousel">
                <div class="carousel-indicators">
                    <button type="button" data-mdb-target="#carouselExampleIndicators" data-mdb-slide-to="0"
                            class="active" aria-current="true" 
                            aria-label="Slide 1"></button>
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
        <!-- Section-->
        <section  class="py-5">
            <center><h3>SÁCH MỚI</h3></center>
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <c:forEach items="${sessionScope.listBook}" var="book" begin = "0" end = "3">
                        <div class="col mb-5">
                            <a href="product?id=${book.id}">
                                <div class="card h-100">
                                    <!-- Sale badge-->
                                    <c:if test="${book.soluong <=2}">
                                        <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; left:  0.5rem">Hết hàng</div>
                                    </c:if>
                                    <c:if test="${book.stt ==3}">
                                        <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; left:  0.5rem">Đặt trước</div>
                                    </c:if>
                                    <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">-${book.giamgia}%</div>
                                    <!-- Product image-->
                                    <img style="height: 260px;" class="card-img-top" src="${book.img}" alt="..." />
                                    <!-- Product details-->
                                    <div class="card-body p-4">
                                        <div class="text-center">
                                            <!-- Product name-->
                                            <h5 style="display: -webkit-box;
                                                -webkit-line-clamp: 2;
                                                -webkit-box-orient: vertical;
                                                overflow: hidden;" class="fw-bolder">${book.tensach}</h5>
                                            <!-- Product reviews-->
                                            <div class="d-flex justify-content-center small text-warning mb-2">
                                                <div class="bi-star-fill"></div>
                                                <div class="bi-star-fill"></div>
                                                <div class="bi-star-fill"></div>
                                                <div class="bi-star-fill"></div>
                                                <div class="bi-star-fill"></div>
                                            </div>
                                            <!-- Product price-->
                                            <span class="text-muted text-decoration-line-through"><fmt:formatNumber pattern="###,###" value="${book.giaban}"/>₫</span>
                                            <fmt:formatNumber pattern="###,###" value="${book.giaban - book.giaban*book.giamgia/100}"/>₫
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <center><a href="collection?categoryid=2"><h3>Manga - Comic</h3></a></center>
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <c:set var="i" value="0"></c:set>
                    <c:forEach items="${sessionScope.listBook}" var="book">
                        <c:if test="${book.category.id ==2 && i<4}">
                            <c:set var="i" value="${i+1}"></c:set>
                                <div class="col mb-5">
                                    <a href="product?id=${book.id}">
                                    <div class="card h-100">
                                        <!-- Sale badge-->
                                        <c:if test="${book.soluong <=2}">
                                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; left:  0.5rem">Hết hàng</div>
                                        </c:if>
                                        <c:if test="${book.stt ==3}">
                                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; left:  0.5rem">Đặt trước</div>
                                        </c:if>
                                        <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">-${book.giamgia}%</div>
                                        <!-- Product image-->
                                        <img style="height: 260px;" class="card-img-top" src="${book.img}" alt="..." />
                                        <!-- Product details-->
                                        <div class="card-body p-4">
                                            <div class="text-center">
                                                <!-- Product name-->
                                                <h5 style="display: -webkit-box;
                                                    -webkit-line-clamp: 2;
                                                    -webkit-box-orient: vertical;
                                                    overflow: hidden;" class="fw-bolder">${book.tensach}</h5>
                                                <!-- Product reviews-->
                                                <div class="d-flex justify-content-center small text-warning mb-2">
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div>
                                                </div>
                                                <!-- Product price-->
                                                <span class="text-muted text-decoration-line-through"><fmt:formatNumber pattern="###,###" value="${book.giaban}"/>₫</span>
                                                <fmt:formatNumber pattern="###,###" value="${book.giaban - book.giaban*book.giamgia/100}"/>₫
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>

            <center><a href="collection?categoryid=4"><h3>Văn học Việt Nam</h3></a></center>
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <c:set var="i" value="0"></c:set>
                    <c:forEach items="${sessionScope.listBook}" var="book">
                        <c:if test="${book.category.id ==4 && i<4}">
                            <c:set var="i" value="${i+1}"></c:set>
                                <div class="col mb-5">
                                    <a href="product?id=${book.id}">
                                    <div class="card h-100">
                                        <!-- Sale badge-->
                                        <c:if test="${book.soluong <=2}">
                                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; left:  0.5rem">Hết hàng</div>
                                        </c:if>
                                        <c:if test="${book.stt ==3}">
                                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; left:  0.5rem">Đặt trước</div>
                                        </c:if>
                                        <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">-${book.giamgia}%</div>
                                        <!-- Product image-->
                                        <img style="height: 260px;" class="card-img-top" src="${book.img}" alt="..." />
                                        <!-- Product details-->
                                        <div class="card-body p-4">
                                            <div class="text-center">
                                                <!-- Product name-->
                                                <h5 style="display: -webkit-box;
                                                    -webkit-line-clamp: 2;
                                                    -webkit-box-orient: vertical;
                                                    overflow: hidden;" class="fw-bolder">${book.tensach}</h5>
                                                <!-- Product reviews-->
                                                <div class="d-flex justify-content-center small text-warning mb-2">
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div>
                                                </div>
                                                <!-- Product price-->
                                                <span class="text-muted text-decoration-line-through"><fmt:formatNumber pattern="###,###" value="${book.giaban}"/>₫</span>
                                                <fmt:formatNumber pattern="###,###" value="${book.giaban - book.giaban*book.giamgia/100}"/>₫
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>

            <center><h3>Manga - Comic</h3></center>
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <c:set var="i" value="0"></c:set>
                    <c:forEach items="${sessionScope.listBook}" var="book">
                        <c:if test="${book.category.id ==2 && i<4}">
                            <c:set var="i" value="${i+1}"></c:set>
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
                        </c:if>
                    </c:forEach>
                </div>
            </div>
        </section>
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
        <%@include file="/pages/footer.jsp" %>
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
            $('#myModal').on('shown.bs.modal', function () {
                $('#myInput').trigger('focus')
            })
        </script>
    </body>
</html>
