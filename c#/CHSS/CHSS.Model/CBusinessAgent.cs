using System;
namespace CHSS.Model
{
    /// <summary>
    /// CBusinessAgent:实体类(属性说明自动提取数据库字段的描述信息)
    /// </summary>
    [Serializable]
    public partial class CBusinessAgent
    {
        public CBusinessAgent()
        {}
        #region Model
        private int _bid;
        private string _busidescription;
        private string _busiadddate;
        private string _businame;
        private string _busiphone;
        private int? _uid;
        /// <summary>
        ///
        /// </summary>
        public int BID
        {
            set{ _bid=value;}
            get{return _bid;}
        }
        /// <summary>
        ///
        /// </summary>
        public string BusiDescription
        {
            set{ _busidescription=value;}
            get{return _busidescription;}
        }
        /// <summary>
        ///
        /// </summary>
        public string BusiAddDate
        {
            set{ _busiadddate=value;}
            get{return _busiadddate;}
        }
        /// <summary>
        ///
        /// </summary>
        public string BusiName
        {
            set{ _businame=value;}
            get{return _businame;}
        }
        /// <summary>
        ///
        /// </summary>
        public string BusiPhone
        {
            set{ _busiphone=value;}
            get{return _busiphone;}
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

