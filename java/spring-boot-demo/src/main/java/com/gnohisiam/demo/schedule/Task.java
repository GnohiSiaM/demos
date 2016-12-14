package com.gnohisiam.demo.schedule;

import lombok.extern.java.Log;

import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;

@Log
@Component
public class Task {

    @Async
    public void task1() {
        log.info("task 11111 start");
        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        task2();
    }

    @Async
    public void task2() {
        log.info("task 22222 start");
        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        task3();
    }

    @Async
    public void task3() {
        log.info("task 33333 start");
        try {
            Thread.sleep(2000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

}
