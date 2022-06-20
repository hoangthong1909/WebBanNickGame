package com.example.Assignment_Java5.controllers.admin;

import com.example.Assignment_Java5.entitys.User;
import com.example.Assignment_Java5.service.IUserService;
import com.example.Assignment_Java5.utils.EncryptUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.*;
@Controller
@RequestMapping("/admin/user")
public class UserController {
    @Autowired
    HttpServletRequest request;

    @Autowired
    private IUserService userDao;

    @Autowired
    HttpSession session;

    @GetMapping("/index")
    public String index(@ModelAttribute("user") User user, Model model, @RequestParam(name = "page", required = false, defaultValue = "0") Optional<Integer> page) {
        Pageable pageable = PageRequest.of(page.orElse(0), 5);
        model.addAttribute("list", userDao.findPageAll(pageable));
        request.setAttribute("view","/views/admin/user.jsp");
        return "admin/admin";
    }


    @PostMapping("/add")
    public String add( Model model,@Valid @ModelAttribute("user") User user,BindingResult result, @RequestParam(name = "password") String password, @RequestParam(name = "page", required = false, defaultValue = "0") Optional<Integer> page) {
        if (result.hasErrors()){
            Pageable pageable = PageRequest.of(page.orElse(0), 5);
            model.addAttribute("list", userDao.findPageAll(pageable));
            request.setAttribute("view","/views/admin/user.jsp");
            return "admin/admin";
        }else {
        try {
            String encrypted = EncryptUtil.encrypt(password);
            user.setStatus(1);
            user.setPassword(encrypted);
            this.userDao.insert(user);
            session.setAttribute("message", "Thêm Mới Thành Công");
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error", "Thêm Mới Thất Bại");
        }
        return "redirect:/admin/user/index";
        }
    }

    @GetMapping("/edit")
    public String edit(@RequestParam(name = "id") Integer id, Model model, @ModelAttribute("user") User user, @RequestParam(name = "page", required = false, defaultValue = "0") Optional<Integer> page) {
        Integer idCu=id;
        model.addAttribute("user", userDao.findById(id));
        Pageable pageable = PageRequest.of(page.orElse(0), 5);
        request.setAttribute("list", userDao.findPageAll(pageable));
        request.setAttribute("view","/views/admin/user.jsp");
        return "admin/admin";
    }

    @PostMapping("/update")
    public String update( @ModelAttribute("user") User user, @RequestParam(name = "id") Integer id) {
        try {
            User u=userDao.findById(id);
            user.setPassword(u.getPassword());
            user.setStatus(u.getStatus());
            this.userDao.update(user);
            session.setAttribute("message", "Cập Nhật Thành Công");
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error", "Cập Nhật Thất Bại");
        }
        return "redirect:/admin/user/index";
    }

    @PostMapping("/delete")
    public String delete( @RequestParam(name = "id") Integer id) {
        try {
            User user=userDao.findById(id);
            user.setStatus(0);
            this.userDao.update(user);
            session.setAttribute("message", "Xóa Thành Công");
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error", "Xóa Thất Bại");
        }
        return "redirect:/admin/user/index";
    }
}

