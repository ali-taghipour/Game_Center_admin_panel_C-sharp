using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;

/// <summary>
/// Summary description for userType
/// </summary>

namespace Enums
{
    public enum userType
    {
        [Description("commen user")]
        customer = 0,
        [Description("adminstrator")]
        admin = 1
    }
}