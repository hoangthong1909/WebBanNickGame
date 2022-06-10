<%--
  Created by IntelliJ IDEA.
  User: thongpro
  Date: 6/11/22
  Time: 1:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<div class="c-layout-page">
    <!-- BEGIN: PAGE CONTENT -->
    <div class="c-content-box c-size-md c-bg-white">
        <div class="container">
            <div class="row">
                <div class="row-flex-safari game-list">
                    <section id="cardbody" class="section">
                        <div class="panel">
                            <div class="panel">
                                <div class="col-sm-12 text-center" style="font-family:Roboto; margin-bottom: 20px;">
                                    <h2 style="color: #19b1ff;">ĐỔI MẬT KHẨU</h2>
                                    <div style="width: 140px; height: 1px; margin: 20px auto; border-bottom: 4px solid #19b1ff;"></div>
                                </div>
                            </div>
                            <!-- End-->
                            <div class="content_post">
                                <div class="row">
                                    <form action="/home/changepass" method="post">
                                        <section id="dv" class="countdown groomsmen-bridesmaids">
                                            <div class="col-md-6 col-md-offset-2" style="padding-bottom: 45px;">
                                                <div class="col-md-12 has-textbox m-0">
                                                    <c:if test="${!empty sessionScope.error}">
                                                        <div class="alert alert-danger">
                                                                ${sessionScope.error}
                                                        </div>
                                                        <c:remove var="error" scope="session"/>
                                                    </c:if>
                                                    <c:if test="${!empty sessionScope.message}">
                                                        <div class="alert alert-success">
                                                                ${sessionScope.message}
                                                        </div>
                                                        <c:remove var="message" scope="session"/>
                                                    </c:if>
                                                    <div class="form-group row">
                                                        <spam class="col-md-4 control-label bb ar">Mật khẩu cũ: </spam>
                                                        <div class="col-md-8">
                                                            <input type="password" name="oldpassword" class="form-control t14" >
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-12 has-textbox m-0">
                                                    <div class="form-group row">
                                                        <spam class="col-md-4 control-label bb ar">Mật khẩu mới: </spam>
                                                        <div class="col-md-8">
                                                            <input type="password" name="newpassword" class="form-control t14" >
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-12 has-textbox m-0">
                                                    <div class="form-group row">
                                                        <spam class="col-md-4 control-label bb ar">Nhập lại mật khẩu mới: </spam>
                                                        <div class="col-md-8">
                                                            <input type="password" name="confirmpassword" class="form-control t14" >
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-12 has-textbox m-0">
                                                    <div class="form-group row">
                                                        <spam class="col-md-4 control-label bb ar"></spam>
                                                        <div class="col-md-8">
                                                            <button  class="btn btn-info col-xs-12">Đổi mật khẩu</button>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </section>
                                    </form>
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
