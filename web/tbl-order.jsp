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
        <link REL="SHORTCUT ICON" HREF="img\icon.png">
        <meta name="author" content="">

        <title>SB Admin 2 - Tables</title>

        <!-- Custom fonts for this template -->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/sb-admin-2.min.css" rel="stylesheet">

        <!-- Custom styles for this page -->
        <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

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
                            <h1 class="h3 mb-0 text-gray-800">Đơn hàng</h1>
                            <a onclick="exportHD()()" class="d-none d-sm-inline-block btn btn-sm btn-success shadow-sm"><i
                                    class="fas fa-download fa-sm text-white-50"></i> Xuất hóa đơn</a>
                        </div>

                        <!-- DataTales Example -->
                        <div class="card shadow mb-4">
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">

                                        <thead>
                                            <tr>
                                                <th  colspan="7"><input  type="checkbox" id="selectAll" >
                                                    <label for="selectAll">Select All</label></th>
                                            </tr>
                                            <tr>
                                                <th></th>
                                                <th>ID</th>
                                                <th>Họ tên</th>
                                                <th>Số điện thoại</th>
                                                <th>Tổng tiền</th>
                                                <th>Trạng thái</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th></th>
                                                <th>ID</th>
                                                <th>Họ tên</th>
                                                <th>Số điện thoại</th>
                                                <th>Tổng tiền</th>
                                                <th>Trạng thái</th>
                                                <th>Action</th>
                                            </tr>
                                        </tfoot>
                                        <tbody >
                                            <c:forEach items="${requestScope.listorder}" var="order">
                                                <tr class="item">
                                                    <th><input value="${order.ID}" type="checkbox" id="selectItem"></th>
                                                    <td>${order.ID}</td>
                                                    <td>${order.hoten}</td>
                                                    <td>${order.phone}</td>
                                                    <td><fmt:formatNumber pattern="###,###" value="${order.total}"/>đ</td>
                                                    <td id="stt${order.status.ID}">${order.status.mota}</td>
                                                    <td style="text-align: center;"><a href="update-order?order=${order.ID}"><i class='fas fa-eye' style='font-size:30px'></i></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
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

        <!--Core plugin JavaScript-->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

        <!--Custom scripts for all pages-->
        <script src="js/sb-admin-2.min.js"></script>

        <!-- Page level plugins -->
        <script src="vendor/datatables/jquery.dataTables.min.js"></script>
        <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

        <!-- Page level custom scripts -->
        <script src="js/demo/datatables-demo.js"></script>
        <script>
            function exportHD() {
                var inputs = document.querySelectorAll('#selectItem');
                var id='';
                for (var i = 0; i < inputs.length; i++) {
                    if(inputs[i].checked){
                        id += inputs[i].value+",";
                        
                    }
                }
                window.location = "export/hoadon?id="+id;
            }
            $("#selectAll").click(function () {
                $("input[type=checkbox]").prop("checked", $(this).prop("checked"));
            });

            $("input[type=checkbox]").click(function () {
                if (!$(this).prop("checked")) {
                    $("#selectAll").prop("checked", false);
                }
            });


        </script>  
    </body>

</html>