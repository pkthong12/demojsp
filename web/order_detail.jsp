

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
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">


    </head>
    <body>
        <%@include file="/pages/navbar.jsp" %>
        <header class="bg-dark py-5">
            <div id="carouselExampleIndicators" class="carousel slide" data-mdb-ride="carousel">
                <div class="carousel-indicators">

                </div>
                <div class="carousel-inner">

                </div>
            </div>
        </header>

        <section  class="py-5">
            <div class="container">
                <a href="index">
                    <small ><i class='fa fa-long-arrow-left' ></i>&nbsp;Trở lại lịch sử</small>
                </a>

                <h2>Đơn hàng: ${requestScope.order.ID}</h2>
                <small>Ngày: ${requestScope.order.thoigian}</small>
                <table style="margin-top: 1%;" class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Sản phẩm</th>
                            <th>Đơn giá</th>
                            <th>Số lượng</th>
                            <th>Tổng</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th style="font-weight: bold" colspan="3">Tổng tiền</th>
                            <th><fmt:formatNumber pattern="###,###" value="${requestScope.order.total}"/>đ</th>
                        </tr>
                    </tfoot>
                    <tbody>
                        <c:forEach items="${requestScope.listdetail}" var="detail">
                            <tr>
                                <td style="color: #d51c24">${detail.tensach}</td>
                                <td><fmt:formatNumber pattern="###,###" value="${detail.giaban}"/>đ</td>
                                <td>${detail.soluong}</td>
                                <td><fmt:formatNumber pattern="###,###" value="${detail.thanhtien}"/>đ</td>
                            </tr>
                        </c:forEach>

                        <tr>
                            <td colspan="3">Phí ship</td>
                            <td><fmt:formatNumber pattern="###,###" value="${requestScope.order.phiship}"/>đ</td>
                        </tr>
                       
                        <tr>
                            <td colspan="3">Tạm tính</td>
                            <td><fmt:formatNumber pattern="###,###" value="${requestScope.order.totalFirst}"/>đ</td>
                        </tr>
                        <tr>
                            <td colspan="3">Giảm giá</td>
                            <td>${requestScope.order.giamgia}%</td>
                        </tr>
                         <tr>
                             
                            <td>Địa chỉ nhận hàng</td>
                            <td colspan="3">${requestScope.order.diachi}</td>

                        </tr>
                        <tr>
                            <td >Trạng thái</td>
                            <td colspan="3">${requestScope.order.status.mota}</td>
                        </tr>
                    </tbody>
                </table>
            </div>

        </section>

        <%@include file="/pages/footer.jsp" %>

        <script>
            const VND = new Intl.NumberFormat('vi-VN', {
                style: 'currency',
                currency: 'VND',
            });
        </script>
    </body>

</html>
