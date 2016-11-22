package com.gnohisiam.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gnohisiam.dao.SupermarketDAO;

@SuppressWarnings("serial")
public class SupDeleteServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        SupermarketDAO dao = new SupermarketDAO();
        dao.deleteSupermarket(request.getParameter("sNumber"));

        response.sendRedirect("SupInfoServlet");
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
