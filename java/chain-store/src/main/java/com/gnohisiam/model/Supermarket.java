package com.gnohisiam.model;

import lombok.Data;
import org.springframework.data.annotation.Id;

@Data
public class Supermarket {

    @Id
    private String id;
    private String sNumber;
    private String sName;
    private String sAddress;
    private String sPhoneNumber;

}
