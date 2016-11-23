package com.gnohisiam.controller;

import com.gnohisiam.model.Department;
import com.gnohisiam.repository.DepartmentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
@RequestMapping("department")
public class DepartmentController {

    @Autowired
    private DepartmentRepository repository;

    @PostMapping("delete")
    public String deleteDepartment(
            @RequestParam String sNumber,
            @RequestParam String dNumber,
            Map<String, Object> model
    ) {
        repository.delete(dNumber);
        model.put("dInfo", repository.findAllBySNumber(sNumber));
        return "/main/departmentInfo";
    }

    @GetMapping("update")
    public String getDepartment(
            @RequestParam String dNumber,
            Map<String, Object> model
    ) {
        model.put("department", repository.findOne(dNumber));
        return "/main/departmentEdit";
    }

    @PostMapping("update")
    public String updateDepartment(
            @RequestParam String sNumber,
            Department department,
            Map<String, Object> model
    ) {
        repository.save(department); // TODO: 要改为update
        model.put("dInfo", repository.findAllBySNumber(sNumber));
        return "/main/departmentInfo";
    }

    @GetMapping("info")
    public String getDepartmentList(
            @RequestParam String sName,
            @RequestParam String sNumber,
            HttpServletRequest request,
            Map<String, Object> model
    ) {
        request.getSession().setAttribute("sNumber", sNumber);
        request.getSession().setAttribute("sName", sName);

        model.put("dInfo", "all".equals(sNumber) ? repository.findAll() : repository.findAllBySNumber(sNumber));
        return "/main/departmentInfo";
    }

    @PostMapping("save")
    public String saveDepartment(
            @RequestParam String sNumber,
            Department department,
            Map<String, Object> model
    ) {
        repository.save(department);
        model.put("dInfo", repository.findAllBySNumber(sNumber));
        return "/main/departmentInfo";
    }

}
