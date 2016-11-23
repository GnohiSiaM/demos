package com.gnohisiam.controller;

import com.gnohisiam.model.Manager;
import com.gnohisiam.repository.ManagerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

@Controller
@RequestMapping("manager")
public class ManagerController {

    @Autowired
    private ManagerRepository repository;


    @PostMapping("delete")
    public String deleteManager(@RequestParam String eNumber) {
        repository.delete(eNumber);
        return "redirect:/manager/info";
    }

    @GetMapping("info")
    public String getManagerList(Map<String, Object> model) {
        model.put("mInfo", repository.findAll());
        return "/main/managerInfo";
    }

    @PostMapping("save")
    public String saveManager(@RequestParam String emp) {
        String startTime = new SimpleDateFormat("yyyy/MM/dd").format(new Date()).toString();
        Manager manager = new Manager();
        manager.setENumber(emp);
        manager.setStartTime(startTime);
        repository.save(manager);
        return "redirect:/manager/info";
    }

    @GetMapping("saveGet")
    public String saveGetManager(@RequestParam String emp) {
        String startTime = new SimpleDateFormat("yyyy/MM/dd").format(new Date()).toString();
        Manager manager = new Manager();
        manager.setENumber(emp);
        manager.setStartTime(startTime);
        repository.save(manager);
        return "redirect:/manager/info";
    }

//    public void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        String sNumber = request.getParameter("sNumber");
//        String dNumber = request.getParameter("dNumber");
//
//        //跳转到“设置部门经理”页面时，把“商场-部门-员工”三级联动的第一级(商场列表)传到页面上
//        if ( sNumber == null && dNumber == null ) {
//            SupermarketDAO sdao = new SupermarketDAO();
//            List<Supermarket> supList = sdao.getSupermarketList();
//            request.setAttribute("supList", supList);
//            request.getRequestDispatcher("/main/managerSave.jsp").forward(request, response);
//        }
//
//        //设置返回给浏览器的数据格式
//        response.setContentType("text/json; charset=utf-8");
//
//        //(ajax)“商场-部门-员工”三级联动的第二级(部门列表)
//        if ( sNumber != null ) {
//            DepartmentDAO ddao = new DepartmentDAO();
//            List<Department> depList = ddao.getDepartmentList(sNumber);
//            if (depList.size() == 0) {
//                response.getWriter().write("{}");
//            } else {
//                String department = "";
//                for(int i=0;i<depList.size();i++) {
//                    department += "{'dName':'"+depList.get(i).getdName()+"',";
//                    department += "'dNumber':'"+depList.get(i).getdNumber()+"'},";
//                }
//                response.getWriter().write( "["+department.substring(0, department.length()-1)+"]" );
//            }
//        }
//
//        //(ajax)“商场-部门-员工”三级联动的第三级(员工列表)
//        if ( dNumber != null ) {
//            EmployeeDAO edao = new EmployeeDAO();
//            List<Employee> empList = edao.getEmployeeList(dNumber);
//            if (empList.size() == 0) {
//                response.getWriter().write("{}");
//            } else {
//                String employee = "";
//                for(int i=0;i<empList.size();i++) {
//                    employee += "{'eName':'"+empList.get(i).geteName()+"',";
//                    employee += "'eNumber':'"+empList.get(i).geteNumber()+"'},";
//                }
//                response.getWriter().write( "["+employee.substring(0, employee.length()-1)+"]" );
//            }
//        }
//
//    }

}
