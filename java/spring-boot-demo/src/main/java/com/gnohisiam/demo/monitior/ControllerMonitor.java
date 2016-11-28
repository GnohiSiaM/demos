package com.gnohisiam.demo.monitior;

import lombok.extern.java.Log;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

@Log
@Aspect
@Component
public class ControllerMonitor {

    @AfterReturning("execution(* com.gnohisiam..*Controller.*(..))")
    public void logControllerAccess(JoinPoint joinPoint) {
        log.info("Completed: " + joinPoint);
    }

}
