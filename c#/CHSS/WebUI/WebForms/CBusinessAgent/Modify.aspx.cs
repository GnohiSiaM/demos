using System;
using System.Web.UI;
namespace CHSS.Web.CBusinessAgent
{
    public partial class Modify : Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            try         //--判断是否具有权限，若无权限回退到上一页
            {
                char[] AuthorityKey = Session["roleValue"].ToString().ToCharArray();
                if (AuthorityKey[9] == '0')
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
                    int BID = (Convert.ToInt32(Request.Params["id"]));
                    ShowInfo(BID);
                }
            }
        }

        private void ShowInfo(int BID)
        {
            CHSS.BLL.CBusinessAgent bll = new CHSS.BLL.CBusinessAgent();
            CHSS.Model.CBusinessAgent model = bll.GetModel(BID);
            this.txtBID.Text = model.BID.ToString();
            this.txtBusiDescription.Text = model.BusiDescription;
            this.txtBusiAddDate.Text = model.BusiAddDate;
            this.txtBusiName.Text = model.BusiName;
            this.txtBusiPhone.Text = model.BusiPhone;

        }

        public void btnSave_Click(object sender, EventArgs e)
        {

            int BID = int.Parse(this.txtBID.Text);
            string BusiDescription = this.txtBusiDescription.Text;
            string BusiAddDate = this.txtBusiAddDate.Text;
            string BusiName = this.txtBusiName.Text;
            string BusiPhone = this.txtBusiPhone.Text;
            int UID = int.Parse(Session["UID"].ToString());


            CHSS.Model.CBusinessAgent model = new CHSS.Model.CBusinessAgent();
            model.BID = BID;
            model.BusiDescription = BusiDescription;
            model.BusiAddDate = BusiAddDate;
            model.BusiName = BusiName;
            model.BusiPhone = BusiPhone;
            model.UID = UID;

            CHSS.BLL.CBusinessAgent bll = new CHSS.BLL.CBusinessAgent();
            bll.Update(model);
            Response.Redirect("Show.aspx?id=" + BID);

        }


        public void btnCancle_Click(object sender, EventArgs e)
        {
            Response.Redirect("list.aspx");
        }
    }
}
