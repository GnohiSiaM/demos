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
public class EmpSaveServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }


    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //将request请求设置为中文支持
        request.setCharacterEncoding("UTF-8");

        String dNumber = request.getSession().getAttribute("dNumber").toString();

        Employee emp = new Employee();
        emp.seteNumber(request.getParameter("eNumber"));
        emp.seteName(request.getParameter("eName"));
        emp.setePosition(request.getParameter("ePosition"));
        emp.setePhoneNumber(request.getParameter("ePhoneNumber"));
        emp.seteSalary(Double.valueOf(request.getParameter("eSalary")) );
        emp.seteAge(Integer.valueOf(request.getParameter("eAge")));
        emp.seteSex(request.getParameter("eSex"));
        emp.setdNumber(dNumber);

        EmployeeDAO dao = new EmployeeDAO();
        dao.saveEmployee(emp);                //保存新员工信息

        //返回并刷新员工信息页面
        List<Employee> eInfo = dao.getEmployeeList(dNumber);
        request.setAttribute("eInfo", eInfo);
        request.getRequestDispatcher("/main/employeeInfo.jsp").forward(request, response);

    }

}
