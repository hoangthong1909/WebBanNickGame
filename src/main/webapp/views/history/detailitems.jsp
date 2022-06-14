<%--
  Created by IntelliJ IDEA.
  User: thongpro
  Date: 6/13/22
  Time: 9:11 PM
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
                                        <h2 style="color: #19b1ff;">CHI TIẾT VẬT PHẨM ĐÃ MUA</h2>
                                        <div style="width: 140px; height: 1px; margin: 20px auto; border-bottom: 4px solid #19b1ff;"></div>
                                    </div>
                                    <!-- End-->
                                    <div class="content_post">
                                        <table class="table shopping-summery" >
                                            <thead>
                                            <tr>
                                                <th scope="col">STT</th>
                                                <th>Hình ảnh</th>
                                                <th>Vật phẩm</th>
                                                <th>Loại</th>
                                                <th>Hành tinh</th>
                                                <th>Máy chủ</th>
                                                <th>Giá tiền</th>
                                                <th>Số lượng</th>
                                                <th>Tổng tiền</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${orderDetail}" var="orderdetail" varStatus="status">
                                                <tr>
                                                    <td>#${status.count}</td>
                                                    <td class="image"><img src="${orderdetail.items.image}" alt=""></td>
                                                    <td style="text-align: center">${orderdetail.items.item.toString()}</td>
                                                    <td style="text-align: center">${orderdetail.items.type.toString()}</td>
                                                    <td style="text-align: center">${orderdetail.items.planet.toString()}</td>
                                                    <td style="text-align: center">${orderdetail.items.server.name}</td>
                                                    <td style="text-align: center"><fmt:formatNumber value="${orderdetail.price}" pattern="#,###"/>VND</td>
                                                    <td style="text-align: center">${orderdetail.quantity}</td>
                                                    <td style="text-align: center"><span style="color: red"><fmt:formatNumber value="${orderdetail.price*orderdetail.quantity}" pattern="#,###"/> VND</span></td>
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



