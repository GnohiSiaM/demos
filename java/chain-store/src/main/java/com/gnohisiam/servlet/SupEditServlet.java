package com.gnohisiam.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gnohisiam.dao.SupermarketDAO;
import com.gnohisiam.entity.Supermarket;

@SuppressWarnings("serial")
public class SupEditServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        SupermarketDAO dao = new SupermarketDAO();
        Supermarket supermarket = dao.showSupermarket(request.getParameter("sNumber"));
        request.setAttribute("supermarket", supermarket);
        request.getRequestDispatcher("/main/supermarketEdit.jsp").forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //将request请求设置为中文支持
        request.setCharacterEncoding("UTF-8");

        Supermarket sup = new Supermarket();
        sup.setsNumber(request.getParameter("sNumber"));
        sup.setsName(request.getParameter("sName"));
        sup.setsAddress(request.getParameter("sAddress"));
        sup.setsPhoneNumber(request.getParameter("sPhoneNumber"));

        SupermarketDAO dao = new SupermarketDAO();
        dao.updateSupermarket(sup);

        response.sendRedirect("SupInfoServlet");
    }

}
