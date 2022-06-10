package com.example.Assignment_Java5.controllers.account;

import com.example.Assignment_Java5.entitys.User;
import com.example.Assignment_Java5.service.IUserService;
import com.example.Assignment_Java5.utils.EncryptUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/home")
public class ChangePassword {
    @Autowired
    private HttpSession session;

    @Autowired
    private IUserService userDao;

    @Autowired
    private HttpServletRequest request;

    @GetMapping("/changepassword")
    public String changePasswordUI(){
        request.setAttribute("view","/views/account/changepassword.jsp");
        return "home/layout";
    }

    @PostMapping("changepass")
    public String changePassword( @RequestParam(name = "oldpassword",required = false) String password,@RequestParam(name = "newpassword",required = false) String newpassword,@RequestParam(name = "confirmpassword",required = false) String confirmpassword) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        } else {
            boolean check = EncryptUtil.check(password, user.getPassword());
            if (check == true) {
                if (newpassword.equals(confirmpassword)) {
                    String encrypted = EncryptUtil.encrypt(newpassword);
                    user.setPassword(encrypted);
                    this.userDao.update(user);
                    session.setAttribute("message", "Đổi mật khẩu thành công");
                    return "redirect:/home/changepassword";
                } else {
                    session.setAttribute("error", "Mật khẩu mới không trùng với mật khẩu xác nhận");
                    return "redirect:/home/changepassword";
                }
            } else {
                session.setAttribute("error", "Mật khẩu cũ không chính xác");
                return "redirect:/home/changepassword";
            }
        }
    }
}
