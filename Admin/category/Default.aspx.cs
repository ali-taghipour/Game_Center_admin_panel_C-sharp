using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entities;
using BLL;

public partial class Admin_category_Default : System.Web.UI.Page
{
    private categoryManager categoryManager;

    public Admin_category_Default()
    {
        categoryManager = new categoryManager();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
  
    }

    [WebMethod]
    public static category CreateTarget(string name,bool status,bool manyChoice)
    {
        var categoryManager = new categoryManager();
        return categoryManager.CreateTarget(name, status,manyChoice);
    }

    [WebMethod]
    public static category CreateSubGroup(string name, bool status,bool manyChoice,int parentId)
    {
        var categoryManager = new categoryManager();
        return categoryManager.CreateSubGroup(name, status,manyChoice, parentId);
    }

    [WebMethod]
    public static List<category> getAllCats()
    {
        var categoryManager = new categoryManager();
        return categoryManager.GetAllWithChilds(false);
    }

    [WebMethod]
    public static bool deleteCatWithChildren(int catId)
    {
        var categoryManager = new categoryManager();
        return categoryManager.DeleteCategory(catId);
    }

    [WebMethod]
    public static bool Update(string name, bool status, bool manyChoice, int catId)
    {
        var categoryManager = new categoryManager();
        return categoryManager.Update(name,status,manyChoice, catId);
    }
}