package com.gnohisiam.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.gnohisiam.entity.Manager;
import com.gnohisiam.util.DBHelper;

public class ManagerDAO {

    //查看本部门经理信息功能
    public Manager getManager(String dNumber) {
        Manager MInfo = new Manager();
        String sql = "SELECT m.eNumber,eName,sName,dName,startTime FROM " +
                        "manager AS m INNER JOIN employee AS e ON m.eNumber = e.eNumber " +
                        "INNER JOIN department AS d ON d.dNumber = e.dNumber " +
                        "INNER JOIN supermarket AS s ON s.sNumber = d.sNumber WHERE d.dNumber = ? ";
        Object[] values = new Object[1];
        values[0] = dNumber;
        DBHelper dbHelper = new DBHelper();

        ResultSet rs = dbHelper.executeQuery(sql,values);
        try {
            if ( rs.next() ) {
                MInfo.seteNumber(rs.getString("eNumber"));
                MInfo.seteName(rs.getString("eName"));
                MInfo.setsName(rs.getString("sName"));
                MInfo.setdName(rs.getString("dName"));
                MInfo.setStartTime(rs.getString("startTime"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        dbHelper.closeDB();
        return MInfo;
    }


    //查看所有部门经理信息功能
    public List<Manager> getManagerList() {
        List<Manager> MInfo = new ArrayList<Manager>();
        String sql = "SELECT m.eNumber,eName,sName,dName,startTime FROM " +
                        "manager AS m INNER JOIN employee AS e ON m.eNumber = e.eNumber " +
                        "INNER JOIN department AS d ON d.dNumber = e.dNumber " +
                        "INNER JOIN supermarket AS s ON s.sNumber = d.sNumber " +
                        "order by s.sNumber";
        DBHelper dbHelper = new DBHelper();

        ResultSet rs = dbHelper.executeQuery(sql,null);
        try {
            while( rs.next() ) {
                Manager temp = new Manager();
                temp.seteNumber(rs.getString("eNumber"));
                temp.seteName(rs.getString("eName"));
                temp.setsName(rs.getString("sName"));
                temp.setdName(rs.getString("dName"));
                temp.setStartTime(rs.getString("startTime"));
                MInfo.add(temp);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        dbHelper.closeDB();
        return MInfo;
    }

    //取消部门经理职务功能
    public void deleteManager(String eNumber) {
        String sql = "delete from manager where eNumber = ? ";
        Object[] values = new Object[1];
        values[0] = eNumber;

        DBHelper dbHelper = new DBHelper();
        dbHelper.executeUpdate(sql, values);
        dbHelper.closeDB();
    }

    //设置部门经理功能
    public void saveManager(String startTime,String eNumber) {
        String sql = "insert into manager(startTime,eNumber)values(?,?)";
        Object[] values = new Object[2];
        values[0] = startTime;
        values[1] = eNumber;

        DBHelper dbHelper = new DBHelper();
        dbHelper.executeUpdate(sql, values);
        dbHelper.closeDB();
    }

}
