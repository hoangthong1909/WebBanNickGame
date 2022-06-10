package com.example.Assignment_Java5.controllers.paycard;

import com.example.Assignment_Java5.entitys.Card;
import com.example.Assignment_Java5.entitys.CardEnum.CardType;
import com.example.Assignment_Java5.entitys.User;
import com.example.Assignment_Java5.service.ICardService;
import com.example.Assignment_Java5.service.IParValueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
@RequestMapping("/home")
public class TopUpCardController {
    @Autowired
    ServletContext app;

    @Autowired
    private ICardService cardDao;

    @Autowired
    private IParValueService parValueDao;

    @Autowired
    HttpServletRequest request;

    @Autowired
    HttpSession session;

    @GetMapping("/card")
    public String card(@ModelAttribute("card") Card card,Model model) {
        model.addAttribute("listParValue",parValueDao.getAll());
        request.setAttribute("view","/views/home/topupcard.jsp");
        return "home/layout";
    }


    @PostMapping("/addcard")
    public String add(@ModelAttribute("card") Card card) {
        User user = (User) session.getAttribute("user");
        if (user != null) {
            try {
                card.setTime(new Date());
                card.setUserId(user);
                card.setStatus(0);
                this.cardDao.insert(card);
                session.setAttribute("message", " Thẻ đang chờ xử lí");
            } catch (Exception e) {
                e.printStackTrace();
                session.setAttribute("error", "Error");
            }
        return "redirect:/home/card/history";
        }else {
            return "redirect:/login";
        }
    }

    @GetMapping("/history")
    public String cardHistory(Model model) {
        User user = (User) session.getAttribute("user");
        model.addAttribute("history",user.getCardList());
        return "/home/cardhistory";
    }

    @ModelAttribute("type")
    public List<CardType> getCardType() {
        List<CardType> list=new ArrayList<>();
        for (CardType type: CardType.values()) {
            list.add(type);
        }
        return list;
    }
}
