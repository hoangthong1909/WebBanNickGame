package com.example.Assignment_Java5.controllers;

import com.example.Assignment_Java5.entitys.Items;
import com.example.Assignment_Java5.entitys.ItemsEnum.ItemsPlanet;
import com.example.Assignment_Java5.entitys.ItemsEnum.ItemsType;
import com.example.Assignment_Java5.entitys.ItemsEnum.ItemsVP;
import com.example.Assignment_Java5.service.ICategoryService;
import com.example.Assignment_Java5.service.IItemsService;
import com.example.Assignment_Java5.service.IServerService;
import org.springframework.beans.factory.annotation.Autowired;
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
@RequestMapping("/admin/items")
public class ItemsController {
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
    public String index(@ModelAttribute("items") Items items, Model model, @RequestParam(name = "page", required = false, defaultValue = "0") Optional<Integer> page) {
        Pageable pageable = PageRequest.of(page.orElse(0), 5);
        model.addAttribute("list", itemsDao.findPageAll(pageable));
        model.addAttribute("listServer",serverDao.getAll());
        model.addAttribute("listCate",categoryDao.findCateItems());
        return "admin/items";
    }


    @PostMapping("/add")
    public String add(@ModelAttribute("items") Items items) {
        try {
            this.itemsDao.insert(items);
            session.setAttribute("message", "Thêm Mới Thành Công");
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error", "Thêm Mới Thất Bại");
        }
        return "redirect:/admin/items/index";
    }

    @GetMapping("/edit")
    public String edit(@RequestParam(name = "id") Integer id, Model model, @ModelAttribute("items") Items items, @RequestParam(name = "page", required = false, defaultValue = "0") Optional<Integer> page) {
        model.addAttribute("item", itemsDao.findById(id));
        model.addAttribute("listServer",serverDao.getAll());
        model.addAttribute("listCate",categoryDao.findCateItems());
        Pageable pageable = PageRequest.of(page.orElse(0), 5);
        request.setAttribute("list", itemsDao.findPageAll(pageable));
        return "admin/items";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute("items") Items items, @RequestParam(name = "id") Integer id) {
        try {
            Items it = itemsDao.findById(id);
            this.itemsDao.update(items);
            session.setAttribute("message", "Cập Nhật Thành Công");
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error", "Cập Nhật Thất Bại");
        }
        return "redirect:/admin/items/index";
    }

    @PostMapping("/delete")
    public String delete(@ModelAttribute("items") Items items, @RequestParam(name = "id") Integer id) {
        try {
            this.itemsDao.delete(id);
            session.setAttribute("message", "Xoa Thành Công");
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error", "Xoa Thất Bại");
        }
        return "redirect:/admin/items/index";
    }

    @ModelAttribute("planet")
    public Map<ItemsPlanet, String> getPlanet() {
        Map<ItemsPlanet, String> map = new HashMap<>();
        map.put(ItemsPlanet.XayDa, "Xayda");
        map.put(ItemsPlanet.TraiDat, "Trái Đất");
        map.put(ItemsPlanet.Namec, "Namec");
        return map;
    }

    @ModelAttribute("type")
    public List<ItemsType> getType() {
        List<ItemsType> list=new ArrayList<>();
        for (ItemsType type: ItemsType.values()) {
            list.add(type);
        }
        return list;
    }
    @ModelAttribute("VP")
    public List<ItemsVP> getVP() {
        List<ItemsVP> list=new ArrayList<>();
        for (ItemsVP vp: ItemsVP.values()) {
            list.add(vp);
        }
        return list;
    }
}
