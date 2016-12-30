package com.gnohisiam.demo;

import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;
import com.gnohisiam.demo.schedule.Task;

@Slf4j
@Component
public class AppRunner implements CommandLineRunner {

    @Autowired
    private Task task;

    @Override
    public void run(String... args) throws Exception {
        task.task1();
    }

}