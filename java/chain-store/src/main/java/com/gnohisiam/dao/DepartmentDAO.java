package com.gnohisiam.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.gnohisiam.entity.Department;
import com.gnohisiam.util.DBHelper;

public class DepartmentDAO {

    //查看该商场部门信息列表功能
    public List<Department> getDepartmentList(String sNumber) {
        List<Department> DInfo = new ArrayList<Department>();
        String sql = "select dNumber,dName,dLocation,dPhoneNumber from department where sNumber = ? order by dNumber";
        Object[] values = new Object[1];
        values[0] = sNumber;

        DBHelper dbHelper = new DBHelper();

        try {
            ResultSet rs = dbHelper.executeQuery(sql,values);
            while( rs.next() ) {
                Department temp = new Department();
                temp.setdNumber(rs.getString("dNumber"));
                temp.setdName(rs.getString("dName"));
                temp.setdLocation(rs.getString("dLocation"));
                temp.setdPhoneNumber(rs.getString("dPhoneNumber"));
                DInfo.add(temp);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        dbHelper.closeDB();
        return DInfo;
    }

    //查看所有部门信息列表功能  （重载上函数）
    public List<Department> getDepartmentList() {
        List<Department> DInfo = new ArrayList<Department>();
        String sql = "select dNumber,dName,dLocation,dPhoneNumber from department order by dNumber";
        DBHelper dbHelper = new DBHelper();
        try {
            ResultSet rs = dbHelper.executeQuery(sql,null);
            while( rs.next() ) {
                Department temp = new Department();
                temp.setdNumber(rs.getString("dNumber"));
                temp.setdName(rs.getString("dName"));
                temp.setdLocation(rs.getString("dLocation"));
                temp.setdPhoneNumber(rs.getString("dPhoneNumber"));
                DInfo.add(temp);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        dbHelper.closeDB();
        return DInfo;
    }

    //查看部门信息功能
    public Department showDepartment(String dNumber) {
        Department department = new Department();
        String sql = "select * from department where dNumber=?";
        Object[] values = new Object[1];
        values[0] = dNumber;

        DBHelper dbHelper = new DBHelper();
        ResultSet rs = dbHelper.executeQuery(sql, values);

        try {
            if ( rs.next() ) {
                department.setdNumber(dNumber);
                department.setdName(rs.getString("dName"));
                department.setdLocation(rs.getString("dLocation"));
                department.setdPhoneNumber(rs.getString("dPhoneNumber"));
//                department.setmId(rs.getInt("mId"));
                department.setsNumber(rs.getString("sNumber"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        dbHelper.closeDB();
        return department;
    }

    //添加部门信息功能
    public void saveDepartment(Department dep) {
        String sql = "insert into department(dNumber,dName,dLocation,dPhoneNumber,sNumber)values(?,?,?,?,?)";
        Object[] values = new Object[5];
        values[0] = dep.getdNumber();
        values[1] = dep.getdName();
        values[2] = dep.getdLocation();
        values[3] = dep.getdPhoneNumber();
        values[4] = dep.getsNumber();

        DBHelper dbHelper = new DBHelper();
        dbHelper.executeUpdate(sql, values);
        dbHelper.closeDB();
    }

    //删除部门信息功能
    public void deleteDepartment(String dNumber) {
        String sql = "delete from department where dNumber=?";
        Object[] values = new Object[1];
        values[0] = dNumber;

        DBHelper dbHelper = new DBHelper();
        dbHelper.executeUpdate(sql, values);
        dbHelper.closeDB();
    }

    //修改部门信息功能
    public void updateDepartment(Department dep) {
        String sql = "update department set dName=?,dLocation=?,dPhoneNumber=?,sNumber=? where dNumber=?";
        Object[] values = new Object[5];
        values[0] = dep.getdName();
        values[1] = dep.getdLocation();
        values[2] = dep.getdPhoneNumber();
        values[3] = dep.getsNumber();
        values[4] = dep.getdNumber();

        DBHelper dbHelper = new DBHelper();
        dbHelper.executeUpdate(sql, values);
        dbHelper.closeDB();
    }

}
