<%--
  Created by IntelliJ IDEA.
  User: thongpro
  Date: 6/12/22
  Time: 11:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<link rel="stylesheet" href="/css/style.css">
<div class="c-layout-page">
    <!-- BEGIN: PAGE CONTENT -->
    <div class="c-content-box c-size-md c-bg-white">
        <div class="container">
            <div class="row">
                <div class="row-flex-safari game-list">
                    <section id="cardbody" class="section">
                        <div class="row">
                            <jsp:include page="/views/home/menu.jsp"/>
                            <div class="col-xs-12 col-md-9">
                                <div class="panel">
                                    <div class="col-sm-12 text-center" style="font-family:Roboto; margin-bottom: 20px;">
                                        <h2 style="color: #19b1ff;">LỊCH SỬ GIAO DỊCH</h2>
                                        <div style="width: 140px; height: 1px; margin: 20px auto; border-bottom: 4px solid #19b1ff;"></div>
                                    </div>
                                    <!-- End-->
                                    <div class="content_post">
                                        <table class="table shopping-summery table-striped">
                                            <thead>
                                            <tr>
                                                <th scope="col">STT</th>
                                                <th scope="col">Nhà mạng</th>
                                                <th scope="col">Mệnh giá</th>
                                                <th scope="col">Seri</th>
                                                <th scope="col">Code</th>
                                                <th scope="col">Thời gian</th>
                                                <th scope="col">Trạng thái</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${history.content}" var="h" varStatus="status">
                                                <tr>
                                                    <td>#${status.count}</td>
                                                    <td>${h.type}</td>
                                                    <td><fmt:formatNumber value="${h.parValue.price}" pattern="#,###"/>VND</td>
                                                    <td>${h.seri}</td>
                                                    <td>${h.code}</td>
                                                    <td><fmt:formatDate value="${h.time}"
                                                                        pattern="dd/MM/yyyy HH:mm:ss"/></td>
                                                    <td><c:choose>
                                                        <c:when test="${h.status ==1}"><span style="color: #0a58ca">Chờ xử lí</span></c:when>
                                                        <c:when test="${h.status ==2}"><span style="color: #0c4128">Thành công</span></c:when>
                                                        <c:when test="${h.status ==3}"><span
                                                                style="color: red">Thẻ sai</span></c:when>
                                                        <c:when test="${h.status ==0}"><span
                                                                style="color: red">Thẻ Khóa</span></c:when>
                                                        <c:otherwise>-</c:otherwise>
                                                    </c:choose></td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                        <div class="dataTables_wrapper no-footer">
                                            <div class="dataTables_paginate">
                                                <%--          <a href="/home/showVP?id=${idcatevp}&&?page=${listItems.number-1}" class="paginate_button previous prev">&lt;</a>--%>
                                                <c:forEach var="i" begin="0" end="${ history.totalPages - 1 }">
                                                         <span>
                                                        <a href="/home/history/transaction?page=${i}"
                                                            class="paginate_button current ">${i+1}</a>
                                                                </span>
                                                </c:forEach>
                                                <%--          <a href="/home/showVP?id=${idcatevp}&&?page=${listItems.number+1}" class="paginate_button next ${listItems.number ==listItems.totalPages-1 ? "disabled-link": ""}">&gt;</a>--%>
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


