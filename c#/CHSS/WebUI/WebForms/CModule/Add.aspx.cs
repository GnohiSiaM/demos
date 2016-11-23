using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Text;
namespace CHSS.Web.CModule
{
    public partial class Add : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

                protected void btnSave_Click(object sender, EventArgs e)
        {

            string strErr="";
            if(this.txtModuName.Text.Trim().Length==0)
            {
                strErr+="ModuName不能为空！\\n";
            }
            //if(!PageValidate.IsNumber(txtModuNumber.Text))
            //{
            //    strErr+="ModuNumber格式错误！\\n";
            //}

            //if(strErr!="")
            //{
            //    MessageBox.Show(this,strErr);
            //    return;
            //}
            string ModuName=this.txtModuName.Text;
            int ModuNumber=int.Parse(this.txtModuNumber.Text);

            CHSS.Model.CModule model=new CHSS.Model.CModule();
            model.ModuName=ModuName;
            model.ModuNumber=ModuNumber;

            CHSS.BLL.CModule bll=new CHSS.BLL.CModule();
            bll.Add(model);
            //Maticsoft.Common.MessageBox.ShowAndRedirect(this,"保存成功！","add.aspx");

        }


        public void btnCancle_Click(object sender, EventArgs e)
        {
            Response.Redirect("list.aspx");
        }
    }
}
