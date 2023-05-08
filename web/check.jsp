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
        <script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>  

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.5/jspdf.min.js"></script>  
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

            table {
                font-family: arial, sans-serif;
                border-collapse: collapse;
                width: 100%;
            }

            td, th {
                border: 1px solid #dddddd;
                text-align: left;
                padding: 8px;
            }

            tr:nth-child(even) {
                background-color: #dddddd;
            }
        </style>
    </head>

    <body id="source-html">

        <form class="form" style="max-width: none; width: 1005px;">  
            
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
                                    <c:forEach items="${requestScope.order}" var="order">
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
                                                            Nhuệ Giang, Tây Mỗ<br>
                                                            Nam Từ Liêm, Hà Nội, Việt Nam
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
                                    </c:forEach>
                                </div>
                            </div>
                        </div>

                    </div>
                    <!-- /.container-fluid -->

                </div>

            </div>
            <!-- End of Content Wrapper -->

        </div>

            <!--            <h2 style="color: #0094ff">Hello</h2>  
                        <h3>a bit about this Project:</h3>  
                        <p style="font-size: large">  
                            I will demonstrate how to generate PDF file of your HTML page with CSS using JavaScript and J query.  
                        </p>  
                        <table>  
                            <tbody>  
                                <tr>  
                                    <th>Company</th>  
                                    <th>Contact</th>  
                                    <th>Country</th>  
                                </tr>  
                                <tr>  
                                    <td>Alfreds Futterkiste</td>  
                                    <td>Maria Anders</td>  
                                    <td>Germany</td>  
                                </tr>  
                                <tr>  
                                    <td>Centro comercial Moctezuma</td>  
                                    <td>Francisco Chang</td>  
                                    <td>Mexico</td>  
                                </tr>  
                                <tr>  
                                    <td>Ernst Handel</td>  
                                    <td>Roland Mendel</td>  
                                    <td>Austria</td>  
                                </tr>  
                                <tr>  
                                    <td>Island Trading</td>  
                                    <td>Helen Bennett</td>  
                                    <td>UK</td>  
                                </tr>  
                                <tr>  
                                    <td>Laughing Bacchus Winecellars</td>  
                                    <td>Yoshi Tannamuri</td>  
                                    <td>Canada</td>  
                                </tr>  
                                <tr>  
                                    <td>Magazzini Alimentari Riuniti</td>  
                                    <td>Giovanni Rovelli</td>  
                                    <td>Italy</td>  
                                </tr>  
                            </tbody>  
                        </table>  -->

            <input type="button" id="create_pdf" value="Generate PDF">  
        </form>  

        <!-- Page Wrapper -->
        
        <!-- Page level plugins -->
        <script src="vendor/datatables/jquery.dataTables.min.js"></script>
        <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

        <!-- Page level custom scripts -->
        <script src="js/demo/datatables-demo.js"></script>
        <script>
            (function () {
                var
                        form = $('.form'),
                        cache_width = form.width(),
                        a4 = [200.28, 2841.89]; // for a4 size paper width and height  

                $('#create_pdf').on('click', function () {
                    $('body').scrollTop(0);
                    createPDF();
                });
                //create pdf  
                function createPDF() {
                    getCanvas().then(function (canvas) {
                        var
                                img = canvas.toDataURL("image/png"),
                                doc = new jsPDF({
                                    unit: 'px',
                                    format: 'a4'
                                });
                        doc.addImage(img, 'JPEG', 20, 20);
                        doc.save('Bhavdip-html-to-pdf.pdf');
                        form.width(cache_width);
                    });
                }

                // create canvas object  
                function getCanvas() {
                    form.width((a4[0] * 1.33333) - 80).css('max-width', 'none');
                    return html2canvas(form, {
                        imageTimeout: 2000,
                        removeContainer: true
                    });
                }

            }());
        </script>  
        <script>
            /* 
             * jQuery helper plugin for examples and tests 
             */
            (function ($) {
                $.fn.html2canvas = function (options) {
                    var date = new Date(),
                            $message = null,
                            timeoutTimer = false,
                            timer = date.getTime();
                    html2canvas.logging = options && options.logging;
                    html2canvas.Preload(this[0], $.extend({
                        complete: function (images) {
                            var queue = html2canvas.Parse(this[0], images, options),
                                    $canvas = $(html2canvas.Renderer(queue, options)),
                                    finishTime = new Date();

                            $canvas.css({position: 'absolute', left: 0, top: 0}).appendTo(document.body);
                            $canvas.siblings().toggle();

                            $(window).click(function () {
                                if (!$canvas.is(':visible')) {
                                    $canvas.toggle().siblings().toggle();
                                    throwMessage("Canvas Render visible");
                                } else {
                                    $canvas.siblings().toggle();
                                    $canvas.toggle();
                                    throwMessage("Canvas Render hidden");
                                }
                            });
                            throwMessage('Screenshot created in ' + ((finishTime.getTime() - timer) / 1000) + " seconds<br />", 4000);
                        }
                    }, options));

                    function throwMessage(msg, duration) {
                        window.clearTimeout(timeoutTimer);
                        timeoutTimer = window.setTimeout(function () {
                            $message.fadeOut(function () {
                                $message.remove();
                            });
                        }, duration || 2000);
                        if ($message)
                            $message.remove();
                        $message = $('<div ></div>').html(msg).css({
                            margin: 0,
                            padding: 10,
                            background: "#000",
                            opacity: 0.7,
                            position: "fixed",
                            top: 10,
                            right: 10,
                            fontFamily: 'Tahoma',
                            color: '#fff',
                            fontSize: 12,
                            borderRadius: 12,
                            width: 'auto',
                            height: 'auto',
                            textAlign: 'center',
                            textDecoration: 'none'
                        }).hide().fadeIn().appendTo('body');
                    }
                };
            })(jQuery);

        </script>  
        <script>
            window.onload = function ()
            {
//                exportHTML();
//                history.back();

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
                fileDownload.download = 'hoadon_order.doc';
                fileDownload.click();
                document.body.removeChild(fileDownload);
            }

        </script>

    </body>

</html>