<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>employeeEdit</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" type="text/css" href="css/button.css">
    <link rel="stylesheet" type="text/css" href="css/form.css">
    <script>
        function checkSex() {
            var obj = document.getElementById("sex");
            if ('${employee.eSex }'=='女' ) {
                obj.innerHTML='<option value="女">女 性</option><option value="男">男 性</option>';
            }
        }
    </script>

  </head>

  <body onLoad="checkSex()">
      <form action="EmpEditServlet" method="post">
        <center>
         <div class="wrapper">
            <div><span class="text">员工编号：</span><input class="mac" style="color:#BD7D7D" type="text" readonly name="eNumber" value="${employee.eNumber }"/></div>
            <div><span class="text">姓 名：</span><input class="mac" type="text" name="eName" value="${employee.eName }"/></div>
            <div><span class="text">岗 位：</span><input class="mac" type="text" name="ePosition" value="${employee.ePosition }"/></div>
            <div><span class="text">电话号码：</span><input class="mac" type="text" name="ePhoneNumber" value="${employee.ePhoneNumber }"/></div>
            <div><span class="text">工 资：</span><input class="mac" type="text" name="eSalary" value="${employee.eSalary }"/></div>
            <div><span class="text">年 龄：</span><input class="mac" type="text" name="eAge" value="${employee.eAge }"/></div>
            <div><span class="text">性 别：</span>
                <select id="sex" class="mac" name="eSex">
                    <option value="男">男 性</option>
                    <option value="女">女 性</option>
                </select>
            </div>
            <div>
                <span class="text">所属部门编号：</span>
                <input class="mac" type="text" style="color:#BD7D7D" readonly name="dNumber" value="${employee.dNumber }"/>
            </div>

            <button class="modern socle" style="margin-left:30px;" type="submit">确定</button>
            <button class="modern socle" onclick="history.go(-1)" type="button">返回</button>
         </div>
        </center>
      </form>
  </body>
</html>
