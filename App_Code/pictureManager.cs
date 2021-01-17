using System;
using DAL;
using Entities;
using TAD_ExtentionMethods;
using TAD_ImageResizer;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.IO;


/// <summary>
/// Summary description for pictureManager
/// </summary>
namespace BLL
{
    public class pictureManager
    {
        private pictureRepository repo;
        public pictureManager()
        {
            repo = new pictureRepository();
        }

        public bool updateSpPicToMain(string largePath,bool isMain,int productId)
        {
            var flag = true;
            if (isMain)
            {
                flag = repo.updateSpPicsToNotMain(productId);
            }
            flag = repo.updateSpPicToMain(largePath, isMain);
            return flag;
        }

        public bool deleteSpPic(string largePath)
        {
            var pic = getSpecialOne(largePath);
            var picLargePath = HttpContext.Current.Server.MapPath("~/" + pic.largePath);
            var picThumbPath = HttpContext.Current.Server.MapPath("~/" + pic.thumbPath);
            if (repo.deleteSpPic(largePath))
            {
                if (File.Exists(picLargePath))
                {
                    File.Delete(picLargePath);
                }
                if (File.Exists(picThumbPath))
                {
                    File.Delete(picThumbPath);
                }
                return true;
            }
            return false;
        }

        public void uploadAllPics(int productId, HttpFileCollection files)
        {
            for (int i = 0; i < files.Count; i++)
            {
                if (files[i] != null && files[i].ContentLength > 0 && files[i].IsImage())
                {
                    var picture = new pictures()
                    {
                        productId = productId,
                        addDate = time.nowTime(),
                        isMain = false
                    };
                    Create(picture, files[i]);
                }
            }
        }


        public bool Create(pictures picture, HttpPostedFile file)
        {
            string fileName = Guid.NewGuid().ToString().GetImgUrlFriendly();
            string largeName = fileName + file.GetExtention();
            string thumbName = fileName + "-" + "th" + file.GetExtention();

            string largePath = "images/Uploads/large/" + largeName;
            string thumbPath = "images/Uploads/thumbs/" + thumbName;

            picture.largePath = largePath;
            picture.thumbPath = thumbPath;

            largePath = "~/images/Uploads/large/" + largeName;
            thumbPath = "~/images/Uploads/thumbs/" + thumbName;


            file.SaveAs(HttpContext.Current.Server.MapPath(largePath));
            file.SaveAs(HttpContext.Current.Server.MapPath(thumbPath));

            //resize
            ImageResizer.OnlyResizeImage(HttpContext.Current.Server.MapPath(largePath), HttpContext.Current.Server.MapPath(largePath), 800, 400, 90);
            //crop
            ImageResizer.ResizeImage(HttpContext.Current.Server.MapPath(thumbPath), HttpContext.Current.Server.MapPath(thumbPath), 360, 240, 90);

            picture.addDate = time.nowTime();

            return repo.Create(picture);
        }

        public List<pictures> getSpecialOnesById(int productId)
        {
            DataTable pictures = new DataTable();
            pictures = repo.getSpPics(productId);
            return toDataModel(pictures);
        }

        public pictures getSpecialOne(string largePath)
        {
            DataRow dataRow = repo.getSpPic(largePath);
            return toDataModel(dataRow);
        }

        public pictures toDataModel(DataRow dataRow)
        {
            if (dataRow == null)
            {
                return null;
            }
            var picture = new pictures()
            {
                largePath = dataRow.Field<string>("largePath"),
                thumbPath = dataRow.Field<string>("thumbPath"),
                isMain = dataRow.Field<bool>("isMain")
            };
            return picture;
        }

        public List<pictures> toDataModel(DataTable pictures)
        {
            if(pictures == null)
            {
                return null;
            }
            return pictures.Select().Select(dr => new pictures {
                id = dr.Field<int>("id"),
                largePath = dr.Field<string>("largePath"),
                thumbPath = dr.Field<string>("thumbPath"),
                isMain = dr.Field<bool>("isMain"),
                addDate = dr.Field<int>("addDate")
            }).ToList();
        }

    }
}

