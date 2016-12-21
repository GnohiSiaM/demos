package com.gnohisiam.demo.configuration;

import lombok.Data;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

@Data
@PropertySource("classpath:test.properties")
@Component
@ConfigurationProperties(prefix = "test")
public class TestProperties {

    private String key;
    private String secret;
    private String url;
    private String endpoint;

}
