package com.gnohisiam.demo;

import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.actuate.metrics.CounterService;
import org.springframework.boot.actuate.metrics.GaugeService;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import com.gnohisiam.demo.schedule.Task;

@Slf4j
@Component
public class AppRunner implements CommandLineRunner {

    @Autowired
    private Task task;

    @Autowired
    private CounterService counterService;

    @Autowired
    private GaugeService gaugeService;

    @Override
    public void run(String... args) throws Exception {
    }

    @Scheduled(fixedDelay = 1000)
    private void scheduled1() {
        log.info("scheduled 11111 start");
        task.task1();
    }

    @Scheduled(fixedDelay = 2000)
    private void scheduled2() {
        log.error("scheduled 22222 start");
    }

    @Scheduled(fixedDelay = 1000)
    private void scheduled3() {
        counterService.increment("services.system.scheduled3.invoked");
        gaugeService.submit("services.system.scheduled3.invoked", 1000);
        log.error("scheduled 33333 start");
    }

}