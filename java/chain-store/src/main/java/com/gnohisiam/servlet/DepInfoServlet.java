package com.gnohisiam.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gnohisiam.dao.DepartmentDAO;
import com.gnohisiam.entity.Department;

@SuppressWarnings("serial")
public class DepInfoServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //通过ISO-8859-1编码方式得到sName字节流并且设为UTF-8
        String sName = new String(request.getParameter("sName").getBytes("ISO-8859-1"),"UTF-8");
        String sNumber = request.getParameter("sNumber");

        DepartmentDAO dao = new DepartmentDAO();
        List<Department> dInfo = new ArrayList<Department>();

        if ("all".equals(sNumber)) {
            dInfo = dao.getDepartmentList();
        } else {
            dInfo = dao.getDepartmentList(sNumber);
        }

        request.getSession().setAttribute("sNumber", sNumber);
        request.getSession().setAttribute("sName", sName);
        request.setAttribute("dInfo", dInfo);
        request.getRequestDispatcher("/main/departmentInfo.jsp").forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
