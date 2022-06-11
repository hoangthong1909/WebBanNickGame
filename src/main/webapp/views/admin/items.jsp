<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<div class="d-sm-flex align-items-center justify-content-between mb-4 offset-5">
    <h1 class="h3 mb-0 text-gray-800">Items Management</h1>
</div>
    <c:if test="${item.id==null}">
        <c:set var="uri" scope="session" value="/admin/items/add"></c:set>
    </c:if>
    <c:if test="${item.id!=null}">
        <c:set var="uri" scope="session" value="/admin/items/update?id=${item.id}"></c:set>
    </c:if>
    <%--@elvariable id="items" type=""--%>
    <form:form action="${uri}" method="post" modelAttribute="items" enctype="multipart/form-data">
        <div class="row">
            <div class="form-group mt-4 col-6">
                <label class="form-label fw-bold">Category</label>
                <select class="form-select" name="categoryItem">
                    <c:forEach items="${ listCate }" var="cate">
                        <option ${item.categoryItem.id==cate.id ? "selected":""}   value="${ cate.id }">
                                ${ cate.name }
                        </option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group mt-4 col-6">
                <label class="form-label fw-bold">Items</label>
                <select class="form-select" name="item">
                    <c:forEach items="${ VP }" var="vp">
                        <option ${item.item==vp.key ? "selected":""} value="${vp.key}">
                                ${ vp.value }
                        </option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group mt-4 col-6">
                <form:label path="price">Price</form:label>
                <form:input path="price" class="form-control" value="${item.price}"/>
            </div>
            <div class="form-group mt-4 col-6">
                <form:label path="quantity">Quantity</form:label>
                <form:input path="quantity" class="form-control" value="${item.quantity}"/>
            </div>
            <div class="form-group mt-4 col-6">
                <label class="form-label fw-bold">Type</label>
                <select class="form-select" name="type">
                    <c:forEach items="${ type }" var="ty">
                        <option ${item.type==ty.key ? "selected":""} value="${ty.key}">
                                ${ ty.value }
                        </option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group mt-4 col-6">
                <label class="form-label fw-bold">Planet</label>
                <select class="form-select" name="planet">
                    <c:forEach items="${ planet }" var="planet">
                        <option ${item.planet==planet.key ? "selected":""} value="${planet.key}">
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
                        <option ${item.server.id==sv.id ? "selected":""}   value="${ sv.id }">
                                ${ sv.name }
                        </option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <c:if test="${item.id==null}">
            <button class="btn btn-success mt-2">Thêm</button>
        </c:if>
        <c:if test="${item.id!=null}">
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
    <form action="/admin/items/search" method="get" class="row g-3 mb-3 mt-2">
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
            <th>Items</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Type</th>
            <th>DateCreate</th>
            <th>Planet</th>
            <th>Server</th>
            <th>Status</th>
            <th></th>
            <th></th>
        </tr>
        </thead>
        <tbody>
            <c:forEach items="${list.content}" var="items" varStatus="status">
                <tr>
                    <td>#${status.count}</td>
                    <td>${items.categoryItem.name}</td>
                    <td><img src="${items.image}" height="50px"></td>
                    <td>${items.item.toString()}</td>
                    <td><fmt:formatNumber value="${items.price}" pattern="#,###"/> VND</td>
                    <td>${items.quantity}</td>
                    <td>${items.type.toString()}</td>
                    <td><fmt:formatDate value="${items.dateCreate}" pattern="dd/MM/yyyy"/></td>
                    <td>${items.planet.toString()}</td>
                    <td>${items.server.name}</td>
                    <td>${items.status ==1 ? "Đang Treo" : "Đã Bán"}</td>
                    <td>
                        <a href="/admin/items/edit?id=${items.id}" class="btn btn-primary">Cập Nhật</a>
                    </td>
                    <td>
                        <a data-bs-toggle="modal" data-bs-target="#i${items.id}" class="btn btn-danger">Xóa</a>
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
                <li class="page-item"><a class="page-link" href="/admin/items/index${number} ">Previous</a></li>
                <c:forEach var="i" begin="0" end="${ list.totalPages - 1 }">
                    <li class="page-item"><a class="page-link" href="/admin/items/index?page=${ i }">${ i + 1 }</a></li>
                    </li>
                </c:forEach>
                <li class="page-item"><a class="page-link" href="/admin/items/index${numberup}">Next</a></li>
            </ul>
        </nav>
    </div>
<c:forEach items="${list.content}" var="items" varStatus="status">
    <div id="i${items.id}" class="modal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title">Xác nhận</h3>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <h5>Bạn muốn xóa vật phẩm này ?</h5>
                </div>
                <div class="modal-footer">
                    <form action="/admin/items/delete" method="post">
                        <input type="hidden" value="${items.id}" name="id">
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
