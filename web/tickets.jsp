<%-- 
    Document   : tickets
    Created on : Apr 1, 2023, 4:15:33 PM
    Author     : ThinkPad X1 G4
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/styles.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <style>
            body {
                background: #007bff;
                background: linear-gradient(to right, #0062E6, #33AEFF);
            }

            .bg-image {
                background-size: cover;
                background-position: center;
                background-repeat: no-repeat;
            }
        </style>
    </head>
    <body>
         <%@include file="/pages/navbar.jsp" %>
        
        <div class="container-fluid px-5 my-5">
            <div class="row justify-content-center">
                <div class="col-xl-10">
                    <div class="card border-0 rounded-3 shadow-lg overflow-hidden">
                        <div class="card-body p-0">
                            <div class="row g-0">
                                <div class="col-sm-6 d-none d-sm-block bg-image">
                                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2750.0796394741237!2d105.75017216815087!3d21.02024512695921!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3134549c574476c3%3A0xd3c6af79105ea6da!2zVHLGsOG7nW5nIENhbyDEkeG6s25nIEPDtG5nIG5naOG7hyBDYW8gSMOgIE7hu5lp!5e0!3m2!1svi!2s!4v1681282035332!5m2!1svi!2s" width="600" height="100%" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                                </div>
                                <div class="col-sm-6 p-4">
                                    <div class="text-center">
                                        <div class="h3 fw-light">Yêu cầu hỗ trợ</div>
                                        <p class="mb-4 text-muted">Bạn có một câu hỏi hoặc vấn đề cần giải quyết? Hệ thống Ticket cho phép chúng tôi trả lời các câu hỏi của bạn. Gửi ticket và chúng tôi sẽ hỗ trợ bạn ngay!</p>
                                    </div>


                                    <form id="contactForm" data-sb-form-api-token="API_TOKEN">

                                        <!-- Name Input -->
                                        <div class="form-floating mb-3">
                                            <input class="form-control" id="name" type="text" placeholder="Name" data-sb-validations="required" />
                                            <label for="name">Tiêu đề</label>
                                            <div class="invalid-feedback" data-sb-feedback="name:required">Tiêu đề is required.</div>
                                        </div>
                                        <!-- Message Input -->
                                        <div class="form-floating mb-3">
                                            <textarea class="form-control" id="message" type="text" placeholder="Message" style="height: 10rem;" data-sb-validations="required"></textarea>
                                            <label for="message">Nội dung</label>
                                            <div class="invalid-feedback" data-sb-feedback="message:required">Nội dung is required.</div>
                                        </div>
                                        <div class="form-floating mb-3">
                                            <select class="form-control">
                                                <option value="0">Không có</option>
                                            </select>
                                            <label for="emailAddress">Dịch vụ liên quan:</label>
                                        </div>

                                        <!-- Submit button -->
                                        <div class="d-grid">
                                            <button class="btn btn-primary btn-lg" id="submitButton" type="submit">Submit</button>
                                        </div>
                                    </form>
                                    <!-- End of contact form -->

                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/pages/footer.jsp" %>

        <!-- CDN Link to SB Forms Scripts -->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    </body>
</html>
