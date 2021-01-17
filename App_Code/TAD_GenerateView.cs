using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for TAD_GenerateView
/// </summary>
namespace myGenerateView
{
    public class GenerateView
    {
        public  TableRow gnerateTableHeader(List<string> headers)
        {
            TableRow row = new TableRow();
            row.TableSection = TableRowSection.TableHeader;
            foreach(var item in headers)
            {
                TableCell cell = new TableHeaderCell();
                cell.Text = item;
                if(headers.IndexOf(item) == headers.Count() - 1)
                {
                    cell.Attributes["class"] = "edit";
                }
                row.Cells.Add(cell);
            }
            return row;
        }

        public TableRow gnerateFooterHeader(List<string> headers)
        {
            TableRow row = new TableRow();
            row.TableSection = TableRowSection.TableFooter;
            foreach (var item in headers)
            {
                TableCell cell = new TableHeaderCell();
                cell.Text = item;
                if (headers.IndexOf(item) == headers.Count() - 1)
                {
                    cell.Attributes["class"] = "edit";
                }
                row.Cells.Add(cell);
            }
            return row;
        }

      
    }
}