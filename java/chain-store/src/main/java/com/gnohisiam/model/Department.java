package com.gnohisiam.model;

import lombok.Data;
import org.springframework.data.annotation.Id;

@Data
public class Department {

    @Id
    private String id;
    private String dNumber;
    private String dName;
    private String dLocation;
    private String dPhoneNumber;
    private Integer mId;
    private String sNumber;

}
