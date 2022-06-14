package com.example.Assignment_Java5.controllers.cart;

import com.example.Assignment_Java5.entitys.Items;
import com.example.Assignment_Java5.entitys.Order;
import com.example.Assignment_Java5.entitys.OrderDetail;
import com.example.Assignment_Java5.service.IItemsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/home")
public class AddToCartController {

    @Autowired
    private IItemsService itemsDao;

    @Autowired
    private HttpSession session;


    @GetMapping("/addtocart")
    public String addToCart(@RequestParam(name = "id") Integer id, @RequestParam(name = "quantity", required = false, defaultValue = "1") Integer quantity) {
        Items items = this.itemsDao.findById(id);
        session.setAttribute("idCu",items.getCategoryItem().getId());
        if (session.getAttribute("order") == null) {
            Order order = new Order();
            OrderDetail orderdetail = new OrderDetail();
            orderdetail.setItems(items);
            orderdetail.setQuantity(quantity);
            orderdetail.setPrice(items.getPrice());
            List<OrderDetail> list = new ArrayList<>();
            list.add(orderdetail);
            order.setOrderdetails(list);
            session.setAttribute("order", order);
        } else {
            Order order = (Order) session.getAttribute("order");
            List<OrderDetail> listOrder = order.getOrderdetails();
            boolean check = false;
            for (OrderDetail item : listOrder) {
                if (item.getItems().getId() == items.getId()) {
                    item.setQuantity(item.getQuantity() + quantity);
                    check = true;
                }
                if (item.getQuantity()>itemsDao.findById(item.getItems().getId()).getQuantity()){
                    item.setQuantity(item.getItems().getQuantity());
                    session.setAttribute("error","Sản phẩm này đã đạt số lượng tối đa");
                }
            }
            if (check == false) {
                OrderDetail orderdetail = new OrderDetail();
                orderdetail.setItems(items);
                orderdetail.setQuantity(quantity);
                orderdetail.setPrice(items.getPrice());
                listOrder.add(orderdetail);
            }
            session.setAttribute("order", order);
        }
        return "redirect:/home/cart";

    }
    @GetMapping("/cart/plus")
    public String cartPlus(@RequestParam(name = "id") Integer id){
        Order order = (Order) session.getAttribute("order");
        List<OrderDetail> listOrder = order.getOrderdetails();
        for (OrderDetail item : listOrder) {
            if (item.getItems().getId() == id) {
                item.setQuantity(item.getQuantity() + 1);
            }
            if (item.getQuantity()>itemsDao.findById(item.getItems().getId()).getQuantity()){
                item.setQuantity(item.getItems().getQuantity());
                session.setAttribute("error","Sản phẩm này đã đạt số lượng tối đa");
            }
        }
        return "redirect:/home/cart";
    }
    @GetMapping("/cart/minus")
    public String cartMinus(@RequestParam(name = "id") Integer id){
        Order order = (Order) session.getAttribute("order");
        List<OrderDetail> listOrder = order.getOrderdetails();
        int check = 0;
        OrderDetail orderdetail = new OrderDetail();
        if (listOrder.size() > 0) {
            for (OrderDetail item : listOrder) {
                if (item.getItems().getId() == id) {
                    item.setQuantity(item.getQuantity() - 1);
                    if (item.getQuantity() == 0) {
                        orderdetail = item;
                        check++;
                    }
                }
            }
            if (check != 0) {
                listOrder.remove(orderdetail);
                if (listOrder.isEmpty()) {
                    session.removeAttribute("order");
                }
            }
        }
        return "redirect:/home/cart";
    }
}
