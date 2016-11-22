package com.gnohisiam.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.gnohisiam.entity.Employee;
import com.gnohisiam.util.DBHelper;

public class EmployeeDAO {

    //查看本部门员工信息列表功能
    public List<Employee> getEmployeeList(String dNumber) {
        List<Employee> EInfo = new ArrayList<Employee>();
        String sql = "select eNumber,eName,ePosition,ePhoneNumber,eSalary from employee where dNumber = ? order by eNumber";
        Object[] values = new Object[1];
        values[0] = dNumber;
        DBHelper dbHelper = new DBHelper();

        ResultSet rs = dbHelper.executeQuery(sql,values);
        try {
            while( rs.next() ) {
                Employee temp = new Employee();
                temp.seteNumber(rs.getString("eNumber"));
                temp.seteName(rs.getString("eName"));
                temp.setePosition(rs.getString("ePosition"));
                temp.setePhoneNumber(rs.getString("ePhoneNumber"));
                temp.seteSalary(rs.getDouble("eSalary"));
                EInfo.add(temp);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        dbHelper.closeDB();
        return EInfo;
    }


    //查看所有员工信息列表功能  （重载上函数）
    public List<Employee> getEmployeeList() {
        List<Employee> EInfo = new ArrayList<Employee>();
        String sql = "select eNumber,eName,ePosition,ePhoneNumber,eSalary from employee order by eNumber";
        DBHelper dbHelper = new DBHelper();

        ResultSet rs = dbHelper.executeQuery(sql,null);
        try {
            while( rs.next() ) {
                Employee temp = new Employee();
                temp.seteNumber(rs.getString("eNumber"));
                temp.seteName(rs.getString("eName"));
                temp.setePosition(rs.getString("ePosition"));
                temp.setePhoneNumber(rs.getString("ePhoneNumber"));
                temp.seteSalary(rs.getDouble("eSalary"));
                EInfo.add(temp);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        dbHelper.closeDB();
        return EInfo;
    }


    //查看员工信息功能
    public Employee showEmployee(String eNumber) {
        Employee employee = new Employee();
        String sql = "select * from employee where eNumber=?";
        Object[] values = new Object[1];
        values[0] = eNumber;

        DBHelper dbHelper = new DBHelper();
        ResultSet rs = dbHelper.executeQuery(sql, values);
        try {
            if ( rs.next() ) {
                employee.seteNumber( eNumber );
                employee.seteName(rs.getString("eName"));
                employee.setePosition(rs.getString("ePosition"));
                employee.setePhoneNumber(rs.getString("ePhoneNumber"));
                employee.seteSalary(rs.getDouble("eSalary"));
                employee.seteAge(rs.getInt("eAge"));
                employee.seteSex(rs.getString("eSex"));
                employee.setdNumber(rs.getString("dNumber"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        dbHelper.closeDB();
        return employee;
    }

    //添加员工信息功能
    public void saveEmployee(Employee emp) {
        String sql = "insert into employee(eNumber,eName,ePosition,ePhoneNumber,eSalary,eAge,eSex,dNumber)values(?,?,?,?,?,?,?,?)";
        Object[] values = new Object[8];
        values[0] = emp.geteNumber();
        values[1] = emp.geteName();
        values[2] = emp.getePosition();
        values[3] = emp.getePhoneNumber();
        values[4] = emp.geteSalary();
        values[5] = emp.geteAge();
        values[6] = emp.geteSex();
        values[7] = emp.getdNumber();

        DBHelper dbHelper = new DBHelper();
        dbHelper.executeUpdate(sql, values);
        dbHelper.closeDB();
    }

    //删除员工信息功能
    public void deleteEmployee(String eNumber) {
        String sql = "delete from employee where eNumber=?";
        Object[] values = new Object[1];
        values[0] = eNumber;

        DBHelper dbHelper = new DBHelper();
        dbHelper.executeUpdate(sql, values);
        dbHelper.closeDB();
    }

    //修改员工信息功能
    public void updateEmployee(Employee emp) {
        String sql = "update employee set eName=?,ePosition=?,ePhoneNumber=?,eSalary=?,eAge=?,eSex=? where eNumber=?";
        Object[] values = new Object[7];
        values[0] = emp.geteName();
        values[1] = emp.getePosition();
        values[2] = emp.getePhoneNumber();
        values[3] = emp.geteSalary();
        values[4] = emp.geteAge();
        values[5] = emp.geteSex();
        values[6] = emp.geteNumber();

        DBHelper dbHelper = new DBHelper();
        dbHelper.executeUpdate(sql, values);
        dbHelper.closeDB();
    }

}
