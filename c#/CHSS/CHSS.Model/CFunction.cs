using System;
namespace CHSS.Model
{
    /// <summary>
    /// CFunction:实体类(属性说明自动提取数据库字段的描述信息)
    /// </summary>
    [Serializable]
    public partial class CFunction
    {
        public CFunction()
        {}
        #region Model
        private int _fid;
        private string _funcname;
        private string _funcabbr;
        private int? _mid;
        /// <summary>
        ///
        /// </summary>
        public int FID
        {
            set{ _fid=value;}
            get{return _fid;}
        }
        /// <summary>
        ///
        /// </summary>
        public string FuncName
        {
            set{ _funcname=value;}
            get{return _funcname;}
        }
        /// <summary>
        ///
        /// </summary>
        public string FuncAbbr
        {
            set{ _funcabbr=value;}
            get{return _funcabbr;}
        }
        /// <summary>
        ///
        /// </summary>
        public int? MID
        {
            set{ _mid=value;}
            get{return _mid;}
        }
        #endregion Model

    }
}

