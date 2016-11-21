package com.validation.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.validation.util.CipherUtil;
import com.validation.util.DBHelper;

public class LoginDAO {

    // public boolean login(String userName, String password) {
    //     String sql = "select * from dbusers where userName = ? and password = ?";
    //     Object[] values = new Object[2];
    //     values[0] = userName;
    //     values[1] = password;

    //     DBHelper dbHelper = new DBHelper();
    //     try {
    //         ResultSet rs = dbHelper.executeQuery(sql, values);
    //         //如果从数据库中匹配到相应用户，且大小写一致则返回 true,否则返回 false
    //         boolean isLogin = rs.next() && rs.getString("userName").equals(userName)
    //                 && rs.getString("password").equals(password);
    //         dbHelper.closeDB();
    //         return isLogin;
    //     } catch (SQLException e) {
    //         e.printStackTrace();
    //     }
    //     return false;
    // }

    //改进版：增强用户体验（告诉用户是账号不存在或是密码错误）
    public Integer login(String userName,String password){
        String sql = "select * from dbusers where userName = ?";
        Object[] values = new Object[1];
        values[0] = userName;
        DBHelper dbHelper = new DBHelper();
        try {
            ResultSet rs = dbHelper.executeQuery(sql, values);
            Integer result = 0;
            if (rs.next() && rs.getString("userName").equals(userName)) {
                //从数据库中匹配到相应用户，若密码一致则返回  1 ,否则返回  2
                //从数据库取得的密码经过加密，要借助CipherUtil类来验证密码的正确性
                result = CipherUtil.validatePassword(rs.getString("password"), password) ? 1 : 2;
            } else {
                result = 0;
            }
            dbHelper.closeDB();
            return result;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

}
