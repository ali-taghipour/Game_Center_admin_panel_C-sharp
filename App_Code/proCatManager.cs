using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using Entities;
using DAL;

/// <summary>
/// Summary description for proCatManager
/// </summary>
namespace BLL
{
    public class proCatManager
    {
        private proCatRepository repo;
        public proCatManager()
        {
            repo = new proCatRepository();
        }

        public bool delete(int proId)
        {
            return repo.delete(proId);
        }

        public List<proCat> getAllProCat(int proId)
        {
            var dataTable = repo.getAllCat(proId);
            return ToDataModel(dataTable);
        }

        public proCat CreateProCat(proCat proCat)
        {
            var dataRow = repo.CreateProCat(proCat);
            return ToDataModel(dataRow);
        }

        public proCat ToDataModel(DataRow dataRow)
        {
            if(dataRow == null)
            {
                return null;
            }

            var proCat = new proCat
            {
                catId = dataRow.Field<int>("catId"),
                productId = dataRow.Field<int>("proId")

            };

            return proCat;
        }

        public List<proCat> ToDataModel(DataTable dataTable)
        {
            if (dataTable == null)
            {
                return null;
            }

            return dataTable.Select().Select(dr => new proCat {
                id = dr.Field<int>("id"),
                catId = dr.Field<int>("catId"),
                productId = dr.Field<int>("proId")
            }).ToList();
        }
    }
}