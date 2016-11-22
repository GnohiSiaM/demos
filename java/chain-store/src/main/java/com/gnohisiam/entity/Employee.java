/**
 * 员工实体
 */

package com.gnohisiam.entity;

public class Employee {
    private Integer eId;
    private String eNumber;
    private String eName;
    private String ePosition;
    private String ePhoneNumber;
    private double eSalary;
    private Integer eAge;
    private String eSex;
    private String dNumber;

    public Integer geteId() {
        return eId;
    }
    public void seteId(Integer eId) {
        this.eId = eId;
    }
    public String geteNumber() {
        return eNumber;
    }
    public void seteNumber(String eNumber) {
        this.eNumber = eNumber;
    }
    public String geteName() {
        return eName;
    }
    public void seteName(String eName) {
        this.eName = eName;
    }
    public String getePosition() {
        return ePosition;
    }
    public void setePosition(String ePosition) {
        this.ePosition = ePosition;
    }
    public String getePhoneNumber() {
        return ePhoneNumber;
    }
    public void setePhoneNumber(String ePhoneNumber) {
        this.ePhoneNumber = ePhoneNumber;
    }
    public double geteSalary() {
        return eSalary;
    }
    public void seteSalary(double eSalary) {
        this.eSalary = eSalary;
    }
    public Integer geteAge() {
        return eAge;
    }
    public void seteAge(Integer eAge) {
        this.eAge = eAge;
    }
    public String geteSex() {
        return eSex;
    }
    public void seteSex(String eSex) {
        this.eSex = eSex;
    }
    public String getdNumber() {
        return dNumber;
    }
    public void setdNumber(String dNumber) {
        this.dNumber = dNumber;
    }

}
