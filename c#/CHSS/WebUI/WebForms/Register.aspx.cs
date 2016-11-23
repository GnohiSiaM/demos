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
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //这段代码是用给前台的ajax验证用户名是否已经存在返回验证结果的
            try
            {
                String strWhere = "UserName='" + this.Request.QueryString["userName"].ToString() + "'";
                DataSet ds = new CHSS.BLL.CUser().GetList(strWhere);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    this.Response.Write(1);
                    this.Response.End();        //不加Response.End()的话,返回的ResponseText会包含整个HTML文件的代码
                }
                else
                {
                    this.Response.Write(0);
                    this.Response.End();
                }
            }
            catch
            { 

            }
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            CHSS.Model.CUser model = new CHSS.Model.CUser();
            model.UserName = username.Text;
            model.Password = FormsAuthentication.HashPasswordForStoringInConfigFile(password.Text, "MD5");   //对密码进行MD5加密
            model.BornDate = birthday.Text;
            model.Phone = phonenumber.Text;
            model.Address = address.Text;
            model.IDNumber = idcard.Text;
            //-----
            model.AddDate = DateTime.Now.ToString();
            model.RealName = "某某";
            model.Gender = Request.Form["gender"].ToString();
            model.RID = 2008;

            CHSS.BLL.CUser bll = new CHSS.BLL.CUser();
            bll.Add(model);
            Response.Redirect("Login.aspx?userName=" + model.UserName + "&msg=恭喜注册成功，请登录！");
        }

    }
}