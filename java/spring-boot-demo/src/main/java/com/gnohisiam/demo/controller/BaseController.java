package com.gnohisiam.demo.controller;

import lombok.extern.slf4j.Slf4j;

import org.apache.commons.lang.exception.ExceptionUtils;
import org.springframework.web.bind.annotation.ExceptionHandler;

@Slf4j
public class BaseController {

    @ExceptionHandler(Exception.class)
    public String handleAllException(Exception exception) {
        String message = ExceptionUtils.getFullStackTrace(exception);
        log.error(message);
        return message;
    }

}
