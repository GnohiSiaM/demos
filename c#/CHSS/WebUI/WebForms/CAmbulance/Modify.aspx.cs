using System;
using System.Web.UI;
namespace CHSS.Web.CAmbulance
{
    public partial class Modify : Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            try         //--判断是否具有权限，若无权限回退到上一页
            {
                char[] AuthorityKey = Session["roleValue"].ToString().ToCharArray();
                if (AuthorityKey[13] == '0')
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
                    int AID = (Convert.ToInt32(Request.Params["id"]));
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

        public void btnSave_Click(object sender, EventArgs e)
        {

            int AID = int.Parse(this.txtAID.Text);
            string AmbuDescription = this.txtAmbuDescription.Text;
            string AmbuAddDate = this.txtAmbuAddDate.Text;
            string AmbuNumber = this.txtAmbuNumber.Text;
            int UID = int.Parse(Session["UID"].ToString());


            CHSS.Model.CAmbulance model = new CHSS.Model.CAmbulance();
            model.AID = AID;
            model.AmbuDescription = AmbuDescription;
            model.AmbuAddDate = AmbuAddDate;
            model.AmbuNumber = AmbuNumber;
            model.UID = UID;

            CHSS.BLL.CAmbulance bll = new CHSS.BLL.CAmbulance();
            bll.Update(model);
            Response.Redirect("Show.aspx?id=" + AID);

        }


        public void btnCancle_Click(object sender, EventArgs e)
        {
            Response.Redirect("list.aspx");
        }
    }
}
