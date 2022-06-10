package com.example.Assignment_Java5.controllers.home;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/home")
public class InfoController {

    @Autowired
    private HttpServletRequest request;
    @GetMapping("info")
    public String getInfo() {
        request.setAttribute("view","/views/home/info.jsp");
        return "home/layout";
    }
}
