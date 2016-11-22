package com.gnohisiam.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gnohisiam.dao.DepartmentDAO;
import com.gnohisiam.dao.EmployeeDAO;
import com.gnohisiam.dao.ManagerDAO;
import com.gnohisiam.dao.SupermarketDAO;
import com.gnohisiam.entity.Department;
import com.gnohisiam.entity.Employee;
import com.gnohisiam.entity.Supermarket;

@SuppressWarnings("serial")
public class ManSaveServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String sNumber = request.getParameter("sNumber");
        String dNumber = request.getParameter("dNumber");

        //跳转到“设置部门经理”页面时，把“商场-部门-员工”三级联动的第一级(商场列表)传到页面上
        if ( sNumber == null && dNumber == null ) {
            SupermarketDAO sdao = new SupermarketDAO();
            List<Supermarket> supList = sdao.getSupermarketList();
            request.setAttribute("supList", supList);
            request.getRequestDispatcher("/main/managerSave.jsp").forward(request, response);
        }

        //设置返回给浏览器的数据格式
        response.setContentType("text/json; charset=utf-8");

        //(ajax)“商场-部门-员工”三级联动的第二级(部门列表)
        if ( sNumber != null ) {
            DepartmentDAO ddao = new DepartmentDAO();
            List<Department> depList = ddao.getDepartmentList(sNumber);
            if (depList.size() == 0) {
                response.getWriter().write("{}");
            } else {
                String department = "";
                for(int i=0;i<depList.size();i++) {
                    department += "{'dName':'"+depList.get(i).getdName()+"',";
                    department += "'dNumber':'"+depList.get(i).getdNumber()+"'},";
                }
                response.getWriter().write( "["+department.substring(0, department.length()-1)+"]" );
            }
        }

        //(ajax)“商场-部门-员工”三级联动的第三级(员工列表)
        if ( dNumber != null ) {
            EmployeeDAO edao = new EmployeeDAO();
            List<Employee> empList = edao.getEmployeeList(dNumber);
            if (empList.size() == 0) {
                response.getWriter().write("{}");
            } else {
                String employee = "";
                for(int i=0;i<empList.size();i++) {
                    employee += "{'eName':'"+empList.get(i).geteName()+"',";
                    employee += "'eNumber':'"+empList.get(i).geteNumber()+"'},";
                }
                response.getWriter().write( "["+employee.substring(0, employee.length()-1)+"]" );
            }
        }

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ManagerDAO dao = new ManagerDAO();
        Date now = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd"); //可以方便地修改日期格式
        String startTime = dateFormat.format( now ).toString();
        String eNumber = request.getParameter("emp");
        dao.saveManager(startTime, eNumber);

        response.sendRedirect("ManInfoServlet");
    }

}
