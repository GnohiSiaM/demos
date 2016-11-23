using System;
using System.Web.UI;
namespace CHSS.Web.CExpert
{
    public partial class Modify : Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            try         //--判断是否具有权限，若无权限回退到上一页
            {
                char[] AuthorityKey = Session["roleValue"].ToString().ToCharArray();
                if (AuthorityKey[21] == '0')
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
                    int EID = (Convert.ToInt32(Request.Params["id"]));
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
            this.txtExpePicURL.Text = model.ExpePicURL;

        }

        public void btnSave_Click(object sender, EventArgs e)
        {

            int EID = int.Parse(this.txtEID.Text);
            string ExpeDescription = this.txtExpeDescription.Text;
            string ExpeAddDate = this.txtExpeAddDate.Text;
            string ExpeName = this.txtExpeName.Text;
            string ExpePhone = this.txtExpePhone.Text;
            string ExpePicURL = this.txtExpePicURL.Text;
            int UID = int.Parse(Session["UID"].ToString());


            CHSS.Model.CExpert model = new CHSS.Model.CExpert();
            model.EID = EID;
            model.ExpeDescription = ExpeDescription;
            model.ExpeAddDate = ExpeAddDate;
            model.ExpeName = ExpeName;
            model.ExpePhone = ExpePhone;
            model.ExpePicURL = ExpePicURL;
            model.UID = UID;

            CHSS.BLL.CExpert bll = new CHSS.BLL.CExpert();
            bll.Update(model);
            Response.Redirect("Show.aspx?id=" + EID);

        }


        public void btnCancle_Click(object sender, EventArgs e)
        {
            Response.Redirect("list.aspx");
        }
    }
}
