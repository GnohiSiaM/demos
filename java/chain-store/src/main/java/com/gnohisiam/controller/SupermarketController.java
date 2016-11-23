package com.gnohisiam.controller;


import com.gnohisiam.model.Supermarket;
import com.gnohisiam.repository.SupermarketRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
@RequestMapping("supermarket")
public class SupermarketController {

    @Autowired
    private SupermarketRepository repository;

    @PostMapping("delete")
    public String deleteSupermarket(
            @RequestParam String sNumber,
            @RequestParam String dNumber,
            Map<String, Object> model
    ) {
        repository.delete(sNumber);
        return "redirect:/supermarket/info";
    }

    @GetMapping("update")
    public String getSupermarket(
            @RequestParam String sNumber,
            Map<String, Object> model
    ) {
        model.put("supermarket", repository.findOne(sNumber));
        return "/main/supermarketEdit";
    }

    @PostMapping("update")
    public String updateSupermarket(Supermarket Supermarket) {
        repository.save(Supermarket); // TODO: 要改为update
        return "redirect:/supermarket/info";
    }

    @GetMapping("info")
    public String getSupermarketList(Map<String, Object> model) {
        model.put("sInfo", repository.findAll());
        return "/main/supermarketInfo";
    }

    @PostMapping("save")
    public String saveSupermarket(Supermarket Supermarket) {
        repository.save(Supermarket);
        return "redirect:/supermarket/info";
    }

}
