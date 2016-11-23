using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace CHSS.Web.CRole
{
    public partial class Modify : Page
    {
        char[] RValue;
        protected void Page_Load(object sender, EventArgs e)
        {
            try         //--判断是否具有权限，若无权限回退到上一页
            {
                char[] AuthorityKey = Session["roleValue"].ToString().ToCharArray();
                if (AuthorityKey[3] == '0')
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
                    int RID = (Convert.ToInt32(Request.Params["id"]));
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
            //int recordCount = new CHSS.BLL.CModule().GetRecordCount("");
            //for (int i = 0; i < recordCount; i++)
            //{
            //    CheckBoxList checkBoxItem = (CheckBoxList)(MainDiv.FindControl("CheckBoxList" + (i + 1).ToString()));
            //    for (int j = 0; j < checkBoxItem.Items.Count; j++)
            //    {
            //        checkBoxItem.Items[j].Selected = RValue[i * 4 + j] == '1' ? true : false;
            //        //if (RValue[i * 4 + j] == '1')
            //        //    checkBoxItem.Items[j].Selected = true;
            //        //else
            //        //    checkBoxItem.Items[j].Selected = false;
            //    }
            //}
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

        public void btnSave_Click(object sender, EventArgs e)
        {
            int recordCount = new CHSS.BLL.CModule().GetRecordCount("");
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

            int RID = int.Parse(this.txtRID.Text);
            string RoleNumber = this.txtRoleNumber.Text;
            string RoleName = this.txtRoleName.Text;
            string RoleValue = RValue;
            string RoleDescription = this.txtRoleDescription.Text;


            CHSS.Model.CRole model = new CHSS.Model.CRole();
            model.RID = RID;
            model.RoleNumber = RoleNumber;
            model.RoleName = RoleName;
            model.RoleValue = RoleValue;
            model.RoleDescription = RoleDescription;

            CHSS.BLL.CRole bll = new CHSS.BLL.CRole();
            bll.Update(model);
            Response.Redirect("Show.aspx?id=" + RID);
        }


        public void btnCancle_Click(object sender, EventArgs e)
        {
            Response.Redirect("list.aspx");
        }
    }
}
