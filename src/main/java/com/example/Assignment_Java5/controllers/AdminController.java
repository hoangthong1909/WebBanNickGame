package com.example.Assignment_Java5.controllers;

import com.example.Assignment_Java5.entitys.Admin;
import com.example.Assignment_Java5.service.IAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;
@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    HttpServletRequest request;

    @Autowired
    private IAdminService adminDao;

    @Autowired
    HttpSession session;

    @GetMapping("/index")
    public String index(@ModelAttribute("admin") Admin admin, Model model, @RequestParam(name = "page", required = false, defaultValue = "0") Optional<Integer> page) {
        Pageable pageable = PageRequest.of(page.orElse(0), 5);
        model.addAttribute("list", adminDao.findPageAll(pageable));
        return "admin/user";
    }


    @PostMapping("/add")
    public String add(@ModelAttribute("admin") Admin admin) {
        try {
            admin.setStatus(1);
            this.adminDao.insert(admin);
            session.setAttribute("message", "Thêm Mới Thành Công");
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error", "Thêm Mới Thất Bại");
        }
        return "redirect:/admin/index";
    }

    @GetMapping("/edit")
    public String edit(@RequestParam(name = "id") Integer id, Model model, @ModelAttribute("admin") Admin admin, @RequestParam(name = "page", required = false, defaultValue = "0") Optional<Integer> page) {
        model.addAttribute("admin", adminDao.findById(id));
        Pageable pageable = PageRequest.of(page.orElse(0), 5);
        request.setAttribute("list", adminDao.findPageAll(pageable));
        return "admin/user";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute("admin") Admin admin, @RequestParam(name = "id") Integer id) {
        try {
            this.adminDao.update(admin);
            session.setAttribute("message", "Cập Nhật Thành Công");
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error", "Cập Nhật Thất Bại");
        }
        return "redirect:/admin/index";
    }

    @PostMapping("/delete")
    public String delete(@ModelAttribute("admin") Admin admin, @RequestParam(name = "id") Integer id) {
        try {
            this.adminDao.delete(id);
            session.setAttribute("message", "Xóa Thành Công");
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error", "Xóa Thất Bại");
        }
        return "redirect:/admin/index";
    }
}

