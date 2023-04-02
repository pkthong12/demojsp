<%-- 
    Document   : navbar
    Created on : Feb 22, 2023, 2:54:45 PM
    Author     : ThinkPad X1 G4
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
              />
        <!-- Google Fonts Roboto -->
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap"
              />
        <script type="text/javascript" src="js/mdb.min.js"></script>
        
        <!-- Custom scripts -->
        <script type="text/javascript"></script>
        <!-- MDB -->
        <link rel="stylesheet" href="css/mdb.min.css" />

    </head>
    <body>
        <!-- Navbar -->
        <div>
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <!-- Container wrapper -->
                <div class="container-fluid">
                    <!-- Toggle button -->
                    <button
                        class="navbar-toggler"
                        type="button"
                        data-mdb-toggle="collapse"
                        data-mdb-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent"
                        aria-expanded="false"
                        aria-label="Toggle navigation"
                        >
                        <i class="fas fa-bars"></i>
                    </button>

                    <!-- Collapsible wrapper -->
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <!-- Navbar brand -->
                        <a class="navbar-brand mt-2 mt-lg-0" href="index">
                            <img
                                src="img\logo_1.png"
                                height="20"
                                alt="MDB Logo"
                                loading="lazy"
                                />
                        </a>
                        <!-- Left links -->
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link" href="news.jsp">TIN TỨC</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">GIỚI THIỆU</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="tickets.jsp">HỖ TRỢ</a>
                            </li>
                        </ul>
                        <!-- Left links -->
                    </div>
                    <!-- Collapsible wrapper -->

                    <!-- Right elements -->
                    <div class="d-flex align-items-center">
                        <div class="dropdown">
                            <a
                                class="text-reset me-3 dropdown-toggle hidden-arrow"
                                href="collection.jsp"
                                id="navbarDropdownMenuLink"
                                role="button"
                                data-mdb-toggle="dropdown"
                                aria-expanded="false"
                                >
                                <i class="fas fa-sitemap"></i>
                            </a>
                            <ul
                                class="dropdown-menu dropdown-menu-end"
                                aria-labelledby="navbarDropdownMenuLink"
                                >
                                <li>
                                    <a style="background-color: red; color: white;    font-weight: 600;" class="dropdown-item" href="collection">TẤT CẢ SẢN PHẨM</a>
                                </li>
                                <c:forEach items="${sessionScope.listCategory}" var="category">
                                    <li>
                                        <a class="dropdown-item" href="collection?categoryid=${category.id}">${category.tenloai}</a>
                                    </li>
                                </c:forEach>

                            </ul>
                        </div>
                        <!-- Icon -->
                        <c:set var="giohang" value="${sessionScope.giohang}"/>
                        <a class="text-reset me-3" href="carts">
                            <i class="fas fa-shopping-cart"></i>
                            <span class="badge rounded-pill badge-notification bg-danger">${giohang.size()}</span>
                        </a>

                        <!-- Notifications -->
                        <div class="dropdown">
                            <a
                                class="text-reset me-3 dropdown-toggle hidden-arrow"
                                href="#"
                                id="navbarDropdownMenuLink"
                                role="button"
                                data-mdb-toggle="dropdown"
                                aria-expanded="false"
                                >
                                <i class="fas fa-bell"></i>
                                <span class="badge rounded-pill badge-notification bg-danger">1</span>
                            </a>
                            <ul
                                class="dropdown-menu dropdown-menu-end"
                                aria-labelledby="navbarDropdownMenuLink"
                                >
                                <li>
                                    <a class="dropdown-item" href="#">Some news</a>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="#">Another news </a>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="#">Something else here</a>
                                </li>
                            </ul>
                        </div>
                        <!-- Avatar -->
                        <div class="dropdown">
                            <a
                                class="dropdown-toggle d-flex align-items-center hidden-arrow"
                                href="#"
                                id="navbarDropdownMenuAvatar"
                                role="button"
                                data-mdb-toggle="dropdown"
                                aria-expanded="false"
                                >
                                <img
                                    src="img\anh5.jpg"
                                    class="rounded-circle"
                                    height="25"
                                    alt="Black and White Portrait of a Man"
                                    loading="lazy"
                                    />
                            </a>

                            <ul
                                class="dropdown-menu dropdown-menu-end"
                                aria-labelledby="navbarDropdownMenuAvatar"
                                >
                                <c:if test="${sessionScope.account!=null}">
                                    <li>
                                        <a class="dropdown-item" href="profile">Thông tin cá nhân</a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="my-order">Lịch sử mua hàng</a>
                                    </li>
                                    <c:if test="${sessionScope.account.role!=3}">
                                        <li>
                                            <a class="dropdown-item" href="dbadmin">Trang quản trị</a>
                                        </li>
                                    </c:if>
                                    <li>
                                        <a class="dropdown-item" href="logout">Logout</a>
                                    </li>
                                </c:if>
                                <c:if test="${sessionScope.account==null}">
                                    <li>
                                        <a class="dropdown-item" href="login">Login</a>
                                    </li>
                                </c:if>

                            </ul>
                        </div>
                    </div>
                    <!-- Right elements -->
                </div>
                <!-- Container wrapper -->
            </nav>
            <!-- Navbar -->
        </div>

    </body>
</html>
