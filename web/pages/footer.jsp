<%-- 
    Document   : footer
    Created on : Feb 22, 2023, 3:11:02 PM
    Author     : ThinkPad X1 G4
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            @import url(https://fonts.googleapis.com/css?family=Open+Sans:400,500,300,700);

            * {
                font-family: Open Sans;
            }

            .footer-distributed{
                background: #d1d1d1;
                box-shadow: 0 1px 1px 0 rgba(0, 0, 0, 0.12);
                box-sizing: border-box;
                width: 100%;
                text-align: left;
                font: bold 16px sans-serif;
                padding: 55px 50px;
            }

            .footer-distributed .footer-left,
            .footer-distributed .footer-center,
            .footer-distributed .footer-right{
                display: inline-block;
                vertical-align: top;
            }

            /* Footer left */

            .footer-distributed .footer-left{
                width: 40%;
            }

            /* The company logo */

            .footer-distributed h3{
                color:  #ffffff;
                font: normal 36px 'Open Sans', cursive;
                margin: 0;
            }

            .footer-distributed h3 span{
                color:  lightseagreen;
            }

            /* Footer links */

            .footer-distributed .footer-links{
                color:  #ffffff;
                margin: 20px 0 12px;
                padding: 0;
            }

            .footer-distributed .footer-links a{
                display:inline-block;
                line-height: 1.8;
                font-weight:400;
                text-decoration: none;
                color:  inherit;
            }

            .footer-distributed .footer-company-name{
                color:  #222;
                font-size: 14px;
                font-weight: normal;
                margin: 0;
            }

            /* Footer Center */

            .footer-distributed .footer-center{
                width: 35%;
            }

            .footer-distributed .footer-center i{
                background-color:  #33383b;
                color: #ffffff;
                font-size: 25px;
                width: 38px;
                height: 38px;
                border-radius: 50%;
                text-align: center;
                line-height: 42px;
                margin: 10px 15px;
                vertical-align: middle;
            }

            .footer-distributed .footer-center i.fa-envelope{
                font-size: 17px;
                line-height: 38px;
            }

            .footer-distributed .footer-center p{
                display: inline-block;
                color: #ffffff;
                font-weight:400;
                vertical-align: middle;
                margin:0;
            }

            .footer-distributed .footer-center p span{
                display:block;
                font-weight: normal;
                font-size:14px;
                line-height:2;
            }

            .footer-distributed .footer-center p a{
                color:  lightseagreen;
                text-decoration: none;
                ;
            }

            .footer-distributed .footer-links a:before {
                content: "|";
                font-weight:300;
                font-size: 20px;
                left: 0;
                color: #fff;
                display: inline-block;
                padding-right: 5px;
            }

            .footer-distributed .footer-links .link-1:before {
                content: none;
            }

            /* Footer Right */

            .footer-distributed .footer-right{
                width: 20%;
            }

            .footer-distributed .footer-company-about{
                line-height: 20px;
                color:  #92999f;
                font-size: 13px;
                font-weight: normal;
                margin: 0;
            }

            .footer-distributed .footer-company-about span{
                display: block;
                color:  #ffffff;
                font-size: 14px;
                font-weight: bold;
                margin-bottom: 20px;
            }

            .footer-distributed .footer-icons{
                margin-top: 25px;
            }

            .footer-distributed .footer-icons a{
                display: inline-block;
                width: 35px;
                height: 35px;
                cursor: pointer;
                background-color:  #33383b;
                border-radius: 2px;

                font-size: 20px;
                color: #ffffff;
                text-align: center;
                line-height: 35px;

                margin-right: 3px;
                margin-bottom: 5px;
            }

            /* If you don't want the footer to be responsive, remove these media queries */

            @media (max-width: 880px) {

                .footer-distributed{
                    font: bold 14px sans-serif;
                }

                .footer-distributed .footer-left,
                .footer-distributed .footer-center,
                .footer-distributed .footer-right{
                    display: block;
                    width: 100%;
                    margin-bottom: 40px;
                    text-align: center;
                }

                .footer-distributed .footer-center i{
                    margin-left: 0;
                }

            }

        </style>
    </head>
    <body>
        <div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v16.0&appId=308936717220243&autoLogAppEvents=1" nonce="ZOXUagts"></script>
        <footer class="footer-distributed">

            <div class="footer-left">

                <h3><span>${sessionScope.configs.tenweb}</span></h3>

                <p class="footer-links">
                    <a href="#" class="link-1">DỊCH VỤ</a>

                    <a href="#">HỖ TRỢ</a>

                    <a href="#">VẬN CHUYỂN</a>

                    <a href="#">LIÊN HỆ</a>
                </p>

                <p class="footer-company-name">Company Name © 2015</p>
            </div>

            <div class="footer-center">

                <div>
                    <i class="fa fa-map-marker"></i>
                    <p><span>${sessionScope.configs.diachiduong}</span> ${sessionScope.configs.diachithanhpho}</p>
                </div>

                <div>
                    <i class="fa fa-phone"></i>
                    <p>${sessionScope.configs.phone}</p>
                </div>

                <div>
                    <i class="fa fa-envelope"></i>
                    <p><a href="mailto:${sessionScope.configs.mail}">${sessionScope.configs.mail}</a></p>
                </div>

            </div>

            <div class="footer-right">

                <div class="fb-page" data-href="https://www.facebook.com/profile.php?id=100084687950939" data-tabs="timeline" data-width="" data-height="70" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="false"><blockquote cite="https://www.facebook.com/profile.php?id=100084687950939" class="fb-xfbml-parse-ignore"><a href="https://www.facebook.com/profile.php?id=100084687950939">Phùng Kim Thông</a></blockquote></div>

                <div class="footer-icons">

                    <a href="${sessionScope.configs.facebook}" target="_blank"><i class="fa fa-facebook"></i></a>
                    <a href="https://instagram.com/${sessionScope.configs.instagram}" target="_blank"><i class="fa fa-instagram"></i></a>
                    <a href="http://zalo.me/${sessionScope.configs.zalo}" target="_blank"><i class="fa fa-commenting-o"></i></a>

                </div>

            </div>

        </footer>
    </body>
</html>
