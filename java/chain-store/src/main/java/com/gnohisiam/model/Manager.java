package com.gnohisiam.model;

import lombok.Data;
import org.springframework.data.annotation.Id;

@Data
public class Manager {

    @Id
    private String id;
    private String startTime;
    private String eNumber;
    private String eName;
    private String dName;
    private String sName;

}
