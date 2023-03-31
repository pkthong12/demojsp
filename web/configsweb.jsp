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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

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
                            <h1 class="h3 mb-0 text-gray-800">Cấu hình web</h1>
                        </div>

                        <!-- DataTales Example -->
                        <div class="card shadow mb-4">
                            <div class="card-body">
                                <div class="table-responsive">
                                    <div style="margin-top: 1rem!important;" class="container px-5 my-5">
                                        <form id="contactForm" action="configs" method="post">
                                            <div class="form-floating mb-3">
                                                <label for="tenWebsite">Tên website</label>
                                                <input class="form-control" name="tenweb" id="tenWebsite" type="text" placeholder="Tên website" data-sb-validations="required,email" value="${sessionScope.configs.tenweb}" />
                                                <div class="invalid-feedback" data-sb-feedback="tenWebsite:required">Tên website is required.</div>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <label for="diaChỉSốDường">Đia chỉ số, đường</label>
                                                <input class="form-control" name="diachiduong" id="diaChỉSốDường" type="text" placeholder="Đia chỉ số, đường" data-sb-validations="required" value="${sessionScope.configs.diachiduong}"/>
                                                <div class="invalid-feedback" data-sb-feedback="diaChỉSốDường:required">Đia chỉ số, đường is required.</div>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <label for="dịaChỉThanhPhố">Địa chỉ thành phố</label>
                                                <input class="form-control"name="diachithanhpho" id="dịaChỉThanhPhố" type="text" placeholder="Địa chỉ thành phố" data-sb-validations="required" value="${sessionScope.configs.diachithanhpho}"/>
                                                <div class="invalid-feedback" data-sb-feedback="dịaChỉThanhPhố:required">Địa chỉ thành phố is required.</div>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <label for="sốDiệnThoại">Số điện thoại</label>
                                                <input class="form-control"name="phone" id="sốDiệnThoại" type="text" placeholder="Số điện thoại" data-sb-validations="required" value="${sessionScope.configs.phone}"/>
                                                <div class="invalid-feedback" data-sb-feedback="sốDiệnThoại:required">Số điện thoại is required.</div>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <label for="emailAddress">Email Address</label>
                                                <input class="form-control" name="email"id="emailAddress" type="email" placeholder="Email Address" data-sb-validations="required,email" value="${sessionScope.configs.mail}"/>
                                                <div class="invalid-feedback" data-sb-feedback="emailAddress:required">Email Address is required.</div>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <label for="facebook">Facebook</label>
                                                <input class="form-control" name="facebook" id="facebook" type="text" placeholder="Facebook" data-sb-validations="required" value="${sessionScope.configs.facebook}"/>
                                                <div class="invalid-feedback" data-sb-feedback="facebook:required">Facebook is required.</div>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <label for="instagram">Instagram</label>
                                                <input class="form-control" name="instagram" id="instagram" type="text" placeholder="Instagram" data-sb-validations="required" value="${sessionScope.configs.instagram}"/>
                                                <div class="invalid-feedback" data-sb-feedback="instagram:required">Instagram is required.</div>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <label for="zalo">Zalo</label>
                                                <input class="form-control" id="zalo" name="zalo" type="text" placeholder="Zalo" data-sb-validations="required" value="${sessionScope.configs.zalo}"/>
                                                <div class="invalid-feedback" data-sb-feedback="zalo:required">Zalo is required.</div>
                                            </div>
                                            <div class="d-grid">
                                                <button class="btn btn-primary btn-lg" id="submitButton" type="submit">Submit</button>
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

    </body>

</html>