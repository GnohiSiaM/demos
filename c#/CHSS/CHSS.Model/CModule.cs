using System;
namespace CHSS.Model
{
    /// <summary>
    /// CModule:实体类(属性说明自动提取数据库字段的描述信息)
    /// </summary>
    [Serializable]
    public partial class CModule
    {
        public CModule()
        {}
        #region Model
        private int _mid;
        private string _moduname;
        private int? _modunumber;
        /// <summary>
        ///
        /// </summary>
        public int MID
        {
            set{ _mid=value;}
            get{return _mid;}
        }
        /// <summary>
        ///
        /// </summary>
        public string ModuName
        {
            set{ _moduname=value;}
            get{return _moduname;}
        }
        /// <summary>
        ///
        /// </summary>
        public int? ModuNumber
        {
            set{ _modunumber=value;}
            get{return _modunumber;}
        }
        #endregion Model

    }
}

