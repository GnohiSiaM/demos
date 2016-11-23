using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using CHSS.Utility;//Please add references
namespace CHSS.DAL
{
    /// <summary>
    /// 数据访问类:CModule
    /// </summary>
    public partial class CModule
    {
        public CModule()
        {}
        #region  BasicMethod

        /// <summary>
        /// 得到最大ID
        /// </summary>
        public int GetMaxId()
        {
        return DBHelper.GetMaxID("MID", "CModule");
        }

        /// <summary>
        /// 是否存在该记录
        /// </summary>
        public bool Exists(int MID)
        {
            StringBuilder strSql=new StringBuilder();
            strSql.Append("select count(1) from CModule");
            strSql.Append(" where MID=@MID");
            SqlParameter[] parameters = {
                    new SqlParameter("@MID", SqlDbType.Int,4)
            };
            parameters[0].Value = MID;

            return DBHelper.Exists(strSql.ToString(),parameters);
        }


        /// <summary>
        /// 增加一条数据
        /// </summary>
        public int Add(CHSS.Model.CModule model)
        {
            StringBuilder strSql=new StringBuilder();
            strSql.Append("insert into CModule(");
            strSql.Append("ModuName,ModuNumber)");
            strSql.Append(" values (");
            strSql.Append("@ModuName,@ModuNumber)");
            strSql.Append(";select @@IDENTITY");
            SqlParameter[] parameters = {
                    new SqlParameter("@ModuName", SqlDbType.NVarChar,50),
                    new SqlParameter("@ModuNumber", SqlDbType.Int,4)};
            parameters[0].Value = model.ModuName;
            parameters[1].Value = model.ModuNumber;

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
        public bool Update(CHSS.Model.CModule model)
        {
            StringBuilder strSql=new StringBuilder();
            strSql.Append("update CModule set ");
            strSql.Append("ModuName=@ModuName,");
            strSql.Append("ModuNumber=@ModuNumber");
            strSql.Append(" where MID=@MID");
            SqlParameter[] parameters = {
                    new SqlParameter("@ModuName", SqlDbType.NVarChar,50),
                    new SqlParameter("@ModuNumber", SqlDbType.Int,4),
                    new SqlParameter("@MID", SqlDbType.Int,4)};
            parameters[0].Value = model.ModuName;
            parameters[1].Value = model.ModuNumber;
            parameters[2].Value = model.MID;

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
        public bool Delete(int MID)
        {

            StringBuilder strSql=new StringBuilder();
            strSql.Append("delete from CModule ");
            strSql.Append(" where MID=@MID");
            SqlParameter[] parameters = {
                    new SqlParameter("@MID", SqlDbType.Int,4)
            };
            parameters[0].Value = MID;

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
        public bool DeleteList(string MIDlist )
        {
            StringBuilder strSql=new StringBuilder();
            strSql.Append("delete from CModule ");
            strSql.Append(" where MID in ("+MIDlist + ")  ");
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
        public CHSS.Model.CModule GetModel(int MID)
        {

            StringBuilder strSql=new StringBuilder();
            strSql.Append("select  top 1 MID,ModuName,ModuNumber from CModule ");
            strSql.Append(" where MID=@MID");
            SqlParameter[] parameters = {
                    new SqlParameter("@MID", SqlDbType.Int,4)
            };
            parameters[0].Value = MID;

            CHSS.Model.CModule model=new CHSS.Model.CModule();
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
        public CHSS.Model.CModule DataRowToModel(DataRow row)
        {
            CHSS.Model.CModule model=new CHSS.Model.CModule();
            if (row != null)
            {
                if(row["MID"]!=null && row["MID"].ToString()!="")
                {
                    model.MID=int.Parse(row["MID"].ToString());
                }
                if(row["ModuName"]!=null)
                {
                    model.ModuName=row["ModuName"].ToString();
                }
                if(row["ModuNumber"]!=null && row["ModuNumber"].ToString()!="")
                {
                    model.ModuNumber=int.Parse(row["ModuNumber"].ToString());
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
            strSql.Append("select MID,ModuName,ModuNumber ");
            strSql.Append(" FROM CModule ");
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
            strSql.Append(" MID,ModuName,ModuNumber ");
            strSql.Append(" FROM CModule ");
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
            strSql.Append("select count(1) FROM CModule ");
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
                strSql.Append("order by T.MID desc");
            }
            strSql.Append(")AS Row, T.*  from CModule T ");
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
            parameters[0].Value = "CModule";
            parameters[1].Value = "MID";
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

