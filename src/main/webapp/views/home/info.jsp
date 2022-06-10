<%--
  Created by IntelliJ IDEA.
  User: thongpro
  Date: 6/11/22
  Time: 12:59 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<div class="c-layout-page">
    <!-- BEGIN: PAGE CONTENT -->
    <div class="c-content-box c-size-md c-bg-white">
        <div class="container">
            <div class="row">
                <div class="row-flex-safari game-list">
                    <section id="cardbody" class="section">
                        <div class="row">
                            <jsp:include page="menu.jsp"/>
                            <div class="col-xs-12 col-md-9">
                                <div class="panel">
                                    <div class="panel">
                                        <div class="col-sm-12 dv-title">
                                            <h2>THÔNG TIN TÀI KHOẢN</h2>
                                            <div class="gach"></div>
                                        </div>
                                    </div>
                                    <div class="content_post">
                                        <div class="row">
                                            <div class="col-md-8 col-md-offset-4">
                                                <div class="col-md-12 has-textbox">
                                                    <div class="form-group row m-0">
                                                        <spam class="col-md-3 col-xs-6 control-label bb ar m-0">ID
                                                            của bạn:</spam>
                                                        <spam class="col-md-8 col-xs-6 control-label al bb m-0">
                                                            TK${sessionScope.user.id}</spam>
                                                    </div>
                                                </div>
                                                <div class="col-md-12 has-textbox">
                                                    <div class="form-group row m-0">
                                                        <spam class="col-md-3 col-xs-6 control-label bb ar m-0">Tên
                                                            tài khoản:</spam>
                                                        <spam class="col-md-8 col-xs-6 control-label al bb m-0">
                                                            ${sessionScope.user.name}</spam>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 has-textbox m-0" >
                                                    <div class="form-group row">
                                                        <spam class="col-md-3 col-xs-6 control-label bb ar">
                                                            Email:</spam>
                                                        <spam class="col-md-8 col-xs-6 control-label al">
                                                            ${sessionScope.user.email}</spam>
                                                    </div>
                                                </div>
                                                <div class="col-md-12 has-textbox m-0">
                                                    <div class="form-group row">
                                                        <spam class="col-md-3 col-xs-6 control-label bb ar">Mật
                                                            khẩu:</spam>
                                                        <spam class="col-md-8 col-xs-6 control-label al"><a
                                                                href="/home/changepassword"
                                                                style="color:#19b1ff; font-weight:bold;">Nhấn
                                                            đổi mật khẩu</a></spam>
                                                    </div>
                                                </div>
                                                <div class="col-md-12 has-textbox m-0">
                                                    <div class="form-group row">
                                                        <spam class="col-md-3 col-xs-6 control-label bb ar">Số
                                                            dư:</spam>
                                                        <spam class="col-md-8 col-xs-6 control-label al bb"
                                                              style="color:#d70f0f;"><fmt:formatNumber value="${sessionScope.user.surplus}" pattern="#,###"/> VNĐ</spam>
                                                    </div>
                                                </div>
                                                <div class="col-md-12 has-textbox m-0">
                                                    <div class="form-group row">
                                                        <spam class="col-md-3 col-xs-6 control-label bb ar">Địa Chỉ:</spam>
                                                        <spam class="col-md-8 col-xs-6 control-label al">
                                                            ${sessionScope.user.address}</spam>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </div>
    <!-- END: PAGE CONTENT -->
</div>

