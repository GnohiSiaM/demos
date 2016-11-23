package com.gnohisiam.model;

import lombok.Data;
import org.springframework.data.annotation.Id;

@Data
public class User {

    @Id
    private String id;
    private String uName;
    private String uPassword;
    private String eNumber;

}
