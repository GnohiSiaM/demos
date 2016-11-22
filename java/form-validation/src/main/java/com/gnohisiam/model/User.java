package com.gnohisiam.model;

import lombok.Data;
import org.springframework.data.annotation.Id;

@Data
public class User {

    @Id
    private String id;
    private String name;
    private String password;
    private int age;
    private boolean gender;
    private String idCard;
    private String email;
    private String phone;
    private String url;
    private String address;
    private String birthday;

}
