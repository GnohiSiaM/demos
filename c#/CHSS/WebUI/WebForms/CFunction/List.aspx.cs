using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;
namespace CHSS.Web.CFunction
{
    public partial class List : Page
    {

        CHSS.BLL.CFunction bll = new CHSS.BLL.CFunction();

        protected void Page_Load(object sender, EventArgs e)
        {
            try         //--判断是否具有权限，若无权限回退到上一页
            {
                char[] AuthorityKey = Session["roleValue"].ToString().ToCharArray();
                if (AuthorityKey[4] == '0')
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
                BindData();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindData();
        }


        public void BindData()
        {

            DataSet ds = new DataSet();
            StringBuilder strWhere = new StringBuilder();
            if (txtKeyword.Text.Trim() != "")
            {
                #warning 代码生成警告：请修改 keywordField 为需要匹配查询的真实字段名称
                //strWhere.AppendFormat("keywordField like '%{0}%'", txtKeyword.Text.Trim());
                strWhere.AppendFormat("FuncName like '%{0}%' or MID like '%{0}%' or FID like '%{0}%' or FuncAbbr like '%{0}%'", txtKeyword.Text.Trim());
            }
            ds = bll.GetList(strWhere.ToString());
            gridView.DataSource = ds;
            gridView.DataBind();
        }

        protected void gridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridView.PageIndex = e.NewPageIndex;
            BindData();
        }

    }
}
