using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebUI.WebForms
{
    public partial class Logou : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
            //Session.Remove("userName");把单个session清除，
            //Session.Clear()就是把Session对象中的所有项目都删除了，
            //Session.Abandon()就是把当前Session对象删除了，下一次就是新的Session了。
        }
    }
}