using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using Entities;

/// <summary>
/// Summary description for proCatRepository
/// </summary>

namespace DAL
{
    public class proCatRepository : RepositoryBase
    {
        public proCatRepository()
        {

        }

        public bool delete(int proId)
        {
            var dic = new Dictionary<string, object>();
            var sql = "delete from productCategory where proId=@p1";
            dic.Add("@p1", proId);
            return delete(sql,dic);
        }
        public DataRow CreateProCat(proCat proCat)
        {
            var dic = new Dictionary<string,object>();
            var sql = "insert into productCategory(catId,proId) output inserted.* values(@p1,@p2)";
            dic.Add("@p1",proCat.catId);
            dic.Add("@p2",proCat.productId);
            var ds = new DataSet();
            ds = GetData(sql,CommandType.Text,dic);
            if(ds == null)
            {
                return null;
            }
            if(ds.Tables.Count > 0)
            {
                if(ds.Tables[0].Rows.Count > 0)
                {
                    return ds.Tables[0].Rows[0];
                }
            }
            return null;
        }

        public DataTable getAllCat(int proId)
        {
            var dic = new Dictionary<string, object>();
            var sql = "select * from productCategory where proId = @p1";
            dic.Add("@p1", proId);
            var ds = new DataSet();
            ds = GetData(sql, CommandType.Text, dic);
            if (ds == null)
            {
                return null;
            }
            if (ds.Tables.Count > 0)
            {
                return ds.Tables[0];
            }
            return null;
        }
    }
}