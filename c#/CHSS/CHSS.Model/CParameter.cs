using System;
namespace CHSS.Model
{
    /// <summary>
    /// CParameter:实体类(属性说明自动提取数据库字段的描述信息)
    /// </summary>
    [Serializable]
    public partial class CParameter
    {
        public CParameter()
        {}
        #region Model
        private int _pid;
        private string _paraname;
        private string _paravalue;
        private string _paramaxvalue;
        private string _paraminivalue;
        private string _paraunit;
        private string _paradescription;
        /// <summary>
        ///
        /// </summary>
        public int PID
        {
            set{ _pid=value;}
            get{return _pid;}
        }
        /// <summary>
        ///
        /// </summary>
        public string ParaName
        {
            set{ _paraname=value;}
            get{return _paraname;}
        }
        /// <summary>
        ///
        /// </summary>
        public string ParaValue
        {
            set{ _paravalue=value;}
            get{return _paravalue;}
        }
        /// <summary>
        ///
        /// </summary>
        public string ParaMaxValue
        {
            set{ _paramaxvalue=value;}
            get{return _paramaxvalue;}
        }
        /// <summary>
        ///
        /// </summary>
        public string ParaMiniValue
        {
            set{ _paraminivalue=value;}
            get{return _paraminivalue;}
        }
        /// <summary>
        ///
        /// </summary>
        public string ParaUnit
        {
            set{ _paraunit=value;}
            get{return _paraunit;}
        }
        /// <summary>
        ///
        /// </summary>
        public string ParaDescription
        {
            set{ _paradescription=value;}
            get{return _paradescription;}
        }
        #endregion Model

    }
}

