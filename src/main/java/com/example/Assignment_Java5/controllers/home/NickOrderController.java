package com.example.Assignment_Java5.controllers.home;

import com.example.Assignment_Java5.entitys.NickGame;
import com.example.Assignment_Java5.entitys.Order;
import com.example.Assignment_Java5.entitys.OrderDetail;
import com.example.Assignment_Java5.entitys.User;
import com.example.Assignment_Java5.service.IItemsService;
import com.example.Assignment_Java5.service.INickGameService;
import com.example.Assignment_Java5.service.IOrderService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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

    @GetMapping("addNickToOrder")
    public String addNickToOrder(Model model, @RequestParam(name = "id") Integer id ) {
        NickGame nickGame =nickGameDao.findById(id);
        User user= (User) session.getAttribute("user");
        if (nickGame!=null){
            Order order=new Order();
            OrderDetail orderDetail=new OrderDetail();
            orderDetail.setNickGame(nickGame);
            orderDetail.setQuantity(1);
            orderDetail.setPrice(nickGame.getPrice());
            orderDetail.setItems(null);
            List<OrderDetail> list = new ArrayList<>();
            list.add(orderDetail);
            order.setUserDatHang(user);
            order.setDatecreate(new Date());
            order.setTotal(nickGame.getPrice());
            order.setStatus(1);
        }
        return "home/layout";
    }
}
