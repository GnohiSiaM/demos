package com.validation.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.validation.dao.RegisterDAO;
import com.validation.entity.DBUsers;
import com.validation.util.CipherUtil;

@SuppressWarnings("serial")
public class RegisterServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 将request请求设置为中文支持
        request.setCharacterEncoding("UTF-8");

        DBUsers user = new DBUsers();
        user.setUserName(request.getParameter("username"));
        user.setPassword(CipherUtil.generatePassword(request.getParameter("password"))); // 对密码进行MD5加密
        user.setEmail(request.getParameter("email"));
        user.setPhoneNumber(request.getParameter("phonenumber"));
        user.setHomePage(request.getParameter("url"));
        user.setIDcard(request.getParameter("idcard"));
        user.setAddress(request.getParameter("address"));
        user.setBirthday(request.getParameter("birthday"));
        user.setAge(17);
        user.setGender("男");

        RegisterDAO dao = new RegisterDAO();
        // 以防万一(服务器重启后第一次用AJAX验证用户名有延迟，为什么呢？)在后台再次判断用户名是否已存在
        boolean isExist = dao.checkUsername(user.getUserName());
        if (isExist) {
            request.setAttribute("msg", "用户名已存在，请重新注册");
            request.getRequestDispatcher("formValidation.jsp").forward(request, response);
        } else {
            dao.saveUser(user);
            request.setAttribute("msg", "恭喜注册成功，请直接登录");
            request.setAttribute("name", user.getUserName());
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }

    }

}
