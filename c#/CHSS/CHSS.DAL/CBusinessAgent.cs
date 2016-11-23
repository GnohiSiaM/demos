using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using CHSS.Utility;//Please add references
namespace CHSS.DAL
{
    /// <summary>
    /// 数据访问类:CBusinessAgent
    /// </summary>
    public partial class CBusinessAgent
    {
        public CBusinessAgent()
        {}
        #region  BasicMethod

        /// <summary>
        /// 得到最大ID
        /// </summary>
        public int GetMaxId()
        {
        return DBHelper.GetMaxID("BID", "CBusinessAgent");
        }

        /// <summary>
        /// 是否存在该记录
        /// </summary>
        public bool Exists(int BID)
        {
            StringBuilder strSql=new StringBuilder();
            strSql.Append("select count(1) from CBusinessAgent");
            strSql.Append(" where BID=@BID");
            SqlParameter[] parameters = {
                    new SqlParameter("@BID", SqlDbType.Int,4)
            };
            parameters[0].Value = BID;

            return DBHelper.Exists(strSql.ToString(),parameters);
        }


        /// <summary>
        /// 增加一条数据
        /// </summary>
        public int Add(CHSS.Model.CBusinessAgent model)
        {
            StringBuilder strSql=new StringBuilder();
            strSql.Append("insert into CBusinessAgent(");
            strSql.Append("BusiDescription,BusiAddDate,BusiName,BusiPhone,UID)");
            strSql.Append(" values (");
            strSql.Append("@BusiDescription,@BusiAddDate,@BusiName,@BusiPhone,@UID)");
            strSql.Append(";select @@IDENTITY");
            SqlParameter[] parameters = {
                    new SqlParameter("@BusiDescription", SqlDbType.NVarChar,200),
                    new SqlParameter("@BusiAddDate", SqlDbType.NVarChar,20),
                    new SqlParameter("@BusiName", SqlDbType.NVarChar,20),
                    new SqlParameter("@BusiPhone", SqlDbType.NChar,11),
                    new SqlParameter("@UID", SqlDbType.Int,4)};
            parameters[0].Value = model.BusiDescription;
            parameters[1].Value = model.BusiAddDate;
            parameters[2].Value = model.BusiName;
            parameters[3].Value = model.BusiPhone;
            parameters[4].Value = model.UID;

            object obj = DBHelper.GetSingle(strSql.ToString(),parameters);
            if (obj == null)
            {
                return 0;
            }
            else
            {
                return Convert.ToInt32(obj);
            }
        }
        /// <summary>
        /// 更新一条数据
        /// </summary>
        public bool Update(CHSS.Model.CBusinessAgent model)
        {
            StringBuilder strSql=new StringBuilder();
            strSql.Append("update CBusinessAgent set ");
            strSql.Append("BusiDescription=@BusiDescription,");
            strSql.Append("BusiAddDate=@BusiAddDate,");
            strSql.Append("BusiName=@BusiName,");
            strSql.Append("BusiPhone=@BusiPhone,");
            strSql.Append("UID=@UID");
            strSql.Append(" where BID=@BID");
            SqlParameter[] parameters = {
                    new SqlParameter("@BusiDescription", SqlDbType.NVarChar,200),
                    new SqlParameter("@BusiAddDate", SqlDbType.NVarChar,20),
                    new SqlParameter("@BusiName", SqlDbType.NVarChar,20),
                    new SqlParameter("@BusiPhone", SqlDbType.NChar,11),
                    new SqlParameter("@UID", SqlDbType.Int,4),
                    new SqlParameter("@BID", SqlDbType.Int,4)};
            parameters[0].Value = model.BusiDescription;
            parameters[1].Value = model.BusiAddDate;
            parameters[2].Value = model.BusiName;
            parameters[3].Value = model.BusiPhone;
            parameters[4].Value = model.UID;
            parameters[5].Value = model.BID;

            int rows=DBHelper.ExecuteSql(strSql.ToString(),parameters);
            if (rows > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// 删除一条数据
        /// </summary>
        public bool Delete(int BID)
        {

            StringBuilder strSql=new StringBuilder();
            strSql.Append("delete from CBusinessAgent ");
            strSql.Append(" where BID=@BID");
            SqlParameter[] parameters = {
                    new SqlParameter("@BID", SqlDbType.Int,4)
            };
            parameters[0].Value = BID;

            int rows=DBHelper.ExecuteSql(strSql.ToString(),parameters);
            if (rows > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        /// <summary>
        /// 批量删除数据
        /// </summary>
        public bool DeleteList(string BIDlist )
        {
            StringBuilder strSql=new StringBuilder();
            strSql.Append("delete from CBusinessAgent ");
            strSql.Append(" where BID in ("+BIDlist + ")  ");
            int rows=DBHelper.ExecuteSql(strSql.ToString());
            if (rows > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }


        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        public CHSS.Model.CBusinessAgent GetModel(int BID)
        {

            StringBuilder strSql=new StringBuilder();
            strSql.Append("select  top 1 BID,BusiDescription,BusiAddDate,BusiName,BusiPhone,UID from CBusinessAgent ");
            strSql.Append(" where BID=@BID");
            SqlParameter[] parameters = {
                    new SqlParameter("@BID", SqlDbType.Int,4)
            };
            parameters[0].Value = BID;

            CHSS.Model.CBusinessAgent model=new CHSS.Model.CBusinessAgent();
            DataSet ds=DBHelper.Query(strSql.ToString(),parameters);
            if(ds.Tables[0].Rows.Count>0)
            {
                return DataRowToModel(ds.Tables[0].Rows[0]);
            }
            else
            {
                return null;
            }
        }


        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        public CHSS.Model.CBusinessAgent DataRowToModel(DataRow row)
        {
            CHSS.Model.CBusinessAgent model=new CHSS.Model.CBusinessAgent();
            if (row != null)
            {
                if(row["BID"]!=null && row["BID"].ToString()!="")
                {
                    model.BID=int.Parse(row["BID"].ToString());
                }
                if(row["BusiDescription"]!=null)
                {
                    model.BusiDescription=row["BusiDescription"].ToString();
                }
                if(row["BusiAddDate"]!=null)
                {
                    model.BusiAddDate=row["BusiAddDate"].ToString();
                }
                if(row["BusiName"]!=null)
                {
                    model.BusiName=row["BusiName"].ToString();
                }
                if(row["BusiPhone"]!=null)
                {
                    model.BusiPhone=row["BusiPhone"].ToString();
                }
                if(row["UID"]!=null && row["UID"].ToString()!="")
                {
                    model.UID=int.Parse(row["UID"].ToString());
                }
            }
            return model;
        }

        /// <summary>
        /// 获得数据列表
        /// </summary>
        //public DataSet GetList(string strWhere)
        //{
        //    StringBuilder strSql = new StringBuilder();
        //    strSql.Append("select BID,BusiDescription,BusiAddDate,BusiName,BusiPhone,UID ");
        //    strSql.Append(" FROM CBusinessAgent ");
        //    if (strWhere.Trim() != "")
        //    {
        //        strSql.Append(" where " + strWhere);
        //    }
        //    return DBHelper.Query(strSql.ToString());
        //}
        public DataSet GetList(string strWhere)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select BID,BusiDescription,BusiAddDate,BusiName,BusiPhone,a.UID,RealName ");
            strSql.Append(" FROM CBusinessAgent as a,CUser as b ");
            if (strWhere.Trim() != "")
            {
                strSql.Append(" where a.UID=b.UID AND ( " + strWhere + " )");
            }
            else
            {
                strSql.Append(" where a.UID=b.UID ");
            }
            return DBHelper.Query(strSql.ToString());
        }

        /// <summary>
        /// 获得前几行数据
        /// </summary>
        public DataSet GetList(int Top,string strWhere,string filedOrder)
        {
            StringBuilder strSql=new StringBuilder();
            strSql.Append("select ");
            if(Top>0)
            {
                strSql.Append(" top "+Top.ToString());
            }
            strSql.Append(" BID,BusiDescription,BusiAddDate,BusiName,BusiPhone,UID ");
            strSql.Append(" FROM CBusinessAgent ");
            if(strWhere.Trim()!="")
            {
                strSql.Append(" where "+strWhere);
            }
            strSql.Append(" order by " + filedOrder);
            return DBHelper.Query(strSql.ToString());
        }

        /// <summary>
        /// 获取记录总数
        /// </summary>
        public int GetRecordCount(string strWhere)
        {
            StringBuilder strSql=new StringBuilder();
            strSql.Append("select count(1) FROM CBusinessAgent ");
            if(strWhere.Trim()!="")
            {
                strSql.Append(" where "+strWhere);
            }
            object obj = DBHelper.GetSingle(strSql.ToString());
            if (obj == null)
            {
                return 0;
            }
            else
            {
                return Convert.ToInt32(obj);
            }
        }
        /// <summary>
        /// 分页获取数据列表
        /// </summary>
        public DataSet GetListByPage(string strWhere, string orderby, int startIndex, int endIndex)
        {
            StringBuilder strSql=new StringBuilder();
            strSql.Append("SELECT * FROM ( ");
            strSql.Append(" SELECT ROW_NUMBER() OVER (");
            if (!string.IsNullOrEmpty(orderby.Trim()))
            {
                strSql.Append("order by T." + orderby );
            }
            else
            {
                strSql.Append("order by T.BID desc");
            }
            strSql.Append(")AS Row, T.*  from CBusinessAgent T ");
            if (!string.IsNullOrEmpty(strWhere.Trim()))
            {
                strSql.Append(" WHERE " + strWhere);
            }
            strSql.Append(" ) TT");
            strSql.AppendFormat(" WHERE TT.Row between {0} and {1}", startIndex, endIndex);
            return DBHelper.Query(strSql.ToString());
        }

        /*
        /// <summary>
        /// 分页获取数据列表
        /// </summary>
        public DataSet GetList(int PageSize,int PageIndex,string strWhere)
        {
            SqlParameter[] parameters = {
                    new SqlParameter("@tblName", SqlDbType.VarChar, 255),
                    new SqlParameter("@fldName", SqlDbType.VarChar, 255),
                    new SqlParameter("@PageSize", SqlDbType.Int),
                    new SqlParameter("@PageIndex", SqlDbType.Int),
                    new SqlParameter("@IsReCount", SqlDbType.Bit),
                    new SqlParameter("@OrderType", SqlDbType.Bit),
                    new SqlParameter("@strWhere", SqlDbType.VarChar,1000),
                    };
            parameters[0].Value = "CBusinessAgent";
            parameters[1].Value = "BID";
            parameters[2].Value = PageSize;
            parameters[3].Value = PageIndex;
            parameters[4].Value = 0;
            parameters[5].Value = 0;
            parameters[6].Value = strWhere;
            return DBHelper.RunProcedure("UP_GetRecordByPage",parameters,"ds");
        }*/

        #endregion  BasicMethod
        #region  ExtensionMethod

        #endregion  ExtensionMethod
    }
}

