/**
 * 连锁商场实体
 */

package com.gnohisiam.entity;

public class Supermarket {
    private Integer sId;
    private String sNumber;
    private String sName;
    private String sAddress;
    private String sPhoneNumber;

    public Integer getsId() {
        return sId;
    }
    public void setsId(Integer sId) {
        this.sId = sId;
    }
    public String getsNumber() {
        return sNumber;
    }
    public void setsNumber(String sNumber) {
        this.sNumber = sNumber;
    }
    public String getsName() {
        return sName;
    }
    public void setsName(String sName) {
        this.sName = sName;
    }
    public String getsAddress() {
        return sAddress;
    }
    public void setsAddress(String sAddress) {
        this.sAddress = sAddress;
    }
    public String getsPhoneNumber() {
        return sPhoneNumber;
    }
    public void setsPhoneNumber(String sPhoneNumber) {
        this.sPhoneNumber = sPhoneNumber;
    }

}
