using System;
using System.Web.UI;
namespace CHSS.Web.CMedicalEquipment
{
    public partial class Add : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try         //--判断是否具有权限，若无权限回退到上一页
            {
                char[] AuthorityKey = Session["roleValue"].ToString().ToCharArray();
                if (AuthorityKey[22] == '0')
                {
                    Response.Write("<script>alert('无此权限');document.execCommand('stop');window.stop();window.history.back();</script>");
                }
            }
            catch
            {
                Response.Write("<script>alert('无此权限');document.execCommand('stop');window.stop();window.history.back();</script>");
            }          //--END

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {

            string MediDescription = this.txtMediDescription.Text;
            string MediAddDate = this.txtMediAddDate.Text;
            string MediName = this.txtMediName.Text;
            int UID = int.Parse(Session["UID"].ToString());

            CHSS.Model.CMedicalEquipment model = new CHSS.Model.CMedicalEquipment();
            model.MediDescription = MediDescription;
            model.MediAddDate = MediAddDate;
            model.MediName = MediName;
            model.UID = UID;

            CHSS.BLL.CMedicalEquipment bll = new CHSS.BLL.CMedicalEquipment();
            bll.Add(model);
            Response.Redirect("Show.aspx?id=" + (bll.GetMaxId() - 1));

        }


        public void btnCancle_Click(object sender, EventArgs e)
        {
            Response.Redirect("list.aspx");
        }
    }
}
