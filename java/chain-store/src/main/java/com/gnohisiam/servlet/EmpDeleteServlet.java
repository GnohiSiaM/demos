package com.gnohisiam.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gnohisiam.dao.EmployeeDAO;
import com.gnohisiam.entity.Employee;

@SuppressWarnings("serial")
public class EmpDeleteServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String dNumber = request.getSession().getAttribute("dNumber").toString();

        EmployeeDAO dao = new EmployeeDAO();
        //根据eNumber来调用EmployeeDAO类的deleteEmployee()方法删除员工信息
        dao.deleteEmployee( request.getParameter("eNumber") );

        //返回并刷新员工信息页面
        List<Employee> eInfo = dao.getEmployeeList(dNumber);
        request.setAttribute("eInfo", eInfo);
        request.getRequestDispatcher("/main/employeeInfo.jsp").forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
