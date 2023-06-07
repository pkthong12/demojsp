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

        <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
        <style>
            body {
                font-family: 'Trebuchet MS', sans-serif;
            }
            .bo-bot{
                border-bottom: 2px dotted;
                text-align: left;
            }
        </style>
    </head>

    <body id="source-html">
        <c:forEach items="${requestScope.order}" var="order">
            <!-- Page Wrapper -->
            <div id="wrapper">
                <!-- Content Wrapper -->
                <div id="content-wrapper" class="d-flex flex-column">
                    <!-- Main Content -->
                    <div id="content">
                        <!-- Begin Page Content -->
                        <div class="container-fluid" >

                            <!-- DataTales Example -->
                            <div class="card shadow mb-4">

                                <div class="card-body">

                                    <div class="table-responsive" >

                                        <div style="margin-top: 1rem!important;" class="container px-5 my-5">
                                            <table style="border: 2px dotted" class="table">
                                                <thead >
                                                    <tr >
                                                        <th style="border-bottom: 2px dotted;text-align: left;" colspan="4">
                                                            <img style="width: 100%" src="D:\End_Project\web\img\logo-word.png" alt="alt"/>
                                                            <h2 style="color: lightseagreen;"><span>${sessionScope.configs.tenweb}</span></h2>
                                                        </th>
                                                    </tr>
                                                    <tr>
                                                        <th  style="text-align: left; width: 50%;border-right: 2px dotted;border-bottom: 2px dotted;">Từ:<br>
                                                            ${sessionScope.configs.tenweb}<br>
                                                            ${sessionScope.configs.diachiduong}<br>
                                                            ${sessionScope.configs.diachithanhpho}
                                                        </th>
                                                        <th colspan="3" style="text-align: left;border-bottom: 2px dotted;">Đến:<br>
                                                            ${order.hoten} - ${order.phone}<br>
                                                            ${order.diachi}
                                                        </th>
                                                    </tr>
                                                </thead>
                                                <thead >
                                                    <tr>
                                                        <th style="text-align: center; font-size: 25px"colspan="4">DB-${order.ID}</th>
                                                    </tr>
                                                    <tr >
                                                        <th style="border-right: 2px dotted;border-top: 2px dotted " class="bo-bot">Sản phẩm</th>
                                                        <th style="border-right: 2px dotted;border-top: 2px dotted " class="bo-bot">Đơn giá</th>
                                                        <th style="border-right: 2px dotted;border-top: 2px dotted " class="bo-bot">Số lượng</th>
                                                        <th style="border-top: 2px dotted " class="bo-bot">Tổng</th>
                                                    </tr>
                                                </thead>

                                                <tbody>
                                                    <c:forEach var="detail" items="${requestScope.listdetail}">
                                                        <c:if test="${detail.orderID == order.ID}">
                                                            <tr>
                                                                <td style="width: 60%; border-right: 2px dotted;border-top: 2px dotted; color: #d51c24 " class="bo-bot">${detail.tensach}</td>
                                                                <td style="border-right: 2px dotted;border-top: 2px dotted " class="bo-bot"><fmt:formatNumber pattern="###,###" value="${detail.giaban}"/>đ</td>
                                                                <td style="border-right: 2px dotted;border-top: 2px dotted " class="bo-bot">${detail.soluong}</td>
                                                                <td style="border-top: 2px dotted" class="bo-bot"><fmt:formatNumber pattern="###,###" value="${detail.thanhtien}"/>đ</td>
                                                            </tr>
                                                        </c:if>

                                                    </c:forEach>


                                                    <tr >
                                                        <td style="border-right: 2px dotted;border-top: 2px dotted " colspan="3">Phí ship</td>
                                                        <td style="border-top: 2px dotted "><fmt:formatNumber pattern="###,###" value="${order.phiship}"/>đ</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="border-right: 2px dotted;border-top: 2px dotted " colspan="3">Tạm tính</td>
                                                        <td style="border-top: 2px dotted "><fmt:formatNumber pattern="###,###" value="${order.totalFirst}"/>đ</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="border-right: 2px dotted;border-top: 2px dotted " colspan="3">Giảm giá</td>
                                                        <td style="border-top: 2px dotted ">${order.giamgia}%</td>
                                                    </tr>
                                                </tbody>
                                                <tfoot>
                                                    <tr >
                                                        <th style="border-right: 2px dotted;border-top: 2px dotted " colspan="3">Tiền thu</th>
                                                        <th style="border-top: 2px dotted; font-size: 35px "><fmt:formatNumber pattern="###,###" value="${order.total}"/>đ</th>
                                                    </tr>
                                                    <tr >
                                                        <th colspan="4" style="border-top: 2px dotted;text-align: right ">Thời gian đặt hàng:<br>
                                                            ${order.thoigian}
                                                        </th>
                                                    </tr>
                                                    <tr >
                                                        <td colspan="4" style="border-top: 2px dotted;text-align: center ">
                                                            Cảm ơn bạn đã tin tưởng và ủng hộ chúng tôi. Mọi vấn đề về đơn hàng bạn có thể liên hệ với shop để được hỗ trợ.
                                                        </td>
                                                    </tr>
                                                </tfoot>
                                            </table>
                                            <h1></h1>
                                        </div>

                                    </div>
                                </div>
                            </div>

                        </div>
                        <!-- /.container-fluid -->

                    </div>

                </div>
                <!-- End of Content Wrapper -->
            </c:forEach>
        </div>
        <!-- Page level plugins -->
        <script src="vendor/datatables/jquery.dataTables.min.js"></script>
        <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

        <!-- Page level custom scripts -->
        <script src="js/demo/datatables-demo.js"></script>
        <script>
            window.onload = function ()
            {
                exportHTML();
                history.back();

            };

            function exportHTML() {
                var header = "<html xmlns:o='urn:schemas-microsoft-com:office:office' " +
                        "xmlns:w='urn:schemas-microsoft-com:office:word' " +
                        "xmlns='http://www.w3.org/TR/REC-html40'>" +
                        "<head><meta charset='utf-8'><title>Export HTML to Word Document with JavaScript</title></head><body>";
                var footer = "</body></html>";
                var sourceHTML = header + document.getElementById("source-html").innerHTML + footer;

                var source = 'data:application/vnd.ms-word;charset=utf-8,' + encodeURIComponent(sourceHTML);
                var fileDownload = document.createElement("a");
                document.body.appendChild(fileDownload);
                fileDownload.href = source;
                fileDownload.download = 'hoadon_order_${requestScope.lorder}.doc';
                fileDownload.click();
                document.body.removeChild(fileDownload);
            }

        </script>

    </body>

</html>