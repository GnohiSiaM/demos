package com.gnohisiam.demo.model;

import static com.gnohisiam.demo.common.Constants.GMT_8;
import static com.gnohisiam.demo.common.Constants.TIME_PATTERN;

import java.util.Date;

import lombok.Data;

import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.annotation.Version;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonInclude;

@Data
@JsonInclude(JsonInclude.Include.NON_NULL)
public class BaseModel {

    @Id
    private String id;
    @CreatedDate
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = TIME_PATTERN, timezone = GMT_8)
    private Date created;
    @LastModifiedDate
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = TIME_PATTERN, timezone = GMT_8)
    private Date lastModified;
    @Version
    private Long version;

}
