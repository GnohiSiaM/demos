package com.gnohisiam.demo.controller;

import org.apache.commons.lang.exception.ExceptionUtils;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestController;

@ControllerAdvice
@RestController
public class GlobalExceptionController {

    @ExceptionHandler(Exception.class)
    public String handleAllException(Exception exception) {
        return ExceptionUtils.getFullStackTrace(exception);
    }

}
