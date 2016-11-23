package com.gnohisiam.controller;


import com.gnohisiam.model.Employee;
import com.gnohisiam.repository.EmployeeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("employee")
public class EmployeeController {

    @Autowired
    private EmployeeRepository repository;

    @PostMapping("delete")
    public String deleteEmployee(
            @RequestParam String dNumber,
            @RequestParam String eNumber,
            Map<String, Object> model
    ) {
        repository.delete(eNumber);
        model.put("eInfo", repository.findAllByDNumber(dNumber));
        return "/main/employeeInfo";
    }

    @GetMapping("update")
    public String getEmployee(
            @RequestParam String eNumber,
            Map<String, Object> model
    ) {
        model.put("employee", repository.findOne(eNumber));
        return "/main/employeeEdit";
    }

    @PostMapping("update")
    public String updateEmployee(
            @RequestParam String dNumber,
            Employee employee,
            Map<String, Object> model
    ) {
        repository.save(employee); // TODO: 要改为update
        model.put("eInfo", repository.findAllByDNumber(dNumber));
        return "/main/employeeInfo";
    }

    @GetMapping("info")
    public String getEmployeeList(
            @RequestParam String dName,
            @RequestParam String dNumber,
            HttpServletRequest request,
            Map<String, Object> model
    ) {
        request.getSession().setAttribute("dNumber", dNumber);
        request.getSession().setAttribute("dName", dName);


        List<Employee> eInfo;
        if ("all".equals(dNumber)) {
            eInfo = repository.findAll();
        } else {
            eInfo = repository.findAllByDNumber(dNumber);
            // TODO: Manager man = new ManagerDAO().getManager(dNumber);
            // model.put("MInfo", man);
        }

        model.put("eInfo", eInfo);
        return "/main/employeeInfo";
    }

    @PostMapping("save")
    public String saveEmployee(
            @RequestParam String dNumber,
            Employee employee,
            Map<String, Object> model
    ) {
        repository.save(employee);
        model.put("eInfo", repository.findAllByDNumber(dNumber));
        return "/main/employeeInfo";
    }

}
