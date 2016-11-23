using System;
using System.Web.UI;
namespace CHSS.Web.CParameter
{
    public partial class Show : Page
    {
        public string strid = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            try         //--判断是否具有权限，若无权限回退到上一页
            {
                char[] AuthorityKey = Session["roleValue"].ToString().ToCharArray();
                if (AuthorityKey[32] == '0')
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
                    int PID = (Convert.ToInt32(strid));
                    ShowInfo(PID);
                }
            }
        }

        private void ShowInfo(int PID)
        {
            CHSS.BLL.CParameter bll = new CHSS.BLL.CParameter();
            CHSS.Model.CParameter model = bll.GetModel(PID);
            this.txtPID.Text = model.PID.ToString();
            this.txtParaName.Text = model.ParaName;
            this.txtParaValue.Text = model.ParaValue;
            this.txtParaMaxValue.Text = model.ParaMaxValue;
            this.txtParaMiniValue.Text = model.ParaMiniValue;
            this.txtParaUnit.Text = model.ParaUnit;
            this.txtParaDescription.Text = model.ParaDescription;

        }

        protected void btnModify_Click(object sender, EventArgs e)
        {
            Response.Redirect("Modify.aspx?id=" + Request.Params["id"]);
        }

    }
}
