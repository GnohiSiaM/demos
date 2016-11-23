using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Security;

namespace WebUI
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected String msg = String.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userName"] != null)
            {
                Response.Redirect("Index.aspx");
            }
            else if ( !IsPostBack )
            {
                try
                {
                    userName.Text = this.Request.QueryString["userName"].ToString();
                    try
                    {
                        msg = this.Request.QueryString["msg"].ToString();
                    }
                    catch 
                    { 

                    }
                }
                catch 
                { 

                }
            }
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            
            //判断验证码,是否正确
            String vCode = Request.Form["verifyCode"].ToString();  //非runat=server控件可通过HttpContext.Current.Request.Form["控件名"]获取
            if (Request.Cookies.Get("CheckCode").Value != vCode.Trim())
            {
                msg = "验证码输入有误！";
            }
            else
            { 
                String uName = userName.Text;
                String pass = FormsAuthentication.HashPasswordForStoringInConfigFile(password.Text, "MD5");   //对密码进行MD5加密
                String strWhere = "UserName='" + uName + "'";
                DataSet ds = new CHSS.BLL.CUser().GetList(strWhere);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    if (ds.Tables[0].Rows[0]["Password"].Equals(pass))
                    {
                        Session["userName"] = uName;
                        Session["UID"] = ds.Tables[0].Rows[0]["UID"];
                        try
                        {
                            DataSet dsOfRole = new CHSS.BLL.CRole().GetList("RID='" + ds.Tables[0].Rows[0]["RID"] + "'");
                            Session["roleValue"] = dsOfRole.Tables[0].Rows[0]["RoleValue"];
                        }
                        catch
                        { 

                        }
                        Response.Redirect("Index.aspx");
                    }
                    else
                    {
                        userName.Text = uName;
                        msg = "密码错误，请区分字母大小写！";
                    }
                
                }
                else 
                {
                    userName.Text = "";
                    msg = "该用户名不存在，抢注去呗！";
                }
            }
            Page.DataBind();
        }
    }
}


//Request.Params["id"] Request.Form["id"] Request.QueryString["id"]的用法以及区别?

//Request.Params是所有post和get传过来的值的集合,

//Request.Form是取post传值, 

//Request.QueryString是get传过来的值


//①response.redirect 
//    这个跳转页面的方法跳转的速度不快，因为它要走2个来回(2次postback)，但他可以跳转到任何页面，
//    没有站点页面限制(即可以由雅虎跳到新浪)，同时不能跳过登录保护。但速度慢是其最大缺陷!
//    redirect跳转机制：首先是发送一个http请求到客户端，通知需要跳转到新页面，然后客户端在发送跳转请求到服务器端。
//    需要注意的是跳转后内部空间保存的所有数据信息将会丢失，所以需要用到session。 
//②sever.execute 
//    这个方法主要是用在页面设计上面，而且他必须是跳转同一站点下的页面。
//    这个方法是需要将一个页面的输出结果插入到另一个aspx页面的时候使用，
//    大部分是在表格中，将某一个页面类似于嵌套的方式存在于另一页面。 
//③server.transfer 
//    速度快，只需要一次postback ,但是…他必须是在同一个站点下，因为它是server的一个方法。
//    另外，他能跳过登录保护。你可以写个小程序试试：设计一个由页面一到页面二的跳转，
//    但要进入到页面二需要登录，form认证，但如果跳转语句使用transfer的话，那就不会弹出登录页面了。
//    这个方法的重定向请求是发生在服务器端，所以浏览器的url地址仍然保留的是原页面的地址! 
//    例如：   this.TextBox2.Text =Request ["TextBox1"].ToString (); 
//             Server.Transfer("WebForm2.aspx", true);//第二个参数为false时，WebForm2.aspx中不能获得TextBox1的内容 

//总结: 
//如果要捕获一个ASPX页面的输出结果，然后将结果插入另一个ASPX页面的特定位置，则使用Server.Execute。 
//·如果要确保HTML输出合法，请使用Response.Redirect，因为Server.Execute 或者Server.Transfer方法返回给客户端的页面包含多个<Html><body>标记，不是合法的HTML页面，在非IE浏览器中可能会发生错误。 
//1.Response.Redirect("http://www.baidu.com",false); 
//目标页面和原页面可以在2个服务器上，可输入网址或相对路径。后面的bool值为是否停止执行当前页。 
//跳转向新的页面，原窗口被代替。" 
//浏览器中的URL为新路径。 
//:Response.Redirect方法导致浏览器链接到一个指定的URL。当Response.Redirect()方法被调用时，它会创建一个应答，应答头中指出了 
//状态代码302（表示目标已经改变）以及新的目标URL。浏览器从服务器收到该应答，利用应答头中的信息发出一个对新URL的请求。这就是说， 
//使用Response.Redirect方法时重定向操作发生在客户端，总共涉及到两次与服务器的通信（两个来回）：第一次是对原始页面的请求, 
//得到一个302应答，第二次是请求302应答中声明的新页面，得到重定向之后的页面。 
//2.Server.Transfer("Default2.aspx?name=zhangsan",true); 
//目标页面和原页面可以在同一个服务器上。 
//跳转向新的页面，原窗口被代替。 
//波球论坛 浏览器中的URL为原路径不变。 
//默认情况下，Server.Transfer方法不会把表单数据或查询字符串从一个页面传递到另一个页面，但只要把该方法的第二个参数设置成 
//Tb310True，就可以保留第一个页面的表单数据和查询字符串。 
//同时，使用Server.Transfer时应注意一点：目标页面将使用原始页面创建的应答流，这导致ASP.NET的机器验证检查b310,,博球,博球网,行家心水,赛事推荐,赛事分析,资料库,足球赛事,篮球,NBA,赔率,比分,篮球数据,足球数据. 

//(Machine Authentication Check，MAC)认为新页面的ViewState已被篡改。因此，如果要保留原始页面的表单数据和查询字符串集合， 
//必须把目标页面Page指令的EnableViewStateMac属性设置成False。 
//3.Server.Execute("Default5.aspx?address=beijing); 
//目标页面和原页面可以在同一个服务器上。 
//跳转向新的页面，再跳转会原页面。 
//浏览器中的URL为原路径不变。 
//当指定的ASPX页面执行完毕，控制流程重新返回原页面发出Server.Execute调用的位置。 
//这种页面导航方式类似于针对ASPX页面的一次函数调用，被调用的页面能够访问发出调用页面的表单数据和查询字符串集合，所以要把 
//被调用页面Page指令的EnableViewStateMac属性设置成False。 
//4.Response.Write("<script language='javascript'>window.open('aaa.aspx');</script>");_ 
//目标页面和原页面可以在2个服务器上，可输入网址或相对路径。 
//原窗口保留，另外新增一个新页面。 
//5.Response.Write("<script language='javascript'>window.location='Default2.aspx'</script>"); 
//打开新的页面，原窗口被代替。 
//6.Response.Write("<script>window.showModalDialog('Default2.aspx')</script>"); 
//7.Response.Write("<script>window.showModelessDialog('Default2.aspx')</script>"); 