using Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using TAD_Security;


namespace DAL
{
    /// <summary>
    /// Summary description for ProductRepository
    /// </summary>
    public class productRepository : RepositoryBase
    {
        public productRepository()
        {

        }

        public DataTable getAll()
        {
            string cmdText = "select product.*,pictures.thumbPath as mainPic from product left join pictures on isMain = 1 and proId = product.id order by product.id desc";
            var cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = cmdText;
            var ds = GetData(cmd);

            if (ds.Tables.Count > 0)
            {
                return ds.Tables[0];
            }
            return null;
        }

        public DataRow Create(product product)
        {
            string cmdText = "insert into product (pName,trailer,describe,existance,createYear,pNumber,price,pLink,addDate) OUTPUT Inserted.* "
                                      + "values (@p1,@p5,@p6,@p7,@p8,@p9,@p10,@p11,@p12)";
            var Params = new Dictionary<string, object>();
            Params.Add("@p1", product.productName);
            Params.Add("@p5", product.trailer);
            Params.Add("@p6", product.describe);
            Params.Add("@p7", product.existance);
            Params.Add("@p8", product.createYear);
            Params.Add("@p9", product.productNumber);
            Params.Add("@p10", product.price);
            Params.Add("@p11", product.productLink);
            Params.Add("@p12", product.addDate);

            var ds = GetData(cmdText, CommandType.Text, Params);
            if (ds.Tables.Count > 0)
                if (ds.Tables[0].Rows.Count > 0)
                    return ds.Tables[0].Rows[0];
            return null;
        }

        public bool Update(product product)
        {
            string cmdText = "update product set pName = @p1,trailer = @p5,describe = @p6,existance = @p7,createYear = @p8,pNumber = @p9,price = @p10,pLink = @p11,addDate = @p12 where id = @p13";

            var Params = new Dictionary<string, object>();
            Params.Add("@p1", product.productName);
            Params.Add("@p5", product.trailer);
            Params.Add("@p6", product.describe);
            Params.Add("@p7", product.existance);
            Params.Add("@p8", product.createYear);
            Params.Add("@p9", product.productNumber);
            Params.Add("@p10", product.price);
            Params.Add("@p11", product.productLink);
            Params.Add("@p12", product.addDate);
            Params.Add("@p13", product.id);

            return SetData(cmdText, CommandType.Text, Params);
        }

        public DataRow getSpProduct(int productId)
        {
            string text = "select * from product where id = @p1";
            var param = new Dictionary<string, object>();
            param.Add("@p1", productId);
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

        public bool deleteById(int productId)
        {
            var param = new Dictionary<string, object>();
            string text = "delete from product where id = @p1";
            param.Add("@p1",productId);
            return delete(text,param);
        }
    }
}