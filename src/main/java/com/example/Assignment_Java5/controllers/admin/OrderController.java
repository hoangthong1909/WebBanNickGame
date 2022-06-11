package com.example.Assignment_Java5.controllers.admin;

import com.example.Assignment_Java5.entitys.Card;
import com.example.Assignment_Java5.entitys.CardEnum.CardType;
import com.example.Assignment_Java5.entitys.Items;
import com.example.Assignment_Java5.entitys.Order;
import com.example.Assignment_Java5.entitys.User;
import com.example.Assignment_Java5.service.ICardService;
import com.example.Assignment_Java5.service.IOrderService;
import com.example.Assignment_Java5.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/admin/order")
public class OrderController {
    @Autowired
    ServletContext app;

    @Autowired
    private IOrderService orderDao;

    @Autowired
    private IUserService userDao;

    @Autowired
    HttpServletRequest request;

    @Autowired
    HttpSession session;

    @GetMapping("/index")
    public String index(Model model, @RequestParam(name = "page", required = false, defaultValue = "0") Optional<Integer> page) {
        Pageable pageable = PageRequest.of(page.orElse(0), 5);
        model.addAttribute("list", orderDao.findPageAll(pageable));
        request.setAttribute("view","/views/admin/order.jsp");
        return "admin/admin";
    }

    @GetMapping("/showdetail")
    public String showDetail(Model model,@RequestParam(name = "id") Integer id) {
        Order order = orderDao.findById(id);
        model.addAttribute("orderDetail", order.getOrderdetails());
        request.setAttribute("view","/views/admin/orderdetail.jsp");
        return "admin/admin";
    }

    @PostMapping("/delete")
    public String delete(@RequestParam(name = "id") Integer id) {
        try {
            Order order = orderDao.findById(id);
            order.setStatus(0);
            this.orderDao.update(order);
            session.setAttribute("message", "Xóa Thành Công");
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error", "Xóa Thất Bại");
        }
        return "redirect:/admin/order/index";
    }

}
