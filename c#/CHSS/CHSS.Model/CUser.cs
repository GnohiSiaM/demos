using System;
namespace CHSS.Model
{
    /// <summary>
    /// CUser:实体类(属性说明自动提取数据库字段的描述信息)
    /// </summary>
    [Serializable]
    public partial class CUser
    {
        public CUser()
        {}
        #region Model
        private int _uid;
        private string _realname;
        private string _username;
        private string _password;
        private string _gender;
        private string _borndate;
        private string _phone;
        private string _address;
        private string _idnumber;
        private string _adddate;
        private int? _rid;
        /// <summary>
        ///
        /// </summary>
        public int UID
        {
            set{ _uid=value;}
            get{return _uid;}
        }
        /// <summary>
        ///
        /// </summary>
        public string RealName
        {
            set{ _realname=value;}
            get{return _realname;}
        }
        /// <summary>
        ///
        /// </summary>
        public string UserName
        {
            set{ _username=value;}
            get{return _username;}
        }
        /// <summary>
        ///
        /// </summary>
        public string Password
        {
            set{ _password=value;}
            get{return _password;}
        }
        /// <summary>
        ///
        /// </summary>
        public string Gender
        {
            set{ _gender=value;}
            get{return _gender;}
        }
        /// <summary>
        ///
        /// </summary>
        public string BornDate
        {
            set{ _borndate=value;}
            get{return _borndate;}
        }
        /// <summary>
        ///
        /// </summary>
        public string Phone
        {
            set{ _phone=value;}
            get{return _phone;}
        }
        /// <summary>
        ///
        /// </summary>
        public string Address
        {
            set{ _address=value;}
            get{return _address;}
        }
        /// <summary>
        ///
        /// </summary>
        public string IDNumber
        {
            set{ _idnumber=value;}
            get{return _idnumber;}
        }
        /// <summary>
        ///
        /// </summary>
        public string AddDate
        {
            set{ _adddate=value;}
            get{return _adddate;}
        }
        /// <summary>
        ///
        /// </summary>
        public int? RID
        {
            set{ _rid=value;}
            get{return _rid;}
        }
        #endregion Model

    }
}

