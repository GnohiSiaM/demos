using System;
using System.Web.UI;
namespace CHSS.Web.CBusinessAgent
{
    public partial class Show : Page
    {
        public string strid = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            try         //--判断是否具有权限，若无权限回退到上一页
            {
                char[] AuthorityKey = Session["roleValue"].ToString().ToCharArray();
                if (AuthorityKey[8] == '0')
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
                    int BID = (Convert.ToInt32(strid));
                    ShowInfo(BID);
                }
            }
        }

        private void ShowInfo(int BID)
        {
            CHSS.BLL.CBusinessAgent bll = new CHSS.BLL.CBusinessAgent();
            CHSS.Model.CBusinessAgent model = bll.GetModel(BID);
            this.txtBID.Text = model.BID.ToString();
            this.txtBusiDescription.Text = model.BusiDescription;
            this.txtBusiAddDate.Text = model.BusiAddDate;
            this.txtBusiName.Text = model.BusiName;
            this.txtBusiPhone.Text = model.BusiPhone;

        }

        protected void btnModify_Click(object sender, EventArgs e)
        {
            Response.Redirect("Modify.aspx?id=" + Request.Params["id"]);
        }
    }
}
