using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for proCat
/// </summary>

namespace Entities
{ 
    public class proCat
    {
        public proCat()
        {
            
        }
        public int id { get; set; }
        public int catId { get; set; }
        public int productId { get; set; }
    }
}