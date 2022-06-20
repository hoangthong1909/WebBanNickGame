package com.example.Assignment_Java5.controllers.admin;

import com.example.Assignment_Java5.entitys.Card;
import com.example.Assignment_Java5.entitys.CardEnum.CardType;
import com.example.Assignment_Java5.entitys.Items;
import com.example.Assignment_Java5.entitys.User;
import com.example.Assignment_Java5.service.ICardService;
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
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/admin/card")
public class CardController {
    @Autowired
    ServletContext app;

    @Autowired
    private ICardService cardDao;

    @Autowired
    private IUserService userDao;

    @Autowired
    HttpServletRequest request;

    @Autowired
    HttpSession session;

    @GetMapping("/index")
    public String index(Model model, @RequestParam(name = "page", required = false, defaultValue = "0") Optional<Integer> page) {
        Pageable pageable = PageRequest.of(page.orElse(0), 5);
        model.addAttribute("list", cardDao.findPageAll(pageable));
        request.setAttribute("view","/views/admin/card.jsp");
        return "admin/admin";
    }

    @PostMapping("/confirm")
    public String confirm(@RequestParam(name = "id") Integer id) {
        try {
            Card card = cardDao.findById(id);
            card.setStatus(2);
            this.cardDao.update(card);
            User user =userDao.findById(card.getUserId().getId());
            user.setSurplus(user.getSurplus().add(card.getParValue().getPrice()));
            this.userDao.update(user);
            session.setAttribute("message", "Xác nhận Thành Công");
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error", "Xác nhận Thất Bại");
        }
        return "redirect:/admin/card/index";
    }
    @PostMapping("/cancel")
    public String cancel(@RequestParam(name = "id") Integer id) {
        try {
            Card card = cardDao.findById(id);
            card.setStatus(3);
            this.cardDao.update(card);
            session.setAttribute("message", "Hủy Thành Công");
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error", "Hủy Thất Bại");
        }
        return "redirect:/admin/card/index";
    }


    @PostMapping("/delete")
    public String delete(@RequestParam(name = "id") Integer id) {
        try {
            Card card = cardDao.findById(id);
            card.setStatus(0);
            this.cardDao.update(card);
            session.setAttribute("message", "Xoá Thành Công");
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error", "Xoá Thất Bại");
        }
        return "redirect:/admin/card/index";
    }
}
