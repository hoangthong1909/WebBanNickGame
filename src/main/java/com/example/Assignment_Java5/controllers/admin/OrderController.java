package com.example.Assignment_Java5.controllers.admin;

import com.example.Assignment_Java5.entitys.*;
import com.example.Assignment_Java5.entitys.CardEnum.CardType;
import com.example.Assignment_Java5.service.ICardService;
import com.example.Assignment_Java5.service.IItemsService;
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
    private IItemsService itemsDao;

    @Autowired
    HttpServletRequest request;

    @Autowired
    HttpSession session;

    @GetMapping("/items")
    public String getOrderItems(Model model, @RequestParam(name = "page", required = false, defaultValue = "0") Optional<Integer> page) {
        Pageable pageable = PageRequest.of(page.orElse(0), 5);
        model.addAttribute("list", orderDao.findAllOrderItems(pageable));
        request.setAttribute("view","/views/admin/orderitems.jsp");
        return "admin/admin";
    }

    @GetMapping("/showdetailItems")
    public String showDetail(Model model,@RequestParam(name = "id") Integer id) {
        Order order = orderDao.findById(id);
        model.addAttribute("orderDetail", order.getOrderdetails());
        request.setAttribute("view","/views/admin/orderdetailitems.jsp");
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
        return "redirect:/admin/order/items";
    }
    @PostMapping("/confirm")
    public String confirm(@RequestParam(name = "id") Integer id) {
        try {
            Order order = orderDao.findById(id);
            order.setStatus(2);
            this.orderDao.update(order);
            session.setAttribute("message", "Xác nhận Thành Công");
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error", "Xác nhận Thất Bại");
        }
        return "redirect:/admin/order/items";
    }
    @PostMapping("/cancel")
    public String cancel(@RequestParam(name = "id") Integer id) {
        try {
            List<Items> itemsList = itemsDao.getAll();
            Order order = orderDao.findById(id);
            order.setStatus(3);
            this.orderDao.update(order);
            User user =userDao.findById(order.getUserDatHang().getId());
            user.setSurplus(user.getSurplus().add(order.getTotal()));
            this.userDao.update(user);
            for (OrderDetail item : order.getOrderdetails()){
            for (Items i : itemsList) {
                if (item.getItems().getId() == i.getId()) {
                    i.setQuantity(i.getQuantity() + item.getQuantity());
                    this.itemsDao.update(i);
                }
            }
            }
            session.setAttribute("message", "Hủy Thành Công");
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error", "Hủy Thất Bại");
        }
        return "redirect:/admin/order/items";
    }

    @GetMapping("/nick")
    public String getOrderNick(Model model, @RequestParam(name = "page", required = false, defaultValue = "0") Optional<Integer> page) {
        Pageable pageable = PageRequest.of(page.orElse(0), 5);
        model.addAttribute("list", orderDao.findAllOrderNick(pageable));
        request.setAttribute("view","/views/admin/ordernick.jsp");
        return "admin/admin";
    }

}
