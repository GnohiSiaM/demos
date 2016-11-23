using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using CHSS.Utility;//Please add references
namespace CHSS.DAL
{
    /// <summary>
    /// 数据访问类:CParameter
    /// </summary>
    public partial class CParameter
    {
        public CParameter()
        {}
        #region  BasicMethod

        /// <summary>
        /// 得到最大ID
        /// </summary>
        public int GetMaxId()
        {
        return DBHelper.GetMaxID("PID", "CParameter");
        }

        /// <summary>
        /// 是否存在该记录
        /// </summary>
        public bool Exists(int PID)
        {
            StringBuilder strSql=new StringBuilder();
            strSql.Append("select count(1) from CParameter");
            strSql.Append(" where PID=@PID");
            SqlParameter[] parameters = {
                    new SqlParameter("@PID", SqlDbType.Int,4)
            };
            parameters[0].Value = PID;

            return DBHelper.Exists(strSql.ToString(),parameters);
        }


        /// <summary>
        /// 增加一条数据
        /// </summary>
        public int Add(CHSS.Model.CParameter model)
        {
            StringBuilder strSql=new StringBuilder();
            strSql.Append("insert into CParameter(");
            strSql.Append("ParaName,ParaValue,ParaMaxValue,ParaMiniValue,ParaUnit,ParaDescription)");
            strSql.Append(" values (");
            strSql.Append("@ParaName,@ParaValue,@ParaMaxValue,@ParaMiniValue,@ParaUnit,@ParaDescription)");
            strSql.Append(";select @@IDENTITY");
            SqlParameter[] parameters = {
                    new SqlParameter("@ParaName", SqlDbType.NVarChar,50),
                    new SqlParameter("@ParaValue", SqlDbType.NChar,10),
                    new SqlParameter("@ParaMaxValue", SqlDbType.NChar,10),
                    new SqlParameter("@ParaMiniValue", SqlDbType.NChar,10),
                    new SqlParameter("@ParaUnit", SqlDbType.NChar,10),
                    new SqlParameter("@ParaDescription", SqlDbType.NVarChar,200)};
            parameters[0].Value = model.ParaName;
            parameters[1].Value = model.ParaValue;
            parameters[2].Value = model.ParaMaxValue;
            parameters[3].Value = model.ParaMiniValue;
            parameters[4].Value = model.ParaUnit;
            parameters[5].Value = model.ParaDescription;

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
        public bool Update(CHSS.Model.CParameter model)
        {
            StringBuilder strSql=new StringBuilder();
            strSql.Append("update CParameter set ");
            strSql.Append("ParaName=@ParaName,");
            strSql.Append("ParaValue=@ParaValue,");
            strSql.Append("ParaMaxValue=@ParaMaxValue,");
            strSql.Append("ParaMiniValue=@ParaMiniValue,");
            strSql.Append("ParaUnit=@ParaUnit,");
            strSql.Append("ParaDescription=@ParaDescription");
            strSql.Append(" where PID=@PID");
            SqlParameter[] parameters = {
                    new SqlParameter("@ParaName", SqlDbType.NVarChar,50),
                    new SqlParameter("@ParaValue", SqlDbType.NChar,10),
                    new SqlParameter("@ParaMaxValue", SqlDbType.NChar,10),
                    new SqlParameter("@ParaMiniValue", SqlDbType.NChar,10),
                    new SqlParameter("@ParaUnit", SqlDbType.NChar,10),
                    new SqlParameter("@ParaDescription", SqlDbType.NVarChar,200),
                    new SqlParameter("@PID", SqlDbType.Int,4)};
            parameters[0].Value = model.ParaName;
            parameters[1].Value = model.ParaValue;
            parameters[2].Value = model.ParaMaxValue;
            parameters[3].Value = model.ParaMiniValue;
            parameters[4].Value = model.ParaUnit;
            parameters[5].Value = model.ParaDescription;
            parameters[6].Value = model.PID;

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
        public bool Delete(int PID)
        {

            StringBuilder strSql=new StringBuilder();
            strSql.Append("delete from CParameter ");
            strSql.Append(" where PID=@PID");
            SqlParameter[] parameters = {
                    new SqlParameter("@PID", SqlDbType.Int,4)
            };
            parameters[0].Value = PID;

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
        public bool DeleteList(string PIDlist )
        {
            StringBuilder strSql=new StringBuilder();
            strSql.Append("delete from CParameter ");
            strSql.Append(" where PID in ("+PIDlist + ")  ");
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
        public CHSS.Model.CParameter GetModel(int PID)
        {

            StringBuilder strSql=new StringBuilder();
            strSql.Append("select  top 1 PID,ParaName,ParaValue,ParaMaxValue,ParaMiniValue,ParaUnit,ParaDescription from CParameter ");
            strSql.Append(" where PID=@PID");
            SqlParameter[] parameters = {
                    new SqlParameter("@PID", SqlDbType.Int,4)
            };
            parameters[0].Value = PID;

            CHSS.Model.CParameter model=new CHSS.Model.CParameter();
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
        public CHSS.Model.CParameter DataRowToModel(DataRow row)
        {
            CHSS.Model.CParameter model=new CHSS.Model.CParameter();
            if (row != null)
            {
                if(row["PID"]!=null && row["PID"].ToString()!="")
                {
                    model.PID=int.Parse(row["PID"].ToString());
                }
                if(row["ParaName"]!=null)
                {
                    model.ParaName=row["ParaName"].ToString();
                }
                if(row["ParaValue"]!=null)
                {
                    model.ParaValue=row["ParaValue"].ToString();
                }
                if(row["ParaMaxValue"]!=null)
                {
                    model.ParaMaxValue=row["ParaMaxValue"].ToString();
                }
                if(row["ParaMiniValue"]!=null)
                {
                    model.ParaMiniValue=row["ParaMiniValue"].ToString();
                }
                if(row["ParaUnit"]!=null)
                {
                    model.ParaUnit=row["ParaUnit"].ToString();
                }
                if(row["ParaDescription"]!=null)
                {
                    model.ParaDescription=row["ParaDescription"].ToString();
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
            strSql.Append("select PID,ParaName,ParaValue,ParaMaxValue,ParaMiniValue,ParaUnit,ParaDescription ");
            strSql.Append(" FROM CParameter ");
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
            strSql.Append(" PID,ParaName,ParaValue,ParaMaxValue,ParaMiniValue,ParaUnit,ParaDescription ");
            strSql.Append(" FROM CParameter ");
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
            strSql.Append("select count(1) FROM CParameter ");
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
                strSql.Append("order by T.PID desc");
            }
            strSql.Append(")AS Row, T.*  from CParameter T ");
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
            parameters[0].Value = "CParameter";
            parameters[1].Value = "PID";
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

