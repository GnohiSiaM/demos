using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using CHSS.Utility;//Please add references
namespace CHSS.DAL
{
    /// <summary>
    /// 数据访问类:CExpert
    /// </summary>
    public partial class CExpert
    {
        public CExpert()
        {}
        #region  BasicMethod

        /// <summary>
        /// 得到最大ID
        /// </summary>
        public int GetMaxId()
        {
        return DBHelper.GetMaxID("EID", "CExpert");
        }

        /// <summary>
        /// 是否存在该记录
        /// </summary>
        public bool Exists(int EID)
        {
            StringBuilder strSql=new StringBuilder();
            strSql.Append("select count(1) from CExpert");
            strSql.Append(" where EID=@EID");
            SqlParameter[] parameters = {
                    new SqlParameter("@EID", SqlDbType.Int,4)
            };
            parameters[0].Value = EID;

            return DBHelper.Exists(strSql.ToString(),parameters);
        }


        /// <summary>
        /// 增加一条数据
        /// </summary>
        public int Add(CHSS.Model.CExpert model)
        {
            StringBuilder strSql=new StringBuilder();
            strSql.Append("insert into CExpert(");
            strSql.Append("ExpeDescription,ExpeAddDate,ExpeName,ExpePhone,ExpePicURL,UID)");
            strSql.Append(" values (");
            strSql.Append("@ExpeDescription,@ExpeAddDate,@ExpeName,@ExpePhone,@ExpePicURL,@UID)");
            strSql.Append(";select @@IDENTITY");
            SqlParameter[] parameters = {
                    new SqlParameter("@ExpeDescription", SqlDbType.NVarChar,200),
                    new SqlParameter("@ExpeAddDate", SqlDbType.NVarChar,20),
                    new SqlParameter("@ExpeName", SqlDbType.NVarChar,20),
                    new SqlParameter("@ExpePhone", SqlDbType.Char,11),
                    new SqlParameter("@ExpePicURL", SqlDbType.NVarChar,50),
                    new SqlParameter("@UID", SqlDbType.Int,4)};
            parameters[0].Value = model.ExpeDescription;
            parameters[1].Value = model.ExpeAddDate;
            parameters[2].Value = model.ExpeName;
            parameters[3].Value = model.ExpePhone;
            parameters[4].Value = model.ExpePicURL;
            parameters[5].Value = model.UID;

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
        public bool Update(CHSS.Model.CExpert model)
        {
            StringBuilder strSql=new StringBuilder();
            strSql.Append("update CExpert set ");
            strSql.Append("ExpeDescription=@ExpeDescription,");
            strSql.Append("ExpeAddDate=@ExpeAddDate,");
            strSql.Append("ExpeName=@ExpeName,");
            strSql.Append("ExpePhone=@ExpePhone,");
            strSql.Append("ExpePicURL=@ExpePicURL,");
            strSql.Append("UID=@UID");
            strSql.Append(" where EID=@EID");
            SqlParameter[] parameters = {
                    new SqlParameter("@ExpeDescription", SqlDbType.NVarChar,200),
                    new SqlParameter("@ExpeAddDate", SqlDbType.NVarChar,20),
                    new SqlParameter("@ExpeName", SqlDbType.NVarChar,20),
                    new SqlParameter("@ExpePhone", SqlDbType.Char,11),
                    new SqlParameter("@ExpePicURL", SqlDbType.NVarChar,50),
                    new SqlParameter("@UID", SqlDbType.Int,4),
                    new SqlParameter("@EID", SqlDbType.Int,4)};
            parameters[0].Value = model.ExpeDescription;
            parameters[1].Value = model.ExpeAddDate;
            parameters[2].Value = model.ExpeName;
            parameters[3].Value = model.ExpePhone;
            parameters[4].Value = model.ExpePicURL;
            parameters[5].Value = model.UID;
            parameters[6].Value = model.EID;

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
        public bool Delete(int EID)
        {

            StringBuilder strSql=new StringBuilder();
            strSql.Append("delete from CExpert ");
            strSql.Append(" where EID=@EID");
            SqlParameter[] parameters = {
                    new SqlParameter("@EID", SqlDbType.Int,4)
            };
            parameters[0].Value = EID;

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
        public bool DeleteList(string EIDlist )
        {
            StringBuilder strSql=new StringBuilder();
            strSql.Append("delete from CExpert ");
            strSql.Append(" where EID in ("+EIDlist + ")  ");
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
        public CHSS.Model.CExpert GetModel(int EID)
        {

            StringBuilder strSql=new StringBuilder();
            strSql.Append("select  top 1 EID,ExpeDescription,ExpeAddDate,ExpeName,ExpePhone,ExpePicURL,UID from CExpert ");
            strSql.Append(" where EID=@EID");
            SqlParameter[] parameters = {
                    new SqlParameter("@EID", SqlDbType.Int,4)
            };
            parameters[0].Value = EID;

            CHSS.Model.CExpert model=new CHSS.Model.CExpert();
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
        public CHSS.Model.CExpert DataRowToModel(DataRow row)
        {
            CHSS.Model.CExpert model=new CHSS.Model.CExpert();
            if (row != null)
            {
                if(row["EID"]!=null && row["EID"].ToString()!="")
                {
                    model.EID=int.Parse(row["EID"].ToString());
                }
                if(row["ExpeDescription"]!=null)
                {
                    model.ExpeDescription=row["ExpeDescription"].ToString();
                }
                if(row["ExpeAddDate"]!=null)
                {
                    model.ExpeAddDate=row["ExpeAddDate"].ToString();
                }
                if(row["ExpeName"]!=null)
                {
                    model.ExpeName=row["ExpeName"].ToString();
                }
                if(row["ExpePhone"]!=null)
                {
                    model.ExpePhone=row["ExpePhone"].ToString();
                }
                if(row["ExpePicURL"]!=null)
                {
                    model.ExpePicURL=row["ExpePicURL"].ToString();
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
        //    strSql.Append("select EID,ExpeDescription,ExpeAddDate,ExpeName,ExpePhone,ExpePicURL,UID ");
        //    strSql.Append(" FROM CExpert ");
        //    if(strWhere.Trim()!="")
        //    {
        //        strSql.Append(" where "+strWhere);
        //    }
        //    return DBHelper.Query(strSql.ToString());
        //}
        public DataSet GetList(string strWhere)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select EID,ExpeDescription,ExpeAddDate,ExpeName,ExpePhone,ExpePicURL,a.UID,RealName ");
            strSql.Append(" FROM CExpert as a,CUser as b ");
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
            strSql.Append(" EID,ExpeDescription,ExpeAddDate,ExpeName,ExpePhone,ExpePicURL,UID ");
            strSql.Append(" FROM CExpert ");
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
            strSql.Append("select count(1) FROM CExpert ");
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
                strSql.Append("order by T.EID desc");
            }
            strSql.Append(")AS Row, T.*  from CExpert T ");
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
            parameters[0].Value = "CExpert";
            parameters[1].Value = "EID";
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

