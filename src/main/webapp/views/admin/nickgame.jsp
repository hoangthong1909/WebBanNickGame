<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<div class="d-sm-flex align-items-center justify-content-between mb-4 offset-5">
    <h1 class="h3 mb-0 text-gray-800">Nick Management</h1>
</div>
    <c:if test="${pro.id==null}">
        <c:set var="uri" scope="session" value="/admin/nickgame/add"></c:set>
    </c:if>
    <c:if test="${pro.id!=null}">
        <c:set var="uri" scope="session" value="/admin/nickgame/update?id=${pro.id}"></c:set>
    </c:if>
    <%--@elvariable id="nickgame" type=""--%>
    <form:form action="${uri}" method="post" modelAttribute="nickgame" enctype="multipart/form-data">
        <div class="row">
            <div class="form-group mt-4 col-6">
                <label class="form-label">Category</label>
                <select class="form-select" name="idCategory">
                    <c:forEach items="${ listCate }" var="cate">
                        <option ${pro.idCategory.id==cate.id ? "selected":""} value="${ cate.id }">
                                ${ cate.name }
                        </option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group mt-4 col-6">
                <form:label path="">UserName</form:label>
                <form:input  path="user" class="form-control" value="${pro.user}"/>
            </div>
            <c:if test="${pro.id==null}">
                <div class="form-group mt-4 col-6">
                    <form:label path="password">Password</form:label>
                    <form:input type="password" name="password" path="password" class="form-control"
                                value="${pro.password}"/>
                </div>
            </c:if>
            <div class="form-group mt-4 col-6">
                <form:label path="price">Price</form:label>
                <form:input name="price" path="price" class="form-control" value="${pro.price}"/>
            </div>
            <div class="form-group mt-4 col-6">
                <label class="form-label fw-bold">Planet</label>
                <select class="form-select" name="planet">
                    <c:forEach items="${ planet }" var="planet">
                        <option ${pro.planet==planet.key ? "selected":""} value="${planet.key}">
                                ${ planet.value }
                        </option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group mt-4 col-6">
                <form:label path="" class="form-lable">Image</form:label>
                <input type="file" class="form-control" name="attach">
            </div>
            <div class="form-group mt-4 col-6">
                <label class="form-label fw-bold">Server</label>
                <select class="form-select" name="server">
                    <c:forEach items="${ listServer }" var="sv">
                        <option ${pro.server.id==sv.id ? "selected":""} value="${ sv.id }">
                                ${ sv.name }
                        </option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group mt-4 col-6">
                <label class="form-label fw-bold">Describe</label>
                <textarea class="form-control" name="describe" cols="30" rows="10">${pro.describe}</textarea>
            </div>
        </div>
        <c:if test="${pro.id==null}">
            <button class="btn btn-success mt-2">Thêm</button>
        </c:if>
        <c:if test="${pro.id!=null}">
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
    <form action="/admin/nickgame/search" method="get" class="row g-3 mb-3 mt-2">
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
            <th>STT</th>
            <th>Category</th>
            <th>Image</th>
            <th>UserName</th>
            <th>Price</th>
            <th>CreatedDate</th>
            <th>Planet</th>
            <th>Server</th>
            <th>Describe</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
            <c:forEach items="${list.content}" var="product" varStatus="status">
                <tr>
                    <td>#${status.count}</td>
                    <td>${product.idCategory.name}</td>
                    <td><img src="${product.image}" height="50px"></td>
                    <td>${product.user}</td>
                    <td><fmt:formatNumber value="${product.price}" pattern="#,###"/> VND</td>
                    <td><fmt:formatDate value="${product.createDate}" pattern="dd/MM/yyyy"/></td>
                    <td>${product.planet.toString()}</td>
                    <td>${product.server.name}</td>
                    <td>${product.describe}</td>
                    <td>
                        <a href="/admin/nickgame/edit?id=${product.id}" class="btn btn-primary">Cập Nhật</a>
                    </td>
                    <td>
                        <a data-bs-toggle="modal" data-bs-target="#b${product.id}" class="btn btn-danger">Xóa</a>
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
                <c:if test="${list.number-1>0}">
                    <c:set var="number" scope="session" value="?page=${list.number -1}"></c:set>
                </c:if>
                <c:if test="${list.number-1<1}">
                    <c:set var="number" scope="session" value=""></c:set>
                </c:if>
                <c:if test="${list.number+1>list.totalPages}">
                    <c:set var="numberup" scope="session" value="?page=${list.totalPages}"></c:set>
                </c:if>
                <c:if test="${list.number+1<list.totalPages}">
                    <c:set var="numberup" scope="session" value="?page=${list.number+1}"></c:set>
                </c:if>
                <li class="page-item"><a class="page-link" href="/admin/nickgame/index${number} ">Previous</a></li>
                <c:forEach var="i" begin="0" end="${ list.totalPages - 1 }">
                    <li class="page-item"><a class="page-link" href="/admin/nickgame/index?page=${ i }">${ i + 1 }</a></li>
                    </li>
                </c:forEach>
                <li class="page-item"><a class="page-link" href="/admin/nickgame/index${numberup}">Next</a></li>
            </ul>
        </nav>
    </div>
<c:forEach items="${list.content}" var="product" varStatus="status">
    <div id="b${product.id}" class="modal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title">Xác nhận</h3>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <h5>Bạn muốn xóa Nick Game Nay ?</h5>
                </div>
                <div class="modal-footer">
                    <form action="/admin/nickgame/delete" method="post">
                        <input type="hidden" value="${product.id}" name="id">
                        <button class="btn btn-danger">Xóa</button>
                    </form>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"
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