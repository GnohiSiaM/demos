package com.validation.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.validation.dao.LoginDAO;

@SuppressWarnings("serial")
public class LoginServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //将request请求设置为中文支持
        request.setCharacterEncoding("UTF-8");

        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        LoginDAO dao = new LoginDAO();

        //System.out.println(CipherUtil.generatePassword(password));    //输出经过MD5加密的密码

        String validCode = request.getSession().getAttribute("validCode").toString();    //获取ValidateCodeServlet生成的验证码值
        String inputValidCode = request.getParameter("inputValidCode").toUpperCase();    //获取前台输入的验证码值
        boolean resultOfValidCode = validCode.equals(inputValidCode);
        request.getSession().removeAttribute("validCode");

        if (resultOfValidCode) {
            Integer result = dao.login(userName, password);
            switch (result) {
                case 0:
                    request.setAttribute("msg", "账号不存在，请先注册");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                    break;
                case 1:
                    request.getSession().setAttribute("userName", userName);
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                    break;
                case 2:
                    request.setAttribute("msg", "密码有误，请注意区分大小写");
                    request.setAttribute("name", userName);
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                    break;
            }
        } else {
            request.setAttribute("msg", "验证码输入有误");
            request.setAttribute("name", userName);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

}
