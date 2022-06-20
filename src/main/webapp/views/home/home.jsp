<%--
  Created by IntelliJ IDEA.
  User: thongpro
  Date: 6/9/22
  Time: 5:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<div class="c-layout-page">
    <!-- BEGIN: PAGE CONTENT -->
    <div class="c-content-box">
        <div id="slider" class="owl-theme section section-cate slideshow_full_width ">
            <div id="slide_banner" class="owl-carousel">

            </div>
        </div>
    </div>
    <!-- BEGIN: PAGE CONTENT -->

    <div  class="c-content-box c-size-md c-bg-white groomsmen-bridesmaids">
        <div class="container">
            <!-- Begin: Testimonals 1 component -->
            <div class="row">
                <div class="heading col-sm-12 text-center" style=" margin-bottom: 20px; margin-top:40px;">
                    <h2>
                        MENU GIAO DỊCH
                    </h2>
                    <div style="width: 100px; height: 1px; margin: 20px auto; border-bottom: 4px solid #e90606;"></div>
                </div>
                <div class="row-flex-safari game-list">
                    <div class="col-sm-3 col-xs-6 p-5">
                        <div class="classWithPad1" style="border: 0px solid #cccccc;">
                            <a href="/home/card" title="">
                                <div class="news_image">
                                    <img src="/images/category/NapThe.png">
                                </div>
                            </a>
                            <div class="news_title">
                                <a href="/home/card" title="">NẠP THẺ</a>
                            </div>
                        </div>
                    </div>
<%--                    <c:if test="${!empty sessionScope.user}">--%>
                    <div class="col-sm-3 col-xs-6 p-5">
                        <div class="classWithPad1" style="border: 0px solid #cccccc;">
                            <a href="/home/info" title="">
                                <div class="news_image">
                                    <img src="/images/category/TaiKhoan.png">
                                </div>
                            </a>
                            <div class="news_title">
                                <a href="/home/info" title="">TÀI KHOẢN</a>
                            </div>
                        </div>
                    </div>
<%--                    </c:if>--%>
<%--                <c:if test="${empty sessionScope.user}">--%>
<%--                    <div class="col-sm-3 col-xs-6 p-5">--%>
<%--                        <div class="classWithPad1" style="border: 0px solid #cccccc;">--%>
<%--                            <a href="/login" title="">--%>
<%--                                <div class="news_image">--%>
<%--                                    <img src="/images/category/TaiKhoan.png">--%>
<%--                                </div>--%>
<%--                            </a>--%>
<%--                            <div class="news_title">--%>
<%--                                <a href="/login" title="">TÀI KHOẢN</a>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </c:if>--%>
                    <div class="col-sm-3 col-xs-6 p-5">
                        <div class="classWithPad1" style="border: 0px solid #cccccc;">
                            <a href="/home/index" title="">
                                <div class="news_image">
                                    <img src="/images/category/DichVu.png">
                                </div>
                            </a>
                            <div class="news_title">
                                <a href="/home/index" title="">DỊCH VỤ</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3 col-xs-6 p-5">
                        <div class="classWithPad1" style="border: 0px solid #cccccc;">
                            <a href="/home/index" title="">
                                <div class="news_image">
                                    <img src="/images/category/NickRandom.png">
                                </div>
                            </a>
                            <div class="news_title">
                                <a href="/home/index" title="">VÒNG QUAY</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End-->
        </div>
    </div>
    <div class="c-content-box c-size-md c-bg-white groomsmen-bridesmaids">
        <div class="container">
            <!-- Begin: Testimonals 1 component -->
            <div class="row">
                <div class="heading col-sm-12 text-center" style=" margin-bottom: 20px; margin-top:40px;">
                    <h2>
                        DANH MỤC GAME
                    </h2>
                    <div style="width: 100px; height: 1px; margin: 20px auto; border-bottom: 4px solid #e90606;"></div>
                </div>
                <div class="row-flex-safari game-list">
                    <c:forEach items="${listCate}" var="cate">
                        <div class="col-sm-3 col-xs-6 p-5">
                            <div class="classWithPad">
                                <c:if test="${cate.status==1}">
                                    <a href="/home/showNick?id=${cate.id}" title="">
                                        <div class="news_image">
                                            <img src="${cate.image}">
                                        </div>
                                    </a>
                                </c:if>
                                <c:if test="${cate.status==2}">
                                    <a href="/home/showVP?id=${cate.id}" title="">
                                        <div class="news_image">
                                            <img src="${cate.image}">
                                        </div>
                                    </a>
                                </c:if>
<%--                                <a href="#" title="">--%>
<%--                                    <div class="news_image">--%>
<%--                                        <img src="${cate.image}">--%>
<%--                                    </div>--%>
<%--                                </a>--%>
                                <div class="news_title">
                                    <c:if test="${cate.status==1}">
                                    <a href="/home/showNick?id=${cate.id}" title=""></a>
                                    </c:if>
                                    <c:if test="${cate.status==2}">
                                        <a href="/home/showVP?id=${cate.id}" title=""></a>
                                    </c:if>
                                </div>
                                <div class="news_description">
                                    <p>Số tài khoản:
                                        <c:choose>
                                            <c:when test="${cate.status ==1}">${cate.listProduct.size()}</c:when>
                                            <c:when test="${cate.status ==2}">${cate.listItems.size()}</c:when>
                                            <c:otherwise>-</c:otherwise>
                                        </c:choose>
                                    </p>
                                </div>
                                <div class="a-more">
                                    <div class="row">
                                        <div class="col-md-8 col-md-offset-2 col-xs-10 col-xs-offset-1">
                                            <c:if test="${cate.status==1}">
                                                <a href="/home/showNick?id=${cate.id}" title="">
                                                    <div class="view">
                                                        XEM THÊM
                                                    </div>
                                                </a>
                                            </c:if>
                                            <c:if test="${cate.status==2}">
                                                <a href="/home/showVP?id=${cate.id}" title="">
                                                    <div class="view">
                                                        XEM THÊM
                                                    </div>
                                                </a>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <!-- End-->
        </div>
    </div>
</div>
