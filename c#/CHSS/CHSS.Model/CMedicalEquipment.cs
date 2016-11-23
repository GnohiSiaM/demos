using System;
namespace CHSS.Model
{
    /// <summary>
    /// CMedicalEquipment:实体类(属性说明自动提取数据库字段的描述信息)
    /// </summary>
    [Serializable]
    public partial class CMedicalEquipment
    {
        public CMedicalEquipment()
        {}
        #region Model
        private int _mid;
        private string _medidescription;
        private string _mediadddate;
        private string _mediname;
        private int? _uid;
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
        public string MediDescription
        {
            set{ _medidescription=value;}
            get{return _medidescription;}
        }
        /// <summary>
        ///
        /// </summary>
        public string MediAddDate
        {
            set{ _mediadddate=value;}
            get{return _mediadddate;}
        }
        /// <summary>
        ///
        /// </summary>
        public string MediName
        {
            set{ _mediname=value;}
            get{return _mediname;}
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

