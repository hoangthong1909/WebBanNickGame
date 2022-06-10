package com.example.Assignment_Java5.controllers.account;

import com.example.Assignment_Java5.entitys.User;
import com.example.Assignment_Java5.service.IUserService;
import com.example.Assignment_Java5.utils.EncryptUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;

@Controller
public class RegisterController {

    @Autowired
    private HttpSession session;

    @Autowired
    private IUserService userDao;

    @PostMapping("/register")
    public String register( @RequestParam(name = "email", required = false) String email, @RequestParam(name = "password", required = false) String password, @RequestParam(name = "password2", required = false) String password2,@RequestParam(name = "name", required = false) String name,@RequestParam(name = "address", required = false) String address) {
        User entity = new User();
        if (password.equals(password2)) {
            if (this.userDao.findByEmail(email) == null) {
                String encrypted = EncryptUtil.encrypt(password);
                entity.setPassword(encrypted);
                entity.setStatus(1);
                entity.setName(name);
                entity.setEmail(email);
                entity.setAddress(address);
                entity.setSurplus(new BigDecimal(0));
                entity.setPermission(0);
                this.userDao.insert(entity);
                session.setAttribute("message", "Đăng Ký Thành Công");
                return "redirect:/login";
            } else {
                session.setAttribute("error", "Email Đã Tồn Tại");
                return "redirect:/login";
            }
        } else {
            session.setAttribute("error", "Mật khẩu không trùng với mật khẩu xác nhận");
            return "redirect:/login";
        }
    }
}
