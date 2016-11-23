using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using CHSS.Utility;//Please add references
namespace CHSS.DAL
{
    /// <summary>
    /// 数据访问类:CRole
    /// </summary>
    public partial class CRole
    {
        public CRole()
        {}
        #region  BasicMethod

        /// <summary>
        /// 得到最大ID
        /// </summary>
        public int GetMaxId()
        {
        return DBHelper.GetMaxID("RID", "CRole");
        }

        /// <summary>
        /// 是否存在该记录
        /// </summary>
        public bool Exists(int RID)
        {
            StringBuilder strSql=new StringBuilder();
            strSql.Append("select count(1) from CRole");
            strSql.Append(" where RID=@RID");
            SqlParameter[] parameters = {
                    new SqlParameter("@RID", SqlDbType.Int,4)
            };
            parameters[0].Value = RID;

            return DBHelper.Exists(strSql.ToString(),parameters);
        }


        /// <summary>
        /// 增加一条数据
        /// </summary>
        public int Add(CHSS.Model.CRole model)
        {
            StringBuilder strSql=new StringBuilder();
            strSql.Append("insert into CRole(");
            strSql.Append("RoleNumber,RoleName,RoleValue,RoleDescription)");
            strSql.Append(" values (");
            strSql.Append("@RoleNumber,@RoleName,@RoleValue,@RoleDescription)");
            strSql.Append(";select @@IDENTITY");
            SqlParameter[] parameters = {
                    new SqlParameter("@RoleNumber", SqlDbType.VarChar,50),
                    new SqlParameter("@RoleName", SqlDbType.NVarChar,50),
                    new SqlParameter("@RoleValue", SqlDbType.VarChar,100),
                    new SqlParameter("@RoleDescription", SqlDbType.NVarChar,200)};
            parameters[0].Value = model.RoleNumber;
            parameters[1].Value = model.RoleName;
            parameters[2].Value = model.RoleValue;
            parameters[3].Value = model.RoleDescription;

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
        public bool Update(CHSS.Model.CRole model)
        {
            StringBuilder strSql=new StringBuilder();
            strSql.Append("update CRole set ");
            strSql.Append("RoleNumber=@RoleNumber,");
            strSql.Append("RoleName=@RoleName,");
            strSql.Append("RoleValue=@RoleValue,");
            strSql.Append("RoleDescription=@RoleDescription");
            strSql.Append(" where RID=@RID");
            SqlParameter[] parameters = {
                    new SqlParameter("@RoleNumber", SqlDbType.VarChar,50),
                    new SqlParameter("@RoleName", SqlDbType.NVarChar,50),
                    new SqlParameter("@RoleValue", SqlDbType.VarChar,100),
                    new SqlParameter("@RoleDescription", SqlDbType.NVarChar,200),
                    new SqlParameter("@RID", SqlDbType.Int,4)};
            parameters[0].Value = model.RoleNumber;
            parameters[1].Value = model.RoleName;
            parameters[2].Value = model.RoleValue;
            parameters[3].Value = model.RoleDescription;
            parameters[4].Value = model.RID;

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
        public bool Delete(int RID)
        {

            StringBuilder strSql=new StringBuilder();
            strSql.Append("delete from CRole ");
            strSql.Append(" where RID=@RID");
            SqlParameter[] parameters = {
                    new SqlParameter("@RID", SqlDbType.Int,4)
            };
            parameters[0].Value = RID;

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
        public bool DeleteList(string RIDlist )
        {
            StringBuilder strSql=new StringBuilder();
            strSql.Append("delete from CRole ");
            strSql.Append(" where RID in ("+RIDlist + ")  ");
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
        public CHSS.Model.CRole GetModel(int RID)
        {

            StringBuilder strSql=new StringBuilder();
            strSql.Append("select  top 1 RID,RoleNumber,RoleName,RoleValue,RoleDescription from CRole ");
            strSql.Append(" where RID=@RID");
            SqlParameter[] parameters = {
                    new SqlParameter("@RID", SqlDbType.Int,4)
            };
            parameters[0].Value = RID;

            CHSS.Model.CRole model=new CHSS.Model.CRole();
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
        public CHSS.Model.CRole DataRowToModel(DataRow row)
        {
            CHSS.Model.CRole model=new CHSS.Model.CRole();
            if (row != null)
            {
                if(row["RID"]!=null && row["RID"].ToString()!="")
                {
                    model.RID=int.Parse(row["RID"].ToString());
                }
                if(row["RoleNumber"]!=null)
                {
                    model.RoleNumber=row["RoleNumber"].ToString();
                }
                if(row["RoleName"]!=null)
                {
                    model.RoleName=row["RoleName"].ToString();
                }
                if(row["RoleValue"]!=null)
                {
                    model.RoleValue=row["RoleValue"].ToString();
                }
                if(row["RoleDescription"]!=null)
                {
                    model.RoleDescription=row["RoleDescription"].ToString();
                }
            }
            return model;
        }

        /// <summary>
        /// 获得数据列表
        /// </summary>
        public DataSet GetList(string strWhere)
        {
            StringBuilder strSql=new StringBuilder();
            strSql.Append("select RID,RoleNumber,RoleName,RoleValue,RoleDescription ");
            strSql.Append(" FROM CRole ");
            if(strWhere.Trim()!="")
            {
                strSql.Append(" where "+strWhere);
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
            strSql.Append(" RID,RoleNumber,RoleName,RoleValue,RoleDescription ");
            strSql.Append(" FROM CRole ");
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
            strSql.Append("select count(1) FROM CRole ");
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
                strSql.Append("order by T.RID desc");
            }
            strSql.Append(")AS Row, T.*  from CRole T ");
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
            parameters[0].Value = "CRole";
            parameters[1].Value = "RID";
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

