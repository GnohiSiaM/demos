using System;
using System.Web.UI;
namespace CHSS.Web.CParameter
{
    public partial class Add : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try         //--判断是否具有权限，若无权限回退到上一页
            {
                char[] AuthorityKey = Session["roleValue"].ToString().ToCharArray();
                if (AuthorityKey[30] == '0')
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

            string ParaName = this.txtParaName.Text;
            string ParaValue = this.txtParaValue.Text;
            string ParaMaxValue = this.txtParaMaxValue.Text;
            string ParaMiniValue = this.txtParaMiniValue.Text;
            string ParaUnit = this.txtParaUnit.Text;
            string ParaDescription = this.txtParaDescription.Text;

            CHSS.Model.CParameter model = new CHSS.Model.CParameter();
            model.ParaName = ParaName;
            model.ParaValue = ParaValue;
            model.ParaMaxValue = ParaMaxValue;
            model.ParaMiniValue = ParaMiniValue;
            model.ParaUnit = ParaUnit;
            model.ParaDescription = ParaDescription;

            CHSS.BLL.CParameter bll = new CHSS.BLL.CParameter();
            bll.Add(model);
            Response.Redirect("Show.aspx?id=" + (bll.GetMaxId() - 1));

        }


        public void btnCancle_Click(object sender, EventArgs e)
        {
            Response.Redirect("list.aspx");
        }
    }
}
