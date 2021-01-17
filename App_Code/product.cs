using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for product
/// </summary>
namespace Entities
{
    public class product
    {
        public product()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public int id { get; set; }
        public string productName { get; set; }
        public int price { get; set; }
        public string mainPic { get; set; }
        public string trailer { get; set; }
        public string describe { get; set; }
        public bool existance { get; set; }
        public int? createYear { get; set; }
        public int? productNumber { get; set; }
        public string productLink { get; set; }
        public int addDate { get; set; }

        public List<pictures> pictures { get; set; }

        public List<category> Category { get; set; }
    }
}
