using System;
using System.Web.UI;
namespace CHSS.Web.CMedicalEquipment
{
    public partial class Show : Page
    {
        public string strid = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try         //--判断是否具有权限，若无权限回退到上一页
                {
                    char[] AuthorityKey = Session["roleValue"].ToString().ToCharArray();
                    if (AuthorityKey[24] == '0')
                    {
                        Response.Write("<script>alert('无此权限');document.execCommand('stop');window.stop();window.history.back();</script>");
                    }
                }
                catch
                {
                    Response.Write("<script>alert('无此权限');document.execCommand('stop');window.stop();window.history.back();</script>");
                }          //--END

                if (Request.Params["id"] != null && Request.Params["id"].Trim() != "")
                {
                    strid = Request.Params["id"];
                    int MID = (Convert.ToInt32(strid));
                    ShowInfo(MID);
                }
            }
        }

        private void ShowInfo(int MID)
        {
            CHSS.BLL.CMedicalEquipment bll = new CHSS.BLL.CMedicalEquipment();
            CHSS.Model.CMedicalEquipment model = bll.GetModel(MID);
            this.txtMID.Text = model.MID.ToString();
            this.txtMediDescription.Text = model.MediDescription;
            this.txtMediAddDate.Text = model.MediAddDate;
            this.txtMediName.Text = model.MediName;
        }

        protected void btnModify_Click(object sender, EventArgs e)
        {
            Response.Redirect("Modify.aspx?id=" + Request.Params["id"]);
        }

    }
}
