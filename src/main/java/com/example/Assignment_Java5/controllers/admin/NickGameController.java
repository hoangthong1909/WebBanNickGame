package com.example.Assignment_Java5.controllers.admin;

import com.example.Assignment_Java5.entitys.NickEnum.NickPlanet;
import com.example.Assignment_Java5.entitys.NickGame;
import com.example.Assignment_Java5.service.ICategoryService;
import com.example.Assignment_Java5.service.INickGameService;
import com.example.Assignment_Java5.service.IServerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageImpl;
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
import java.util.*;

@Controller
@RequestMapping("/admin/nickgame")
public class NickGameController {
    @Autowired
    ServletContext app;

    @Autowired
    private INickGameService dao;

    @Autowired
    private ICategoryService categoryDao;

    @Autowired
    private IServerService serverDao;

    @Autowired
    HttpServletRequest request;

    @Autowired
    HttpSession session;

    @GetMapping("/index")
    public String index(@ModelAttribute("nickgame") NickGame nickgame, Model model, @RequestParam(name = "page", required = false, defaultValue = "0") Optional<Integer> page) {
        Pageable pageable = PageRequest.of(page.orElse(0), 5);
        model.addAttribute("list", dao.findPageAll(pageable));
        model.addAttribute("listCate",categoryDao.findCateProduct());
        model.addAttribute("listServer",serverDao.getAll());
        request.setAttribute("view","/views/admin/nickgame.jsp");
        return "admin/admin";
    }


    @PostMapping("/add")
    public String add(@ModelAttribute("nickgame") NickGame nickgame,@RequestParam("attach") MultipartFile attach) {
        try {
            nickgame.setCreateDate(new Date());
            if (!attach.isEmpty()) {
                String filename = attach.getOriginalFilename();
                File file = new File(app.getRealPath("/images/nick/" + filename));
                nickgame.setImage("/images/nick/" + filename);
                try {
                    attach.transferTo(file);
                } catch (IOException e) {
                    throw new RuntimeException(e);
                }
            }
            nickgame.setStatus(1);
            this.dao.insert(nickgame);
            session.setAttribute("message", "Thêm Mới Thành Công");
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error", "Thêm Mới Thất Bại");
        }
        return "redirect:/admin/nickgame/index";
    }

    @GetMapping("/edit")
    public String edit(@RequestParam(name = "id") Integer id, Model model, @ModelAttribute("nickgame") NickGame nickgame, @RequestParam(name = "page", required = false, defaultValue = "0") Optional<Integer> page) {
        model.addAttribute("pro", dao.findById(id));
        model.addAttribute("listCate",categoryDao.getAll());
        model.addAttribute("listServer",serverDao.getAll());
        Pageable pageable = PageRequest.of(page.orElse(0), 5);
        model.addAttribute("list", dao.findPageAll(pageable));
        request.setAttribute("view","/views/admin/nickgame.jsp");
        return "admin/admin";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute("nickgame") NickGame nickgame,@RequestParam("attach") MultipartFile attach, @RequestParam(name = "id") Integer id) {
        try {
            NickGame p = dao.findById(id);
            nickgame.setCreateDate(p.getCreateDate());
            nickgame.setPassword(p.getPassword());
            nickgame.setStatus(p.getStatus());
            if (!attach.isEmpty()) {
                String filename = attach.getOriginalFilename();
                File file = new File(app.getRealPath("/images/nick/" + filename));
                nickgame.setImage("/images/nick/" + filename);
                try {
                    attach.transferTo(file);
                } catch (IOException e) {
                    throw new RuntimeException(e);
                }
            }else {
                nickgame.setImage(p.getImage());
            }
            this.dao.update(nickgame);
            session.setAttribute("message", "Cập Nhật Thành Công");
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error", "Cập Nhật Thất Bại");
        }
        return "redirect:/admin/nickgame/index";
    }

    @PostMapping("/delete")
    public String delete( @RequestParam(name = "id") Integer id) {
        try {
            this.dao.delete(id);
            session.setAttribute("message", "Xoa Thành Công");
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error", "Xoa Thất Bại");
        }
        return "redirect:/admin/nickgame/index";
    }

    @ModelAttribute("planet")
    public Map<NickPlanet, String> getPlanet() {
        Map<NickPlanet, String> map = new HashMap<NickPlanet, String>();
        map.put(NickPlanet.XayDa, "Xayda");
        map.put(NickPlanet.TraiDat, "Trái Đất");
        map.put(NickPlanet.Namec, "Namec");
        return map;
    }

//    @PostMapping("/deleteMuch")
//    public String deleteMuch() {
//        String[] id = request.getParameterValues("checkDelete");
//        List<NickGame> list = new ArrayList<>();
//        for (String s : id) {
//            NickGame product = this.dao.findById(Integer.valueOf(s));
//            list.add(product);
//        }
//        if (id != null) {
//            this.dao.deleteMuch(list);
//        }
//        return "redirect:/admin/nickgame/index";
//    }
}
