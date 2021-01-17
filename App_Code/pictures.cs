using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for pictures
/// </summary>
namespace Entities
{
    public class pictures
    {
        public pictures()
        {
           
        }

        public int id { get; set; }
        public string largePath { get; set; }
        public string thumbPath { get; set; }
        public int addDate { get; set; }
        public bool isMain { get; set; }
        public int? productId { get; set; }
        public product product { get; set; }
    }
}
