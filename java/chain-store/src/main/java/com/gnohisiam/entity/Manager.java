/**
 * 部门经理实体
 */

package com.gnohisiam.entity;

public class Manager {
    private Integer mId;
    private String startTime;
    private String eNumber;
    private String eName;
    private String dName;
    private String sName;

    public Integer getmId() {
        return mId;
    }
    public void setmId(Integer mId) {
        this.mId = mId;
    }
    public String getStartTime() {
        return startTime;
    }
    public void setStartTime(String startTime) {
        this.startTime = startTime;
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
    public String getdName() {
        return dName;
    }
    public void setdName(String dName) {
        this.dName = dName;
    }
    public String getsName() {
        return sName;
    }
    public void setsName(String sName) {
        this.sName = sName;
    }

}
