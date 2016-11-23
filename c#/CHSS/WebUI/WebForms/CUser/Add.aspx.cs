using System;
using System.Web.UI;
using System.Web.Security;
namespace CHSS.Web.CUser
{
    public partial class Add : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try         //--判断是否具有权限，若无权限回退到上一页
            {
                char[] AuthorityKey = Session["roleValue"].ToString().ToCharArray();
                if (AuthorityKey[26] == '0')
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
            string RealName = this.txtRealName.Text;
            string UserName = this.txtUserName.Text;
            string Password = FormsAuthentication.HashPasswordForStoringInConfigFile(this.txtPassword.Text, "MD5");   //对密码进行MD5加密
            string Gender = Request.Form["gender"].ToString();
            string BornDate = this.txtBornDate.Text;
            string Phone = this.txtPhone.Text;
            string Address = this.txtAddress.Text;
            string IDNumber = this.txtIDNumber.Text;
            int RID = 2008; //int.Parse(this.txtRID.Text);
            string AddDate = DateTime.Now.ToString();

            CHSS.Model.CUser model = new CHSS.Model.CUser();
            model.RealName = RealName;
            model.UserName = UserName;
            model.Password = Password;
            model.Gender = Gender;
            model.BornDate = BornDate;
            model.Phone = Phone;
            model.Address = Address;
            model.IDNumber = IDNumber;
            model.RID = RID;
            model.AddDate = AddDate;

            CHSS.BLL.CUser bll = new CHSS.BLL.CUser();
            bll.Add(model);
            Response.Redirect("Show.aspx?id=" + (bll.GetMaxId() - 1));

        }


        public void btnCancle_Click(object sender, EventArgs e)
        {
            Response.Redirect("list.aspx");
        }
    }
}
