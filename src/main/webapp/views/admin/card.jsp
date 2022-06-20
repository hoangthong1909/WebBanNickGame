<%--
  Created by IntelliJ IDEA.
  User: thongpro
  Date: 6/10/22
  Time: 5:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<div class="d-sm-flex align-items-center justify-content-between mb-4 offset-5">
    <h1 class="h3 mb-0 text-gray-800">Card Management</h1>
</div>
<c:if test="${empty list.content}">
        <p class="alert alert-warning">
            Vui Lòng Thêm Mới Dữ Liệu
        </p>
    </c:if>
    <c:if test="${!empty sessionScope.message }">
        <div class="alert alert-success mt-3">
                ${ sessionScope.message }
            <c:remove var="message" scope="session"/>
        </div>
    </c:if>
    <c:if test="${!empty sessionScope.error }">
        <div class="alert alert-danger mt-3">
                ${ sessionScope.error }
            <c:remove var="error" scope="session"/>
        </div>
    </c:if>
    <table class="table table-success table-striped" >
        <thead>
        <tr>
            <th scope="col">STT</th>
            <th scope="col">UserName</th>
            <th scope="col">CardType</th>
            <th scope="col">ParValue</th>
            <th scope="col">Seri</th>
            <th scope="col">Code</th>
            <th scope="col">Time</th>
            <th scope="col">Status</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${list.content}" var="card" varStatus="status">
            <tr>
                <td>#${status.count}</td>
                <td>${card.userId.name}</td>
                <td>${card.type}</td>
                <td><fmt:formatNumber value="${card.parValue.price}" pattern="#,###"/>VND</td>
                <td>${card.seri}</td>
                <td>${card.code}</td>
                <td><fmt:formatDate value="${card.time}" pattern="dd/MM/yyyy HH:mm:ss"/></td>
                <td> <c:choose>
                    <c:when test="${card.status ==1}">
                        <button data-toggle="modal" data-target="#aa${card.id}" class="btn btn-success">Confirm</button>
                        <button data-toggle="modal" data-target="#cc${card.id}" class="btn btn-danger">Cancel</button>
                    </c:when>
                    <c:when test="${card.status ==2}"><span style="color: green">Confirmed</span></c:when>
                    <c:when test="${card.status ==3}"><span style="color: red">Cancelled</span></c:when>
                    <c:otherwise>-</c:otherwise>
                </c:choose></td>
                <td>
                    <button data-toggle="modal" data-target="#kaka${card.id}" class="btn btn-danger">Xóa</button>
                </td>
                <div id="cc${card.id}" class="modal" tabindex="-1">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h3 class="modal-title">Xác nhận</h3>
                                <button type="button" class="btn-close" data-dismiss="modal"
                                        aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <h5> Hủy Đơn nạp thẻ của khách hàng ${card.userId.name} ?</h5>
                            </div>
                            <div class="modal-footer">
                                <form action="/admin/card/cancel" method="post">
                                    <input type="hidden" value="${card.id}" name="id">
                                    <button class="btn btn-success">Xác Nhận</button>
                                </form>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal"
                                        aria-label="Close">Hủy
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                    <%--            Modal confirm--%>
                <div id="aa${card.id}" class="modal" tabindex="-1">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h3 class="modal-title">Xác nhận</h3>
                                <button type="button" class="btn-close" data-dismiss="modal"
                                        aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <h5>Xác Nhận Đơn nạp thẻ của khách ${card.userId.name} ?</h5>
                            </div>
                            <div class="modal-footer">
                                <form action="/admin/card/confirm" method="post">
                                    <input type="hidden" value="${card.id}" name="id">
                                    <button class="btn btn-success">Xác Nhận</button>
                                </form>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal"
                                        aria-label="Close">Hủy
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="kaka${card.id}" class="modal" tabindex="-1">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h3 class="modal-title">Xác nhận</h3>
                                <button type="button" class="btn-close" data-dismiss="modal"
                                        aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <h5>Bạn muốn xóa Card ${card.id} ?</h5>
                            </div>
                            <div class="modal-footer">
                                <form action="/admin/card/delete" method="post">
                                    <input type="hidden" value="${card.id}" name="id">
                                    <button class="btn btn-danger">Xóa</button>
                                </form>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal"
                                        aria-label="Close">Hủy
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="row">
        <div class="col-6">
            <p class="d-flex justify-content-start">
                Trang Số : <span style="color: red">&nbsp ${list.number + 1} </span> &nbsp trong tổng số : <span
                    style="color: red">&nbsp${list.totalPages} </span>
            </p>
            <p class="d-flex justify-content-start">
                Hiển Thị : <span style="color: red"> &nbsp${list.numberOfElements} </span> &nbsp trong tổng số : <span
                    style="color: red"> &nbsp${list.totalElements} </span> &nbsp sản phẩm
            </p>
        </div>
        <nav aria-label="Page navigation example" class="d-flex justify-content-end col-6">
            <ul class="pagination">
                <li ${list.number ==0 ? "hidden": ""} class="page-item"><a class="page-link" href="/admin/card/index?page=${list.number-1} ">Previous</a></li>
                <c:forEach var="i" begin="0" end="${ list.totalPages - 1 }">
                    <li class="page-item"><a class="page-link" href="/admin/card/index?page=${ i }">${ i + 1 }</a></li>
                    </li>
                </c:forEach>
                <li ${list.number ==list.totalPages-1 ? "hidden": ""} class="page-item"><a class="page-link" href="/admin/card/index?page=${list.number+1}">Next</a></li>
            </ul>
        </nav>
    </div>
