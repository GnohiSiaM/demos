package com.gnohisiam.demo.monitior;

import lombok.extern.slf4j.Slf4j;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

@Slf4j
@Aspect
@Component
public class ControllerMonitor {

    @AfterReturning("execution(* com.gnohisiam..*Controller.*(..))")
    public void logControllerAccess(JoinPoint joinPoint) {
        log.info("Completed: " + joinPoint);
    }

}
