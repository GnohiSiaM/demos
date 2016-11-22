/**
 * function:    原生JS表单验证
 * date:        2014-1-7
 * author:      GnohiSiaM
 */

//页面加载完自动调用
onload = validation;

var isNameNonexistent = true;
//可以使用onsubmit调用，也可以使用onload调用
function validation(blurOrSubmit) {
    var status = true;
    var name = document.getElementById("name");
    var password = document.getElementById("password");
    var repass = document.getElementById("repass");
    var email = document.getElementById("email");
    var phonenumber = document.getElementById("phonenumber");
    var url = document.getElementById("url");
    var idcard = document.getElementById("idcard");

    /***************检测是否同意 《使用协议》********************/
    var checkbox = document.getElementById("checkbox");
    var button = document.getElementById("submit");
    checkbox.onchange = isChecked;
    function isChecked() {
        if (checkbox.checked) {
            button.type = "submit";
            button.className = "enabled";
        } else {
            button.type = "button";
            button.className = "disabled";
        }
    }
    isChecked();
    /************************************************************/

//    check(name, "长度须为3-20位且无空格", blurOrSubmit, function(val) {
//        if (val.match(/^\S+$/) && val.length >= 3 && val.length <= 20) {
//            isNameExist();
//            return true;
//        } else {
//            status = false;
//            return false;
//        }
//    });

    //增强版用户名检测方法(使用AJAX检测用户名是否已被使用)
    checkName(name, "长度3-20位且无特殊字符", blurOrSubmit, function(val) {
        if (val.match(/^[A-Za-z0-9_\u4e00-\u9fa5]+$/) && val.length >= 3 && val.length <= 20) {
            return true;
        } else {
            status = false;
            return false;
        }
    });

//    check(password, "长度必须在6-30位之间", blurOrSubmit, function(val) {
//        if (val.match(/^\S+$/) && val.length >= 6 && val.length <= 30) {
//            return true;
//        } else {
//            status = false;
//            return false;
//        }
//    });

    //增强版密码检测方法(检测密码强度及失去焦点时会检测repass)
    checkPassword(password, "长度6-30位且无空格", blurOrSubmit, repass);

    check(repass, "请保持两次密码一致", blurOrSubmit, function(val) {
        if (val.match(/^\S+$/) && val.length >= 6 && val.length <= 30 && val == password.value) {
            return true;
        } else {
            status = false;
            return false;
        }
    });

    check(email, "请使用有效邮箱", blurOrSubmit, function(val) {
        if (val.match(/\w+((-w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+/)) {
            return true;
        } else {
            status = false;
            return false;
        }
    });

    check(phonenumber, "请输入11位手机号码", blurOrSubmit, function(val) {
        if (val.length == 11 && val.match( /^((\(\d{3}\))|(\d{3}\-))?13[0-9]\d{8}|15[0-9]\d{8}|18[0-9]\d{8}$/)) {
            return true;
        } else {
            status = false;
            return false;
        }
    });

    check(url, "请按示例输入且不能过长", blurOrSubmit, function(val) {
        if (val.length <= 100 && val.match( /[a-zA-z]+:\/\/[^\s]+/)) {
            return true;
        } else {
            status = false;
            return false;
        }
    });

    check(idcard, "请输入正确的身份证号", blurOrSubmit, function(val) {
        if (val.match( /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/)) {
            return true;
        } else {
            status = false;
            return false;
        }
    });

    //非必填项，不作额外提示，但获取焦点时改变式样
    var address = document.getElementById("address");
    var birthday = document.getElementById("birthday");
    bright(address);
    bright(birthday);

    return isNameNonexistent && status;
}//#end  validation();

//获取提示控件方法（这里是LABEL标签），可以通过此控件来给状态、提示信息等
function getTips(obj) {
    while(true) {
        if (obj.nextSibling.nodeName == "LABEL") {
            return obj.nextSibling;
        }
        obj = obj.nextSibling;
    }
}//#end  getTips();

//非必填项提示
function bright(obj) {
    var tips = getTips(obj);
    obj.onfocus = function() {
        tips.className = "tips status2";
    }
    obj.onblur = function() {
        tips.className = "tips status1";
    }
}

//通用检查方法，参数列表：
//obj: 被检查的对象
//info: 提示的信息
//func: 回调函数，用于检测输入值是否符合条件
//blurOrSubmit：只是一个状态，区分是单击提交还是失去焦点
function check(obj, info, blurOrSubmit, func) {
    var tips = getTips(obj);
    obj.onfocus = function() {        //当控件被选中时，显示提示状态(蓝色)和提示信息
        tips.className = "tips status2";
        tips.innerHTML = info;
    }
    obj.onblur = function() {        //当控件失去焦点时，检测输入内容的合法性
        if ( func(this.value) ) {        //合法时显示绿色
            tips.className = "tips status4";
            tips.innerHTML = "输入合法";
        } else {                        //不合法时显示红色
            tips.className = "tips status3";
            tips.innerHTML = obj.value == '' ? "该项不能为空" : info;
        }
    }
    if (blurOrSubmit == "Submit") {        //区分是单击提交还是失去焦点
        obj.onblur();
    }
}//#end  check();

//密码检测方法（增强版：失去焦点时会检测repass）
function checkPassword(obj, info, blurOrSubmit, repass) {
    var tips = getTips(obj);
    obj.onfocus = function() {
        tips.className = "tips status2";
        tips.innerHTML = info;
    }
    obj.onblur = function() {
        if ( obj.value == '') {
            tips.className = "tips status3";
            tips.innerHTML = "该项不能为空";
        } else if (!obj.value.match(/^\S+$/) || obj.value.length < 6 || obj.value.length > 30) {
            tips.className = "tips status3";
            tips.innerHTML = info;
        } else {
            passwordGrade(obj);
        }
        //当'确认密码'已填写，修改密码时检测'确认密码'是否与'密码'一致
        if (repass.value != '') {
            check(repass, "请保持两次密码一致", "Submit", function(val) {
                return val.match(/^\S+$/) && val.length >= 6 && val.length <= 30 && val == obj.value;
            });
        }
    }
    if (blurOrSubmit == "Submit") {
        obj.onblur();
    }
}//#end  checkPassword();

//密码强度检测方法（打分制）
//规则：分三类打分（基础分、加分、减分）；
//基础分：一个密码长度为一分，大于18个字符都为18分；密码里面包含一种可输入类型, 基础分加4分
//加分：一种密码可输入类型的总数量 >= 2，加分2分，如果总数量 >= 5，加分4分
//减分：每连续重复出现一次单个种类字符，减一分
//总分50分：0~10(弱)，11~20(一般)，21~30（中），31~40（强），41~50（安全）；
//分数范围及打分规则可以根据需要自由调整和搭配
function passwordGrade(obj) {
    var pwd = obj.value;
    var tips = getTips(obj);
    var score = 0;
    var regexArr = ['[0-9]', '[a-z]', '[A-Z]', '[\\W_]'];
    var repeatCount = 0;
    var prevChar = '';
    //check length
    var len = pwd.length;
    score += len > 18 ? 18 : len;
    //check type
    for(var i = 0, num = regexArr.length; i < num; i += 1) {
        if (eval('/'+regexArr[i]+'/').test(pwd)) {
            score += 4;
        }
    }
    //bonus point
    for(var i = 0, num = regexArr.length; i < num; i += 1) {
        if (pwd.match(eval('/'+regexArr[i]+'/g')) && pwd.match(eval('/'+regexArr[i]+'/g')).length >= 2) {
            score += 2;
        }
        if (pwd.match(eval('/'+regexArr[i]+'/g')) && pwd.match(eval('/'+regexArr[i]+'/g')).length >= 5){
            score += 2;
        }
    }
    //deduction
    for(var i = 0, num = pwd.length; i < num; i += 1) {
        if (pwd.charAt(i) == prevChar) {
            repeatCount += 1;
        } else {
            prevChar = pwd.charAt(i);
        }
    }
    score -= repeatCount * 1;
    //返回提示及状态
    if (!pwd.match(/^\S+$/) || pwd.length < 6 || pwd.length > 30) {
        tips.className = "tips status2";
        tips.innerHTML = "长度6-30位且无空格";
        return;
    }
    if (score <= 10) {
        tips.className = "tips status4I";
        tips.innerHTML = "密码强度：较弱";
        return;
    }
    if (score > 10 && score <= 20) {
        tips.className = "tips status4II";
        tips.innerHTML = "密码强度：一般";
        return;
    }
    if (score > 20 && score <= 30) {
        tips.className = "tips status4III";
        tips.innerHTML = "密码强度：中等";
        return;
    }
    if (score > 30 && score <= 40) {
        tips.className = "tips status4IV";
        tips.innerHTML = "密码强度：较强";
        return;
    }
    if (score > 40) {
        tips.className = "tips status4";
        tips.innerHTML = "密码强度：安全";
    }
}//#end  passwordGrade();

//--------学习AJAX-------(2014/03)---------
//获取XMLHttpRequest对象方法(解决浏览器兼容性问题)
function getXMLHttpObject() {
    // XMLHttpRequest(): for IE7+, Firefox, Chrome, Opera, Safari
    // ActiveXObject("Microsoft.XMLHTTP"): for IE6, IE5
    return window.XMLHttpRequest ? new XMLHttpRequest() : new ActiveXObject("Microsoft.XMLHTTP");
}//#end  getXMLHttpObject()

//验证用户名是否已存在方法
//function isNameExist() {
//    var name = document.getElementById("name");
//    var tips = getTips(name);
//
//    var XHRObject = getXMLHttpObject();
//    if (XHRObject) {        //XMLHttpRequest对象创建成功才执行后续代码
//        //第一个参数：请求的方式 GET/POST
//        //第二个参数：指定url，对哪个页面发出ajax请求（本质仍是http请求）
//        //第三个参数：true表示使用异步机制，false表示不使用异步机制
//        var url="RegisterServlet?name="+name.value ;
//        //打开请求
//        XHRObject.open("get", url, true);
//        //发送请求，如果是get请求send()内填null即可;如果是post请求，则填入实际的数据
//        XHRObject.send(null);
//        XHRObject.onreadystatechange = function() {
//            if (XHRObject.readyState == 4 && XHRObject.status == 200) {
//                if (XHRObject.responseText == 1) {
//                    isNameNonexistent = false;
//                    tips.className = 'status3';
//                    tips.innerHTML = '用户已存在, 请更名或直接<a href="login.jsp">登录</a>';
//                } else {
//                    isNameNonexistent = true;
//                }
//            }
//        }
//    }
//}//#end  isNameExist()      //AJAX会有延时和等待，但函数会立即返回一个值（true/false）


//用户名检测方法（增强版：检测用户名是否已被使用）
function checkName(obj, info, blurOrSubmit, func) {
    var tips = getTips(obj);
    var XHRObject = getXMLHttpObject();
    var url = "";
    var isNameAvailable = null;
    obj.onfocus = function() {
        tips.className = "tips status2";
        tips.innerHTML = info;
    }
    obj.onblur = function() {
        if (!XHRObject) {
            return;
        }

        tips.innerHTML = "用户名验证中...";
        isNameAvailable = func(obj.value);

        //url="CheckNameServlet?name="+obj.value ;
        //XHRObject.open("get", url, true);
        //XHRObject.setRequestHeader("If-Modified-Since", "0"); //解决IE下Ajax缓存问题
        //XHRObject.send();
        url="CheckNameServlet";
        XHRObject.open("post", url, true);
        XHRObject.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        XHRObject.send("name=" + obj.value );
        XHRObject.onreadystatechange = function() {
            if (XHRObject.readyState != 4 || XHRObject.status != 200) {
                return;
            }

            if (XHRObject.responseText == 1) {
                isNameNonexistent = false;
                tips.className = 'tips status3';
                tips.innerHTML = '用户已存在,请更名或直接<a href="login.jsp?name='+obj.value+'" style="color:#3587F0;text-decoration:none;">登录</a>';
                return;
            }

            isNameNonexistent = true;
            if ( isNameAvailable ) {
                tips.className = "tips status4";
                tips.innerHTML = "输入合法";
            } else {
                tips.className = "tips status3";
                tips.innerHTML = obj.value == '' ? "该项不能为空" : info;
            }
        }
    }
    if (blurOrSubmit == "Submit"){
        obj.onblur();
    }
}//#end  checkName();
