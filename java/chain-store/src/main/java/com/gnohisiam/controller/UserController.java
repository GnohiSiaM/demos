package com.gnohisiam.controller;


import com.gnohisiam.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
public class UserController {

    @Autowired
    private UserRepository repository;

    @PostMapping("/login")
    public String login(
            @RequestParam String name,
            @RequestParam String password,
            HttpServletRequest request,
            Map<String, Object> model
    ) {
        if (repository.findByUNameAndUPassword(name, password) != null) {
            request.getSession().setAttribute("uname", name);
            return "index";
        } else {
            //返回登录错误信息
            model.put("msg", "-= 账号或密码有误 =-");
            return "login";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest request) {
        request.getSession().invalidate(); //删除所有session中保存的键
        return "login";
    }

}
