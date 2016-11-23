package com.gnohisiam.model;

import lombok.Data;
import org.springframework.data.annotation.Id;

@Data
public class Employee {

    @Id
    private String id;
    private String eNumber;
    private String eName;
    private String ePosition;
    private String ePhoneNumber;
    private double eSalary;
    private Integer eAge;
    private String eSex;
    private String dNumber;

}
