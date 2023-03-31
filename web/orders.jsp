

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
                    <small ><i class='fa fa-long-arrow-left' ></i>&nbsp;Trở lại trang chủ</small>
                </a>
                
                <h2>Lịch sử giao dịch</h2>         
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Đơn hàng</th>
                            <th>Ngày</th>
                            <th>Trạng thái đơn hàng</th>
                            <th>Tổng</th>
                            <th>Chi tiết</th>
                        </tr>
                    </thead>
                    
                    <tbody>
                        <c:forEach items="${requestScope.listorder}" var="order">
                            <tr>
                                <td>${order.ID}</td>
                                <td>${order.thoigian}</td>
                                <td>${order.status.mota}</td>
                                <td><fmt:formatNumber pattern="###,###" value="${order.total}"/>đ</td>
                                <td style="text-align: center;"><a href="order-detail?order=${order.ID}"><i class='fas fa-eye' style='font-size:30px'></i></td>
                            </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </section>
    <%@include file="/pages/footer.jsp" %>
</body>

</html>
