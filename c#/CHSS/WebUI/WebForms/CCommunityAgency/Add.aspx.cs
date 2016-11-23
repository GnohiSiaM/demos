using System;
using System.Web.UI;
namespace CHSS.Web.CCommunityAgency
{
    public partial class Add : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try         //--判断是否具有权限，若无权限回退到上一页
            {
                char[] AuthorityKey = Session["roleValue"].ToString().ToCharArray();
                if (AuthorityKey[14] == '0')
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
            string CommDescription = this.txtCommDescription.Text;
            string CommAddDate = this.txtCommAddDate.Text;
            string CommName = this.txtCommName.Text;
            int UID = int.Parse(Session["UID"].ToString());

            CHSS.Model.CCommunityAgency model = new CHSS.Model.CCommunityAgency();
            model.CommDescription = CommDescription;
            model.CommAddDate = CommAddDate;
            model.CommName = CommName;
            model.UID = UID;

            CHSS.BLL.CCommunityAgency bll = new CHSS.BLL.CCommunityAgency();
            bll.Add(model);
            Response.Redirect("Show.aspx?id=" + (bll.GetMaxId() - 1));

        }


        public void btnCancle_Click(object sender, EventArgs e)
        {
            Response.Redirect("list.aspx");
        }
    }
}
