<%--
  Created by IntelliJ IDEA.
  User: thongpro
  Date: 6/10/22
  Time: 12:45 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/themify-icons.css">
<div class="c-layout-page">
  <div class="c-content-box c-size-md c-bg-white">
    <div class="container">
  <div class="row">
    <div class="col-sm-12 text-center" style="font-family:Roboto; margin-bottom: 20px;">
      <h2 style="color: #19b1ff;">NGỌC RỒNG ONLINE - GIỎ HÀNG</h2>
      <div style="width: 140px; height: 1px; margin: 20px auto; border-bottom: 4px solid #19b1ff;">
      </div>
    </div>
  </div>
<div class="shopping-cart section">
  <div class="container">
    <div class="row">
      <div class="col-md-12 ">
        <!-- Shopping Summery -->
        <c:if test="${!empty sessionScope.error }">
          <div class="alert alert-danger mt-3">
              ${ sessionScope.error }
            <c:remove var="error" scope="session"/>
          </div>
        </c:if>
        <c:if test="${empty sessionScope.order.orderdetails}">
          <td><p style="color: red;font-size: 20px">Bạn chưa có sản phẩm nào trong giỏ hàng</p></td>
        </c:if>
        <table class="table shopping-summery">
          <thead>
          <tr class="main-hading">
            <th>Image</th>
            <th>Items</th>
            <th>Type</th>
            <th>Planet</th>
            <th>Server</th>
            <th class="text-center">Price</th>
            <th class="text-center">Quantity</th>
            <th class="text-center">TOTAL</th>
            <th class="text-center"></th>
          </tr>
          </thead>
          <tbody>

          <c:forEach items="${sessionScope.order.orderdetails}" var="cart" varStatus="status">
            <tr>
              <td class="image" ><img width="100px" height="100px" src="${cart.items.image} "></td>
              <td class="product-des" >
                <p class="product-name">${cart.items.item.toString()}</p>
              </td>
              <td class="product-des" >
                <p class="product-name">${cart.items.type.toString()}</p>
              </td>
              <td class="product-des" >
                <p class="product-name">${cart.items.planet.toString()}</p>
              </td>
              <td class="product-des" >
                <p class="product-name">${cart.items.server.name}</p>
              </td>
              <td class="price" ><span ><fmt:formatNumber value="${cart.items.price}" pattern="#,###"/> VND</span></td>
              <td class="qty" ><!-- Input Order -->
                <div class="input-group">
                  <div class="button minus">
                    <a href="/home/cart/minus?id=${cart.items.id}" class="btn btn-primary ">
                      <i class="ti-minus"></i>
                    </a>
                  </div>
                  <input type="text" name="quantity" class="input-number" disabled  value="${cart.quantity}">
                  <div class="button plus">
                    <a href="/home/cart/plus?id=${cart.items.id}" class="btn btn-primary"> <i class="ti-plus"></i></a>
                  </div>
                </div>
                <!--/ End Input Order -->
              </td>
              <td class="total-amount" ><span style="color: red; font-size: 18px"><fmt:formatNumber value="${cart.items.price * cart.quantity}" pattern="#,###"/> VND</span></td>
              <td class="action" ><a href="/home/removecart?id=${cart.items.id}"><i class="ti-trash remove-icon"></i></a></td>
            </tr>
          </c:forEach>

          </tbody>
        </table>
        <!--/ End Shopping Summery -->
      </div>
    </div>
    <div class="row">
      <div class="col-12">
        <!-- Total Amount -->
        <div class="total-amount">
          <div class="row">
            <div class="col-lg-8 col-md-5 col-12">
              <div class="left">
                <div class="coupon">
                  <form action="#" target="_blank">
                    <input name="Coupon" placeholder="Enter Your Coupon">
                    <button class="btn">Apply</button>
                  </form>
                </div>
                <div class="checkbox">
                  <label class="checkbox-inline" for="2"><input name="news" id="2" type="checkbox"> Shipping (+10$)</label>
                </div>
              </div>
            </div>
            <div class="col-lg-4 col-md-7 col-12">
              <div class="right">
                <ul>
                  <li>Tổng vật phẩm<span style="color: red">${quantityCart}</span></li>
                  <li>Tổng số lượng <span style="color: red">${quantityVP}</span></li>
                  <li>Phí giao dịch<span>Miễn phí</span></li>
                  <li class="last">Tổng tiền<span style="color: red;font-size: 20px"><fmt:formatNumber value="${sessionScope.total}" pattern="#,###"/> VND</span></li>
                </ul>
                <div class="button5">
            <c:if test="${!empty sessionScope.user}">
                  <c:if test="${check==true}">
                    <button  data-toggle="modal" data-target="#Modal_Items" class="btn btn-info btn-block btn2">Check Out</button>
                  </c:if>
                  <c:if test="${check ==false}">
                    <a href="/home/cart" class="btn">Check Out</a>
                  </c:if>
            </c:if>
                  <c:if test="${empty sessionScope.user}">
                    <a href="/login" class="btn">Check Out</a>
                  </c:if>
                  <c:if test="${empty sessionScope.idCu}">
                    <a href="/home/nickgame" class="btn">Tiếp tục mua hàng</a>
                  </c:if>
                  <c:if test="${!empty sessionScope.idCu}">
                    <a href="/home/showVP?id=${idCu}" class="btn">Tiếp tục mua hàng</a>
                  </c:if>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!--/ End Total Amount -->
      </div>
    </div>
  </div>
</div>
</div>
</div>
</div>
<div id="Modal_Items" class="modal" tabindex="-1">
  <div class="modal-dialog">
    <form action="/home/addtoorder" method="get">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" style="color:#19b1ff;">&times;</button>
        <h4 class="modal-title" style="color:#19b1ff;">Xác nhận mua vật phẩm</h4>
      </div>
      <div class="modal-body">
        <a href="/home/card"><h4 class="text-center" style="color:#ff1919;font-weight:bold;"> NẠP TIỀN TỪ ATM - VÍ TẠI ĐÂY</h4></a>
        <br>
        <div class="form-group">
        <label class="form-label fw-bold">ID Game</label>
        <input type="text" placeholder="Nhập ID game" name="idGame" class="form-control">
        </div>
        <div class="form-group">
          <label class="form-label fw-bold">Địa điểm giao dịch</label>
          <input type="text" placeholder="Nhập địa điểm giao dịch" name="location" class="form-control">
        </div>
        <div class="form-group">
        <label class="form-label fw-bold">Tổng vật phẩm: <span style="color: red">${quantityCart}</span></label>
        </div>
        <div class="form-group">
        <label class="form-label fw-bold">Tổng số lượng : <span style="color: red">${quantityVP}</span></label>
        </div>
        <div class="form-group">
        <label class="form-label fw-bold">Tổng tiền : <span style="color: red;font-size: 20px"><fmt:formatNumber value="${sessionScope.total}" pattern="#,###"/> VND</span></label>
      </div>
      </div>
      <div class="modal-footer">
          <button  class="btn btn-success mini">THANH TOÁN</button>
        <button type="button" class="btn btn-warning mini" data-dismiss="modal">Đóng</button>
      </div>
    </div>
    </form>
  </div>
</div>