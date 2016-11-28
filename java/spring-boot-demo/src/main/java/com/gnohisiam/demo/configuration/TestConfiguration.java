package com.gnohisiam.demo.configuration;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Data
@Component
@ConfigurationProperties(prefix = "test")
public class TestConfiguration {

    private String key;
    private String secret;
    private String url;
    private String endpoint;

}
