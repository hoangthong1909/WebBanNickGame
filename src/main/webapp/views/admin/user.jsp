<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<div class="d-sm-flex align-items-center justify-content-between mb-4 offset-5">
    <h1 class="h3 mb-0 text-gray-800">User Management</h1>
</div>
    <c:if test="${user.id==null}">
        <c:set var="uri" scope="session" value="/admin/user/add"></c:set>
    </c:if>
    <c:if test="${user.id!=null}">
        <c:set var="uri" scope="session" value="/admin/user/update?id=${user.id}"></c:set>
    </c:if>
    <%--@elvariable id="user" type="lombok"--%>
    <form:form action="${uri}" method="post" modelAttribute="user">
        <div class="row">
            <div class="form-group mt-4 col-6">
                <form:label path="name">Name</form:label>
                <form:input name="name" path="name" class="form-control" value="${user.name}"/>
                <form:errors path="name" class="text-danger"/>
            </div>
            <div class="form-group mt-4 col-6">
                <form:label path="email">Email</form:label>
                <form:input  name="email" path="email" type="email" class="form-control" value="${user.email}"/>
                <form:errors path="email" class="text-danger"/>
            </div>
            <c:if test="${user.id==null}">
                <div class="form-group mt-4 col-6">
                    <form:label path="password">Password</form:label>
                    <form:input type="password" name="password" path="password" class="form-control"
                                value="${user.password}"/>
                    <form:errors path="password" class="text-danger"/>
                </div>
            </c:if>
            <div class="form-group mt-4 col-6">
                <form:label path="address">Address</form:label>
                <form:input name="address" path="address" class="form-control" value="${user.address}"/>
                <form:errors path="address" class="text-danger"/>
            </div>
            <div class="form-group mt-4 col-6">
                <form:label path="surplus">Surplus</form:label>
                <form:input type="text" name="surplus" path="surplus" class="form-control" value="${user.surplus}"/>
                <form:errors path="surplus" class="text-danger"/>
            </div>
            <div class="form-group mt-4 col-6">
                <label class="form-label  pe-4">Permission</label>
                <input class="form-check-input" checked type="radio" value="1" ${user.permission == 1 ? "checked" : ""}  name="permission">
                <label class="form-check-label me-5">Admin</label>
                <input class="form-check-input" type="radio" value="0" ${user.permission == 0 ? "checked" : ""} name="permission">
                <label class="form-check-label me-3">User</label>
        </div>
        </div>
        <c:if test="${user.id==null}">
            <button class="btn btn-success mt-2">Thêm</button>
        </c:if>
        <c:if test="${user.id!=null}">
            <button class="btn btn-success mt-2">Cập Nhật</button>
        </c:if>
        <button type="reset" class="btn btn-primary mt-2">Làm Mới</button>
        <br>

        <c:if test="${empty list}">
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
    </form:form>
    <form action="/admin/user/search" method="get" class="row g-3 mb-3 mt-2">
        <div class="col-11">
            <input type="text" name="search" class="form-control">
        </div>
        <div class="col-1">
            <button type="submit" class="btn btn-primary">Tìm Kiếm</button>
        </div>
    </form>

    <table class="table table-success table-striped">
        <thead>
        <tr>
            <th scope="col">STT</th>
            <th scope="col">Name</th>
            <th scope="col">Email</th>
            <th scope="col">Surplus</th>
            <th scope="col">Permission</th>
            <th scope="col">Address</th>
            <th></th>
            <th></th>
        </tr>
        </thead>
        <tbody>
            <c:forEach items="${list.content}" var="u" varStatus="status">
                <tr>
                    <td>#${status.count}</td>
                    <td>${u.name}</td>
                    <td>${u.email}</td>
                    <td><fmt:formatNumber value="${u.surplus}" pattern="#,###"/> VND</td>
                    <td>${u.permission ==1 ? "Admin" : "User"}</td>
                    <td>${u.address}</td>
                    <td>
                        <a href="/admin/user/edit?id=${u.id}" class="btn btn-primary">Cập Nhật</a>
                    </td>
                    <td>
                        <a data-toggle="modal" data-target="#b${u.id}" class="btn btn-danger">Xóa</a>
                    </td>
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
                <li ${list.number ==0 ? "hidden": ""} class="page-item"><a class="page-link" href="/admin/user/index?page=${list.number-1} ">Previous</a></li>
                <c:forEach var="i" begin="0" end="${ list.totalPages - 1 }">
                    <li class="page-item"><a class="page-link" href="/admin/user/index?page=${ i }">${ i + 1 }</a></li>
                    </li>
                </c:forEach>
                <li ${list.number ==list.totalPages-1 ? "hidden": ""} class="page-item"><a class="page-link" href="/admin/user/index?page=${list.number+1}">Next</a></li>
            </ul>
        </nav>
    </div>
<c:forEach items="${list.content}" var="u" varStatus="status">
    <div id="b${u.id}" class="modal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title">Xác nhận</h3>
                    <button type="button" class="btn-close" data-dismiss="modal"
                            aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <h5>Bạn muốn xóa user ${u.name} ?</h5>
                </div>
                <div class="modal-footer">
                    <form action="/admin/user/delete" method="post">
                        <input type="hidden" value="${u.id}" name="id">
                        <button class="btn btn-danger">Xóa</button>
                    </form>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal"
                            aria-label="Close">Hủy
                    </button>
                </div>
            </div>
        </div>
    </div>
</c:forEach>

<script>
    $(document).ready(function () {
        // Activate tooltip
        $('[data-toggle="tooltip"]').tooltip();

        // Select/Deselect checkboxes
        var checkbox = $('table tbody input[type="checkbox"]');
        $("#selectAll").click(function () {
            if (this.checked) {
                checkbox.each(function () {
                    this.checked = true;
                });
            } else {
                checkbox.each(function () {
                    this.checked = false;
                });
            }
        });
        checkbox.click(function () {
            if (!this.checked) {
                $("#selectAll").prop("checked", false);
            }
        });
    });
</script>