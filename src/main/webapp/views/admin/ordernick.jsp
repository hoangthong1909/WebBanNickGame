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
    <h1 class="h3 mb-0 text-gray-800">Order Management</h1>
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
        <th>Image</th>
        <th>CharacterName</th>
        <th>Planet</th>
        <th>Server</th>
        <th>DateCreate</th>
        <th>Total</th>
        <th scope="col">Status</th>
        <th></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${list.content}" var="order" varStatus="status">
        <tr>
            <td>#${status.count}</td>
            <td>${order.userDatHang.name}</td>
             <c:forEach items="${order.getOrderdetails()}" var="o" varStatus="status">
            <td><img height="50px" src="${o.nickGame.image}" alt=""></td>
            <td>${o.nickGame.user}</td>
            <td>${o.nickGame.planet.toString()}</td>
            <td>${o.nickGame.server.name}</td>
            </c:forEach>
            <td><fmt:formatDate value="${order.datecreate}" pattern="dd/MM/yyyy HH:mm:ss"/></td>
            <td><fmt:formatNumber value="${order.total}" pattern="#,###"/>VND</td>
            <td style="text-align: center"> <c:choose>
            <c:when test="${order.status ==2}"><span style="color: #0c4128">Thành công</span></c:when>
            <c:otherwise>-</c:otherwise>
        </c:choose></td>
            <td>
                <button data-toggle="modal" data-target="#cu${order.id}" class="btn btn-danger">Delete</button>
            </td>
            <div id="cu${order.id}" class="modal" tabindex="-1">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h3 class="modal-title">Xác nhận</h3>
                            <button type="button" class="btn-close" data-dismiss="modal"
                                    aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <h5>Bạn muốn xóa Order ${order.id} ?</h5>
                        </div>
                        <div class="modal-footer">
                            <form action="/admin/order/delete" method="post">
                                <input type="hidden" value="${order.id}" name="id">
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
            <li ${list.number ==0 ? "hidden": ""} class="page-item"><a class="page-link" href="/admin/order/nick?page=${list.number-1} ">Previous</a></li>
            <c:forEach var="i" begin="0" end="${ list.totalPages - 1 }">
                <li class="page-item"><a class="page-link" href="/admin/order/nick?page=${ i }">${ i + 1 }</a></li>
                </li>
            </c:forEach>
            <li ${list.number ==list.totalPages-1 ? "hidden": ""} class="page-item"><a class="page-link" href="/admin/order/nick?page=${list.number+1}">Next</a></li>
        </ul>
    </nav>
</div>



