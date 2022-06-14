package com.example.Assignment_Java5.controllers.history;

import com.example.Assignment_Java5.entitys.Order;
import com.example.Assignment_Java5.entitys.User;
import com.example.Assignment_Java5.service.ICardService;
import com.example.Assignment_Java5.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Optional;

@Controller
@RequestMapping("/home/history")
public class HistoryController {
    @Autowired
    HttpSession session;

    @Autowired
    ICardService cardDao;

    @Autowired
    IOrderService orderDao;

    @Autowired
    HttpServletRequest request;

    @GetMapping("/transaction")
    public String cardHistory(Model model, @RequestParam(name = "page", required = false, defaultValue = "0") Optional<Integer> page) {
        User user = (User) session.getAttribute("user");
        Pageable pageable = PageRequest.of(page.orElse(0), 5);
        model.addAttribute("history", cardDao.findAllByUser(user.getId(), pageable));
        request.setAttribute("view", "/views/history/transaction.jsp");
        return "/home/layout";
    }

    @GetMapping("/buynick")
    public String NickHistory(Model model, @RequestParam(name = "page", required = false, defaultValue = "0") Optional<Integer> page) {
        User user = (User) session.getAttribute("user");
        if (user != null) {
            Pageable pageable = PageRequest.of(page.orElse(0), 5);
            model.addAttribute("history", orderDao.findAllOrderNickByUser(user.getId(), pageable));
        }
        request.setAttribute("view", "/views/history/buynick.jsp");
        return "/home/layout";
    }

    @GetMapping("/buyitems")
    public String ItemsHistory(Model model, @RequestParam(name = "page", required = false, defaultValue = "0") Optional<Integer> page) {
        User user = (User) session.getAttribute("user");
        Pageable pageable = PageRequest.of(page.orElse(0), 5);
        model.addAttribute("history", orderDao.findAllOrderItemsByUser(user.getId(), pageable));
        request.setAttribute("view", "/views/history/buyitems.jsp");
        return "/home/layout";
    }

    @GetMapping("/buyitems/show")
    public String ItemsHistoryDetails(Model model, @RequestParam(name = "id") Integer id) {
        Order order = orderDao.findById(id);
        model.addAttribute("orderDetail", order.getOrderdetails());
        request.setAttribute("view", "/views/history/detailitems.jsp");
        return "/home/layout";
    }
}
