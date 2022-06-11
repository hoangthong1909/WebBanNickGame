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
                <h2 style="font-family:Roboto;"><span>THÔNG TIN TÀI KHOẢN </span><span style="color:#e7505a;">#${detailNick.id}</span></h2>
                <span>Để Xem thêm chi tiết về tài khoản vui lòng kéo xuống bên dưới.</span>
            </div>
            <div class="c-shop-product-details-4">
                <div class="row">
                    <div class="col-md-8">
                        <div class="form-group row">
                            <spam class="col-xs-6 control-label s-product-nameprice">TIỀN CARD:</spam>
                            <spam class="col-xs-6 control-label s-product-price"><fmt:formatNumber value="${detailNick.price}" pattern="#,###"/> VNĐ</spam>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group row">
                            <div class="col-xs-7 ar">
                                <c:if test="${detailNick.status==2}">
                                    <h2 >Đã bán</h2>
                                </c:if>
                                <c:if test="${detailNick.status==1}">
                                    <c:if test="${ !empty sessionScope.user}">
                                    <button  data-toggle="modal" data-target="#Modal_ATM" class="btn btn-info btn-block btn2">MUA NGAY</button>
                                    </c:if>
                                    <c:if test="${ empty sessionScope.user}">
                                        <a href="/login" class="btn btn-info btn-block btn2">MUA NGAY</a>
                                    </c:if>
                                </c:if>
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
                            <p class="c-product-meta-label c-product-margin-1 c-font-uppercase c-font-bold">M&#225;y chủ: <span class="c-font-red">${detailNick.server.name}</span></p>
                        </div>
                        <div class="col-xs-2 col-sm-3 col-xs-6 c-product-variant">
                            <p class="c-product-meta-label c-product-margin-1 c-font-uppercase c-font-bold">H&#224;nh tinh: <span class="c-font-red">${detailNick.planet.toString()}</span></p>
                        </div>
                        <div class="col-xs-2 col-sm-3 col-xs-6 c-product-variant">
                            <p class="c-product-meta-label c-product-margin-1 c-font-uppercase c-font-bold">MÔ TẢ: <span class="c-font-red">${detailNick.describe}</span></p>
                        </div>

                    </div>

                    <div class="c-content-divider">
                        <i class="icon-dot"></i>
                    </div>
                </div>
            </div>
            <div class="container m-t-20 content_post">
                <div class="col-sm-12 text-center" style=" margin-bottom: 50px;">
                    <h2 style="font-family:Roboto; font-size:15px;"><span>Hình ảnh chi tiết của tài khoản </span><span style="color:#e7505a;">NGỌC RỒNG ONLINE #${detailNick.id}</span></h2>
                </div>
                <p>
                    <img src="${detailNick.image}" class="zoom">
                </p>
            </div>

        </div>

    </div>
    <!-- END: PAGE CONTENT -->
</div>
<div class="modal fade" id="Modal_ATM" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" style="color:#19b1ff;">&times;</button>
                <h4 class="modal-title" style="color:#19b1ff;">Xác nhận mua tài khoản</h4>
            </div>
            <div class="modal-body">
                <a href="/home/card"><h4 class="text-center" style="color:#ff1919;font-weight:bold;"> NẠP TIỀN TỪ ATM - VÍ TẠI ĐÂY</h4></a>

                <div class="row">
                    <div class="col-md-12">
                        <a data-toggle="tab" href="#TT" class="btn btn-lg col-xs-6 btn-default atm rounded-0">THANH TOÁN</a>
                        <a data-toggle="tab" href="#TK" class="btn btn-lg col-xs-6 btn-default atm  rounded-0">TÀI KHOẢN</a>
                        <div class="tab-content" style="padding-top: 55px;">
                            <div id="TT" class="tab-pane fade in active">
                                <div class="col-md-12 p-5 text-border">
                                    <div class="form-group row">
                                        <span class="col-md-12 control-label bb">Thông tin tài khoản #${detailNick.id}</span>
                                    </div>
                                </div>
                                <div class="col-md-12 p-5 text-border">
                                    <div class="form-group row">
                                        <span class="col-xs-6 col-md-6 control-label al">Nhà phát hành:</span>
                                        <span class="col-xs-6 col-md-6 control-label bb">TeaMobi</span>
                                    </div>
                                </div>
                                <div class="col-md-12 p-5 text-border">
                                    <div class="form-group row">
                                        <span class="col-xs-6 col-md-6 control-label al">Tên game:</span>
                                        <span class="col-xs-6 col-md-6 control-label bb">NGỌC RỒNG ONLINE</span>
                                    </div>
                                </div>
                                <div class="col-md-12 p-5 text-border">
                                    <div class="form-group row">
                                        <span class="col-xs-6 col-md-6 control-label al">Giá tiền:</span>
                                        <span class="col-xs-6 col-md-6 control-label bb"><fmt:formatNumber value="${detailNick.price}" pattern="#,###"/> VNĐ</span>
                                    </div>
                                </div>
                            </div>
                            <div id="TK" class="tab-pane fade ">
                                <div class="col-md-12 p-5 text-border">
                                    <div class="form-group row">
                                        <span class="col-md-12 control-label bb">Chi Tiết tài khoản #${detailNick.id}</span>
                                    </div>
                                </div>
                                <div class="col-md-12 p-5 text-border">
                                    <div class="form-group row">
                                        <span class="col-xs-6 col-md-6 control-label al">Tên Nhân Vật:</span>
                                        <span class="col-xs-6 col-md-6 control-label bb">${detailNick.user}</span>
                                    </div>
                                </div>
                                <div class="col-md-12 p-5 text-border">
                                    <div class="form-group row">
                                        <span class="col-xs-6 col-md-6 control-label al">Máy chủ:</span>
                                        <span class="col-xs-6 col-md-6 control-label bb">${detailNick.server.name}</span>
                                    </div>
                                </div>
                                <div class="col-md-12 p-5 text-border">
                                    <div class="form-group row">
                                        <span class="col-xs-6 col-md-6 control-label al">Hành tinh:</span>
                                        <span class="col-xs-6 col-md-6 control-label bb">${detailNick.planet.toString()}</span>
                                    </div>
                                </div>
                                <div class="col-md-12 p-5 text-border">
                                    <div class="form-group row">
                                        <span class="col-xs-6 col-md-6 control-label al">Đăng ký:</span>
                                        <span class="col-xs-6 col-md-6 control-label bb">Ảo</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <c:if test="${ sessionScope.user.surplus<detailNick.price}">
                            <p style="color:#ff0000;text-align: center;padding-top: 20px;">
                                Bạn cần thêm <fmt:formatNumber value="${detailNick.price-sessionScope.user.surplus}" pattern="#,###"/> VNĐ để mua tài khoản này. Bạn hãy click vào nút nạp thẻ để nạp
                                thêm và mua tài khoản.
                            </p>
                        </c:if>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
            <c:if test="${ sessionScope.user.surplus<detailNick.price}">
                <a href="/home/card" class="btn btn-info mini">NẠP THẺ CÀO</a>
            </c:if>
                <c:if test="${ sessionScope.user.surplus>detailNick.price}">
                    <a href="/home/card" class="btn btn-success mini">THANH TOÁN</a>

                </c:if>
            <button type="button" class="btn btn-warning mini" data-dismiss="modal">Đóng</button>
            </div>
        </div>
        </div>

    </div>
</div>
<script>
    $(document).ready(function () {
        if ($("#mess").val() != '') {
            swal($("#mess").val());
        }
        $(".atm").on("click", function () {
            $(".atm").removeClass('btn-info');
            $(this).addClass('btn-info');
        });
    });
</script>

