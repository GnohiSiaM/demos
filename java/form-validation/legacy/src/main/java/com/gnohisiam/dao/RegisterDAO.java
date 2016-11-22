package com.gnohisiam.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.gnohisiam.model.User;
import com.gnohisiam.util.DBHelper;

public class RegisterDAO {

    //响应AJAX的请求，判断用户名是否已存在于数据库
    public boolean isNameExist(String name) {
        String sql = "select * from user where name = ?";
        Object[] values = new Object[1];
        values[0] = name;

        DBHelper dbHelper = new DBHelper();
        try {
            ResultSet rs = dbHelper.executeQuery(sql, values);
            //如果从数据库中匹配到相应用户，且大小写一致则返回 true,否则返回 false
            boolean isExist = rs.next() && rs.getString("name").equals(name);
            dbHelper.closeDB();
            return isExist;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    //注册新用户
    public void saveUser(User user) {
        String sql = "insert into user(name,password,email,phoneNumber,homePage,IDcard,address,birthday,age,gender)values(?,?,?,?,?,?,?,?,?,?)";
        Object[] values = new Object[10];
        values[0] = user.getName();
        values[1] = user.getPassword();
        values[2] = user.getEmail();
        values[3] = user.getPhoneNumber();
        values[4] = user.getHomePage();
        values[5] = user.getIDcard();
        values[6] = user.getAddress();
        values[7] = user.getBirthday();
        values[8] = user.getAge();
        values[9] = user.getGender();

        DBHelper dbHelper = new DBHelper();
        dbHelper.executeUpdate(sql, values);
        dbHelper.closeDB();
    }

}
