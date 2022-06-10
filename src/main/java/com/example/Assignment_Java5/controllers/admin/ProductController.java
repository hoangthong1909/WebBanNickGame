package com.example.Assignment_Java5.controllers.admin;

import com.example.Assignment_Java5.entitys.Product;
import com.example.Assignment_Java5.entitys.ProductType;
import com.example.Assignment_Java5.service.ICategoryService;
import com.example.Assignment_Java5.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
@RequestMapping("/account")
public class ProductController {
    @Autowired
    ServletContext app;

    @Autowired
    private IProductService dao;

    @Autowired
    private ICategoryService categoryDao;

    @Autowired
    HttpServletRequest request;

    @Autowired
    HttpSession session;

    @GetMapping("/index")
    public String index(@ModelAttribute("product") Product product, Model model, @RequestParam(name = "page", required = false, defaultValue = "0") Optional<Integer> page) {
        Pageable pageable = PageRequest.of(page.orElse(0), 5);
        model.addAttribute("list", dao.findPageAll(pageable));
        model.addAttribute("listCate",categoryDao.getAll());
        return "admin/form";
    }


    @PostMapping("/add")
    public String add(@ModelAttribute("product") Product product) {
        try {
            product.setCreatedDate(new Date());
            this.dao.insert(product);
            session.setAttribute("message", "Thêm Mới Thành Công");
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error", "Thêm Mới Thất Bại");
        }
        return "redirect:/account/index";
    }

    @GetMapping("/edit")
    public String edit(@RequestParam(name = "id") Integer id, Model model, @ModelAttribute("product") Product product, @RequestParam(name = "page", required = false, defaultValue = "0") Optional<Integer> page) {
        model.addAttribute("pro", dao.findById(id));
        model.addAttribute("listCate",categoryDao.getAll());
        Pageable pageable = PageRequest.of(page.orElse(0), 5);
        request.setAttribute("list", dao.findPageAll(pageable));
        return "admin/form";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute("product") Product product, @RequestParam(name = "id") Integer id) {
        try {
            Product p = dao.findById(id);
            product.setCreatedDate(p.getCreatedDate());
            product.setPassword(p.getPassword());
            this.dao.update(product);
            session.setAttribute("message", "Cập Nhật Thành Công");
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error", "Cập Nhật Thất Bại");
        }
        return "redirect:/account/index";
    }

    @PostMapping("/delete")
    public String delete(@ModelAttribute("product") Product product, @RequestParam(name = "id") Integer id) {
        try {
            this.dao.delete(id);
            session.setAttribute("message", "Xoa Thành Công");
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error", "Xoa Thất Bại");
        }
        return "redirect:/account/index";
    }

    @GetMapping("/search")
    public String search(@ModelAttribute("product") Product product, @RequestParam(name = "search") String type, @RequestParam(name = "page") Optional<Integer> page) {
        try {
            ProductType.valueOf(type);
            try {
                List<Product> list = dao.findAllByType(ProductType.valueOf(type));
                Pageable pageable = PageRequest.of(page.orElse(0), 5);
                int start = (int) pageable.getOffset();
                int end = Math.min((start + pageable.getPageSize()), list.size());
                request.setAttribute("list", new PageImpl<>(list.subList(start, end), pageable, list.size()));
                session.setAttribute("message", "Tim Thành Công");
            } catch (Exception e) {
                e.printStackTrace();
            }
        } catch (IllegalArgumentException e) {
            e.printStackTrace();
            session.setAttribute("error", "Tim Thất Bại");
            return "redirect:/account/index";
        }
        return "admin/form";
    }


    @ModelAttribute("type")
    public Map<String, String> getPlanet() {
        Map<String, String> map = new HashMap<String, String>();
        map.put(String.valueOf(ProductType.Xayda), "Xayda");
        map.put(String.valueOf(ProductType.TraiDat), "Trái Đất");
        map.put(String.valueOf(ProductType.Namec), "Namec");
        return map;
    }

    @PostMapping("/deleteMuch")
    public String deleteMuch() {
        String[] id = request.getParameterValues("checkDelete");
        List<Product> list = new ArrayList<>();
        for (String s : id) {
            Product product = this.dao.findById(Integer.valueOf(s));
            list.add(product);
        }
        if (id != null) {
            this.dao.deleteMuch(list);
        }
        return "redirect:/account/index";
    }
}
