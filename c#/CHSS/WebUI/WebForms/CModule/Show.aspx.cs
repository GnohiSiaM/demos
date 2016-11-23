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
    public partial class Show : Page
    {
                public string strid="";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.Params["id"] != null && Request.Params["id"].Trim() != "")
                {
                    strid = Request.Params["id"];
                    int MID=(Convert.ToInt32(strid));
                    ShowInfo(MID);
                }
            }
        }

    private void ShowInfo(int MID)
    {
        CHSS.BLL.CModule bll=new CHSS.BLL.CModule();
        CHSS.Model.CModule model=bll.GetModel(MID);
        this.lblMID.Text=model.MID.ToString();
        this.lblModuName.Text=model.ModuName;
        this.lblModuNumber.Text=model.ModuNumber.ToString();

    }


    }
}
