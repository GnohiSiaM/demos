package com.gnohisiam.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.gnohisiam.entity.Supermarket;
import com.gnohisiam.util.DBHelper;

public class SupermarketDAO {

    //查看全部商场信息列表功能
    public List<Supermarket> getSupermarketList() {
        List<Supermarket> SInfo = new ArrayList<Supermarket>();
        String sql = "select sNumber,sName,sAddress,sPhoneNumber from supermarket order by sNumber";
        DBHelper dbHelper = new DBHelper();

        try {
            ResultSet rs = dbHelper.executeQuery(sql,null);
            while( rs.next() ) {
                Supermarket temp = new Supermarket();
                temp.setsNumber(rs.getString("sNumber"));
                temp.setsName(rs.getString("sName"));
                temp.setsAddress(rs.getString("sAddress"));
                temp.setsPhoneNumber(rs.getString("sPhoneNumber"));
                SInfo.add(temp);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        dbHelper.closeDB();
        return SInfo;
    }

    //查看商场信息功能
    public Supermarket showSupermarket(String sNumber) {
        Supermarket supermarket = new Supermarket();
        String sql = "select * from supermarket where sNumber=?";
        Object[] values = new Object[1];
        values[0] = sNumber;

        DBHelper dbHelper = new DBHelper();
        ResultSet rs = dbHelper.executeQuery(sql, values);

        try {
            if ( rs.next() ) {
                supermarket.setsNumber(sNumber);
                supermarket.setsName(rs.getString("sName"));
                supermarket.setsAddress(rs.getString("sAddress"));
                supermarket.setsPhoneNumber(rs.getString("sPhoneNumber"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        dbHelper.closeDB();
        return supermarket;
    }

    //添加商场信息功能
    public void saveSupermarket(Supermarket sup) {
        String sql = "insert into supermarket(sNumber,sName,sAddress,sPhoneNumber)values(?,?,?,?)";
        Object[] values = new Object[4];
        values[0] = sup.getsNumber();
        values[1] = sup.getsName();
        values[2] = sup.getsAddress();
        values[3] = sup.getsPhoneNumber();

        DBHelper dbHelper = new DBHelper();
        dbHelper.executeUpdate(sql, values);
        dbHelper.closeDB();
    }

    //删除商场信息功能
    public void deleteSupermarket(String sNumber) {
        String sql = "delete from supermarket where sNumber=?";
        Object[] values = new Object[1];
        values[0] = sNumber;

        DBHelper dbHelper = new DBHelper();
        dbHelper.executeUpdate(sql, values);
        dbHelper.closeDB();
    }

    //修改商场信息功能
    public void updateSupermarket(Supermarket sup) {
        String sql = "update supermarket set sName=?,sAddress=?,sPhoneNumber=? where sNumber=?";
        Object[] values = new Object[4];
        values[0] = sup.getsName();
        values[1] = sup.getsAddress();
        values[2] = sup.getsPhoneNumber();
        values[3] = sup.getsNumber();

        DBHelper dbHelper = new DBHelper();
        dbHelper.executeUpdate(sql, values);
        dbHelper.closeDB();
    }
}
