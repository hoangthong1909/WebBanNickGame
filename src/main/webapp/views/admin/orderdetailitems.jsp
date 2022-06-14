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
    <h1 class="h3 mb-0 text-gray-800">OrderDetail Management</h1>
</div>
    <table class="table table-success table-striped" >
        <thead>
        <tr>
            <th scope="col">STT</th>
            <th>Image</th>
            <th>Items</th>
            <th>Type</th>
            <th>Planet</th>
            <th>Server</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Total</th>
        </tr>
        </thead>
        <tbody>
            <c:forEach items="${orderDetail}" var="orderdetail" varStatus="status">
            <tr>
            <td>#${status.count}</td>
                <td><img height="50px" src="${orderdetail.items.image}" alt=""></td>
                <td>${orderdetail.items.item.toString()}</td>
                <td>${orderdetail.items.type.toString()}</td>
                <td>${orderdetail.items.planet.toString()}</td>
                <td>${orderdetail.items.server.name}</td>
                <td><fmt:formatNumber value="${orderdetail.price}" pattern="#,###"/>VND</td>
                <td>${orderdetail.quantity}</td>
                <td><span style="color: red"><fmt:formatNumber value="${orderdetail.price*orderdetail.quantity}" pattern="#,###"/> VND</span></td>
                </tr>

            </c:forEach>
        </tbody>
    </table>



