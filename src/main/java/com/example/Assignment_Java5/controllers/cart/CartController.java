package com.example.Assignment_Java5.controllers.cart;

import com.example.Assignment_Java5.entitys.Order;
import com.example.Assignment_Java5.entitys.OrderDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.List;
@Controller
@RequestMapping("/home")
public class CartController {

    @Autowired
    private HttpSession session;

    @Autowired
    private HttpServletRequest request;

    @GetMapping("/cart")
    public String getCart(Model model){
        BigDecimal total = new BigDecimal(0);
        int quantity = 0;
        int quantityCart=0;
        Order order = (Order) session.getAttribute("order");
        if (order == null) {
            total = new BigDecimal(0);
            quantity = 0;
        } else {
            List<OrderDetail> listOrder = order.getOrderdetails();
            for (OrderDetail item : listOrder) {
                BigDecimal q = BigDecimal.valueOf(item.getQuantity());
                total = total.add(item.getPrice().multiply(q));
                quantity += item.getQuantity();
            }
            quantityCart+= listOrder.size();
        }
        model.addAttribute("total",total);
        model.addAttribute("quantityVP",quantity);
        model.addAttribute("quantityCart",quantityCart);
        request.setAttribute("view","/views/cart/cart.jsp");
        return "home/layout";
    }
}
