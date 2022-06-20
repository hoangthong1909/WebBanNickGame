package com.example.Assignment_Java5.controllers.home;

import com.example.Assignment_Java5.entitys.NickGame;
import com.example.Assignment_Java5.entitys.Order;
import com.example.Assignment_Java5.entitys.OrderDetail;
import com.example.Assignment_Java5.entitys.User;
import com.example.Assignment_Java5.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.math.MathContext;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/home")
public class NickOrderController {
    @Autowired
    private HttpServletRequest request;

    @Autowired
    private HttpSession session;

    @Autowired
    private INickGameService nickGameDao;

    @Autowired
    private IOrderService orderDao;

    @Autowired
    private IUserService userDao;

    @Autowired
    private IOrderDetailsService orderDetailsDao;

    @GetMapping("addNickToOrder")
    public String addNickToOrder(Model model, @RequestParam(name = "id") Integer id) {
        NickGame nickGame = nickGameDao.findById(id);
        User user = (User) session.getAttribute("user");
        if (nickGame != null) {
            Order order = new Order();
            OrderDetail orderDetail = new OrderDetail();
            orderDetail.setNickGame(nickGame);
            orderDetail.setQuantity(1);
            orderDetail.setPrice(nickGame.getPrice());
            orderDetail.setItems(null);
            List<OrderDetail> list = new ArrayList<>();
            list.add(orderDetail);
            order.setUserDatHang(user);
//            long millis=System.currentTimeMillis();
            order.setDatecreate(new java.util.Date(new Date().getTime()));
            System.out.println(order.getDatecreate()+"ngu");
            order.setTotal(nickGame.getPrice());
            order.setLocation("no-data");
            order.setIdGame("no-data");
            order.setStatus(2);
            order.setOrderdetails(list);
            try {
                this.orderDao.insert(order);
                orderDetail.setOrder(order);
                this.orderDetailsDao.insert(orderDetail);
                user.setSurplus(user.getSurplus().subtract(nickGame.getPrice(), MathContext.DECIMAL32));
                this.userDao.update(user);
                nickGame.setStatus(2);
                this.nickGameDao.update(nickGame);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return "redirect:/home/history/buynick";
        } else {
            return "redirect:/home/index";
        }
    }
}
