<%-- 
Document   : index
Created on : Feb 23, 2023, 10:08:23 PM
Author     : ThinkPad X1 G4
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tài khoản</title>
        <link REL="SHORTCUT ICON" HREF="img\icon.png">
        <link href="css/styles.css" rel="stylesheet" />
        <link rel="stylesheet" href="css/mdb.min.css" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    </head>
    <body>
        <%@include file="/pages/navbar.jsp" %>

        <div class="container rounded bg-white mt-5 mb-5"> 
            <div class="row"> 
                <a  style="text-decoration: none;" href="index">
                    <h6 style="margin-left: 5%"><i class="fa fa-long-arrow-left" ></i>&nbsp;Trở lại</h6>
                </a>
                <form style="display: contents;" action="change" method="post">
                    <div class="col-md-3 border-right"> 
                        <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                            <img id="anhshow" style="width: 75%;" class="rounded-circle mt-5" src="img\anh5.jpg">
                            <center><input id="anhinput" style="    width: 100%;
                                           margin-top: 6%;
                                           margin-left: 4%;
                                           padding: 4%;" class="text-black-50" type="file" id="file" name="file" multiple /></center>
                            <span class="font-weight-bold">${sessionScope.account.username}</span>
                            <span class="text-black-50">${sessionScope.account.email}</span>
                            <span> </span>
                        </div> 
                    </div> 
                    <div class="col-md-5 border-right"> 
                        <div class="p-3 py-5"> 
                            <div class="d-flex justify-content-between align-items-center mb-3"> 
                                <h4 class="text-right">Thông tin cá nhân</h4> 
                            </div> 

                            <div class="row mt-2"> 
                                <div style="width: 100%;" class="col-md-6">
                                    <label class="labels">Tên</label>
                                    <input type="text" name="hoten" required="" class="form-control" value="${sessionScope.account.hoten}">
                                </div>  
                            </div> 
                            <div class="row mt-3"> 
                                <div class="col-md-12">
                                    <label class="labels">Số điện thoại</label>
                                    <input type="text" name="phone" class="form-control" value="${sessionScope.account.phone}">
                                </div> 
                                <div class="col-md-12">
                                    <label class="labels">Địa chỉ</label>
                                    <input type="text" name="address" required="" class="form-control" value="${sessionScope.account.diachi}">
                                </div> 
                                <div class="col-md-12">
                                    <input type="hidden" name="email" required=""class="form-control"  value="${sessionScope.account.email}">
                                </div>  
                            </div> 

                            <div class="mt-5 text-center">
                                <input class="btn btn-primary profile-button" type="hidden" name="action" value="changeinfo"/>
                                <input class="btn btn-primary profile-button" type="submit" value="Save Profile"/>
                            </div> 

                        </div> 
                </form>
            </div> 
            <div class="col-md-4"> 
                <div class="p-3 py-5"> 
                    <div class="d-flex justify-content-between align-items-center mb-3"> 
                        <h4 class="text-right">Đổi mật khẩu</h4> 
                    </div>
                    <form action="change" method="post" onsubmit="return kiemtra()">
                        <div class="row mt-3"> 
                            <div class="col-md-12">
                                <label class="labels">Mật khẩu cũ</label>
                                <input type="password" name="olderpass"required=""class="form-control"  value="">
                            </div> 
                            <div class="col-md-12">
                                <label class="labels">Mật khẩu mới</label>
                                <input type="password" id="p1" name="newpass" required=""class="form-control" value="">
                            </div> 
                            <div class="col-md-12">
                                <label class="labels">Nhập lại mật khẩu mới</label>
                                <input type="password" id="p2" name="repass" required=""class="form-control"  value="">
                            </div> 
                            <div class="mt-5 text-center">
                                <input class="btn btn-primary profile-button" type="hidden" name="action" value="changepass"/>
                                <button type="submit" class="btn btn-primary profile-button" >Save</button>
                            </div>
                        </div> 
                    </form>
                </div> 
            </div> 
        </div>
    </div>
</div>
</div>
<%@include file="/pages/footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script>

                        const input = document.getElementById('anhinput');
                        const image = document.getElementById('anhshow');

                        input.addEventListener('change', (e) => {
                            if (e.target.files.length) {
                                const src = URL.createObjectURL(e.target.files[0]);
                                image.src = src;
                            }
                        });

</script>
<script type="text/javascript">
                        function kiemtra() {
                            var newpass = document.getElementById("p1").value;
                            var repass = document.getElementById("p2").value;

                            if (newpass.length < 5) {
                                window.alert("Mật khẩu phải đủ 5 ký tự trở lên!");
                                return false;
                            } else if (newpass !== repass) {
                                window.alert("Mật khẩu nhập lại khác mật khẩu mới");
                                return false;
                            }
                            return true;

                        }
                        ;
</script>
<c:if test="${sessionScope.notifi != null}">
    <script>
        window.alert("${sessionScope.notifi}");
        <% 
            session.removeAttribute("notifi");
        %>
    </script>
</c:if>
</body>
</html>
