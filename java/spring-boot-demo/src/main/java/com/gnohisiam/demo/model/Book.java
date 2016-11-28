package com.gnohisiam.demo.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.gnohisiam.demo.common.Constants;
import lombok.AllArgsConstructor;
import lombok.Data;

import java.util.Date;

@Data
@AllArgsConstructor
public class Book extends BaseModel {

    private String name;
    private String author;
    private Float price;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = Constants.TIME_PATTERN, timezone = Constants.GMT_8)
    private Date publicationDate;

}
