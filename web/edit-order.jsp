<%-- 
    Document   : tbl-user
    Created on : Mar 11, 2023, 10:25:40 PM
    Author     : ThinkPad X1 G4
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>  
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link REL="SHORTCUT ICON" HREF="img\icon.png">
        <title>SB Admin 2 - Chi tiết</title>

        <!-- Custom fonts for this template -->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/sb-admin-2.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <!-- Custom styles for this page -->
        <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

        <style>

        </style>
    </head>

    <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            <%@include file="pages-admin/navbar.jsp" %>
            <!-- End of Sidebar -->

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">

                    <!-- Topbar -->
                    <%@include file="pages-admin/topbar.jsp" %>
                    <!-- End of Topbar -->

                    <!-- Begin Page Content -->
                    <div class="container-fluid">

                        <!-- Page Heading -->
                        <div class="d-sm-flex align-items-center justify-content-between mb-4">
                            <h1 class="h3 mb-0 text-gray-800">Chi tiết đơn hàng</h1>
                        </div>

                        <!-- DataTales Example -->
                        <div class="card shadow mb-4">

                            <div class="card-body">
                                <a style="text-decoration: none; cursor: pointer; color: #386bc0" onclick="history.back()" >
                                    <h6 ><i class="fa fa-long-arrow-left" ></i>&nbsp;Trở lại</h6>
                                </a>
                                <div class="table-responsive" id="source-html">
                                    <div style="margin-top: 1rem!important;" class="container px-5 my-5">
                                        <form id="contactForm" action="update-order" method="post">
                                            <div class="form-floating mb-3">
                                                <label for="tenWebsite">Đơn hàng: ${requestScope.order.ID}</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <label for="tenWebsite">Thời gian: ${requestScope.order.thoigian}</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <label for="tenWebsite">Tài khoản: <a target="_blank" href="edit-user?action=edit&id=${requestScope.order.account.id}">${requestScope.order.account.username}</a></label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <label for="diaChỉSốDường">Họ tên:</label>
                                                <input disabled class="form-control info" name="hoten" id="diaChỉSốDường" type="text" placeholder="Họ tên" required value="${requestScope.order.account.hoten}"  />
                                            </div>
                                            <div class="form-floating mb-3">
                                                <label for="dịaChỉThanhPhố">Địa chỉ nhận hàng:</label>
                                                <input disabled class="form-control info" name="diachi" id="dịaChỉThanhPhố" type="text" placeholder="Địa chỉ nhận hàng" required value="${requestScope.order.diachi}" />
                                            </div>
                                            <div class="form-floating mb-3">
                                                <label for="sốDiệnThoại">Số điện thoại:</label>
                                                <input disabled class="form-control info" name="phone" id="sốDiệnThoại" type="text" placeholder="Số điện thoại" required value="${requestScope.order.account.phone}"/>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <label  for="emailAddress">Email: </label>
                                                <input disabled="" class="form-control info" name="email" id="emailAddress" type="email" placeholder="Email" required value="${requestScope.order.account.email}" />
                                            </div>
                                            <table style="margin-top: 1%; border: 1px solid" class="table table-bordered">
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
                                                            <td ><a style="color: #d51c24" href="product?id=${detail.sach.id}">${detail.sach.tensach}</a></td>
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
                                                        <td><fmt:formatNumber pattern="###,###" value="${requestScope.order.totalFirst+requestScope.order.phiship}"/>đ</td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="3">Giảm giá</td>
                                                        <td>${requestScope.order.giamgia}%</td>
                                                    </tr>
                                                </tbody>
                                                <tfoot>
                                                    <tr>
                                                        <th style="font-weight: bold" colspan="3">Tổng tiền</th>
                                                        <th><fmt:formatNumber pattern="###,###" value="${requestScope.order.total}"/>đ</th>
                                                    </tr>
                                                </tfoot>
                                            </table>
                                            <div class="form-floating mb-3">
                                                <label  for="emailAddress">Trạng thái đơn hàng: </label>
                                                <select <c:if test="${requestScope.order.status.ID == 7}">disabled=""</c:if> style="width: 100%;
                                                                                                          height: 35px;
                                                                                                          border-radius: 5px;" class="form-select" id="newField1" name="stt">
                                                        <option selected="" value="${requestScope.order.status.ID}">${requestScope.order.status.mota}</option>
                                                    <c:forEach items="${requestScope.orderstt}" var="stt">
                                                        <option value="${stt.ID}">${stt.mota}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div <c:if test="${requestScope.order.status.ID == 7}"> style="display: none"</c:if> class="d-grid">
                                                <button class="btn btn-primary btn-lg" id="submitButton" type="submit">Cập nhật</button>
                                                <button class="btn btn-primary btn-lg" id="submitButton" onclick="change()" type="button">Yêu cầu cập nhật thông tin</button>
                                                <a type="button" href="export/hoadon?id=${requestScope.order.ID}"class="btn btn-success btn-lg" id="btn-export" >Xuất hóa đơn</a>
                                            </div>
                                        </form>
                                    </div>

                                </div>
                            </div>
                        </div>

                    </div>
                    <!-- /.container-fluid -->

                </div>
                <!-- End of Main Content -->

                <!-- Footer -->
                <footer class="sticky-footer bg-white">
                    <div class="container my-auto">
                        <div class="copyright text-center my-auto">
                            <span>Copyright &copy; Your Website 2020</span>
                        </div>
                    </div>
                </footer>
                <!-- End of Footer -->

            </div>
            <!-- End of Content Wrapper -->

        </div>
        <!-- End of Page Wrapper -->

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>
        <!-- Bootstrap core JavaScript-->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="js/sb-admin-2.min.js"></script>
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
        <!-- Page level plugins -->
        <script src="vendor/datatables/jquery.dataTables.min.js"></script>
        <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

        <!-- Page level custom scripts -->
        <script src="js/demo/datatables-demo.js"></script>
        <script>
                                                    function change() {
                                                        const collection = document.getElementsByClassName("info");
                                                        for (let i = 0; i < collection.length; i++) {
                                                            collection[i].disabled = !collection[i].disabled;
                                                        }
                                                    }
                                                    ;
        </script>

    </body>

</html>