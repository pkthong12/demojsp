

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
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <style>
            .container {
                padding: 2rem 0rem;
            }
            h4 {
                margin: 2rem 0rem 1rem;
            }
        </style>

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
                <a style="text-decoration: none; cursor: pointer; color: #386bc0" onclick="history.back()" ><small ><i class='fa fa-long-arrow-left' ></i>&nbsp;Trở lại lịch sử</small></a>


                <h2>Đơn hàng: ĐB-${requestScope.order.ID}</h2>
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
                            <td >Trạng thái </td>
                            <td colspan="3">${requestScope.order.status.mota}</td>
                        </tr>
                    </tbody>
                    <tfoot>
                        <tr>
                            <th style="font-weight: bold" colspan="3">Tổng tiền</th>
                            <th><fmt:formatNumber pattern="###,###" value="${requestScope.order.total}"/>đ</th>
                        </tr>
                    </tfoot>
                </table>

                <table class="table table-bordered" style="margin-top: 1%; border: 1px solid transparent">
                    <thead>
                        <c:if test="${requestScope.order.status.ID=='1'}">
                            <tr>
                                <th><buton type="button" data-toggle="modal" data-target="#myModal" class="btn btn-warning">Hủy đơn hàng</button></th>
                            </tr>
                        </c:if>
                        <c:if test="${requestScope.order.status.ID=='3'}">
                            <tr>
                                <th><a class="btn btn-warning" href="">Yêu cầu hủy đơn hàng</a></th>
                            </tr>
                        </c:if>
                        <c:if test="${requestScope.order.status.ID=='4'}">

                            <tr>
                                <th colspan="2"><a class="btn btn-success" href="">Đã nhận</a></th>
                                <th ><a data-toggle="modal" data-target="#kt_modal_1" style="float: right" class="btn btn-warning">Yêu cầu trả hàng/hoàn tiền</a></th>
                            </tr>
                        </c:if>
                        </thead>

                </table>
            </div>

        </section>
        <!-- The Modal -->
        <div class="modal fade" id="myModal">
            <form action="order-detail/cancelOrder" method="post">
                <div class="modal-dialog">
                    <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title">Lý do hủy đơn hàng:</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>

                        <!-- Modal body -->
                        <div class="modal-body ">

                            <div onclick="changeButton()" class="form-group custom-radio custom-control">
                                <input type="radio" id="customRadio1" value="Muốn thay đổi địa chỉ giao hàng" name="customRadio" class="custom-control-input huy" >
                                <label class="custom-control-label" for="customRadio1">Muốn thay đổi địa chỉ giao hàng</label>

                            </div>
                            <div onclick="changeButton()" class="form-group custom-radio custom-control">
                                <input  type="radio" id="customRadio2" value="Muốn nhập/thay đổi mã Voucher" name="customRadio" class="custom-control-input huy" >
                                <label class="custom-control-label" for="customRadio2">Muốn nhập/thay đổi mã Voucher</label>

                            </div>
                            <div onclick="changeButton()" class="form-group custom-radio custom-control">
                                <input type="radio" id="customRadio3" name="customRadio" value="Muốn thay đổi sản phẩm/số lượng trong đơn hàng" class="custom-control-input huy" >
                                <label class="custom-control-label" for="customRadio3">Muốn thay đổi sản phẩm/số lượng trong đơn hàng</label>

                            </div>
                            <div onclick="changeButton()" class="form-group custom-radio custom-control">
                                <input type="radio" id="customRadio4" value="Tìm thấy chỗ khác rẻ hơn" name="customRadio" class="custom-control-input huy" >
                                <label class="custom-control-label" for="customRadio4">Tìm thấy chỗ khác rẻ hơn</label>

                            </div>
                            <div onclick="changeButton()" class="form-group custom-radio custom-control">
                                <input  type="radio" id="customRadio5" value="Đổi ý, không mua nữa" name="customRadio" class="custom-control-input huy" >
                                <label  class="custom-control-label" for="customRadio5">Đổi ý, không mua nữa</label>

                            </div>
                            <div onclick="changeButton()" class="form-group custom-radio custom-control">
                                <input  type="radio" id="customRadio6" value="Khác" name="customRadio" class="custom-control-input huy" >
                                <label  class="custom-control-label" for="customRadio6">Khác:</label>
                                <textarea name="mess" disabled="" style="display: none" class="form-control" id="message-text"></textarea>
                            </div>
                        </div>

                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="button" class="btn" data-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-danger">Xác nhận hủy</button>
                        </div>

                    </div>
                </div>
            </form>
        </div>

        <div class="modal fade" tabindex="-1" id="kt_modal_1">
            <form action="order-detail/requestCancelOrder" method="post">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Lý do hoàn hàng:</h4>
                            <button type="button" aria-label="Close" class="close" data-dismiss="modal">&times;</button>
                        </div>

                        <div class="modal-body">
                            <div onclick="changeButton_hoan()" class="form-group custom-radio custom-control">
                                <input type="radio" id="customRadio7" value="Sản phẩm không giống mô tả" name="customRadio" class="custom-control-input hoan" >
                                <label class="custom-control-label" for="customRadio7">Sản phẩm không giống mô tả</label>
                            </div>
                            <div onclick="changeButton_hoan()" class="form-group custom-radio custom-control">
                                <input type="radio" id="customRadio8" value="Sản phẩm nhận được bị thiếu/sai/bể vỡ/đã qua sử dụng/giả nhái" name="customRadio" class="custom-control-input hoan" >
                                <label class="custom-control-label" for="customRadio8">Sản phẩm nhận được bị thiếu/sai/bể vỡ/đã qua sử dụng/giả nhái</label>
                            </div>
                            <div onclick="changeButton_hoan()" class="form-group custom-radio custom-control">
                                <input type="radio" id="customRadio9" name="customRadio" value="Muốn thay đổi sản phẩm/số lượng trong đơn hàng" class="custom-control-input hoan" >
                                <label class="custom-control-label" for="customRadio9">Chưa nhận được hàng sau thời gian giao hàng dự kiến</label>
                            </div>
                            <div onclick="changeButton_hoan()" class="form-group custom-radio custom-control">
                                <input type="radio" id="customRadio10" value="Tìm thấy chỗ khác rẻ hơn" name="customRadio" class="custom-control-input hoan" >
                                <label class="custom-control-label" for="customRadio10">Chưa nhận được hàng nhưng Shipper đã cập nhật giao hàng thành công</label>
                            </div>
                            <div onclick="changeButton_hoan()" class="form-group custom-radio custom-control">
                                <input  type="radio" id="customRadio11" value="Khác" name="customRadio" class="custom-control-input hoan" >
                                <label  class="custom-control-label" for="customRadio11">Khác:</label>
                                <textarea name="mess" disabled="" style="display: none" class="form-control" id="message-hoan"></textarea>
                            </div>

                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn" data-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-danger">Xác nhận hoàn hàng</button>
                        </div>
                    </div>
            </form>
        </div>
    </div>
    <%@include file="/pages/footer.jsp" %>

    <script>
        const VND = new Intl.NumberFormat('vi-VN', {
            style: 'currency',
            currency: 'VND',
        });
        var mess;
        var mess_other = document.getElementById('message-text');
        var mess_other_hoan = document.getElementById('message-hoan');
        function changeButton() {
            var radios = document.getElementsByClassName('huy');
            for (var i = 0; i < radios.length; i++) {
                if (radios[i].value === 'Khác' && radios[i].checked) {
                    mess_other.style.display = 'block';
                    mess_other.disabled = false;
                } else {
                    mess_other.style.display = 'none';
                    mess_other.disabled = true;
                }
            }
        }
        ;
        function changeButton_hoan() {
            var radios = document.getElementsByClassName('hoan');
            for (var i = 0; i < radios.length; i++) {
                if (radios[i].value === 'Khác' && radios[i].checked) {
                    mess_other_hoan.style.display = 'block';
                    mess_other_hoan.disabled = false;
                } else {
                    mess_other_hoan.style.display = 'none';
                    mess_other_hoan.disabled = true;
                }
            }
        }
        ;

    </script>
</body>

</html>
