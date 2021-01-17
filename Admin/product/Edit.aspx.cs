using BLL;
using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using KargahProject.Models.ViewModels;
using TAD_ExtentionMethods;
using TAD;

public partial class Admin_product_Edit : System.Web.UI.Page
{
    private productManager productManager;
    public static int? id;
    private proCatManager proCatManager;
    public static List<proCat> category;

    public Admin_product_Edit()
    {
        productManager = new productManager();
        proCatManager = new proCatManager();
    }

    [WebMethod]
    public static void getCategory(List<proCat> cat)
    {
        category = cat;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        id = Request.QueryString["id"].GetInt();
        if (!this.IsPostBack) {
            if (id != null)
            {
                var product = productManager.getSpProductById((int)id);
                pname.Value = product.productName;
                description.Value = product.describe;
                exist.Checked = product.existance;
                price.Value = product.price.ToString();
                createYear.Value = product.createYear.ToString();
                pnumber.Value = product.productNumber.ToString();
                plink.Value = product.productLink;
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }
        
    }

    protected void submit_click(object sender, EventArgs e)
    {
        product product = new product()
        {
            id = id ?? 0,
            productName = pname.Value,
            //trailer = gettingFile.getTrailer("ctl00$CPH1$pro_triler"),
            trailer = "",
            describe = description.Value,
            existance = exist.Checked,
            createYear = createYear.Value.GetInt(),
            productNumber = pnumber.Value.GetInt(),
            productLink = plink.Value,
            addDate = time.nowTime()
        };
        ValidateResultViewModel result = productManager.validate(product, price.Value);
        if (!result.IsValid)
        {
            error.InnerHtml = result.Errors;
            return;
        }
        product.price = (int)price.Value.GetInt();
        bool outPro = productManager.Update(product);
        if (outPro == false)
        {
            error.InnerHtml = "ثبت کاربر با خطا همراه بوده است!";
            return;
        }
        else
        {
            proCatManager.delete((int)id);
            if (category != null && category.Count > 0)
            {
                foreach (var item in category)
                {
                    item.productId = (int)id;
                    proCatManager.CreateProCat(item);
                }
            }
            error.InnerHtml = "ثبت موفقیت آمیز";
        }

        if (Request.Files.Count > 0)
        {
            pictureManager pictureManager = new pictureManager();
            pictureManager.uploadAllPics(product.id, Request.Files);
        }
        ////کپچا

        //string[] amounts = Request.Form.GetValues("g-recaptcha-response");
        //var CaptchaRes = CheckCaptcha(amounts[0]);
        //if (!CaptchaRes.IsValid)
        //{
        //    error.InnerHtml = CaptchaRes.Errors;
        //    error.Attributes["class"] = "show-error";
        //    return;
        //}

        Response.Redirect("Default.aspx");

    }

    /// چک کردن کپچا
    /// </summary>
    /// <returns></returns>
    public ValidateResultViewModel CheckCaptcha(string CaptchaValue)
    {
        //تایید کلیک بر روی من ربات نیستم
        CaptchaManager CaptchaManager = new CaptchaManager();
        if (string.IsNullOrWhiteSpace(CaptchaValue))
            return new ValidateResultViewModel()
            {
                IsValid = false,
                Errors = "بر روی \"من ربات نیستم\" کلیک کنید."
            };

        ReCaptchaResponse reCaptchaResponse = CaptchaManager.VerifyCaptcha("6Lddd5MUAAAAABMcq_sYEmcf5ubOJJHf0rLEZO3F", CaptchaValue);
        if (reCaptchaResponse == null || !reCaptchaResponse.success)
            return new ValidateResultViewModel()
            {
                IsValid = false,
                Errors = "ربات نبودن شما تأیید نشد. مجدداً امتحان کنید."
            };

        return new ValidateResultViewModel()
        {
            IsValid = true
        };
    }

    [WebMethod]
    public static List<pictures> pictureslargepathsrc()
    {
        var pictureManager = new pictureManager();
        return pictureManager.getSpecialOnesById((int)id);
    }

    [WebMethod]
    public static bool deletePicByLargePath(string largePath)
    {
        var pictureManager = new pictureManager();
        return pictureManager.deleteSpPic(largePath);
    }

    [WebMethod]
    public static bool updatePicByLargePath(string largePath,bool isMain)
    {
        var pictureManager = new pictureManager();
        return pictureManager.updateSpPicToMain(largePath, isMain,(int)id);
    }

    [WebMethod]
    public static List<category> GetAllCategory()
    {
        var categoryManager = new categoryManager();
        return categoryManager.GetAllWithChilds(true);
    }

    [WebMethod]
    public static List<proCat> proCatToChoose()
    {
        var proCatManager = new proCatManager();
        return proCatManager.getAllProCat((int)id);
    }
}