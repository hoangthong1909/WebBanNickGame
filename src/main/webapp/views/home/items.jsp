<%--
  Created by IntelliJ IDEA.
  User: thongpro
  Date: 6/9/22
  Time: 7:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<div class="c-layout-page">
  <!-- BEGIN: PAGE CONTENT -->
  <div class="c-content-box c-size-md c-bg-white">
    <div class="container">
      <div class="row">
        <div class="col-sm-12 text-center" style="font-family:Roboto; margin-bottom: 20px;">
          <h2 style="color: #19b1ff;">NGỌC RỒNG ONLINE - SHOP VẬT PHẨM NRO</h2>
          <div style="width: 140px; height: 1px; margin: 20px auto; border-bottom: 4px solid #19b1ff;"></div>
        </div>
      </div>
      <div class="header-ball">
        <div class="row">
          <div class="col-md-12 header-title-buy">
            <div class="content_post">
              <p><span style="font-size:16px">Shop b&aacute;n vật phẩm của AeNhaPro !</span></p>

              <p><span style="font-size:16px"><strong>Lưu &yacute;:<span style="color:#e74c3c"> Nick đựng vật phẩm c&oacute; thể l&agrave; nick đăng k&iacute; thật, Sau khi mua th&igrave; c&aacute;c bạn v&agrave;o giao dịch đồ sang nick của m&igrave;nh !</span></strong></span></p>

            </div>
          </div>
        </div>
      </div>

      <form class="" id="frmBuy" name="frmBuy">
        <input id="id" name="id" type="hidden" value="99271dd9-ec5a-48d3-9c11-1b4bde90f537" />
        <input id="GameID" name="GameID" type="hidden" value="9ace6f9f-1fa3-4c38-898f-933556294c08" />

        <div class="content_post">
          <div class="row">
            <div class="row-flex-safari game-list">

              <div class="col-md-3 p-5">
                <div class="form-group">
                  <div class="input-group">
                    <span class="input-group-addon">Mã Số</span>
                    <input class="form-control" id="Code" name="Code" placeholder="Nhập Mã Số" type="text">
                  </div>
                </div>
              </div>
              <div class="col-md-3 p-5">
                <div class="form-group">
                  <div class="input-group">
                    <span class="input-group-addon">Giá</span>

                    <select class="form-control" id="Money" name="Money">
                      <option value="" selected>Tất cả</option>
                      <option value="0 200000" >Dưới 200k</option>
                      <option value="200000 400000" >Từ 200k đến 400k</option>
                      <option value="400000 600000" >Từ 400k đến 600k</option>
                      <option value="600000 1000000" >Từ 600k đến 1000k</option>
                      <option value="1000000 1500000" >Từ 1000k đến 1500k</option>
                      <option value="1500000 2000000" >Từ 1500k đến 2000k</option>
                      <option value="2000000 99999999" >Trên 2000k</option>
                    </select>
                  </div>
                </div>
              </div>
              <div class="col-md-3 p-5">
                <div class="form-group">
                  <div class="input-group">
                    <span class="input-group-addon">Trạng thái</span>

                    <select class="form-control" id="Stage" name="Stage">
                      <option value="">Trạng Thái</option>
                      <option value="ChuaBan">Chưa bán</option>
                      <option value="DaBan">Đã bán</option>
                      <option value="DaDacCoc">Đã đặt cọc</option>
                    </select>
                  </div>
                </div>
              </div>
              <div class="col-md-3 p-5">
                <div class="form-group">
                  <div class="input-group">
                    <span class="input-group-addon">M&#225;y chủ</span>
                    <select class="form-control" id="Field01" name="Field01"><option value="">M&#225;y chủ</option>
                      <option value="1">1 Sao</option>
                      <option value="2">2 Sao</option>
                      <option value="3">3 Sao</option>
                      <option value="4">4 Sao</option>
                      <option value="5">5 Sao</option>
                      <option value="6">6 Sao</option>
                      <option value="7">7 Sao</option>
                      <option value="8">8 Sao</option>
                      <option value="9">9 Sao</option>
                      <option value="10">10 Sao</option>
                    </select>
                  </div>
                </div>
              </div>
              <div class="col-md-3 p-5">
                <div class="form-group">
                  <div class="input-group">
                    <span class="input-group-addon">H&#224;nh tinh</span>
                    <select class="form-control" id="Field02" name="Field02"><option value="">H&#224;nh tinh</option>
                      <option value="TD">Tr&#225;i đất</option>
                      <option value="XD">Xayda</option>
                      <option value="NM">Namek</option>
                    </select>
                  </div>
                </div>
              </div>
              <div class="col-md-3 p-5">
                <div class="form-group">
                  <div class="input-group">
                    <span class="input-group-addon">Vật phẩm</span>
                    <select class="form-control" id="Field04" name="Field04"><option value="">Vật phẩm</option>
                      <option value="nro1sao">Bộ Ngọc Rồng 1 Sao</option>
                      <option value="ao">&#193;o</option>
                      <option value="quan">Quần</option>
                      <option value="gang">Găng</option>
                      <option value="giay">Gi&#224;y</option>
                      <option value="rada">Rada</option>
                      <option value="setdo">S&#233;t đồ</option>
                    </select>
                  </div>
                </div>
              </div>
              <div class="col-md-3 p-5">
                <div class="form-group">
                  <div class="input-group">
                    <span class="input-group-addon">Loại đồ</span>
                    <select class="form-control" id="Field05" name="Field05"><option value="">Loại đồ</option>
                      <option value="sucdanh">Sức đ&#225;nh</option>
                      <option value="hp">Tăng HP</option>
                      <option value="ki">Tăng KI</option>
                      <option value="hutmau">H&#250;t m&#225;u</option>
                      <option value="hutki">H&#250;t KI</option>
                      <option value="tnsm">Tiềm năng sức mạnh</option>
                      <option value="bongocrong">Bộ Ngọc Rồng</option>
                    </select>
                  </div>
                </div>
              </div>
              <div class="col-md-2 p-5">
                <div class="form-group">
                  <div class="input-group">
                    <button type="submit" class="btn btn-info btn0" style="padding: 4px 30px;">TÌM KIẾM</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </form>

      <div class="row row-flex item-list">
    <c:forEach items="${listItems.content}" var="items">
    <div class="col-sm-6 col-md-3 p-5">
          <div class="classWithPad">
            <div class="image">
              <a href="../buynickdetail1f0b.html?id=fbb79007-2bf4-4abf-abd0-28a7528b606f">
                <img src="${items.image}">
                <span class="ms">Mã số: ${items.id}</span>
              </a>
            </div>
            <div class="description">
              TIỀN CARD : <fmt:formatNumber value="${items.price}" pattern="#,###"/> VND
            </div>
            <div class="attribute_info">
              <div class="row">
                <div class="col-xs-6 a_att">
                  Máy chủ: <b>${items.server.name}</b>
                </div>
                <div class="col-xs-6 a_att">
                  Hành tinh: <b>${items.planet.toString()}
                   </b>
                </div>
                <div class="col-xs-6 a_att">
                  Vật phẩm: <b>${items.item.toString()}</b>
                </div>
                <div class="col-xs-6 a_att">
                  Loại đồ: <b>${items.type.toString()}</b>
                </div>
              </div>
            </div>
            <div class="a-more">
              <div class="row">
                <div class="col-xs-8 p-5">
                  <div class="price_item">
                    <a href="/home/addtocart?id=${items.id}">Thêm vào giỏ hàng</a>
                  </div>
                </div>
                <div class="col-xs-4 p-5">
                  <div class="view3">
                    <a href="/home/showNro/ItemsDetail?id=${items.id}">Chi tiết</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
</c:forEach>
      </div>
      <div class="dataTables_wrapper no-footer">
        <div class="dataTables_paginate paging_simple_numbers" id="tb_hisser_paginate">
          <span>
           <a href="#" class="paginate_button current" aria-controls="tb_hisser" data-dt-idx="1" tabindex="0">1</a>
           </span>
          <span>
           <a href="../BuyNickefcb.html?&amp;id=99271dd9-ec5a-48d3-9c11-1b4bde90f537&amp;p=2" class="paginate_button" aria-controls="tb_hisser" data-dt-idx="1" tabindex="0">2</a>
           </span>
          <span>
           <a href="../BuyNick956c.html?&amp;id=99271dd9-ec5a-48d3-9c11-1b4bde90f537&amp;p=3" class="paginate_button" aria-controls="tb_hisser" data-dt-idx="1" tabindex="0">3</a>
            </span>
          <span>
            <a href="../BuyNickb441.html?&amp;id=99271dd9-ec5a-48d3-9c11-1b4bde90f537&amp;p=4" class="paginate_button" aria-controls="tb_hisser" data-dt-idx="1" tabindex="0">4</a>
            </span>
          <span>
            <a href="../BuyNick826e.html?&amp;id=99271dd9-ec5a-48d3-9c11-1b4bde90f537&amp;p=5" class="paginate_button" aria-controls="tb_hisser" data-dt-idx="1" tabindex="0">5</a>
          </span>
          <span>
          <a href="../BuyNick1409.html?&amp;id=99271dd9-ec5a-48d3-9c11-1b4bde90f537&amp;p=6" class="paginate_button" aria-controls="tb_hisser" data-dt-idx="1" tabindex="0">6</a>
           </span>
          <span>
          <a href="../BuyNick2d95.html?&amp;id=99271dd9-ec5a-48d3-9c11-1b4bde90f537&amp;p=7" class="paginate_button" aria-controls="tb_hisser" data-dt-idx="1" tabindex="0">7</a>
           </span>
          <span>
           <a href="../BuyNickd2ab.html?&amp;id=99271dd9-ec5a-48d3-9c11-1b4bde90f537&amp;p=8" class="paginate_button" aria-controls="tb_hisser" data-dt-idx="1" tabindex="0">8</a>
           </span>
          <span>
           <a href="../BuyNick3628.html?&amp;id=99271dd9-ec5a-48d3-9c11-1b4bde90f537&amp;p=9" class="paginate_button" aria-controls="tb_hisser" data-dt-idx="1" tabindex="0">9</a>
           </span>
          <a title="Trang cuối" href="../BuyNick3ad0.html?id=99271dd9-ec5a-48d3-9c11-1b4bde90f537" class="paginate_button next c-last" aria-controls="tb_hisser" data-dt-idx="2" tabindex="0" id="tb_hisser_next">&gt;</a>
        </div>
      </div>
    </div>
    <!-- END: PAGE CONTENT -->

  </div>
</div>
