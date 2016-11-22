package com.gnohisiam.controller;

import com.gnohisiam.model.User;
import com.gnohisiam.service.UserService;
import com.gnohisiam.util.ValidateCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@Controller
public class UserController {

    @Autowired
    private UserService service;

    @GetMapping("/")
    public String index() {
        return "login";
    }

    @PostMapping("/login")
    public String login(
            @RequestParam String name,
            @RequestParam String password,
            @RequestParam String code,
            HttpServletRequest request,
            Map<String, Object> model
    ) {
        // 获取验证码值
        String validCode = request.getSession().getAttribute("validCode").toString();
        request.getSession().removeAttribute("validCode");
        if (!code.toUpperCase().equals(validCode)) {
            model.put("msg", "验证码输入有误");
            model.put("name", name);
            return "login";
        }

        switch (service.login(name, password)) {
            case 0:
                model.put("msg", "账号不存在，请先注册");
                return "login";
            case 1:
                request.getSession().setAttribute("name", name);
                return "index";
            case 2:
                model.put("msg", "密码有误，请注意区分大小写");
                model.put("name", name);
                return "login";
        }

        return "login";
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest request) {
        // 删除所有session中保存的键
        request.getSession().invalidate();
        return "login";
    }

    @PostMapping("/register")
    public String register(User user, Map<String, Object> model) {
        if (service.isNameExist(user.getName())) {
            model.put("msg", "用户名已存在，请重新注册");
            return "formValidation";
        }

        service.save(user);
        model.put("msg", "恭喜注册成功，请直接登录");
        model.put("name", user.getName());
        return "login";
    }

    @GetMapping("/checkName")
    @ResponseBody
    public String checkName(@RequestParam String name) {
        return service.isNameExist(name) ? "1" : "0";
    }

    @GetMapping("/validateCode")
    public void generateValidateCode(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("image/jpeg"); // 设置相应类型,告诉浏览器输出的内容为图片
        response.setHeader("Pragma", "No-cache"); // 设置响应头信息，告诉浏览器不要缓存此内容
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expire", 0);
        ValidateCode imgObj = new ValidateCode();
        request.getSession().setAttribute("validCode", imgObj.getCode());
        // 将内存中的图片通过流动形式输出到客户端
        ImageIO.write(imgObj.getBuffImg(), "jpeg", response.getOutputStream());
    }

}
