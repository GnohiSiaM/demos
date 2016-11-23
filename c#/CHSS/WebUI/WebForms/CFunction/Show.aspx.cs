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
                    int FID=(Convert.ToInt32(strid));
                    ShowInfo(FID);
                }
            }
        }

    private void ShowInfo(int FID)
    {
        CHSS.BLL.CFunction bll=new CHSS.BLL.CFunction();
        CHSS.Model.CFunction model=bll.GetModel(FID);
        this.lblFID.Text=model.FID.ToString();
        this.lblFuncName.Text=model.FuncName;
        this.lblFuncAbbr.Text=model.FuncAbbr;
        this.lblMID.Text=model.MID.ToString();

    }


    }
}
