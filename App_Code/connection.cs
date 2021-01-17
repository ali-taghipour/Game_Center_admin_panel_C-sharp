using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;

using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;

/// <summary>
/// Summary description for connection
/// </summary>
public class connection
{
    public connection()
    {
        
    }
    public static void myExecuteNonQuery(string commandText,string commandType,Dictionary<string,object> param)
    {
        string cs = WebConfigurationManager.ConnectionStrings["con"].ConnectionString;
        var con = new SqlConnection(cs); 
        var cmd = new SqlCommand(commandText, con);

        cmd.CommandType = commandType == "stored" ? CommandType.StoredProcedure : CommandType.Text;

        foreach(var el in param){
            cmd.Parameters.AddWithValue(el.Key,el.Value);
        }

        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
        }
        //catch { }
        finally
        {
            con.Close();
        }
    }
}