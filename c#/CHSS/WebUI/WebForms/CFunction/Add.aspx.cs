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
namespace CHSS.Web.CFunction
{
    public partial class Add : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

                protected void btnSave_Click(object sender, EventArgs e)
        {

            string strErr="";
            if(this.txtFuncName.Text.Trim().Length==0)
            {
                strErr+="FuncName不能为空！\\n";
            }
            if(this.txtFuncAbbr.Text.Trim().Length==0)
            {
                strErr+="FuncAbbr不能为空！\\n";
            }
            //if(!PageValidate.IsNumber(txtMID.Text))
            //{
            //    strErr+="MID格式错误！\\n";
            //}

            //if(strErr!="")
            //{
            //    MessageBox.Show(this,strErr);
            //    return;
            //}
            string FuncName=this.txtFuncName.Text;
            string FuncAbbr=this.txtFuncAbbr.Text;
            int MID=int.Parse(this.txtMID.Text);

            CHSS.Model.CFunction model=new CHSS.Model.CFunction();
            model.FuncName=FuncName;
            model.FuncAbbr=FuncAbbr;
            model.MID=MID;

            CHSS.BLL.CFunction bll=new CHSS.BLL.CFunction();
            bll.Add(model);
            //Maticsoft.Common.MessageBox.ShowAndRedirect(this,"保存成功！","add.aspx");

        }


        public void btnCancle_Click(object sender, EventArgs e)
        {
            Response.Redirect("list.aspx");
        }
    }
}
