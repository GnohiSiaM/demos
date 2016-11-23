using System;
namespace CHSS.Model
{
    /// <summary>
    /// CAmbulance:实体类(属性说明自动提取数据库字段的描述信息)
    /// </summary>
    [Serializable]
    public partial class CAmbulance
    {
        public CAmbulance()
        {}
        #region Model
        private int _aid;
        private string _ambudescription;
        private string _ambuadddate;
        private string _ambunumber;
        private int? _uid;
        /// <summary>
        ///
        /// </summary>
        public int AID
        {
            set{ _aid=value;}
            get{return _aid;}
        }
        /// <summary>
        ///
        /// </summary>
        public string AmbuDescription
        {
            set{ _ambudescription=value;}
            get{return _ambudescription;}
        }
        /// <summary>
        ///
        /// </summary>
        public string AmbuAddDate
        {
            set{ _ambuadddate=value;}
            get{return _ambuadddate;}
        }
        /// <summary>
        ///
        /// </summary>
        public string AmbuNumber
        {
            set{ _ambunumber=value;}
            get{return _ambunumber;}
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

