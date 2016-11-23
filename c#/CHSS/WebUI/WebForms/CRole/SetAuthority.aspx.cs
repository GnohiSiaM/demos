using System;
using System.Web.UI.WebControls;
using System.Data;

namespace WebUI.WebForms.CRole
{
    public partial class SetAuthority : System.Web.UI.Page
    {
        CHSS.BLL.CUser bll = new CHSS.BLL.CUser();
        CHSS.Model.CUser model;
        int UID = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            try         //--判断是否具有权限，若无权限回退到上一页
            {
                char[] AuthorityKey = Session["roleValue"].ToString().ToCharArray();
                if (AuthorityKey[50] == '0')
                {
                    Response.Write("<script>alert('无此权限');document.execCommand('stop');window.stop();window.history.back();</script>");
                }
            }
            catch
            {
                Response.Write("<script>alert('无此权限');document.execCommand('stop');window.stop();window.history.back();</script>");
            }           //--END


            if (Request.Params["id"] != null && Request.Params["id"].Trim() != "")
            {
                UID = (Convert.ToInt32(Request.Params["id"]));
                model = bll.GetModel(UID);
                lblUserName.Text = model.RealName;
            }

            if (!IsPostBack)
            {
                ShowRole();
            }
        }

        private void ShowRole()
        {
            DataSet ds = new CHSS.BLL.CRole().GetAllList();
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                ListItem li = new ListItem();
                li.Text = " " + ds.Tables[0].Rows[i]["Rolename"].ToString();
                li.Value = ds.Tables[0].Rows[i]["RID"].ToString();
                MyRadioButtonList.Items.Add(li);
            }
        }


        public void btnSave_Click(object sender, EventArgs e)
        {
            foreach (ListItem li in MyRadioButtonList.Items)
            {
                if (li.Selected)
                {
                    model = bll.GetModel(UID);
                    model.RID = Convert.ToInt32(li.Value);

                    bll.Update(model);
                    Response.Redirect("UserList.aspx?txtKeyword=" + model.UserName);
                }
            }

        }

        public void btnCancle_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserList.aspx");
        }
    }
}