using System;
using System.Web.UI;
namespace CHSS.Web.CBusinessAgent
{
    public partial class Add : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try         //--判断是否具有权限，若无权限回退到上一页
            {
                char[] AuthorityKey = Session["roleValue"].ToString().ToCharArray();
                if (AuthorityKey[6] == '0')
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
            string BusiDescription = this.txtBusiDescription.Text;
            string BusiAddDate = this.txtBusiAddDate.Text;
            string BusiName = this.txtBusiName.Text;
            string BusiPhone = this.txtBusiPhone.Text;
            int UID = int.Parse(Session["UID"].ToString());

            CHSS.Model.CBusinessAgent model = new CHSS.Model.CBusinessAgent();
            model.BusiDescription = BusiDescription;
            model.BusiAddDate = BusiAddDate;
            model.BusiName = BusiName;
            model.BusiPhone = BusiPhone;
            model.UID = UID;

            CHSS.BLL.CBusinessAgent bll = new CHSS.BLL.CBusinessAgent();
            bll.Add(model);
            Response.Redirect("Show.aspx?id=" + (bll.GetMaxId() - 1));

        }


        public void btnCancle_Click(object sender, EventArgs e)
        {
            Response.Redirect("list.aspx");
        }
    }
}
