using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using CHSS.Utility;//Please add references
namespace CHSS.DAL
{
    /// <summary>
    /// 数据访问类:CUser
    /// </summary>
    public partial class CUser
    {
        public CUser()
        {}
        #region  BasicMethod

        /// <summary>
        /// 得到最大ID
        /// </summary>
        public int GetMaxId()
        {
        return DBHelper.GetMaxID("UID", "CUser");
        }

        /// <summary>
        /// 是否存在该记录
        /// </summary>
        public bool Exists(int UID)
        {
            StringBuilder strSql=new StringBuilder();
            strSql.Append("select count(1) from CUser");
            strSql.Append(" where UID=@UID");
            SqlParameter[] parameters = {
                    new SqlParameter("@UID", SqlDbType.Int,4)
            };
            parameters[0].Value = UID;

            return DBHelper.Exists(strSql.ToString(),parameters);
        }


        /// <summary>
        /// 增加一条数据
        /// </summary>
        public int Add(CHSS.Model.CUser model)
        {
            StringBuilder strSql=new StringBuilder();
            strSql.Append("insert into CUser(");
            strSql.Append("RealName,UserName,Password,Gender,BornDate,Phone,Address,IDNumber,AddDate,RID)");
            strSql.Append(" values (");
            strSql.Append("@RealName,@UserName,@Password,@Gender,@BornDate,@Phone,@Address,@IDNumber,@AddDate,@RID)");
            strSql.Append(";select @@IDENTITY");
            SqlParameter[] parameters = {
                    new SqlParameter("@RealName", SqlDbType.NVarChar,20),
                    new SqlParameter("@UserName", SqlDbType.NVarChar,50),
                    new SqlParameter("@Password", SqlDbType.NVarChar,50),
                    new SqlParameter("@Gender", SqlDbType.Char,2),
                    new SqlParameter("@BornDate", SqlDbType.VarChar,20),
                    new SqlParameter("@Phone", SqlDbType.Char,11),
                    new SqlParameter("@Address", SqlDbType.NVarChar,50),
                    new SqlParameter("@IDNumber", SqlDbType.VarChar,18),
                    new SqlParameter("@AddDate", SqlDbType.NVarChar,20),
                    new SqlParameter("@RID", SqlDbType.Int,4)};
            parameters[0].Value = model.RealName;
            parameters[1].Value = model.UserName;
            parameters[2].Value = model.Password;
            parameters[3].Value = model.Gender;
            parameters[4].Value = model.BornDate;
            parameters[5].Value = model.Phone;
            parameters[6].Value = model.Address;
            parameters[7].Value = model.IDNumber;
            parameters[8].Value = model.AddDate;
            parameters[9].Value = model.RID;

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
        public bool Update(CHSS.Model.CUser model)
        {
            StringBuilder strSql=new StringBuilder();
            strSql.Append("update CUser set ");
            strSql.Append("RealName=@RealName,");
            strSql.Append("UserName=@UserName,");
            strSql.Append("Password=@Password,");
            strSql.Append("Gender=@Gender,");
            strSql.Append("BornDate=@BornDate,");
            strSql.Append("Phone=@Phone,");
            strSql.Append("Address=@Address,");
            strSql.Append("IDNumber=@IDNumber,");
            //strSql.Append("AddDate=@AddDate,");
            strSql.Append("RID=@RID");
            strSql.Append(" where UID=@UID");
            SqlParameter[] parameters = {
                    new SqlParameter("@RealName", SqlDbType.NVarChar,20),
                    new SqlParameter("@UserName", SqlDbType.NVarChar,50),
                    new SqlParameter("@Password", SqlDbType.NVarChar,50),
                    new SqlParameter("@Gender", SqlDbType.Char,2),
                    new SqlParameter("@BornDate", SqlDbType.VarChar,20),
                    new SqlParameter("@Phone", SqlDbType.Char,11),
                    new SqlParameter("@Address", SqlDbType.NVarChar,50),
                    new SqlParameter("@IDNumber", SqlDbType.VarChar,18),
                    //new SqlParameter("@AddDate", SqlDbType.NVarChar,20),
                    new SqlParameter("@RID", SqlDbType.Int,4),
                    new SqlParameter("@UID", SqlDbType.Int,4)};
            parameters[0].Value = model.RealName;
            parameters[1].Value = model.UserName;
            parameters[2].Value = model.Password;
            parameters[3].Value = model.Gender;
            parameters[4].Value = model.BornDate;
            parameters[5].Value = model.Phone;
            parameters[6].Value = model.Address;
            parameters[7].Value = model.IDNumber;
            //parameters[8].Value = model.AddDate;
            parameters[8].Value = model.RID;
            parameters[9].Value = model.UID;

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
        public bool Delete(int UID)
        {

            StringBuilder strSql=new StringBuilder();
            strSql.Append("delete from CUser ");
            strSql.Append(" where UID=@UID");
            SqlParameter[] parameters = {
                    new SqlParameter("@UID", SqlDbType.Int,4)
            };
            parameters[0].Value = UID;

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
        public bool DeleteList(string UIDlist )
        {
            StringBuilder strSql=new StringBuilder();
            strSql.Append("delete from CUser ");
            strSql.Append(" where UID in ("+UIDlist + ")  ");
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
        public CHSS.Model.CUser GetModel(int UID)
        {

            StringBuilder strSql=new StringBuilder();
            strSql.Append("select  top 1 UID,RealName,UserName,Password,Gender,BornDate,Phone,Address,IDNumber,AddDate,RID from CUser ");
            strSql.Append(" where UID=@UID");
            SqlParameter[] parameters = {
                    new SqlParameter("@UID", SqlDbType.Int,4)
            };
            parameters[0].Value = UID;

            CHSS.Model.CUser model=new CHSS.Model.CUser();
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
        public CHSS.Model.CUser DataRowToModel(DataRow row)
        {
            CHSS.Model.CUser model=new CHSS.Model.CUser();
            if (row != null)
            {
                if(row["UID"]!=null && row["UID"].ToString()!="")
                {
                    model.UID=int.Parse(row["UID"].ToString());
                }
                if(row["RealName"]!=null)
                {
                    model.RealName=row["RealName"].ToString();
                }
                if(row["UserName"]!=null)
                {
                    model.UserName=row["UserName"].ToString();
                }
                if(row["Password"]!=null)
                {
                    model.Password=row["Password"].ToString();
                }
                if(row["Gender"]!=null)
                {
                    model.Gender=row["Gender"].ToString();
                }
                if(row["BornDate"]!=null)
                {
                    model.BornDate=row["BornDate"].ToString();
                }
                if(row["Phone"]!=null)
                {
                    model.Phone=row["Phone"].ToString();
                }
                if(row["Address"]!=null)
                {
                    model.Address=row["Address"].ToString();
                }
                if(row["IDNumber"]!=null)
                {
                    model.IDNumber=row["IDNumber"].ToString();
                }
                if(row["AddDate"]!=null)
                {
                    model.AddDate=row["AddDate"].ToString();
                }
                if(row["RID"]!=null && row["RID"].ToString()!="")
                {
                    model.RID=int.Parse(row["RID"].ToString());
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
            strSql.Append("select UID,RealName,UserName,Password,Gender,BornDate,Phone,Address,IDNumber,AddDate,a.RID,RoleName ");
            strSql.Append(" FROM CUser as a,CRole as b ");
            if(strWhere.Trim()!="")
            {
                strSql.Append(" where a.RID=b.RID AND ( " + strWhere + " )");
            }
            else
            {
                strSql.Append(" where a.RID=b.RID ");
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
            strSql.Append(" UID,RealName,UserName,Password,Gender,BornDate,Phone,Address,IDNumber,AddDate,RID ");
            strSql.Append(" FROM CUser ");
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
            strSql.Append("select count(1) FROM CUser ");
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
                strSql.Append("order by T.UID desc");
            }
            strSql.Append(")AS Row, T.*  from CUser T ");
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
            parameters[0].Value = "CUser";
            parameters[1].Value = "UID";
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

