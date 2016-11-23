using System;
namespace CHSS.Model
{
    /// <summary>
    /// CExpert:实体类(属性说明自动提取数据库字段的描述信息)
    /// </summary>
    [Serializable]
    public partial class CExpert
    {
        public CExpert()
        {}
        #region Model
        private int _eid;
        private string _expedescription;
        private string _expeadddate;
        private string _expename;
        private string _expephone;
        private string _expepicurl;
        private int? _uid;
        /// <summary>
        ///
        /// </summary>
        public int EID
        {
            set{ _eid=value;}
            get{return _eid;}
        }
        /// <summary>
        ///
        /// </summary>
        public string ExpeDescription
        {
            set{ _expedescription=value;}
            get{return _expedescription;}
        }
        /// <summary>
        ///
        /// </summary>
        public string ExpeAddDate
        {
            set{ _expeadddate=value;}
            get{return _expeadddate;}
        }
        /// <summary>
        ///
        /// </summary>
        public string ExpeName
        {
            set{ _expename=value;}
            get{return _expename;}
        }
        /// <summary>
        ///
        /// </summary>
        public string ExpePhone
        {
            set{ _expephone=value;}
            get{return _expephone;}
        }
        /// <summary>
        ///
        /// </summary>
        public string ExpePicURL
        {
            set{ _expepicurl=value;}
            get{return _expepicurl;}
        }
        /// <summary>
        ///
        /// </summary>
        public int? UID
        {
            set{ _uid=value;}
            get{return _uid;}
        }
        #endregion Model

    }
}

