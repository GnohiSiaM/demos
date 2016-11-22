package com.gnohisiam.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gnohisiam.dao.EmployeeDAO;
import com.gnohisiam.dao.ManagerDAO;
import com.gnohisiam.entity.Employee;
import com.gnohisiam.entity.Manager;

@SuppressWarnings("serial")
public class EmpInfoServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //通过ISO-8859-1编码方式得到dName字节流并且设为UTF-8
        String dName = new String(request.getParameter("dName").getBytes("ISO-8859-1"),"UTF-8");
        String dNumber = request.getParameter("dNumber");

        EmployeeDAO dao = new EmployeeDAO();
        //根据dNumber来调用EmployeeDAO类的getEmployee()方法获取员工信息
        List<Employee> eInfo = dao.getEmployeeList(dNumber);

        if ("all".equals(dNumber)) {
            eInfo = dao.getEmployeeList();
        } else {
            eInfo = dao.getEmployeeList(dNumber);
            ManagerDAO mdao = new ManagerDAO();
            Manager man = mdao.getManager(dNumber);
            request.setAttribute("MInfo", man);
        }

        request.getSession().setAttribute("dName", dName);
        request.getSession().setAttribute("dNumber", dNumber);

        request.setAttribute("eInfo", eInfo);
        request.getRequestDispatcher("/main/employeeInfo.jsp").forward(request, response);
    }


    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
