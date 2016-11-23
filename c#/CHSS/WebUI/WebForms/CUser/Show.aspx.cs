using System;
using System.Web.UI;
namespace CHSS.Web.CUser
{
    public partial class Show : Page
    {
        public string strid = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            try         //--判断是否具有权限，若无权限回退到上一页
            {
                char[] AuthorityKey = Session["roleValue"].ToString().ToCharArray();
                if (AuthorityKey[28] == '0')
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
                    int UID = (Convert.ToInt32(strid));
                    ShowInfo(UID);
                }
            }
        }

        private void ShowInfo(int UID)
        {
            CHSS.BLL.CUser bll = new CHSS.BLL.CUser();
            CHSS.Model.CUser model = bll.GetModel(UID);
            this.UID.Text = model.UID.ToString();
            this.RealName.Text = model.RealName;
            this.UserName.Text = model.UserName;
            this.Password.Text = model.Password + " (加密)";
            this.Gender.Text = model.Gender;
            this.BornDate.Text = model.BornDate;
            this.Phone.Text = model.Phone;
            this.Address.Text = model.Address;
            this.IDNumber.Text = model.IDNumber;
            this.RoleName.Text = bll.GetList("UID=" + UID.ToString()).Tables[0].Rows[0]["RoleName"].ToString();
        }

        protected void btnModify_Click(object sender, EventArgs e)
        {
            Response.Redirect("Modify.aspx?id=" + Request.Params["id"]);
        }
    }
}
