<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>managerSave</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" type="text/css" href="css/button.css">
    <link rel="stylesheet" type="text/css" href="css/form.css">
    <script>
        function getXMLHttpObject() {    //(ajax)获取XMLHttpRequest对象方法(解决浏览器兼容性问题)
            var xmlhttp;
            if (window.XMLHttpRequest) {        // code for IE7+, Firefox, Chrome, Opera, Safari
                xmlhttp=new XMLHttpRequest();
            }
            else{                            // code for IE6, IE5
                xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
            }
            return xmlhttp;
        }

        function $(Id) {        //一个简化获取控件的函数
            return document.getElementById(Id);
        }

        function makeDefaultOption(obj) {    //将select控件初始化
            obj.length = 0;
            var option = document.createElement("option");
            option.innerHTML = "请选择";
            option.value = "default";
            obj.appendChild(option);
        }

        function showDepartment() {        //通过商场获取部门
            var XMLHttpRequestObj = getXMLHttpObject();
            if (XMLHttpRequestObj) {
                var url = "ManSaveServlet?sNumber="+$("sup").value;
                XMLHttpRequestObj.open("get",url,true);
                XMLHttpRequestObj.send();
                XMLHttpRequestObj.onreadystatechange =function() {
                    if (XMLHttpRequestObj.readyState == 4 && XMLHttpRequestObj.status == 200) {
                        var jsonObj = eval("("+XMLHttpRequestObj.responseText+")");
                        makeDefaultOption( $("dep") );
                        makeDefaultOption( $("emp") );
                        for(var i=0;i<jsonObj.length;i++) {
                            var option = document.createElement("option");
                            option.value = jsonObj[i].dNumber;
                            option.innerHTML = jsonObj[i].dName;
                            $("dep").appendChild(option);
                        }
                    }
                }
            }
        }

        function showEmployee() {        //通过部门获取员工
            var XMLHttpRequestObj = getXMLHttpObject();
            if (XMLHttpRequestObj) {
                var url = "ManSaveServlet?dNumber="+$("dep").value;
                XMLHttpRequestObj.open("get",url,true);
                XMLHttpRequestObj.send();
                XMLHttpRequestObj.onreadystatechange =function() {
                    if (XMLHttpRequestObj.readyState == 4 && XMLHttpRequestObj.status == 200) {
                        var jsonObj = eval("("+XMLHttpRequestObj.responseText+")");
                        makeDefaultOption( $("emp") );
                        for(var i=0;i<jsonObj.length;i++) {
                            var option = document.createElement("option");
                            option.value = jsonObj[i].eNumber;
                            option.innerHTML = jsonObj[i].eName;
                            $("emp").appendChild(option);
                        }
                    }
                }
            }
        }

    </script>
  </head>

  <body>
      <form action="ManSaveServlet" method="post">
        <center>
         <div class="wrapper" style="margin-top:180px">
            <div  style="color:#929292; font-size:28;">-=请选择部门经理=-</div><br/>
            <div><span class="text">商 场：</span>
                <select class="mac" name="sup" id="sup" onchange="showDepartment()">
                    <option value="default">请选择</option>
                    <c:forEach items="${supList}" var="SList">
                            <option value="${SList.sNumber }">${SList.sName }</option>
                    </c:forEach>
                </select>
            </div>
            <div><span class="text">部 门：</span>
                <select class="mac" name="dep" id="dep" onchange="showEmployee()">
                    <option value="default">请选择</option>
                </select>
            </div>
            <div><span class="text">员 工：</span>
                <select class="mac" name="emp" id="emp" >
                    <option value="default">请选择</option>
                </select>
            </div>

            <button class="modern socle" style="margin-left:30px;" type="submit">确定</button>
            <button class="modern socle" onclick="history.go(-1)" type="button">返回</button>
         </div>
        </center>
      </form>
  </body>
</html>
