using System;
using System.Web.UI;
namespace CHSS.Web.CCommunityAgency
{
    public partial class Show : Page
    {
        public string strid = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            try         //--判断是否具有权限，若无权限回退到上一页
            {
                char[] AuthorityKey = Session["roleValue"].ToString().ToCharArray();
                if (AuthorityKey[16] == '0')
                {
                    Response.Write("<script>alert('无此权限');document.execCommand('stop');window.stop();window.history.back();</script>");
                }
            }
            catch
            {
                Response.Write("<script>alert('无此权限');document.execCommand('stop');window.stop();window.history.back();</script>");
            }          //--END


            if (!Page.IsPostBack)
            {
                if (Request.Params["id"] != null && Request.Params["id"].Trim() != "")
                {
                    strid = Request.Params["id"];
                    int CID = (Convert.ToInt32(strid));
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

        protected void btnModify_Click(object sender, EventArgs e)
        {
            Response.Redirect("Modify.aspx?id=" + Request.Params["id"]);
        }

    }
}
