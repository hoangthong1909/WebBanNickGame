package com.example.Assignment_Java5.controllers.home;

import com.example.Assignment_Java5.entitys.Items;
import com.example.Assignment_Java5.service.ICategoryService;
import com.example.Assignment_Java5.service.IItemsService;
import com.example.Assignment_Java5.service.IServerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
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
    private IServerService serverDao;

    @Autowired
    private ICategoryService categoryDao;

    @Autowired
    HttpServletRequest request;

    @Autowired
    HttpSession session;

    @GetMapping("/index")
    public String index(Model model, @RequestParam(name = "page", required = false, defaultValue = "0") Optional<Integer> page) {
        Pageable pageable = PageRequest.of(page.orElse(0), 5);
        model.addAttribute("listItems", itemsDao.findPageAll(pageable));
        model.addAttribute("listServer",serverDao.getAll());
        model.addAttribute("listCate",categoryDao.getAll());
        System.out.println(itemsDao.findPageAll(pageable)+"ngu");
        return "home/home";
    }
}
