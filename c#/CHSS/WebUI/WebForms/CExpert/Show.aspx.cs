using System;
using System.Web.UI;
namespace CHSS.Web.CExpert
{
    public partial class Show : Page
    {
        public string strid = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            try         //--判断是否具有权限，若无权限回退到上一页
            {
                char[] AuthorityKey = Session["roleValue"].ToString().ToCharArray();
                if (AuthorityKey[20] == '0')
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
                    int EID = (Convert.ToInt32(strid));
                    ShowInfo(EID);
                }
            }
        }

        private void ShowInfo(int EID)
        {
            CHSS.BLL.CExpert bll = new CHSS.BLL.CExpert();
            CHSS.Model.CExpert model = bll.GetModel(EID);
            this.txtEID.Text = model.EID.ToString();
            this.txtExpeDescription.Text = model.ExpeDescription;
            this.txtExpeAddDate.Text = model.ExpeAddDate;
            this.txtExpeName.Text = model.ExpeName;
            this.txtExpePhone.Text = model.ExpePhone;
            this.Image.ImageUrl = model.ExpePicURL;
        }

        protected void btnModify_Click(object sender, EventArgs e)
        {
            Response.Redirect("Modify.aspx?id=" + Request.Params["id"]);
        }

    }
}
