using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using CHSS.Utility;
namespace CHSS.DAL
{
    /// <summary>
    /// 数据访问类:CAmbulance
    /// </summary>
    public partial class CAmbulance
    {
        public CAmbulance()
        {}
        #region  BasicMethod

        /// <summary>
        /// 得到最大ID
        /// </summary>
        public int GetMaxId()
        {
        return DBHelper.GetMaxID("AID", "CAmbulance");
        }

        /// <summary>
        /// 是否存在该记录
        /// </summary>
        public bool Exists(int AID)
        {
            StringBuilder strSql=new StringBuilder();
            strSql.Append("select count(1) from CAmbulance");
            strSql.Append(" where AID=@AID");
            SqlParameter[] parameters = {
                    new SqlParameter("@AID", SqlDbType.Int,4)
            };
            parameters[0].Value = AID;

            return DBHelper.Exists(strSql.ToString(),parameters);
        }


        /// <summary>
        /// 增加一条数据
        /// </summary>
        public int Add(CHSS.Model.CAmbulance model)
        {
            StringBuilder strSql=new StringBuilder();
            strSql.Append("insert into CAmbulance(");
            strSql.Append("AmbuDescription,AmbuAddDate,AmbuNumber,UID)");
            strSql.Append(" values (");
            strSql.Append("@AmbuDescription,@AmbuAddDate,@AmbuNumber,@UID)");
            strSql.Append(";select @@IDENTITY");
            SqlParameter[] parameters = {
                    new SqlParameter("@AmbuDescription", SqlDbType.NVarChar,200),
                    new SqlParameter("@AmbuAddDate", SqlDbType.NVarChar,20),
                    new SqlParameter("@AmbuNumber", SqlDbType.NChar,10),
                    new SqlParameter("@UID", SqlDbType.Int,4)};
            parameters[0].Value = model.AmbuDescription;
            parameters[1].Value = model.AmbuAddDate;
            parameters[2].Value = model.AmbuNumber;
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
        public bool Update(CHSS.Model.CAmbulance model)
        {
            StringBuilder strSql=new StringBuilder();
            strSql.Append("update CAmbulance set ");
            strSql.Append("AmbuDescription=@AmbuDescription,");
            strSql.Append("AmbuAddDate=@AmbuAddDate,");
            strSql.Append("AmbuNumber=@AmbuNumber,");
            strSql.Append("UID=@UID");
            strSql.Append(" where AID=@AID");
            SqlParameter[] parameters = {
                    new SqlParameter("@AmbuDescription", SqlDbType.NVarChar,200),
                    new SqlParameter("@AmbuAddDate", SqlDbType.NVarChar,20),
                    new SqlParameter("@AmbuNumber", SqlDbType.NChar,10),
                    new SqlParameter("@UID", SqlDbType.Int,4),
                    new SqlParameter("@AID", SqlDbType.Int,4)};
            parameters[0].Value = model.AmbuDescription;
            parameters[1].Value = model.AmbuAddDate;
            parameters[2].Value = model.AmbuNumber;
            parameters[3].Value = model.UID;
            parameters[4].Value = model.AID;

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
        public bool Delete(int AID)
        {

            StringBuilder strSql=new StringBuilder();
            strSql.Append("delete from CAmbulance ");
            strSql.Append(" where AID=@AID");
            SqlParameter[] parameters = {
                    new SqlParameter("@AID", SqlDbType.Int,4)
            };
            parameters[0].Value = AID;

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
        public bool DeleteList(string AIDlist )
        {
            StringBuilder strSql=new StringBuilder();
            strSql.Append("delete from CAmbulance ");
            strSql.Append(" where AID in ("+AIDlist + ")  ");
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
        public CHSS.Model.CAmbulance GetModel(int AID)
        {

            StringBuilder strSql=new StringBuilder();
            strSql.Append("select  top 1 AID,AmbuDescription,AmbuAddDate,AmbuNumber,UID from CAmbulance ");
            strSql.Append(" where AID=@AID");
            SqlParameter[] parameters = {
                    new SqlParameter("@AID", SqlDbType.Int,4)
            };
            parameters[0].Value = AID;

            CHSS.Model.CAmbulance model=new CHSS.Model.CAmbulance();
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
        public CHSS.Model.CAmbulance DataRowToModel(DataRow row)
        {
            CHSS.Model.CAmbulance model=new CHSS.Model.CAmbulance();
            if (row != null)
            {
                if(row["AID"]!=null && row["AID"].ToString()!="")
                {
                    model.AID=int.Parse(row["AID"].ToString());
                }
                if(row["AmbuDescription"]!=null)
                {
                    model.AmbuDescription=row["AmbuDescription"].ToString();
                }
                if(row["AmbuAddDate"]!=null)
                {
                    model.AmbuAddDate=row["AmbuAddDate"].ToString();
                }
                if(row["AmbuNumber"]!=null)
                {
                    model.AmbuNumber=row["AmbuNumber"].ToString();
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
        //    strSql.Append("select AID,AmbuDescription,AmbuAddDate,AmbuNumber,UID ");
        //    strSql.Append(" FROM CAmbulance ");
        //    if (strWhere.Trim() != "")
        //    {
        //        strSql.Append(" where " + strWhere);
        //    }
        //    return DBHelper.Query(strSql.ToString());
        //}
        public DataSet GetList(string strWhere)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select AID,AmbuDescription,AmbuAddDate,AmbuNumber,a.UID,RealName ");
            strSql.Append(" FROM CAmbulance as a,CUser as b ");
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
            strSql.Append(" AID,AmbuDescription,AmbuAddDate,AmbuNumber,UID ");
            strSql.Append(" FROM CAmbulance ");
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
            strSql.Append("select count(1) FROM CAmbulance ");
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
                strSql.Append("order by T.AID desc");
            }
            strSql.Append(")AS Row, T.*  from CAmbulance T ");
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
            parameters[0].Value = "CAmbulance";
            parameters[1].Value = "AID";
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

