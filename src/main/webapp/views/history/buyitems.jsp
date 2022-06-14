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
                                        <h2 style="color: #19b1ff;">VẬT PHẨM ĐÃ MUA</h2>
                                        <div style="width: 140px; height: 1px; margin: 20px auto; border-bottom: 4px solid #19b1ff;"></div>
                                    </div>
                                    <!-- End-->
                                    <div class="content_post">
                                        <table class="table shopping-summery table-striped" >
                                            <thead>
                                            <tr>
                                                <th>Mã đơn hàng</th>
                                                <th>Thời gian</th>
                                                <th>ID Game</th>
                                                <th>Địa điểm giao dịch</th>
                                                <th>Số vật phẩm</th>
                                                <th>Tổng tiền</th>
                                                <th>Trạng thái</th>
                                                <th></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${history.content}" var="h" varStatus="status">
                                                <tr>
                                                    <td style="text-align: center">OD${h.id}</td>
                                                    <td style="text-align: center"><fmt:formatDate value="${h.datecreate}" pattern="dd/MM/yyyy HH:mm:ss"/></td>
                                                    <td style="text-align: center">${h.idGame}</td>
                                                    <td style="text-align: center">${h.location}</td>
                                                    <td style="text-align: center">${h.orderdetails.size()}</td>
                                                    <td style="text-align: center"><span style="color: red"><fmt:formatNumber value="${h.total}" pattern="#,###"/>VND</span></td>
                                                    <td style="text-align: center"> <c:choose>
                                                        <c:when test="${h.status ==0}"><span style="color: #0a58ca">Chờ giao dịch</span></c:when>
                                                        <c:when test="${h.status ==1}"><span style="color: #0c4128">Thành công</span></c:when>
                                                        <c:when test="${h.status ==2}"><span style="color: red">Hủy giao dịch</span></c:when>
                                                        <c:otherwise>-</c:otherwise>
                                                    </c:choose></td>
                                                    <td style="text-align: center"><a class="btn btn-info" href="/home/history/buyitems/show?id=${h.id}">Chi tiết</a></td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
<%--                                        <div class="row">--%>
<%--                                            <nav aria-label="Page navigation example" class="d-flex justify-content-end col-6">--%>
<%--                                                <ul class="pagination">--%>
<%--                                                    <c:if test="${history.number-1>0}">--%>
<%--                                                        <c:set var="number" scope="session" value="?page=${list.number -1}"></c:set>--%>
<%--                                                    </c:if>--%>
<%--                                                    <c:if test="${history.number-1<1}">--%>
<%--                                                        <c:set var="number" scope="session" value=""></c:set>--%>
<%--                                                    </c:if>--%>
<%--                                                    <c:if test="${history.number+1>list.totalPages}">--%>
<%--                                                        <c:set var="numberup" scope="session" value="?page=${history.totalPages}"></c:set>--%>
<%--                                                    </c:if>--%>
<%--                                                    <c:if test="${history.number+1<list.totalPages}">--%>
<%--                                                        <c:set var="numberup" scope="session" value="?page=${history.number+1}"></c:set>--%>
<%--                                                    </c:if>--%>
<%--                                                    <li class="page-item"><a class="page-link" href="/home/history/transaction${number} ">Previous</a></li>--%>
<%--                                                    <c:forEach var="i" begin="0" end="${ history.totalPages - 1 }">--%>
<%--                                                        <li class="page-item"><a class="page-link" href="/home/history/transaction?page=${ i }">${ i + 1 }</a></li>--%>
<%--                                                        </li>--%>
<%--                                                    </c:forEach>--%>
<%--                                                    <c:if test="${history.number+1<list.totalPages}">--%>
<%--                                                        <li class="page-item"><a class="page-link" href="/admin/order/index${numberup}">Next</a></li>--%>
<%--                                                    </c:if>--%>
<%--                                                </ul>--%>
<%--                                            </nav>--%>
<%--                                        </div>--%>
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


