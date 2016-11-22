package com.gnohisiam.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gnohisiam.dao.LoginDAO;


@SuppressWarnings("serial")
public class LoginServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //将request请求设置为中文支持
        request.setCharacterEncoding("UTF-8");

        String user = request.getParameter("userName");
        String pwd = request.getParameter("userPassword");
        LoginDAO dao = new LoginDAO();

        boolean isLogin =dao.login(user, pwd);
        if (isLogin) {
            //把用户名保存到Session对象中
            //request.getSession().setAttribute(,)与request.setAttribute(,)的区别
            request.getSession().setAttribute("uname", user);
            request.getRequestDispatcher("homepage.jsp").forward(request, response);
        } else {
            //返回登录错误信息
            request.setAttribute("msg", "-= 账号或密码有误 =-");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

}
