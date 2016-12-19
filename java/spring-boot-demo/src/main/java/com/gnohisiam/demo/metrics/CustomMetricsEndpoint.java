package com.gnohisiam.demo.metrics;

import java.util.Map;
import java.util.TreeMap;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.actuate.endpoint.AbstractEndpoint;
import org.springframework.boot.actuate.endpoint.MetricsEndpoint;
import org.springframework.stereotype.Component;

@Component
public class CustomMetricsEndpoint extends AbstractEndpoint<Map<String, Object>> {

    private MetricsEndpoint metricsEndpoint;

    @Autowired
    public CustomMetricsEndpoint(MetricsEndpoint metricsEndpoint) {
        super("custom/metrics");
        this.metricsEndpoint = metricsEndpoint;
    }

    public Map<String, Object> invoke() {
        return metricsEndpoint.invoke().entrySet()
            .stream()
            .filter(entry -> !entry.getKey().startsWith("counter")
                && !entry.getKey().startsWith("gauge"))
            .collect(Collectors.toMap(
                Map.Entry::getKey,
                Map.Entry::getValue,
                (u, v) -> { throw new IllegalStateException(String.format("Duplicate key %s", u)); },
                TreeMap::new)
            );
    }

}
