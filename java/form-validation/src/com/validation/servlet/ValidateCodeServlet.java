package com.validation.servlet;

import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.validation.util.ValidateCodeUtil;

@SuppressWarnings("serial")
public class ValidateCodeServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("image/jpeg"); // 设置相应类型,告诉浏览器输出的内容为图片
        response.setHeader("Pragma", "No-cache"); // 设置响应头信息，告诉浏览器不要缓存此内容
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expire", 0);
        ValidateCodeUtil imgObj = new ValidateCodeUtil();
        request.getSession().setAttribute("validCode", imgObj.getCode());
        ImageIO.write(imgObj.getBuffImg(), "jpeg", response.getOutputStream()); // 将内存中的图片通过流动形式输出到客户端
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }

}
