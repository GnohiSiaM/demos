using System;
namespace CHSS.Model
{
    /// <summary>
    /// CCommunityAgency:实体类(属性说明自动提取数据库字段的描述信息)
    /// </summary>
    [Serializable]
    public partial class CCommunityAgency
    {
        public CCommunityAgency()
        {}
        #region Model
        private int _cid;
        private string _commdescription;
        private string _commadddate;
        private string _commname;
        private int? _uid;
        /// <summary>
        ///
        /// </summary>
        public int CID
        {
            set{ _cid=value;}
            get{return _cid;}
        }
        /// <summary>
        ///
        /// </summary>
        public string CommDescription
        {
            set{ _commdescription=value;}
            get{return _commdescription;}
        }
        /// <summary>
        ///
        /// </summary>
        public string CommAddDate
        {
            set{ _commadddate=value;}
            get{return _commadddate;}
        }
        /// <summary>
        ///
        /// </summary>
        public string CommName
        {
            set{ _commname=value;}
            get{return _commname;}
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

