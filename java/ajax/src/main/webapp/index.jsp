<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">

    <title>AJAX demo</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="description" content="ajax demo">
    <style type="text/css">
        .box {
            border: 5px dashed rgba(0,0,0,0.32);
            border-radius: 23px;
            background: #F3F3F3;
            -webkit-box-shadow: 0 1px 5px rgba(0,0,0,0.75);
            -moz-box-shadow: 0 1px 5px rgba(0,0,0,0.75);
            box-shadow: 0 1px 5px rgba(0,0,0,0.75);
            padding: 60px;
            margin-left: auto;
            margin-right: auto;
            width: 270px;
            margin-top: 100px;
        }
        input {
            border-radius: 5px;
            border: 2px solid #14b9fb;
            line-height: 20px;
            padding: 6px;
        }
    </style>
  </head>

  <body>
    <div class="box">
        <span>Please input <strong>apple</strong></span><br/><br/>

        <input type="text" id="textValue" oninput="checkByResponseText()" placeholder = "responseText"/>
        <span id="textMessage"></span><br/><br/>

        <input type="text" id="xmlValue" oninput="checkByResponseXml()" placeholder = "responseXML"/>
        <span id="xmlMessage"></span><br/><br/>

        <input type="text" id="jsonValue" oninput="checkByJson()" placeholder = "JSON"/>
        <span id="jsonMessage"></span><br/>
    </div>

    <script type="text/javascript">
        //获取XMLHttpRequest对象方法(解决浏览器兼容性问题)
        function getXMLHttpObject() {
            // XMLHttpRequest() for IE7+, Firefox, Chrome, Opera, Safari
            // ActiveXObject("Microsoft.XMLHTTP") for IE6, IE5
            return window.XMLHttpRequest ? new XMLHttpRequest() : new ActiveXObject("Microsoft.XMLHTTP");
        }

        function checkByResponseText(){
            var XHRObject = getXMLHttpObject();
            if (XHRObject) {
                //使用get方式发出请求，如果提交的数据不变化，浏览器将不会真的发请求，而是缓存取数据
                //解决方法 :
                //1.url 后带一个总是变化的参数,比如当前时间
                //    var url="ResponseTextServlet?time=" + new Date() + "&username=" + username.value ;
                //2.在服务器回送结果时，禁用缓存.
                var url = "ResponseTextServlet?value=" + document.getElementById("textValue").value;
                XHRObject.open("get", url, true);
                XHRObject.send(null);

                //var url="ResponseTextServlet";
                //XHRObject.open("post",url,true);
                //如果需要像 HTML 表单那样 POST 数据，使用 setRequestHeader() 来添加 HTTP 头
                //XHRObject.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
                //XHRObject.send("userName="+username.value);

                XHRObject.onreadystatechange = function() {
                    if (XHRObject.readyState == 4 && XHRObject.status == 200) {
                        document.getElementById("textMessage").innerHTML = XHRObject.responseText;
                    }
                }
            }
        }

        function checkByResponseXml(){
            var XHRObject = getXMLHttpObject();
            if (XHRObject) {
                var url = "ResponseXMLServlet?value=" + document.getElementById("xmlValue").value;
                XHRObject.open("get", url, true);
                XHRObject.send(null);
                XHRObject.onreadystatechange = function() {
                    if (XHRObject.readyState == 4 && XHRObject.status == 200) {
                        var result = XHRObject.responseXML.getElementsByTagName("msg");
                        //(注意)取出XML中msg结点的值
                        document.getElementById("xmlMessage").innerHTML = result[0].childNodes[0].nodeValue;
                    }
                }
            }
        }

        function checkByJson(){
            var XHRObject = getXMLHttpObject();
            if (XHRObject) {
                var url = "JsonServlet?value=" + document.getElementById("jsonValue").value;
                XHRObject.open("get", url, true);
                XHRObject.send(null);
                XHRObject.onreadystatechange = function() {
                    if (XHRObject.readyState == 4 && XHRObject.status == 200){
                        //使用eval函数将XHRObject.responseText转化成对应的对象
                        var result = eval("(" + XHRObject.responseText + ")");
                        document.getElementById("jsonMessage").innerHTML = result.msg;
                    }
                }
            }
        }
    </script>
  </body>

</html>
