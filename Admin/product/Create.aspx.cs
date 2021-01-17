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
public partial class Admin_product_Create : System.Web.UI.Page
{ 
    private productManager productManager;
    private proCatManager proCatManager;
    public static List<proCat> category;

    public Admin_product_Create()
    {
        productManager = new productManager();
        proCatManager = new proCatManager();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    [WebMethod]
    public static void getCategory(List<proCat> cat)
    {
        category = cat;
    }
    protected void submit_click(object sender, EventArgs e)
    {
        product product = new product()
        {
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
        product outPro = productManager.Create(product);
        if (outPro == null)
        {
            error.InnerHtml = "ثبت کاربر با خطا همراه بوده است!";
            return;
        }
        else
        {
            error.InnerHtml = "ثبت موفقیت آمیز";
        }
        if(category != null && category.Count > 0)
        {
            foreach(var item in category)
            {
                item.productId = outPro.id;
                proCatManager.CreateProCat(item);
            }
        }

        if (Request.Files.Count > 0)
        {
            pictureManager pictureManager = new pictureManager();
            pictureManager.uploadAllPics(outPro.id, Request.Files);
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
    public static List<category> GetAllCategory()
    {
        var categoryManager = new categoryManager();
        return categoryManager.GetAllWithChilds(true);
    }
}