<%--
  Created by IntelliJ IDEA.
  User: thongpro
  Date: 6/10/22
  Time: 7:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<div class="c-layout-page">
    <!-- BEGIN: PAGE CONTENT -->
    <div class="c-content-box c-size-md c-bg-white">
        <div class="container">
            <div class="row">
                <div class="row-flex-safari game-list">
                    <section id="cardbody" class="section">
                        <div class="row">
                            <jsp:include page="menu.jsp"/>
                            <div class="col-xs-12 col-md-9">
                                <div class="panel">
                                    <div class="panel">
                                        <div class="col-sm-12 dv-title">
                                            <h2>NẠP TIỀN THẺ CÀO</h2>
                                            <div class="gach"></div>
                                        </div>
                                <%--@elvariable id="card" type=""--%>
                                <form:form  action="/home/addcard" method="post" modelAttribute="card">
                                            <div class="row">
                                                <div class="col-md-12 text-center" style="padding-bottom: 20px;">
                                                    <div class="col-md-4 col-md-offset-4 text-center" style="padding: 10px; background-color: #19b1ff;border: 1px solid #d1ef33;margin-bottom: 30px;border-radius: 6px;">
                                                        <c:if test="${empty sessionScope.user}">
                                                        <b class="t18" style="color:#ffffff;">SỐ DƯ: 0 VNĐ</b>
                                                        </c:if>
                                                        <c:if test="${!empty sessionScope.user}">
                                                            <b class="t18" style="color:#ffffff;">SỐ DƯ: <fmt:formatNumber value="${sessionScope.user.surplus}" pattern="#,###"/> VNĐ</b>
                                                        </c:if>
                                                    </div>
                                                </div>
                                                <div class="col-md-7 col-md-offset-2" style="padding-bottom: 45px;">
                                                    <div class="col-md-12 has-textbox m-0">
                                                        <div class="form-group row">
                                                            <spam class="col-md-3 control-label bb ar">Nhà mạng:</spam>
                                                            <div class="col-md-8">
                                                                <select class="form-control" name="type"><option value="none">Chọn nh&#224; mạng</option>
                                                                    <c:forEach items="${ type }" var="ty">
                                                                        <option value="${ty}">
                                                                            ${ty}
                                                                        </option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-12 has-textbox m-0">
                                                        <div class="form-group row">
                                                            <spam class="col-md-3 control-label bb ar">Mệnh giá:</spam>
                                                            <div class="col-md-8">
                                                                <select class="form-control " name="parValue"  >
                                                                    <option>Chọn mệnh giá</option>
                                                                    <c:forEach items="${ listParValue }" var="parvalue">
                                                                    <option value="${parvalue.id}">${parvalue.price} VND</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-12 has-textbox m-0">
                                                        <div class="form-group row">
                                                            <spam class="col-md-3 control-label bb ar">Số seri:</spam>
                                                            <div class="col-md-8">
                                                                <input type="text" name="seri"  class="form-control " placeholder="Nhập mã serial nằm sau thẻ" >
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-12 has-textbox m-0">
                                                        <div class="form-group row">
                                                            <spam class="col-md-3 control-label bb ar">Mã thẻ: </spam>
                                                            <div class="col-md-8">
                                                                <input type="text" name="code" class="form-control" placeholder="Nhập mã số sau lớp bạc mỏng">
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-12 has-textbox m-0">
                                                        <div class="form-group row">
                                                            <spam class="col-md-3 control-label bb ar"></spam>
                                                            <div class="col-md-8">
                                                                <c:if test="${empty sessionScope.user}">
                                                                <a href="/login" class="btn btn-danger col-xs-12 btn4">Đăng nhập để nạp thẻ</a>
                                                                </c:if>
                                                                <c:if test="${!empty sessionScope.user}">
                                                                    <button  class="btn btn-success col-xs-12 btn4"> Nạp Ngay</button>
                                                                </c:if>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                </form:form>
                                        <div class="header-ball">
                                            <div class="row">
                                                <div class="col-md-12 header-title-buy">
                                                    <div class="content_post">
                                                        <p style="text-align:center"><span style="font-size:16px"><strong>Hệ thống Nạp thẻ ho&agrave;n to&agrave;n tự động v&agrave; Kh&ocirc;ng c&oacute; chiết khấu, Kh&aacute;ch cần nạp qua ATM/V&iacute; vui l&ograve;ng đọc <em><a href="huong-dan/HD-NAPTHE.html">hướng dẫn tại đ&acirc;y</a></em></strong></span></p>

                                                        <p style="text-align:center"><span style="font-size:16px"><strong>Nạp 100k được 100k trong t&agrave;i khoản.</strong></span></p>

                                                        <p style="text-align:center"><span style="font-size:16px"><strong>Hỗ trợ 3 mạng Viettel, Vina, Mobi</strong></span></p>

                                                        <p style="text-align:center"><span style="color:#e74c3c"><span style="font-size:16px"><strong>Sai mệnh gi&aacute; sẽ bị trừ 50% gi&aacute; trị của thẻ nạp !</strong></span></span></p>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <section id="dv" class="countdown groomsmen-bridesmaids">
                                        <div class="row">
                                            <div class="panel-heading clearfix text-center" style="color: #fdfdfd; background: #30b9ff; padding: 10px 15px;">
                                                <span class="t24 bb" style="">LỊCH SỬ NẠP THẺ</span>
                                            </div>
                                        </div>
                                        <div class="overlay"></div>
                                        <div class="row">
                                            <div id="LogDonate">

                                            </div>
                                        </div>
                                    </section>
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
