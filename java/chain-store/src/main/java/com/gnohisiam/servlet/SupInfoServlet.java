package com.gnohisiam.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gnohisiam.dao.SupermarketDAO;
import com.gnohisiam.entity.Supermarket;

@SuppressWarnings("serial")
public class SupInfoServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        SupermarketDAO dao = new SupermarketDAO();
        List<Supermarket> sInfo = dao.getSupermarketList();
        request.setAttribute("sInfo", sInfo);
        request.getRequestDispatcher("/main/supermarketInfo.jsp").forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //将request请求设置为中文支持
        //request.setCharacterEncoding("UTF-8");
    }

}
