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
namespace CHSS.Web.CCommunityAgency
{
    public partial class Modify : Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.Params["id"] != null && Request.Params["id"].Trim() != "")
                {
                    int CID = (Convert.ToInt32(Request.Params["id"]));
                    ShowInfo(CID);
                }
            }
        }

        private void ShowInfo(int CID)
        {
            CHSS.BLL.CCommunityAgency bll = new CHSS.BLL.CCommunityAgency();
            CHSS.Model.CCommunityAgency model = bll.GetModel(CID);
            this.txtCID.Text = model.CID.ToString();
            this.txtCommDescription.Text = model.CommDescription;
            this.txtCommAddDate.Text = model.CommAddDate;
            this.txtCommName.Text = model.CommName;

        }

        public void btnSave_Click(object sender, EventArgs e)
        {

            int CID = int.Parse(this.txtCID.Text);
            string CommDescription = this.txtCommDescription.Text;
            string CommAddDate = this.txtCommAddDate.Text;
            string CommName = this.txtCommName.Text;
            int UID = int.Parse(Session["UID"].ToString());


            CHSS.Model.CCommunityAgency model = new CHSS.Model.CCommunityAgency();
            model.CID = CID;
            model.CommDescription = CommDescription;
            model.CommAddDate = CommAddDate;
            model.CommName = CommName;
            model.UID = UID;

            CHSS.BLL.CCommunityAgency bll = new CHSS.BLL.CCommunityAgency();
            bll.Update(model);
            Response.Redirect("Show.aspx?id=" + CID);

        }


        public void btnCancle_Click(object sender, EventArgs e)
        {
            Response.Redirect("list.aspx");
        }
    }
}
