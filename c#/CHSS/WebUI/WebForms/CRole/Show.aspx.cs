using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace CHSS.Web.CRole
{
    public partial class Show : Page
    {
        public string strid = "";
        char[] RValue;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try         //--判断是否具有权限，若无权限回退到上一页
                {
                    char[] AuthorityKey = Session["roleValue"].ToString().ToCharArray();
                    if (AuthorityKey[2] == '0')
                    {
                        Response.Write("<script>alert('无此权限');document.execCommand('stop');window.stop();window.history.back();</script>");
                    }
                }
                catch
                {
                    Response.Write("<script>alert('无此权限');document.execCommand('stop');window.stop();window.history.back();</script>");
                }          //--END

                if (Request.Params["id"] != null && Request.Params["id"].Trim() != "")
                {
                    strid = Request.Params["id"];
                    int RID = (Convert.ToInt32(strid));
                    ShowInfo(RID);
                }
            }
        }

        private void ShowInfo(int RID)
        {
            CHSS.BLL.CRole bll = new CHSS.BLL.CRole();
            CHSS.Model.CRole model = bll.GetModel(RID);
            this.txtRID.Text = model.RID.ToString();
            this.txtRoleNumber.Text = model.RoleNumber;
            this.txtRoleName.Text = model.RoleName;
            this.txtRoleDescription.Text = model.RoleDescription;

            RValue = model.RoleValue.ToCharArray();
            DataSet ds = new CHSS.BLL.CModule().GetAllList();
            MyRepeater.DataSource = ds;
            MyRepeater.DataBind();
        }

        protected void Repeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            DataRowView drv = (DataRowView)e.Item.DataItem;
            DataSet ds = new CHSS.BLL.CFunction().GetList("MID=" + drv.Row["MID"].ToString());
            CheckBoxList MyCheckBoxList = (CheckBoxList)e.Item.FindControl("MyCheckBoxList");
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                ListItem li = new ListItem();
                li.Text = ds.Tables[0].Rows[i]["FuncName"].ToString();
                li.Value = ds.Tables[0].Rows[i]["FID"].ToString();
                MyCheckBoxList.Items.Add(li);
                MyCheckBoxList.Items[i].Selected = RValue[int.Parse(li.Value)] == '1' ? true : false;
            }
        }

        protected void btnModify_Click(object sender, EventArgs e)
        {
            Response.Redirect("Modify.aspx?id=" + Request.Params["id"]);
        }


    }
}
