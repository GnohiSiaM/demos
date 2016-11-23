using System;
using System.Web.UI;
using System.Web.Security;
namespace CHSS.Web.CUser
{
    public partial class Modify : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try         //--判断是否具有权限，若无权限回退到上一页
            {
                char[] AuthorityKey = Session["roleValue"].ToString().ToCharArray();
                if (AuthorityKey[29] == '0')
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
                    int UID = (Convert.ToInt32(Request.Params["id"]));
                    ShowInfo(UID);
                }
            }
        }

        private void ShowInfo(int UID)
        {
            CHSS.BLL.CUser bll = new CHSS.BLL.CUser();
            CHSS.Model.CUser model = bll.GetModel(UID);
            this.UID.Text = model.UID.ToString();
            this.txtRealName.Text = model.RealName;
            this.txtUserName.Text = model.UserName;
            this.txtPassword.Text = model.Password + " (加密)";
            this.txtGender.Text = model.Gender;
            this.txtBornDate.Text = model.BornDate;
            this.txtPhone.Text = model.Phone;
            this.txtAddress.Text = model.Address;
            this.txtIDNumber.Text = model.IDNumber;
            //this.txtRID.Text = model.RID.ToString();
        }

        public void btnSave_Click(object sender, EventArgs e)
        {

            int UID = int.Parse(this.UID.Text);
            string RealName = this.txtRealName.Text;
            string UserName = this.txtUserName.Text;
            //string Password = this.txtPassword.Text;
            string BornDate = this.txtBornDate.Text;
            string Phone = this.txtPhone.Text;
            string Address = this.txtAddress.Text;
            string IDNumber = this.txtIDNumber.Text;
            //int RID = int.Parse(this.txtRID.Text);
            string Gender = String.Empty;
            try
            {
                Gender = Request.Form["gender"].ToString();
            }
            catch
            {
                Gender = this.txtGender.Text;
            }


            if (Request.Params["id"] != null && Request.Params["id"].Trim() != "")
            {
                int RequestUID = (Convert.ToInt32(Request.Params["id"]));
                CHSS.BLL.CUser bll = new CHSS.BLL.CUser();
                CHSS.Model.CUser model = bll.GetModel(RequestUID);

                model.UID = UID;
                model.RealName = RealName;
                model.UserName = UserName;
                //model.Password = Password;
                model.Gender = Gender;
                model.BornDate = BornDate;
                model.Phone = Phone;
                model.Address = Address;
                model.IDNumber = IDNumber;
                //model.RID = RID;

                bll.Update(model);
            }
            Response.Redirect("Show.aspx?id=" + UID);

        }


        public void btnCancle_Click(object sender, EventArgs e)
        {
            Response.Redirect("list.aspx");
        }
    }
}
