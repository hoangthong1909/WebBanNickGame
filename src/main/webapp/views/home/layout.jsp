<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<head>
    <meta charset="UTF-8">
    <title>Website Ban Nick</title>
    <meta property="fb:admins" content="2154878098063466" />
    <meta name="description" content="Mua bán vàng, ngọc, ngọc rồng online">
    <meta name="keywords" content="Ngọc rồng online, mua bán vàng, mua bán ngọc">
    <meta property="og:image" content="te.html">

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <script src='/frontend/js/jquery.min.js'></script>
    <link href="http://fonts.googleapis.com/css?family=Roboto+Condensed:300,300i,400,400i,700,700i" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Roboto+Condensed:300italic,400italic,700italic,400,300,700&amp;subset=all' rel='stylesheet' type='text/css'>
    <link href="/frontend/assets/frontend/theme/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="/frontend/assets/frontend/theme/assets/demos/default/css/plugins.css" rel="stylesheet" type="text/css" />
    <link href="/frontend/assets/frontend/theme/assets/demos/default/css/components.css" id="style_components" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="/frontend/assets/frontend/plugins/dataTables/jquery.dataTables.min.css">

    <link href="/frontend/css/main.css" rel="stylesheet" />
    <link href="/frontend/assets/frontend/css/style.css" rel="stylesheet" type="text/css" />
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <link href="/frontend/assets/frontend/theme/assets/demos/default/css/themes/default.css" rel="stylesheet" id="style_theme" type="text/css" />
    <link href="/frontend/assets/frontend/theme/assets/demos/default/css/custom.css" rel="stylesheet" type="text/css" />
    <script src="/frontend/assets/frontend/theme/assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="/frontend/assets/frontend/theme/assets/base/js/app.js" type="text/javascript"></script>
    <script src="/frontend/assets/frontend/theme/assets/base/js/components.js" type="text/javascript"></script>
</head>
<body class="c-layout-header-fixed c-layout-header-mobile-fixed c-layout-header-topbar c-layout-header-topbar-collapse">

<!-- BEGIN: HEADER -->
<header class="c-layout-header c-layout-header-4 c-layout-header-default-mobile" >
    <div class="c-navbar">
        <div class="container">
            <!-- BEGIN: BRAND -->
            <div class="c-navbar-wrapper clearfix">
                <div class="c-brand c-pull-left">
                    <a href="/home/index" class="c-logo">
                        <img src="/images/AeNhaPro.jpg" alt="" style="height: 23px; margin-top: -8px;" class="c-desktop-logo">
                        <img src="/images/AeNhaPro.jpg" alt="" style="height: 23px; margin-top: -8px;" class="c-desktop-logo-inverse">
                        <img height="20px" src="/images/AeNhaPro.jpg" alt="" class="c-mobile-logo">
                    </a>
                    <button class="c-hor-nav-toggler" type="button" data-target=".c-mega-menu">
                        <span class="c-line"></span>
                        <span class="c-line"></span>
                        <span class="c-line"></span>
                    </button>
                    <button class="c-topbar-toggler" type="button">
                        <i class="fa fa-ellipsis-v"></i>
                    </button>
                </div>

                <nav class="c-mega-menu c-pull-right c-mega-menu-dark c-mega-menu-dark-mobile c-fonts-uppercase c-fonts-bold">
                    <ul class="nav navbar-nav c-theme-nav">
                        <li class="c-menu-type-classic active"><a href="/home/index" class="c-link dropdown-toggle">TRANG CHỦ</a></li>

                        <li class="c-menu-type-classic"><a href="/home/card" class="c-link dropdown-toggle">NẠP TIỀN</a></li>
                        <li class="c-menu-type-classic"><a href="/home/nickgame" class="c-link dropdown-toggle">NICK GAME</a></li>
                        <li class="c-menu-type-classic"><a href="/home/cart" class="c-link dropdown-toggle">GIỎ HÀNG</a></li>


                        <li class="c-menu-type-classic">
                            <a href="#" class="c-link dropdown-toggle c-toggler">HƯỚNG DẪN<span class="c-arrow c-toggler"></span></a>
                        </li>
                        <c:if test="${empty sessionScope.user}">
                        <li>
                            <a href="/login" class="c-btn-border-opacity-04 c-btn btn-no-focus c-btn-header btn btn-sm c-btn-border-1x c-btn-dark c-btn-circle c-btn-uppercase c-btn-sbold">
                                <i class="icon-user"></i> Đăng nhập
                            </a>
                        </li>
                            <li>
                                <a href="/login" class="c-btn-border-opacity-04 c-btn btn-no-focus c-btn-header btn btn-sm c-btn-border-1x c-btn-dark c-btn-circle c-btn-uppercase c-btn-sbold">
                                    <i class="icon-key icons"></i> Đăng ký
                                </a>
                            </li>
                        </c:if>
                        <c:if test="${!empty sessionScope.user}">
                        <li>
                            <a  href="/home/info" style="background-color: #ed145b; border: 1px solid #ed145b; color: white;" class="_PGO c-btn-border-opacity-04 c-btn btn-no-focus c-btn-header btn btn-sm c-btn-border-1x c-btn-dark c-btn-circle c-btn-uppercase c-btn-sbold">
                                Số dư: <fmt:formatNumber value="${sessionScope.user.surplus}" pattern="#,###"/> VNĐ
                            </a>
                        </li>
                        <li>
                            <a href="/logout" class="c-btn-border-opacity-04 c-btn btn-no-focus c-btn-header btn btn-sm c-btn-border-1x c-btn-dark c-btn-circle c-btn-uppercase c-btn-sbold">
                                 Đăng Xuất
                            </a>
                        </li>
                        </c:if>

                    </ul>
                </nav>
            </div>
        </div>
    </div>
</header>

<!-- END: HEADER -->
<!-- BEGIN: Body -->
<jsp:include page="${view}"/>

<footer class="c-layout-footer c-layout-footer-3 c-bg-dark">
    <div class="c-prefooter">
        <div class="container">
            <div class="col-md-9">
                <div class="c-container c-first">
                    <div class="c-content-title-2">
                        <h3 class="c-font-uppercase c-font-bold c-font-white" style="color:#d8d8d8 !important;">
                            Về <span class="c-theme-font" style="color:#0b93a3 !important">AE NHÀ PRO</span>
                        </h3>
                        <div class="c-line-left hide"></div>
                        <p class="c-text">
                            Hệ thống mua bán nick game tự động uy tín, nhanh gọn, an toàn tuyệt đối.
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="c-container c-last">
                    <div class="c-content-title-2">
                        <h3 class="c-font-uppercase c-font-bold c-font-white" style="color:#d8d8d8 !important;">CHI TIẾT LIÊN HỆ</h3>
                        <div class="c-line-left hide"></div>
                        <p></p>
                    </div>
                    <ul class="c-address">
                        <!--<li><i class="icon-pointer c-theme-font"></i> One Boulevard, Beverly Hills</li>-->
                        <li><a href="#" class="c-font-regular" style="color:#d8d8d8 !important;">Hotline: 0877.222.333 (8h-22h)</a></li>
                        <li><a href="#" class="c-font-regular" style="color:#d8d8d8 !important;">Email: admin@dthongpro.vn</a></li>
                    </ul>
                </div>
            </div>

        </div>
    </div>
</footer>

<!-- END: footer -->
</body>
</html>