package com.gnohisiam.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.gnohisiam.util.DBHelper;

public class LoginDAO {
    public boolean login(String user,String pwd) {
        String sql = "select * from user where uName = ? and uPassword = ?";
        Object[] values = new Object[2];
        values[0] = user;
        values[1] = pwd;

        DBHelper dbHelper = new DBHelper();
        try {
            ResultSet rs = dbHelper.executeQuery(sql, values);
            boolean isLogin = false;
            //如果从数据库中匹配到相应用户，且大小写一致则返回 true,否则返回 false
            if ( rs.next() && rs.getString("uName").equals(user) && rs.getString("uPassword").equals(pwd)) {
                isLogin = true;
            } else {
                isLogin = false;
            }
            dbHelper.closeDB();
            return isLogin;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
