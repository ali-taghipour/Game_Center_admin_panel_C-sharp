using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for time
/// </summary>
public class time
{
    public time()
    {
        
    }
    public static int nowTime()
    {
        int year = persianDateTime.PersianDateTime.Now.Year;
        int month = persianDateTime.PersianDateTime.Now.Month;
        int day = persianDateTime.PersianDateTime.Now.Day;
        int date = year * 10000 + month * 100 + day;

        return date;
    }
}