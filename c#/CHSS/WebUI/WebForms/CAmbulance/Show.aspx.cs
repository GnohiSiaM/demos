using System;
using System.Web.UI;
namespace CHSS.Web.CAmbulance
{
    public partial class Show : Page
    {
        public string strid = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            try         //--判断是否具有权限，若无权限回退到上一页
            {
                char[] AuthorityKey = Session["roleValue"].ToString().ToCharArray();
                if (AuthorityKey[12] == '0')
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
                    int AID = (Convert.ToInt32(strid));
                    ShowInfo(AID);
                }
            }
        }

        private void ShowInfo(int AID)
        {
            CHSS.BLL.CAmbulance bll = new CHSS.BLL.CAmbulance();
            CHSS.Model.CAmbulance model = bll.GetModel(AID);
            this.txtAID.Text = model.AID.ToString();
            this.txtAmbuDescription.Text = model.AmbuDescription;
            this.txtAmbuAddDate.Text = model.AmbuAddDate;
            this.txtAmbuNumber.Text = model.AmbuNumber;

        }

        protected void btnModify_Click(object sender, EventArgs e)
        {
            Response.Redirect("Modify.aspx?id=" + Request.Params["id"]);
        }

    }
}
