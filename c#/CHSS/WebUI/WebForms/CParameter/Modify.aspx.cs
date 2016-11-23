using System;
using System.Web.UI;
namespace CHSS.Web.CParameter
{
    public partial class Modify : Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            try         //--判断是否具有权限，若无权限回退到上一页
            {
                char[] AuthorityKey = Session["roleValue"].ToString().ToCharArray();
                if (AuthorityKey[33] == '0')
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
                    int PID = (Convert.ToInt32(Request.Params["id"]));
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

        public void btnSave_Click(object sender, EventArgs e)
        {

            int PID = int.Parse(this.txtPID.Text);
            string ParaName = this.txtParaName.Text;
            string ParaValue = this.txtParaValue.Text;
            string ParaMaxValue = this.txtParaMaxValue.Text;
            string ParaMiniValue = this.txtParaMiniValue.Text;
            string ParaUnit = this.txtParaUnit.Text;
            string ParaDescription = this.txtParaDescription.Text;


            CHSS.Model.CParameter model = new CHSS.Model.CParameter();
            model.PID = PID;
            model.ParaName = ParaName;
            model.ParaValue = ParaValue;
            model.ParaMaxValue = ParaMaxValue;
            model.ParaMiniValue = ParaMiniValue;
            model.ParaUnit = ParaUnit;
            model.ParaDescription = ParaDescription;

            CHSS.BLL.CParameter bll = new CHSS.BLL.CParameter();
            bll.Update(model);
            Response.Redirect("Show.aspx?id=" + PID);

        }

        public void btnCancle_Click(object sender, EventArgs e)
        {
            Response.Redirect("list.aspx");
        }
    }
}
