using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.IO;

/// <summary>
/// Summary description for gettingFile
/// </summary>
public class gettingFile
{
    public gettingFile()
    {

    }

    // pic
    public static string getPic(string picID)
    {
        HttpPostedFile file = HttpContext.Current.Request.Files[picID];

        string file_name = "";
        string file_ext = "";

        Random r = new Random();
        int ra = r.Next(0, 1000000000);

        if (file != null)
        {
            file_ext = Path.GetExtension(file.FileName).ToLower();
            if (file_ext == ".jpg" || file_ext == ".jpeg" || file_ext == ".png")
            {
                file_name = ra + Path.GetFileName(file.FileName);
                file.SaveAs(HttpContext.Current.Server.MapPath("~/images/Uploads/large/") + file_name);
            }
        }
        return file_name;
    }

    // trailer
    public static string getTrailer(string trailerID)
    {
        Random r = new Random();
        int ra = r.Next(0, 1000000000);

        HttpPostedFile trailer = HttpContext.Current.Request.Files[trailerID];

        string trailer_name = "";
        string trailer_ext = "";

        if (trailer != null)
        {
            trailer_ext = Path.GetExtension(trailer.FileName).ToLower();
            if (trailer_ext == ".mp4" || trailer_ext == ".mkv")
            {
                trailer_name = ra + Path.GetFileName(trailer.FileName);
                trailer.SaveAs(HttpContext.Current.Server.MapPath("~/trailer/") + trailer_name);
            }
        }
        return trailer_name;
    }
}
