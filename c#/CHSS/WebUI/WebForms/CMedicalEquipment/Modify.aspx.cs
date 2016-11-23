using System;
using System.Web.UI;
namespace CHSS.Web.CMedicalEquipment
{
    public partial class Modify : Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try         //--判断是否具有权限，若无权限回退到上一页
                {
                    char[] AuthorityKey = Session["roleValue"].ToString().ToCharArray();
                    if (AuthorityKey[25] == '0')
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
                    int MID = (Convert.ToInt32(Request.Params["id"]));
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

        public void btnSave_Click(object sender, EventArgs e)
        {

            int MID = int.Parse(this.txtMID.Text);
            string MediDescription = this.txtMediDescription.Text;
            string MediAddDate = this.txtMediAddDate.Text;
            string MediName = this.txtMediName.Text;
            int UID = int.Parse(Session["UID"].ToString());


            CHSS.Model.CMedicalEquipment model = new CHSS.Model.CMedicalEquipment();
            model.MID = MID;
            model.MediDescription = MediDescription;
            model.MediAddDate = MediAddDate;
            model.MediName = MediName;
            model.UID = UID;

            CHSS.BLL.CMedicalEquipment bll = new CHSS.BLL.CMedicalEquipment();
            bll.Update(model);
            Response.Redirect("Show.aspx?id=" + MID);

        }


        public void btnCancle_Click(object sender, EventArgs e)
        {
            Response.Redirect("list.aspx");
        }
    }
}
