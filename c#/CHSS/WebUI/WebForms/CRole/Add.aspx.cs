using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebUI.WebForms.CRole;

namespace CHSS.Web.CRole
{
    public partial class Add : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try         //--判断是否具有权限，若无权限回退到上一页
            {
                char[] AuthorityKey = Session["roleValue"].ToString().ToCharArray();
                if (AuthorityKey[0] == '0')
                {
                    Response.Write("<script>alert('无此权限');document.execCommand('stop');window.stop();window.history.back();</script>");
                }
            }
            catch
            {
                Response.Write("<script>alert('无此权限');document.execCommand('stop');window.stop();window.history.back();</script>");
            }          //--END

            if (!IsPostBack)
            {
                DataSet ds = new CHSS.BLL.CModule().GetAllList();
                MyRepeater.DataSource = ds;
                MyRepeater.DataBind();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            char[] RValueArray = new Char[100];
            for (int i = 0; i < MyRepeater.Items.Count; i++)
            {
                CheckBoxList checkBoxItem = (CheckBoxList)(MyRepeater.Controls[i].FindControl("MyCheckBoxList"));
                for (int j = 0; j < checkBoxItem.Items.Count; j++)
                {
                    RValueArray[int.Parse(checkBoxItem.Items[j].Value)] = checkBoxItem.Items[j].Selected ? '1' : '0';
                    //RValue += checkBoxItem.Items[j].Selected ? 1 : 0;
                }
            }
            String RValue = new String(RValueArray);
            string RoleValue = RValue;
            string RoleNumber = this.txtRoleNumber.Text;
            string RoleName = this.txtRoleName.Text;
            string RoleDescription = this.txtRoleDescription.Text;

            CHSS.Model.CRole model = new CHSS.Model.CRole();
            model.RoleNumber = RoleNumber;
            model.RoleName = RoleName;
            model.RoleValue = RoleValue;
            model.RoleDescription = RoleDescription;

            CHSS.BLL.CRole bll = new CHSS.BLL.CRole();
            bll.Add(model);
            Response.Redirect("Show.aspx?id=" + (bll.GetMaxId() - 1));
        }


        public void btnCancle_Click(object sender, EventArgs e)
        {
            Response.Redirect("list.aspx");
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
            }
        }
    }
}
