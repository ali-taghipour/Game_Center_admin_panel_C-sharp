using System;
using Entities;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;


/// <summary>
/// Summary description for pictureRepository
/// </summary>
namespace DAL
{
    public class pictureRepository : RepositoryBase
    {
        public pictureRepository()
        {
            
        }

        public bool Create(pictures picture)
        {
            string cmdText = "insert into pictures (thumbPath,largePath,isMain,addDate,proId) values(@p1,@p2,@p3,@p4,@p5)";
            var Params = new Dictionary<string, object>();
            Params.Add("@p1", picture.thumbPath);
            Params.Add("@p2", picture.largePath);
            Params.Add("@p3", picture.isMain);
            Params.Add("@p4", picture.addDate);
            Params.Add("@p5", picture.productId);

            return SetData(cmdText, CommandType.Text, Params);
        }

        public DataTable getSpPics(int productId)
        {
            string text = "select * from pictures where proId = @p1";
            var param = new Dictionary<string,object>();
            param.Add("@p1",productId);
            var ds = new DataSet();
            ds = GetData(text,CommandType.Text,param);
            if(ds == null)
            {
                return null;
            }
            if(ds.Tables.Count > 0)
            {
                if(ds.Tables[0].Rows.Count > 0)
                {
                    return ds.Tables[0];
                }
            }
            return null;
        }

        public DataRow getSpPic(string largePath)
        {
            string text = "select * from pictures where largePath = @p1";
            var param = new Dictionary<string, object>();
            param.Add("@p1", largePath);
            var ds = new DataSet();
            ds = GetData(text, CommandType.Text, param);
            if (ds == null)
            {
                return null;
            }
            if (ds.Tables.Count > 0)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    return ds.Tables[0].Rows[0];
                }
            }
            return null;
        }

        public bool deleteSpPic(string largePath)
        {
            var dic = new Dictionary<string, object>();
            string sql = "delete from pictures where largePath = @p1";
            dic.Add("@p1", largePath);
            return delete(sql,dic);
        }
        public bool updateSpPicsToNotMain(int productId)
        {
            var dic = new Dictionary<string, object>();
            string sql = "update pictures set isMain = @p1 where isMain = @p2 and proId = @p3";
            dic.Add("@p1", false);
            dic.Add("@p2", true);
            dic.Add("@p3",productId);
            return SetData(sql, CommandType.Text, dic);
        }
        public bool updateSpPicToMain(string largePath,bool isMain)
        {
            var dic = new Dictionary<string, object>();
            string sql = "update pictures set isMain = @p1 where largePath = @p2";
            dic.Add("@p1", isMain);
            dic.Add("@p2", largePath);
            return SetData(sql,CommandType.Text, dic);
        }
    }
}
