using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using CHSS.Utility;//Please add references
namespace CHSS.DAL
{
    /// <summary>
    /// 数据访问类:CCommunityAgency
    /// </summary>
    public partial class CCommunityAgency
    {
        public CCommunityAgency()
        {}
        #region  BasicMethod

        /// <summary>
        /// 得到最大ID
        /// </summary>
        public int GetMaxId()
        {
        return DBHelper.GetMaxID("CID", "CCommunityAgency");
        }

        /// <summary>
        /// 是否存在该记录
        /// </summary>
        public bool Exists(int CID)
        {
            StringBuilder strSql=new StringBuilder();
            strSql.Append("select count(1) from CCommunityAgency");
            strSql.Append(" where CID=@CID");
            SqlParameter[] parameters = {
                    new SqlParameter("@CID", SqlDbType.Int,4)
            };
            parameters[0].Value = CID;

            return DBHelper.Exists(strSql.ToString(),parameters);
        }


        /// <summary>
        /// 增加一条数据
        /// </summary>
        public int Add(CHSS.Model.CCommunityAgency model)
        {
            StringBuilder strSql=new StringBuilder();
            strSql.Append("insert into CCommunityAgency(");
            strSql.Append("CommDescription,CommAddDate,CommName,UID)");
            strSql.Append(" values (");
            strSql.Append("@CommDescription,@CommAddDate,@CommName,@UID)");
            strSql.Append(";select @@IDENTITY");
            SqlParameter[] parameters = {
                    new SqlParameter("@CommDescription", SqlDbType.NVarChar,200),
                    new SqlParameter("@CommAddDate", SqlDbType.NVarChar,20),
                    new SqlParameter("@CommName", SqlDbType.NVarChar,20),
                    new SqlParameter("@UID", SqlDbType.Int,4)};
            parameters[0].Value = model.CommDescription;
            parameters[1].Value = model.CommAddDate;
            parameters[2].Value = model.CommName;
            parameters[3].Value = model.UID;

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
        public bool Update(CHSS.Model.CCommunityAgency model)
        {
            StringBuilder strSql=new StringBuilder();
            strSql.Append("update CCommunityAgency set ");
            strSql.Append("CommDescription=@CommDescription,");
            strSql.Append("CommAddDate=@CommAddDate,");
            strSql.Append("CommName=@CommName,");
            strSql.Append("UID=@UID");
            strSql.Append(" where CID=@CID");
            SqlParameter[] parameters = {
                    new SqlParameter("@CommDescription", SqlDbType.NVarChar,200),
                    new SqlParameter("@CommAddDate", SqlDbType.NVarChar,20),
                    new SqlParameter("@CommName", SqlDbType.NVarChar,20),
                    new SqlParameter("@UID", SqlDbType.Int,4),
                    new SqlParameter("@CID", SqlDbType.Int,4)};
            parameters[0].Value = model.CommDescription;
            parameters[1].Value = model.CommAddDate;
            parameters[2].Value = model.CommName;
            parameters[3].Value = model.UID;
            parameters[4].Value = model.CID;

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
        public bool Delete(int CID)
        {

            StringBuilder strSql=new StringBuilder();
            strSql.Append("delete from CCommunityAgency ");
            strSql.Append(" where CID=@CID");
            SqlParameter[] parameters = {
                    new SqlParameter("@CID", SqlDbType.Int,4)
            };
            parameters[0].Value = CID;

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
        public bool DeleteList(string CIDlist )
        {
            StringBuilder strSql=new StringBuilder();
            strSql.Append("delete from CCommunityAgency ");
            strSql.Append(" where CID in ("+CIDlist + ")  ");
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
        public CHSS.Model.CCommunityAgency GetModel(int CID)
        {

            StringBuilder strSql=new StringBuilder();
            strSql.Append("select  top 1 CID,CommDescription,CommAddDate,CommName,UID from CCommunityAgency ");
            strSql.Append(" where CID=@CID");
            SqlParameter[] parameters = {
                    new SqlParameter("@CID", SqlDbType.Int,4)
            };
            parameters[0].Value = CID;

            CHSS.Model.CCommunityAgency model=new CHSS.Model.CCommunityAgency();
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
        public CHSS.Model.CCommunityAgency DataRowToModel(DataRow row)
        {
            CHSS.Model.CCommunityAgency model=new CHSS.Model.CCommunityAgency();
            if (row != null)
            {
                if(row["CID"]!=null && row["CID"].ToString()!="")
                {
                    model.CID=int.Parse(row["CID"].ToString());
                }
                if(row["CommDescription"]!=null)
                {
                    model.CommDescription=row["CommDescription"].ToString();
                }
                if(row["CommAddDate"]!=null)
                {
                    model.CommAddDate=row["CommAddDate"].ToString();
                }
                if(row["CommName"]!=null)
                {
                    model.CommName=row["CommName"].ToString();
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
        //    StringBuilder strSql=new StringBuilder();
        //    strSql.Append("select CID,CommDescription,CommAddDate,CommName,UID ");
        //    strSql.Append(" FROM CCommunityAgency ");
        //    if(strWhere.Trim()!="")
        //    {
        //        strSql.Append(" where "+strWhere);
        //    }
        //    return DBHelper.Query(strSql.ToString());
        //}
        public DataSet GetList(string strWhere)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select CID,CommDescription,CommAddDate,CommName,a.UID,RealName ");
            strSql.Append(" FROM CCommunityAgency as a,CUser as b ");
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
            strSql.Append(" CID,CommDescription,CommAddDate,CommName,UID ");
            strSql.Append(" FROM CCommunityAgency ");
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
            strSql.Append("select count(1) FROM CCommunityAgency ");
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
                strSql.Append("order by T.CID desc");
            }
            strSql.Append(")AS Row, T.*  from CCommunityAgency T ");
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
            parameters[0].Value = "CCommunityAgency";
            parameters[1].Value = "CID";
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

