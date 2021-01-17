 using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using KargahProject.Models.ViewModels;
using Entities;
using TAD_ExtentionMethods;
using DAL;
using System.Text;
using System.IO;
using System.Text.RegularExpressions;

/// <summary>
/// Summary description for productManager
/// </summary>

namespace BLL
{
    public class productManager
    {
        private pictureManager picturesManager;
        private productRepository repo;
        public productManager()
        {
            picturesManager = new pictureManager();
            repo = new productRepository();
        }
        public bool deleteById(int productId)
        {
            var picturesList = picturesManager.getSpecialOnesById(productId);
            if (repo.deleteById(productId))
            {
                if (picturesList != null)
                {
                    foreach (var pic in picturesList)
                    {
                        var fileLargePath = HttpContext.Current.Server.MapPath(pic.largePath);
                        if (File.Exists(fileLargePath))
                        {
                            File.Delete(fileLargePath);
                        }
                        var fileThumbPath = HttpContext.Current.Server.MapPath(pic.thumbPath);
                        if (File.Exists(fileThumbPath))
                        {
                            File.Delete(fileThumbPath);
                        }
                    }
                }
                return true;
            }
            return true;
        }

        public List<product> GetAll()
        {
            DataTable DataTable = repo.getAll();
            return ToDataModel(DataTable);
        }

        public product Create(product product)
        {
            DataRow DataRow = repo.Create(product);
            return ToDataModel(DataRow);
        }
        public bool Update(product product)
        {
            return repo.Update(product);
        }

        public product getSpProductById(int productId)
        {
            DataRow DataRow = repo.getSpProduct(productId);
            return ToDataModel(DataRow);
        }

        public product ToDataModel(DataRow DataRow)
        {
            if (DataRow == null)
                return null;
            var product = new product()
            {
                id = DataRow.Field<int>("id"),
                productName = DataRow.Field<string>("pName"),
                trailer = DataRow.Field<string>("trailer"),
                describe = DataRow.Field<string>("describe"),
                existance = DataRow.Field<bool>("existance"),
                createYear = DataRow.Field<int?>("createYear"),
                productNumber = DataRow.Field<int?>("pNumber"),
                price = DataRow.Field<int>("price"),
                productLink = DataRow.Field<string>("pLink"),
                addDate = DataRow.Field<int>("addDate")
            };
            return product;
        }

        public List<product> ToDataModel(DataTable DataTable)
        {
            if (DataTable == null)
                return null;
            return DataTable.Select().Select(dr => new product
            {
                id = dr.Field<int>("id"),
                productName = dr.Field<string>("pName"),
                trailer = dr.Field<string>("trailer"),
                describe = dr.Field<string>("describe"),
                existance = dr.Field<bool>("existance"),
                createYear = dr.Field<int?>("createYear"),
                productNumber = dr.Field<int?>("pNumber"),
                price = dr.Field<int>("price"),
                productLink = dr.Field<string>("pLink"),
                addDate = dr.Field<int>("addDate"),
                mainPic = dr.Table.Columns.Contains("mainPic") ? dr.Field<string>("mainPic") : "",
            }).ToList();
        }


        public ValidateResultViewModel validate(product product, string price)
        {
            bool valide = true;
            string errors = "";

            if (string.IsNullOrEmpty(price))
            {
                errors += "لطفا قیمت را وارد کنید ... <br />";
                valide = false;
            }
            else
            {
                product.price = (int)price.GetInt();
                if (product.price < 0)
                {
                    errors += "قیمت وارد شده مجاز نیست .. <br />";
                    valide = false;
                }
            }

            if (string.IsNullOrEmpty(product.productName) || string.IsNullOrWhiteSpace(product.productName))
            {
                errors += "لطفا اسم محصول را وارد کنید ... <br />"; 
                valide = false;
            }
            else if(product.productName.Length > 50)
            {
                errors += "تعداد کارکتر وارد شده زیاد است ... <br />";
                valide = false;
            }

            if (product.existance == false && product.productNumber > 0)
            {
                errors += "تعداد موجود در انبار با موجودیت مطابقت ندارد !!! ... <br />";
                valide = false;
            }

            if (!string.IsNullOrEmpty(product.productLink))
            {
                string UrlRegx = @"^(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$";
                Regex regx = new Regex(UrlRegx);
                if (!regx.IsMatch(product.productLink))
                {
                    valide = false;
                    errors += "فرمت وارد شده برای لینک صحیح نمی باشد ... <br />";
                }
            }

            return new ValidateResultViewModel()
            {
                IsValid = valide,
                Errors = errors
            };
        }
    }
}