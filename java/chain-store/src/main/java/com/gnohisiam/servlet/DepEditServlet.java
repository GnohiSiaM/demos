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
public class DepEditServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DepartmentDAO dao = new DepartmentDAO();
        Department department = dao.showDepartment(request.getParameter("dNumber"));
        request.setAttribute("department", department);
        request.getRequestDispatcher("/main/departmentEdit.jsp").forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //将request请求设置为中文支持
        request.setCharacterEncoding("UTF-8");

        String sNumber = request.getSession().getAttribute("sNumber").toString();

        Department dep = new Department();
        dep.setdNumber(request.getParameter("dNumber"));
        dep.setdName(request.getParameter("dName"));
        dep.setdLocation(request.getParameter("dLocation"));
        dep.setdPhoneNumber(request.getParameter("dPhoneNumber"));
        dep.setsNumber(sNumber);

        DepartmentDAO dao = new DepartmentDAO();
        dao.updateDepartment(dep);                //更新部门信息

        //返回并刷新部门信息页面
        List<Department> dInfo = dao.getDepartmentList(sNumber);
        request.setAttribute("dInfo", dInfo);
        request.getRequestDispatcher("/main/departmentInfo.jsp").forward(request, response);
//        response.sendRedirect("DepInfoServlet");
    }

}
