using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for categoryRepository
/// </summary>

namespace DAL
{
    public class categoryRepository : RepositoryBase
    {
        public categoryRepository()
        {

        }
        public bool Update(string name, bool status, bool manyChoice, int catId)
        {
            string sql = "update categories set title = @p1,status = @p2,manyChoice = @p3 where id = @p4";
            var dic = new Dictionary<string, object>();
            dic.Add("@p1", name);
            dic.Add("@p2", status);
            dic.Add("@p3", manyChoice);
            dic.Add("@p4", catId);
            return SetData(sql, CommandType.Text, dic);
        }

        public DataRow CreateSubGroup(string name, bool status, bool manyChoice, int parentId)
        {
            string sql = "insert into categories(title,status,manyChoice,catId) output inserted.* values(@p1,@p2,@p3,@p4)";
            var dic = new Dictionary<string, object>();
            dic.Add("@p1", name);
            dic.Add("@p2", status);
            dic.Add("@p3", manyChoice);
            dic.Add("@p4", parentId);
            var ds = new DataSet();
            ds = GetData(sql, CommandType.Text, dic);
            if (ds.Tables.Count > 0)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    return ds.Tables[0].Rows[0];
                }
            }

            return null;
        }

        public DataRow CreateTarget(string name, bool status, bool manyChoice)
        {
            string sql = "insert into categories(title,status,manyChoice) output inserted.* values(@p1,@p2,@p3)";
            var dic = new Dictionary<string, object>();
            dic.Add("@p1", name);
            dic.Add("@p2", status);
            dic.Add("@p3", manyChoice);
            var ds = new DataSet();
            ds = GetData(sql, CommandType.Text, dic);
            if (ds.Tables.Count > 0)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    return ds.Tables[0].Rows[0];
                }
            }

            return null;
        }

        public DataTable GetAll(bool JustIsEnabled)
        {
            string sql;
            var dic = new Dictionary<string, object>();
            if (JustIsEnabled)
            {
                sql = "select * from categories where status=@p1";
                dic.Add("@p1", true);
            }
            else
            {
                sql = "select * from categories";
            }
            var ds = new DataSet();
            ds = GetData(sql, CommandType.Text, dic);

            if (ds.Tables.Count > 0)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    return ds.Tables[0];
                }
            }

            return null;
        }

        public DataTable GetChildren(int parentId, bool JustIsEnabled)
        {
            var ds = new DataSet();
            var dic = new Dictionary<string, object>();
            string sql;
            dic.Add("@p1", parentId);
            if (JustIsEnabled)
            {
                sql = "select * from categories where catId = @p1 and status=@p2";
                dic.Add("@p2", true);
            }
            else
            {
                sql = "select * from categories where catId = @p1";
            }
            ds = GetData(sql, CommandType.Text, dic);

            if (ds.Tables.Count > 0)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    return ds.Tables[0];
                }
            }

            return null;
        }

        public int getCatParentId(int id)
        {
            var dic = new Dictionary<string, object>();
            string sql = "select * from categories where id=@p1 and catId > 0";
            dic.Add("@p1", id);
            var ds = new DataSet();
            ds = GetData(sql, CommandType.Text, dic);

            if (ds.Tables.Count > 0)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    return (int)ds.Tables[0].Rows[0][3];
                }
            }

            return 0;
        }

        public bool delete(int id)
        {
            var dic = new Dictionary<string, object>();
            string sql = "delete from categories where id=@p1";
            dic.Add("@p1", id);
            return delete(sql, dic);
        }
    }
}