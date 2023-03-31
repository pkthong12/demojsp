<%-- 
    Document   : success
    Created on : Mar 25, 2023, 9:45:27 PM
    Author     : ThinkPad X1 G4
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
        <style type="text/css">

            body
            {
                background:#f2f2f2;
            }

            .payment
            {
                border:1px solid #f2f2f2;
                height:380px;
                border-radius:20px;
                background:#fff;
            }
            .payment_header
            {
                background:#0050a7b8;
                padding:20px;
                border-radius:20px 20px 0px 0px;

            }

            .check
            {
                margin:0px auto;
                width:50px;
                height:50px;
                border-radius:100%;
                background:#fff;
                text-align:center;
            }

            .check i
            {
                vertical-align:middle;
                line-height:50px;
                font-size:30px;
            }

            .content
            {
                text-align:center;
            }

            .content  h1
            {
                font-size:25px;
                padding-top: 10%;
            }

            .content a
            {
                width:200px;
                height:35px;
                color:#fff;
                border-radius: 4%;
                padding: 10px 10px;
                background:#0050a7b8;
                transition:all ease-in-out 0.5s;
            }

            .content a:hover
            {
                text-decoration:none;
                background:#2a8ffdb8;
            }
            p{
                margin-top: 24px;
                margin-bottom: 3rem;
                margin-left: 5%;
                margin-right: 5%;
            }
        </style>
    </head>
    <body>
        <div style="margin-top: 2rem!important;color: #4b4b4be8;" class="container">
            <div style="display: flex;    justify-content: center;
                 align-items: center;">
                <img style="width: 63px;" src="img\ciu.png" alt="alt"/>
                <h1 style="font-size:25px;
                    padding-top: 2%;"><a style=" text-decoration: none" href="index">Nhà sách DB</a></h1>
            </div>
            <div class="row">
                <div style="margin-top: 0.5rem!important;" class="col-md-6 mx-auto mt-5">
                    <div class="payment">
                        <div class="payment_header">
                            <div class="check"><i class="fa fa-check" aria-hidden="true"></i></div>
                        </div>
                        <div class="content">
                            <h1>Đặt hàng thành công!</h1>
                            <p>Hãy theo dõi đơn hàng trong phần lịch sử mua hàng. Cám ơn bạn đã mua hàng! </p>
                            <a href="index">Tiếp tục mua hàng</a>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
