package com.example.Assignment_Java5.controllers.home;

import com.example.Assignment_Java5.entitys.NickGame;
import com.example.Assignment_Java5.entitys.User;
import com.example.Assignment_Java5.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Optional;

@Controller
@RequestMapping("/home")
public class HomeController {
    @Autowired
    ServletContext app;

    @Autowired
    private IItemsService itemsDao;

    @Autowired
    private INickGameService nickGameDao;

    @Autowired
    private IUserService userDao;


    @Autowired
    private ICategoryService categoryDao;

    @Autowired
    HttpServletRequest request;

    @Autowired
    HttpSession session;

    @GetMapping("/index")
    public String index(Model model) {
        model.addAttribute("listCate", categoryDao.getAll());
        User user= (User) session.getAttribute("user");
        request.setAttribute("view", "/views/home/home.jsp");
        if (user!=null){
        for (User user1: userDao.getAll()) {
        if (user.getId()==user1.getId()){
            session.setAttribute("user",user1);
        }
        }
        }else {
            return "home/layout";
        }
        return "home/layout";
    }

    @GetMapping("/nickgame")
    public String nickGame(Model model) {
        model.addAttribute("listCate", categoryDao.getAll());
        request.setAttribute("view", "/views/home/allcategory.jsp");
        return "home/layout";
    }

    @GetMapping("/showVP")
    public String showVP(Model model, @RequestParam(name = "page", required = false, defaultValue = "0") Optional<Integer> page, @RequestParam(name = "id") Integer id) {
        Pageable pageable = PageRequest.of(page.orElse(0), 8);
        model.addAttribute("listItems", itemsDao.findItemsByCate(id, pageable));
        session.setAttribute("idcatevp",id);
        request.setAttribute("view", "/views/home/showitems.jsp");
        return "home/layout";
    }

    @GetMapping("/showNick")
    public String showNick(Model model, @RequestParam(name = "page", required = false, defaultValue = "0") Optional<Integer> page, @RequestParam(name = "id") Integer id) {
        Pageable pageable = PageRequest.of(page.orElse(0), 8);
        model.addAttribute("listNick", nickGameDao.findNickByCate(id, pageable));
        session.setAttribute("idcatenick",id);
        request.setAttribute("view", "/views/home/shownick.jsp");
        return "home/layout";
    }

    @GetMapping("/showVP/ItemsDetail")
    public String detailVP(Model model, @RequestParam(name = "id") Integer id) {
        model.addAttribute("detail", itemsDao.findById(id));
        request.setAttribute("view", "/views/home/detailsitems.jsp");
        return "home/layout";
    }
    @GetMapping("/showNick/NickDetail")
    public String detailNick(Model model, @RequestParam(name = "id") Integer id) {
        model.addAttribute("detailNick",nickGameDao.findById(id));
        request.setAttribute("view", "/views/home/detailnick.jsp");
        return "home/layout";
    }
}
