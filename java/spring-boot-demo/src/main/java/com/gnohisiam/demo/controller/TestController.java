package com.gnohisiam.demo.controller;

import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.gnohisiam.demo.configuration.TestProperties;

@Slf4j
@RestController
@RequestMapping("test")
public class TestController extends BaseController {

    @Autowired
    private TestProperties testProperties;

    @GetMapping("properties")
    public TestProperties getTestProperties() {
        return testProperties;
    }

    @GetMapping("exception")
    public String testException() {
        return "" + (1 / 0);
    }

}
