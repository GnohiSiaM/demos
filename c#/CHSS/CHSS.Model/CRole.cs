using System;
namespace CHSS.Model
{
    /// <summary>
    /// CRole:实体类(属性说明自动提取数据库字段的描述信息)
    /// </summary>
    [Serializable]
    public partial class CRole
    {
        public CRole()
        {}
        #region Model
        private int _rid;
        private string _rolenumber;
        private string _rolename;
        private string _rolevalue;
        private string _roledescription;
        /// <summary>
        ///
        /// </summary>
        public int RID
        {
            set{ _rid=value;}
            get{return _rid;}
        }
        /// <summary>
        ///
        /// </summary>
        public string RoleNumber
        {
            set{ _rolenumber=value;}
            get{return _rolenumber;}
        }
        /// <summary>
        ///
        /// </summary>
        public string RoleName
        {
            set{ _rolename=value;}
            get{return _rolename;}
        }
        /// <summary>
        ///
        /// </summary>
        public string RoleValue
        {
            set{ _rolevalue=value;}
            get{return _rolevalue;}
        }
        /// <summary>
        ///
        /// </summary>
        public string RoleDescription
        {
            set{ _roledescription=value;}
            get{return _roledescription;}
        }
        #endregion Model

    }
}

