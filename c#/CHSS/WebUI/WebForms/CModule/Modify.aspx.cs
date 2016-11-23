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
    public partial class Modify : Page
    {

                protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.Params["id"] != null && Request.Params["id"].Trim() != "")
                {
                    int MID=(Convert.ToInt32(Request.Params["id"]));
                    ShowInfo(MID);
                }
            }
        }

    private void ShowInfo(int MID)
    {
        CHSS.BLL.CModule bll=new CHSS.BLL.CModule();
        CHSS.Model.CModule model=bll.GetModel(MID);
        this.lblMID.Text=model.MID.ToString();
        this.txtModuName.Text=model.ModuName;
        this.txtModuNumber.Text=model.ModuNumber.ToString();

    }

        public void btnSave_Click(object sender, EventArgs e)
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
            int MID=int.Parse(this.lblMID.Text);
            string ModuName=this.txtModuName.Text;
            int ModuNumber=int.Parse(this.txtModuNumber.Text);


            CHSS.Model.CModule model=new CHSS.Model.CModule();
            model.MID=MID;
            model.ModuName=ModuName;
            model.ModuNumber=ModuNumber;

            CHSS.BLL.CModule bll=new CHSS.BLL.CModule();
            bll.Update(model);
            //Maticsoft.Common.MessageBox.ShowAndRedirect(this,"保存成功！","list.aspx");

        }


        public void btnCancle_Click(object sender, EventArgs e)
        {
            Response.Redirect("list.aspx");
        }
    }
}
