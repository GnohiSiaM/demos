package com.validation.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBHelper {

    public static String user = "root";
    public static String databasePwd = "455676770";
    public static String url = "jdbc:mysql://localhost:3306/formvalidation?useUnicode=true&characterEncoding=utf8";

    private Connection conn = null;
    private PreparedStatement statement = null;
    private ResultSet rs = null;

    /**
     * 通过DriverManager建立数据的链接
     * 将getConnection声明为私有，则外部直接使用executeXXX方法就能进行数据库操作
     * @return conn 表示数据库的链接
     */
    private Connection createConnection() {
        try {
            // 1.加载jdbc驱动类
            Class.forName("com.mysql.jdbc.Driver");
            // 2.获取连接
            conn = DriverManager.getConnection(url, user, databasePwd);
            return conn;
        } catch (ClassNotFoundException cnfe) {
            //JOptionPane.showMessageDialog(GUI_Calendar.GUI_Calendar,"Driver not find","ClassNotFoundException",JOptionPane.WARNING_MESSAGE);
            System.out.println("driver not find:" + cnfe);
            return null;
        } catch (SQLException sqle) {
            System.out.println("can't connetion db:" + sqle);
            return null;
        } catch (Exception e) {
            System.out.println("Failed to load JDBC/ODBC driver.");
            return null;
        }
    }

    /**
     * 封装PreparedStatement 中的executeUpdate方法 用于执行数据的增删改
     * @param sql SQL语句
     * @param values SQL语句中的参数
     * @return void
     */
    public  void executeUpdate(String sql, Object[] values) {
        try {
            createConnection();
            statement = conn.prepareStatement(sql);
            if (values != null && values.length > 0) {
                for (int i = 0;i < values.length; i++) {
                    statement.setObject(i + 1, values[i]);
                }
            }
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * 封装PreparedStatement 中的executeQuery方法 用于执行数据的查询
     * @param sql SQL语句
     * @param values SQL语句中的参数
     * @return ResultSet
     */
    public ResultSet executeQuery(String sql, Object[] values) {
        try {
            createConnection();
            statement = conn.prepareStatement(sql);
            if (values != null && values.length > 0) {
                for (int i =0; i < values.length; i++) {
                    statement.setObject(i+1,values[i]);
                }
            }
            rs = statement.executeQuery();
            return rs;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 关闭与数据相关的非托管资源,
     * 按照打开的逆序来逐层关闭
     */
    public void closeDB() {
      try{
        if (rs! = null) rs.close();
        if (statement != null) statement.close();
        if (conn != null) conn.close();
      } catch (Exception e) {
          e.printStackTrace();
      }
    }
}
