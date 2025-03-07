<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<div class="d-sm-flex align-items-center justify-content-between mb-4 offset-5">
    <h1 class="h3 mb-0 text-gray-800">Catagory Management</h1>
</div>
<c:if test="${cate.id==null}">
        <c:set var="uri" scope="session" value="/admin/category/add"></c:set>
    </c:if>
    <c:if test="${cate.id!=null}">
        <c:set var="uri" scope="session" value="/admin/category/update?id=${cate.id}"></c:set>
    </c:if>
    <%--@elvariable id="category" type="lombok"--%>
    <form:form action="${uri}" method="post" modelAttribute="category"  enctype="multipart/form-data">
        <div class="row">
            <div class="form-group mt-4 col-6">
                <form:label path="name">Category Name</form:label>
                <form:input name="name" path="name" class="form-control" value="${cate.name}"/>
            </div>
            <div class="form-group mt-4 col-6">
                <form:label path="" class="form-lable">Image</form:label>
                <input type="file" class="form-control" name="attach">
            </div>
        </div>
        <div class="row">
            <div class="form-group mt-4 col-6">
                <label class="form-label  pe-4">Classify</label>
                <input class="form-check-input" checked type="radio" value="1" ${cate.status == 1 ? "checked" : ""}  name="status">
                <label class="form-check-label me-5">Account</label>
                <input class="form-check-input" type="radio" value="2" ${cate.status == 2 ? "checked" : ""} name="status">
                <label class="form-check-label me-3">Items</label>
<%--            <form:label path="status" class="form-lable">Classify:</form:label>--%>
<%--            <form:radiobutton path="status" value="1" label="Account" checked="${cate.status == 1 ? 'checked' : ''}"/>--%>
<%--            <form:radiobutton path="status" value="2" label="Items"  checked="${cate.status == 2 ? 'checked' : ''}"/>--%>
        </div>
        </div>
        <c:if test="${cate.id==null}">
            <button class="btn btn-success mt-2">Thêm</button>
        </c:if>
        <c:if test="${cate.id!=null}">
            <button class="btn btn-success mt-2">Cập Nhật</button>
        </c:if>
        <button type="reset" class="btn btn-primary mt-2">Làm Mới</button>
        <br>

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
    </form:form>
    <form action="/admin/category/search" method="get" class="row g-3 mb-3 mt-2">
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
            <th scope="col">Image</th>
            <th scope="col">Name</th>
            <th scope="col">Classify</th>
            <th></th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${list.content}" var="category" varStatus="status">
            <tr>
                <td>#${status.count}</td>
                <td><img src="${category.image}" height="50px"></td>
                <td>${category.name}</td>
                <td>
                    <c:choose>
                        <c:when test="${category.status ==1}">Account</c:when>
                        <c:when test="${category.status ==2}">Items</c:when>
                        <c:otherwise>-</c:otherwise>
                    </c:choose>
                </td>
                <td>
                    <a href="/admin/category/edit?id=${category.id}" class="btn btn-primary">Cập Nhật</a>
                </td>
                <td>
                    <a data-toggle="modal" data-target="#s${category.id}" class="btn btn-danger">Xóa</a>
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
                <li ${list.number ==0 ? "hidden": ""} class="page-item"><a class="page-link" href="/admin/category/index?page=${list.number-1} ">Previous</a></li>
                <c:forEach var="i" begin="0" end="${ list.totalPages - 1 }">
                    <li class="page-item"><a class="page-link" href="/admin/category/index?page=${ i }">${ i + 1 }</a></li>
                    </li>
                </c:forEach>
                <li ${list.number ==list.totalPages-1 ? "hidden": ""} class="page-item"><a class="page-link" href="/admin/category/index?page=${list.number+1}">Next</a></li>

            </ul>
        </nav>
    </div>
<c:forEach items="${list.content}" var="category" varStatus="status">
    <div id="s${category.id}" class="modal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title">Xác nhận</h3>
                    <button type="button" class="btn-close" data-dismiss="modal"
                            aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <h5>Bạn muốn xóa category ${category.name} ?</h5>
                </div>
                <div class="modal-footer">
                    <form action="/admin/category/delete" method="post">
                        <input type="hidden" value="${category.id}" name="id">
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
