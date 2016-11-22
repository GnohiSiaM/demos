/**
 * 用户实体
 */

package com.gnohisiam.entity;

public class User {
    private Integer uId;
    private String uName;
    private String uPassword;
    private String eNumber;

    public Integer getuId() {
        return uId;
    }
    public void setuId(Integer uId) {
        this.uId = uId;
    }
    public String getuName() {
        return uName;
    }
    public void setuName(String uName) {
        this.uName = uName;
    }
    public String getuPassword() {
        return uPassword;
    }
    public void setuPassword(String uPassword) {
        this.uPassword = uPassword;
    }
    public String geteNumber() {
        return eNumber;
    }
    public void seteNumber(String eNumber) {
        this.eNumber = eNumber;
    }

}
