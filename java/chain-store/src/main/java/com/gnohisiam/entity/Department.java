/**
 * 部门实体
 */

package com.gnohisiam.entity;

public class Department {
    private Integer dId;
    private String dNumber;
    private String dName;
    private String dLocation;
    private String dPhoneNumber;
    private Integer mId;
    private String sNumber;

    public Integer getdId() {
        return dId;
    }
    public void setdId(Integer dId) {
        this.dId = dId;
    }
    public String getdNumber() {
        return dNumber;
    }
    public void setdNumber(String dNumber) {
        this.dNumber = dNumber;
    }
    public String getdName() {
        return dName;
    }
    public void setdName(String dName) {
        this.dName = dName;
    }
    public String getdLocation() {
        return dLocation;
    }
    public void setdLocation(String dLocation) {
        this.dLocation = dLocation;
    }
    public String getdPhoneNumber() {
        return dPhoneNumber;
    }
    public void setdPhoneNumber(String dPhoneNumber) {
        this.dPhoneNumber = dPhoneNumber;
    }
    public Integer getmId() {
        return mId;
    }
    public void setmId(Integer mId) {
        this.mId = mId;
    }
    public String getsNumber() {
        return sNumber;
    }
    public void setsNumber(String sNumber) {
        this.sNumber = sNumber;
    }
    @Override
    public String toString() {
        return "Department [dId=" + dId + ", dLocation=" + dLocation
                + ", dName=" + dName + ", dNumber=" + dNumber
                + ", dPhoneNumber=" + dPhoneNumber + ", mId=" + mId
                + ", sNumber=" + sNumber + "]";
    }

}
