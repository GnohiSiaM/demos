package com.gnohisiam.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gnohisiam.dao.ManagerDAO;
import com.gnohisiam.entity.Manager;

@SuppressWarnings("serial")
public class ManInfoServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ManagerDAO dao = new ManagerDAO();
        List<Manager> mInfo = dao.getManagerList();
        request.setAttribute("mInfo", mInfo);
        request.getRequestDispatcher("/main/managerInfo.jsp").forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
