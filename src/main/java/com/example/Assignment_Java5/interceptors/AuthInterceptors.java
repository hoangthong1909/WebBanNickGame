package com.example.Assignment_Java5.interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.example.Assignment_Java5.entitys.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Component
public class AuthInterceptors implements HandlerInterceptor {
    @Autowired
    HttpSession session;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        User user = (User) session.getAttribute("user");
        if (user == null || user.getPermission() == 0) {
//            request.getSession().setAttribute("secureUri",request.getRequestURI());
            response.sendRedirect("/login");
            return false;
        }
        return true;
    }

}