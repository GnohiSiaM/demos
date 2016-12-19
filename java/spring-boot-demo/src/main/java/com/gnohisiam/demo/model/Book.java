package com.gnohisiam.demo.model;

import static com.gnohisiam.demo.common.Constants.GMT_8;
import static com.gnohisiam.demo.common.Constants.TIME_PATTERN;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;

import com.fasterxml.jackson.annotation.JsonFormat;

@Data
@AllArgsConstructor
public class Book extends BaseModel {

    private String name;
    private String author;
    private Float price;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = TIME_PATTERN, timezone = GMT_8)
    private Date publicationDate;

}
