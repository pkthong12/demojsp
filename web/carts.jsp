<%-- 
    Document   : carts
    Created on : Feb 25, 2023, 4:40:24 PM
    Author     : ThinkPad X1 G4
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>  
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${sessionScope.configs.tenweb} - Giỏ hàng</title>
        <link REL="SHORTCUT ICON" HREF="img\icon.png">
        <link href="css/styles.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
              />

    </head>
    <body>

        <%@include file="/pages/navbar.jsp" %>

        <section class="h-100" style="background-color: #eee;">
            <div class="container h-100 py-5">
                <div style="width: fit-content;
                     margin-left: 9%;
                     margin-bottom:  2%;">
                    <a style="text-decoration: none;" href="index">
                        <h6><i class="fa fa-long-arrow-left" ></i>&nbsp;Trở lại</h6>
                    </a>
                </div>
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-10">

                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <h3 class="fw-normal mb-0 text-black">Giỏ hàng</h3>
                        </div>
                        <!--<form action="checkout">-->
                        <c:if test="${sessionScope.giohang.size()<=0 ||sessionScope.giohang ==null}">
                            <%@include file="/pages/carts_empty.jsp" %>
                        </c:if>

                        <c:if test="${sessionScope.giohang.size()>0}">
                            <c:forEach items="${sessionScope.giohang}" var="giohang">
                                <div class="card rounded-3 mb-4">
                                    <div class="card-body p-4">
                                        <div class="row d-flex justify-content-between align-items-center">

                                            <div class="col-md-2 col-lg-2 col-xl-2">
                                                <a href="product?id=${giohang.book.id}">
                                                    <img
                                                        src="${giohang.book.img}"
                                                        class="img-fluid rounded-3" alt="Cotton T-shirt">
                                                </a>

                                            </div>
                                            <div class="col-md-3 col-lg-3 col-xl-3">
                                                <p class="lead fw-normal mb-2"><a  style="font-weight: 500;" href="product?id=${giohang.book.id}">${giohang.book.tensach}</a></p>

                                            </div>
                                            <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
                                                <button class="btn btn-link px-2"
                                                        onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
                                                    <i class="fas fa-minus"></i>
                                                </button>

                                                <input id="form1" min="1" name="quantity" value="${giohang.soluong}" type="number"
                                                       class="form-control form-control-sm text-center" />

                                                <button class="btn btn-link px-2"
                                                        onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
                                                    <i class="fas fa-plus"></i>
                                                </button>
                                            </div>
                                            <c:set var="gia" value="${giohang.book.giaban - giohang.book.giaban*giohang.book.giamgia/100}"></c:set>
                                                <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                                                    <h5 class="mb-0"><fmt:formatNumber pattern="###,###" value="${gia*giohang.soluong}"/>₫</h5>
                                            </div>
                                            <div style="display: contents; margin-top: 0.5%" class="col-md-1 col-lg-1 col-xl-1 text-end">
                                                <input name="select" type="checkbox" value="${giohang.book.id}" />
                                                <a href="remove?bookid=${giohang.book.id}" class="text-danger"><i class="fas fa-trash fa-lg"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            <div class="card mb-4">
                                <div style="justify-content: flex-end;" class="card-body p-4 d-flex flex-row">

                                    <button onclick="uctype="button" class="btn btn-outline-warning btn-lg ms-3">Cập nhật giỏ hàng</button>
                                </div>
                            </div>

                            <div class="card">
                                <div class="card-body">
                                    <button onclick="check()" type="submit" class="btn btn-warning btn-block btn-lg">Thanh toán</button>
                                </div>
                            </div>
                        </c:if>


                    </div>
                </div>
            </div>
        </section>

        <%@include file="/pages/footer.jsp" %>
    </body>
    <script language="javascript">
        function check() {
            var checkbox = document.getElementsByName('select');
            var quantity = document.getElementsByName('quantity');
            var result = "0thdzvkl0";
            for (var i = 0; i < checkbox.length; i++) {
                if (checkbox[i].checked === true) {
                    result += 'tdz' + checkbox[i].value + 'thdzvkl' + quantity[i].value;
                }
            }
            if (result === "0thdzvkl0") {
                alert("cuối đầu bài");
            } else {
                window.location = "checkout?order=" + result;
            }
        }
        function updatecarts() {
            var checkbox = document.getElementsByName('select');
            var quantity = document.getElementsByName('quantity');
            var result = "0:0";
            for (var i = 0; i < checkbox.length; i++) {
                result += ',' + checkbox[i].value + ':' + quantity[i].value;
            }
            window.location = "updatecarts?sql=" + result;
        }
        

    </script>
</html>
