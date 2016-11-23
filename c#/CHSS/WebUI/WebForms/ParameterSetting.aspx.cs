using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace WebUI.WebForms
{
    public partial class ParameterSetting : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string md5Pass = FormsAuthentication.HashPasswordForStoringInConfigFile(TextBox1.Text,"MD5");   //对密码进行MD5加密
            Button1.Text = md5Pass;
        }
    }
}