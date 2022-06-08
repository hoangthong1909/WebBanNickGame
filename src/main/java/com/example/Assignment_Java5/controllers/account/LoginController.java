package com.example.Assignment_Java5.controllers.account;

import com.example.Assignment_Java5.entitys.User;
import com.example.Assignment_Java5.service.IUserService;
import com.example.Assignment_Java5.utils.EncryptUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class LoginController {
    @Autowired
    private HttpSession session;

    @Autowired
    private IUserService userDao;

    @GetMapping("/login")
    public String loginUI(){
        return "account/login";
    }

    @PostMapping("/loginAccount")
    public String login( @RequestParam(name = "email",required = false) String email , @RequestParam(name = "password",required = false) String password) {
        User user = this.userDao.findByEmail(email);
        if (user == null) {
            session.setAttribute("error", "Tên Đăng Nhập Không Tồn Tại");
            return "redirect:/login";
        } else {
            boolean check = EncryptUtil.check(password, user.getPassword());
            if (check == true) {
                // Đăng nhập thành công
                if (user.getPermission() == 1) {
                    session.setAttribute("user", user);
                    return "redirect:/admin/user/index";
                } else {
                    session.setAttribute("user", user);
                    return "redirect:/home/index";
                }
            } else {
                // Đăng nhập thất bại
                session.setAttribute("error", "Mật Khẩu không chính xác ");
                return "redirect:/login";
            }
        }
    }

    @GetMapping("logout")
    public String logout() {
        session.removeAttribute("user");
        return "redirect:/login";
    }
}
