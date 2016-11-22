package com.gnohisiam.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gnohisiam.dao.DepartmentDAO;
import com.gnohisiam.entity.Department;

@SuppressWarnings("serial")
public class DepDeleteServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String sNumber = request.getSession().getAttribute("sNumber").toString();

        DepartmentDAO dao = new DepartmentDAO();
        //根据dNumber来调用DepartmentDAO类的deleteDepartment()方法删除部门信息
        dao.deleteDepartment(request.getParameter("dNumber"));

        //返回并刷新部门信息页面
        List<Department> dInfo = dao.getDepartmentList(sNumber);
        request.setAttribute("dInfo", dInfo);
        request.getRequestDispatcher("/main/departmentInfo.jsp").forward(request, response);

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
