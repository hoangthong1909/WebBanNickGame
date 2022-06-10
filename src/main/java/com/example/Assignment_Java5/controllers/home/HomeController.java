package com.example.Assignment_Java5.controllers.home;

import com.example.Assignment_Java5.service.ICategoryService;
import com.example.Assignment_Java5.service.IItemsService;
import com.example.Assignment_Java5.service.IProductService;
import com.example.Assignment_Java5.service.IServerService;
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
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/home")
public class HomeController {
    @Autowired
    ServletContext app;

    @Autowired
    private IItemsService itemsDao;

    @Autowired
    private IProductService productDao;

    @Autowired
    private IServerService serverDao;

    @Autowired
    private ICategoryService categoryDao;

    @Autowired
    HttpServletRequest request;

    @Autowired
    HttpSession session;

    @GetMapping("/index")
    public String index(Model model) {
        model.addAttribute("listCate", categoryDao.getAll());
        request.setAttribute("view", "/views/home/home.jsp");
        return "home/layout";
    }

    @GetMapping("/nickgame")
    public String nickGame(Model model) {
        model.addAttribute("listCate", categoryDao.getAll());
        request.setAttribute("view", "/views/home/nickgame.jsp");
        return "home/layout";
    }

    @GetMapping("/showNro")
    public String show(Model model, @RequestParam(name = "page", required = false, defaultValue = "0") Optional<Integer> page, @RequestParam(name = "id") Integer id) {
        Pageable pageable = PageRequest.of(page.orElse(0), 5);
        model.addAttribute("listItems", itemsDao.findItemsByCate(id, pageable));
        request.setAttribute("view", "/views/home/items.jsp");
        return "home/layout";
    }

    @GetMapping("/showNro/ItemsDetail")
    public String detail(Model model, @RequestParam(name = "id") Integer id) {
        model.addAttribute("detail", itemsDao.findById(id));
        request.setAttribute("view", "/views/home/details.jsp");
        return "home/layout";
    }
}
