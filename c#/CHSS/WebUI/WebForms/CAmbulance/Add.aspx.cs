using System;
using System.Web.UI;
namespace CHSS.Web.CAmbulance
{
    public partial class Add : Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            try         //--判断是否具有权限，若无权限回退到上一页
            {
                char[] AuthorityKey = Session["roleValue"].ToString().ToCharArray();
                if (AuthorityKey[10] == '0')
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
            string AmbuDescription = this.txtAmbuDescription.Text;
            string AmbuAddDate = this.txtAmbuAddDate.Text;
            string AmbuNumber = this.txtAmbuNumber.Text;
            int UID = int.Parse(Session["UID"].ToString());

            CHSS.Model.CAmbulance model = new CHSS.Model.CAmbulance();
            model.AmbuDescription = AmbuDescription;
            model.AmbuAddDate = AmbuAddDate;
            model.AmbuNumber = AmbuNumber;
            model.UID = UID;

            CHSS.BLL.CAmbulance bll = new CHSS.BLL.CAmbulance();
            bll.Add(model);
            Response.Redirect("Show.aspx?id=" + (bll.GetMaxId() - 1));
        }


        public void btnCancle_Click(object sender, EventArgs e)
        {
            Response.Redirect("list.aspx");
        }
    }
}
