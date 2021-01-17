using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for category
/// </summary>

namespace Entities
{
    public class category
    {
        public category()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public int id { get; set; }
        public string title { get; set; }
        public bool status { get; set; }
        public bool manyChoice { get; set; }


        public int? parentID { get; set; }
        public string parentTitle { get; set; }
        public category parent { get; set; }

        public List<category> childs { get; set; }

        public List<product> products { get; set; }
    }
}
