package com.gnohisiam.demo.model;

import java.util.Date;

import lombok.Data;

import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.annotation.Version;
import com.fasterxml.jackson.annotation.JsonInclude;

@Data
@JsonInclude(JsonInclude.Include.NON_NULL)
public class BaseModel {

    @Id
    private String id;
    @CreatedDate
    private Date created;
    @LastModifiedDate
    private Date lastModified;
    @Version
    private Long version;

}
