using System;
using System.Web.UI;
namespace CHSS.Web.CExpert
{
    public partial class Add : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try         //--判断是否具有权限，若无权限回退到上一页
            {
                char[] AuthorityKey = Session["roleValue"].ToString().ToCharArray();
                if (AuthorityKey[18] == '0')
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

            string ExpeDescription = this.txtExpeDescription.Text;
            string ExpeAddDate = this.txtExpeAddDate.Text;
            string ExpeName = this.txtExpeName.Text;
            string ExpePhone = this.txtExpePhone.Text;
            string ExpePicURL = this.txtExpePicURL.Text;
            int UID = int.Parse(Session["UID"].ToString());

            CHSS.Model.CExpert model = new CHSS.Model.CExpert();
            model.ExpeDescription = ExpeDescription;
            model.ExpeAddDate = ExpeAddDate;
            model.ExpeName = ExpeName;
            model.ExpePhone = ExpePhone;
            model.ExpePicURL = ExpePicURL;
            model.UID = UID;

            CHSS.BLL.CExpert bll = new CHSS.BLL.CExpert();
            bll.Add(model);
            Response.Redirect("Show.aspx?id=" + (bll.GetMaxId() - 1));

        }


        public void btnCancle_Click(object sender, EventArgs e)
        {
            Response.Redirect("list.aspx");
        }

    }
}
