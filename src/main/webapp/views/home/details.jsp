<%--
  Created by IntelliJ IDEA.
  User: thongpro
  Date: 6/11/22
  Time: 2:43 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<div class="c-layout-page">
    <div class="c-overflow-hide c-bg-white">
        <div class="container">
            <div class="col-sm-12 text-center" style="margin-bottom: 20px;margin-top:20px;">
                <h2 style="color: #e7505a;">NGỌC RỒNG ONLINE</h2>
                <div style="width: 140px; height: 1px; margin: 20px auto; border-bottom: 4px solid #00bff3;"></div>
            </div>
            <div class="col-sm-12 text-center" style=" margin-bottom: 50px;">
                <h2 style="font-family:Roboto;"><span>THÔNG TIN TÀI KHOẢN </span><span style="color:#e7505a;">#${detail.id}</span></h2>
                <span>Để Xem thêm chi tiết về tài khoản vui lòng kéo xuống bên dưới.</span>
            </div>
            <div class="c-shop-product-details-4">
                <div class="row">
                    <div class="col-md-8">
                        <div class="form-group row">
                            <spam class="col-xs-6 control-label s-product-nameprice">TIỀN CARD:</spam>
                            <spam class="col-xs-6 control-label s-product-price"><fmt:formatNumber value="${detail.price}" pattern="#,###"/> VNĐ</spam>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group row">
                            <div class="col-xs-7 ar">
                                <a href="/home/addtocart?id=${detail.id}" class="btn btn-info  btn2">Thêm vào giỏ hàng</a>
                            </div>
                            <div class="col-xs-5">
                                <a href="/home/card" class="btn btn-success btn-block btn2">Nạp Thẻ</a>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="c-product-meta">
                    <div class="c-content-divider">
                        <i class="icon-dot"></i>
                    </div>
                    <div class="row">
                        <div class="col-xs-2 col-sm-3 col-xs-6 c-product-variant">
                            <p class="c-product-meta-label c-product-margin-1 c-font-uppercase c-font-bold">M&#225;y chủ: <span class="c-font-red">${detail.server.name}</span></p>
                        </div>
                        <div class="col-xs-2 col-sm-3 col-xs-6 c-product-variant">
                            <p class="c-product-meta-label c-product-margin-1 c-font-uppercase c-font-bold">H&#224;nh tinh: <span class="c-font-red">${detail.planet.toString()}</span></p>
                        </div>
                        <div class="col-xs-2 col-sm-3 col-xs-6 c-product-variant">
                            <p class="c-product-meta-label c-product-margin-1 c-font-uppercase c-font-bold">VẬT PHẨM:: <span class="c-font-red">${detail.item.toString()}</span></p>
                        </div>

                        <div class="col-xs-2 col-sm-3 col-xs-6 c-product-variant">
                            <p class="c-product-meta-label c-product-margin-1 c-font-uppercase c-font-bold">LOẠI ĐỒ: <span class="c-font-red">${detail.type.toString()}</span></p>
                        </div>

                    </div>

                    <div class="c-content-divider">
                        <i class="icon-dot"></i>
                    </div>
                </div>
            </div>
            <div class="container m-t-20 content_post">
                <div class="col-sm-12 text-center" style=" margin-bottom: 50px;">
                    <h2 style="font-family:Roboto; font-size:15px;"><span>Hình ảnh chi tiết của tài khoản </span><span style="color:#e7505a;">NGỌC RỒNG ONLINE #${detail.id}</span></h2>
                </div>
                <p>
                    <img src="${detail.image}" class="zoom">
                </p>
            </div>

        </div>

    </div>



    <!-- END: PAGE CONTENT -->
</div>

