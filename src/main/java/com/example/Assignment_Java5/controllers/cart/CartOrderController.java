package com.example.Assignment_Java5.controllers.cart;

import com.example.Assignment_Java5.entitys.Items;
import com.example.Assignment_Java5.entitys.Order;
import com.example.Assignment_Java5.entitys.OrderDetail;
import com.example.Assignment_Java5.entitys.User;
import com.example.Assignment_Java5.service.IItemsService;
import com.example.Assignment_Java5.service.IOrderDetailsService;
import com.example.Assignment_Java5.service.IOrderService;
import com.example.Assignment_Java5.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.math.MathContext;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/home")
public class CartOrderController {
    @Autowired
    private HttpSession session;
    @Autowired
    private Order order;

    @Autowired
    private IItemsService itemsDao;

    @Autowired
    private IOrderService orderDao;

    @Autowired
    private IUserService userDao;

    @Autowired
    private IOrderDetailsService orderDetailsDao;

    @GetMapping("addtoorder")
    public String addOrder(@RequestParam(name = "idGame") String idGame,@RequestParam(name = "location") String location) {
        Order orderSession = (Order) session.getAttribute("order");
        if (orderSession != null) {
            User user = (User) session.getAttribute("user");
            if (user != null) {
                List<OrderDetail> listOrder = orderSession.getOrderdetails();
                List<Items> itemsList = itemsDao.getAll();
                order.setUserDatHang(user);
                order.setIdGame(idGame);
                order.setLocation(location);
                order.setOrderdetails(listOrder);
                order.setDatecreate(new Date());
                order.setStatus(0);
                BigDecimal total= (BigDecimal) session.getAttribute("total");
                order.setTotal(total);
                if (total.compareTo(user.getSurplus()) > 0) {
                    session.setAttribute("error", "Tài Khoản của bạn không đủ tiền , vui lòng nạp thêm tiền");
                    return "redirect:/home/cart";
                } else {
                    try {
                        this.orderDao.insert(order);
                        for (OrderDetail item : listOrder) {
                            OrderDetail orderDetail = new OrderDetail();
                            orderDetail.setOrder(order);
                            orderDetail.setNickGame(null);
                            orderDetail.setQuantity(item.getQuantity());
                            orderDetail.setPrice(item.getPrice());
                            orderDetail.setItems(item.getItems());
                            this.orderDetailsDao.insert(orderDetail);
                            for (Items i : itemsList) {
                                if (item.getItems().getId() == i.getId()) {
                                    i.setQuantity(i.getQuantity() - item.getQuantity());
                                    this.itemsDao.update(i);
                                    System.out.println(i.getQuantity());
                                }
                            }
                        }
                            user.setSurplus(user.getSurplus().subtract(order.getTotal(), MathContext.DECIMAL32));
                            this.userDao.update(user);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    session.removeAttribute("order");
                    return "redirect:/home/history/buyitems";
                }
            } else {
                return "redirect:/login";
            }
        } else {
            return "redirect:/home/cart";
        }
    }
}
