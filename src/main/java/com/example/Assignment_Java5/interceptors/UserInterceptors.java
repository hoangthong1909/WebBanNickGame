package com.example.Assignment_Java5.interceptors;

import com.example.Assignment_Java5.entitys.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Component
public class UserInterceptors implements HandlerInterceptor {
    @Autowired
    HttpSession session;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            request.getSession().setAttribute("secureUri", request.getRequestURI());
            response.sendRedirect("/login");
            return false;
        }
        return true;
    }

}
