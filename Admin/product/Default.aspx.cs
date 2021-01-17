using System;
using BLL;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using myGenerateView;
using Entities;

public partial class Admin_product_Default : System.Web.UI.Page
{
    private productManager productManager;
    public Admin_product_Default()
    {
        productManager = new productManager();
    }
    Table table = new Table();
    protected void Page_Load(object sender, EventArgs e)
    {
        table.ID = "example1";
        table.Attributes["class"] = "table table-bordered table-striped";
        tableBox.Controls.Add(table);

        List<string> headers = new List<string>()
        { "تصویر بازی","اسم بازی","تعداد موجود در انبار","سال ساخت","ویرایش و حذف" };
        var generateView = new GenerateView();
        var tableHeader = generateView.gnerateTableHeader(headers);
        table.Rows.Add(tableHeader);
        generateTableBody();
        var footerHeader = generateView.gnerateFooterHeader(headers);
        table.Rows.Add(footerHeader);

    }

    public void generateTableBody()
    {
        var list = productManager.GetAll();

        foreach (var item in list)
        {
            var row = new TableRow();
            row.TableSection = TableRowSection.TableBody;

            // img
            var cell = new TableCell();
            HtmlImage img = new HtmlImage();
            img.Src = item.mainPic != null ? "~/" + item.mainPic : "~/1.jpg";
            cell.Controls.Add(img);
            row.Cells.Add(cell);

            // product name
            var cell_1 = new TableCell();
            cell_1.Text = item.productName;
            row.Cells.Add(cell_1);

            // product number
            var cell_3 = new TableCell();
            cell_3.Text = item.productNumber.ToString();
            row.Cells.Add(cell_3);

            // product createYear
            var cell_4 = new TableCell();
            cell_4.Text = item.createYear.ToString();
            row.Cells.Add(cell_4);

            // edit and delete
            var cell_5 = new TableCell();
            HtmlGenericControl ul = new HtmlGenericControl("ul");
            HtmlGenericControl del = new HtmlGenericControl("li");
            del.Attributes["class"] = "del";
            del.Style["list-style"] = "none";
            del.Style["float"] = "left";
            del.Style["cursor"] = "pointer";
            del.Attributes["rel"] = item.id.ToString();
            HtmlGenericControl del_icon = new HtmlGenericControl("i");
            del_icon.Attributes["class"] = "glyphicon glyphicon-remove";
            del.Controls.Add(del_icon);
            ul.Controls.Add(del);
            HtmlGenericControl edit = new HtmlGenericControl("li");
            edit.Attributes["class"] = "edit";
            edit.Style["list-style"] = "none";
            edit.Style["cursor"] = "pointer";
            HtmlAnchor anc = new HtmlAnchor();
            anc.HRef = "Edit.aspx?id=" + item.id;
            HtmlGenericControl edit_icon = new HtmlGenericControl("i");
            edit_icon.Attributes["class"] = "glyphicon glyphicon-scissors";
            anc.Controls.Add(edit_icon);
            edit.Controls.Add(anc);
            ul.Controls.Add(edit);
            cell_5.Controls.Add(ul);
            row.Cells.Add(cell_5);

            table.Rows.Add(row);
        }
    }

    [WebMethod]
    public static bool deleteProduct(int? productId)
    {
        if (productId == null)
        {
            return false;
        }
        productManager productManager = new productManager();
        return productManager.deleteById((int)productId);
    }
}
