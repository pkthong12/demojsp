<%-- 
    Document   : product
    Created on : Feb 22, 2023, 9:33:49 PM
    Author     : ThinkPad X1 G4
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>  
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${sessionScope.configs.tenweb} - ${book.tensach}</title>
        <link REL="SHORTCUT ICON" HREF="img\icon.png">
        <link href="css/styles.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>

    </head>
    <body>
        <div id="fb-root"></div>
        <script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v16.0&appId=308936717220243&autoLogAppEvents=1" nonce="IAl5ngUV"></script>
        <%@include file="/pages/navbar.jsp" %>
        <c:set var="book" value="${requestScope.book}"></c:set>
            <form action="add" method="post">
                <section class="py-5">
                    <a style="text-decoration: none; cursor: pointer; color: #386bc0" onclick="history.back()" >
                        <h6 style="margin-left: 13%"><i class="fa fa-long-arrow-left" ></i>&nbsp;Trở lại</h6>
                    </a>
                    <div class="container px-4 px-lg-5 my-5">
                        <div class="row gx-4 gx-lg-5 align-items-center">

                            <div class="col-md-6">

                                <center class="the ">
                                    <div class="badge bg-dark text-white position-absolute" style="margin: 1%;">-${book.giamgia}%</div>
                                <img class="card-img-top mb-5 mb-md-0" src="${book.img}" alt="..." style="
                                     height: 8%;
                                     width: 70%;">
                            </center>
                        </div>

                        <div class="col-md-6">

                            <div class="small mb-1">MÃ SÁCH: ${book.id} </div>
                            <h1 style="font-size: 2rem;" class="display-5 fw-bolder">${book.tensach}</h1>
                            <div class="fs-5 mb-5">
                                <span class="text-decoration-line-through"><fmt:formatNumber pattern="###,###" value="${book.giaban}"/>₫</span>
                                <span style="color: red;"><fmt:formatNumber pattern="###,###" value="${book.giaban - book.giaban*book.giamgia/100}"/>₫</span>
                            </div>
                            <p class="lead">Tác giả: <a href="#" style="color: red;font-weight: 500;"> ${book.tacgia}</a></p>
                            <p class="lead">Định dạng: ${book.dinhdang}</p>
                            <p class="lead">Trọng lượng: <fmt:formatNumber pattern="###,###" value="${book.trongluong}"/> gram</p>
                            <p class="lead">Thể loại: <a href="collection?categoryid=${book.category.id}" style="color: red; font-weight: 500;"> ${book.category.tenloai}</a></p>
                            <p class="lead">Đã bán: ${book.daban}</p>
                            <div class="d-flex">
                                <input type="hidden" class="text-center" readonly name="bookid" value="${book.id}"/>
                                <input name="soluong" class="form-control text-center me-3" id="inputQuantity" min="1" max="${book.soluong}" pattern="[-+]?[0-99]" type="number" value="1" style="max-width: 5rem" />
                                <c:if test="${book.soluong > 2&&book.stt==5}">
                                    <input value="Thêm vào giỏ hàng"  class="btn btn-outline-dark flex-shrink-0" type="submit"/>
                                </c:if>
                                <c:if test="${book.soluong <=2||book.stt==4}">
                                    <input value="Tạm hết hàng"  class="btn btn-outline-dark flex-shrink-0" disabled="disabled" type="submit"/>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </form>

        <section class="py-5 bg-light">
            <div class="container px-4 px-lg-5 mt-5">
                <h2 class="fw-bolder mb-4">Bình luận</h2>
                <div  class="fb-comments" data-href="https://phungkimthong.online/${book.id}"  data-numposts="5"></div>
            </div>
        </section>
        <!-- Related items section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <h2 class="fw-bolder mb-4"> Sách liên quan</h2>
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <c:set var="i" value="0"></c:set>
                    <c:forEach items="${sessionScope.listBook}" var="cc">
                        <c:if test="${cc.category.id ==book.category.id && i<4}">
                            <c:set var="i" value="${i+1}"></c:set>
                                <div class="col mb-5">
                                    <a href="product?id=${cc.id}">
                                    <div class="card h-100">
                                        <!-- Sale badge-->
                                        <c:if test="${cc.soluong <=2}">
                                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; left:  0.5rem">Hết hàng</div>
                                        </c:if>
                                        <c:if test="${cc.stt ==3}">
                                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; left:  0.5rem">Đặt trước</div>
                                        </c:if>
                                        <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">-${cc.giamgia}%</div>
                                        <!-- Product image-->
                                        <img style="height: 260px;" class="card-img-top" src="${cc.img}" alt="..." />
                                        <!-- Product details-->
                                        <div class="card-body p-4">
                                            <div class="text-center">
                                                <!-- Product name-->
                                                <h5 style="display: -webkit-box;
                                                    -webkit-line-clamp: 2;
                                                    -webkit-box-orient: vertical;
                                                    overflow: hidden;" class="fw-bolder">${cc.tensach}</h5>
                                                <!-- Product reviews-->
                                                <div class="d-flex justify-content-center small text-warning mb-2">
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div>
                                                </div>
                                                <!-- Product price-->
                                                <span class="text-muted text-decoration-line-through"><fmt:formatNumber pattern="###,###" value="${cc.giaban}"/>₫</span>
                                                <fmt:formatNumber pattern="###,###" value="${cc.giaban - cc.giaban*cc.giamgia/100}"/>₫
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
        </section>

        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <%@include file="/pages/footer.jsp" %>
    </body>
</html>
