package com.gnohisiam.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gnohisiam.dao.RegisterDAO;

@SuppressWarnings("serial")
public class CheckNameServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        /********为什么IE下用get方法获取汉字是乱码啊 *********/
        // String name = new String( request.getParameter("name").getBytes("iso-8859-1"),"utf-8");
        // RegisterDAO dao = new RegisterDAO();
        // response.getWriter().write(dao.isNameExist(name) ? "1" : "0");
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //将request请求设置为中文支持
        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("name");
        RegisterDAO dao = new RegisterDAO();
        response.getWriter().write(dao.isNameExist(name) ? "1" : "0");
    }

}
