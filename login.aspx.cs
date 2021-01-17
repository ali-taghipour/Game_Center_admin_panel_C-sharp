using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;
using Entities;

using System.Text;
using System.Text.RegularExpressions;


public partial class login : System.Web.UI.Page
{
    string cs = WebConfigurationManager.ConnectionStrings["con"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (errore0.InnerHtml == "")
        {
            form1.Style["display"] = "none";
            form2.Style["display"] = "block";
        }
        else
        {
            form2.Style["display"] = "none";
            form1.Style["display"] = "block";
        }
    }

    protected void sign_up(object sender, EventArgs e)
    {
        errore1.InnerHtml = "";

        // role
        errore0.InnerHtml = "";
        int role = 0;

        // role for user name
        Match m1 = Regex.Match(sign_name.Value, @"^[A-Za-z0-9]+(?:[ _-][A-Za-z0-9]+)*$");

        if (!m1.Success || sign_name.Value == "null")
        {
            errore0.InnerHtml += "فرمت نام کاربری اشتباه است <br />";
            role = 1;
        }

        //role for email
        Match m2 = Regex.Match(sign_email.Value, @"^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$");

        if (!m2.Success || sign_email.Value == "null")
        {
            errore0.InnerHtml += "فرمت ایمیل نادرست است <br />";
            role = 1;
        }

        // roll for password
        Match m3 = Regex.Match(sign_pass.Value, @"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$");

        if (!m3.Success | sign_pass.Value == "null")
        {
            errore0.InnerHtml += "فرمت رمز ورود اشتباه است  <br />";
            role = 1;
        }

        // equling pass and repass
        if (sign_pass.Value != sign_pass_repeat.Value)
        {
            errore0.InnerHtml += "رمز و تکرار رمز برابر نیستند";
            role = 1;
        }

        if (role == 1)
        {
            errore0.Style["color"] = "red";
            return;
        }

        // connection and doing task
        var connect = new SqlConnection(cs);
        var cmd = new SqlCommand("account_insert", connect);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.AddWithValue("@usname", sign_name.Value);
        cmd.Parameters.AddWithValue("@email", sign_email.Value);
        cmd.Parameters.AddWithValue("@passwo", sign_pass.Value);


        cmd.Parameters.Add("@retvalue", SqlDbType.Int).Direction = ParameterDirection.Output;

        try
        {
            connect.Open();
            cmd.ExecuteNonQuery();


            int result = (int)cmd.Parameters["@retvalue"].Value;
            //int pass = ["@passwo"].Value;
            //int passrepeat = ["@passworepeat"].Value;

            if (result == 0)
            {
                errore0.InnerHtml = "نام کاربری تکراری  ";
            }
            //else if (pass != passrepeat)
            //{
            //    error.InnerHtml = "عدم تطابق رمز ورود";
            //}
            else if ((result == 1))
            {
                errore0.InnerHtml = " با موفقیت ثبت شد  ";
                errore0.Style["color"] = "green";
            }

        }
        // catch{}
        finally
        {
            connect.Close();

        }


    }

    protected void loggin(object sender, EventArgs e)
    {
        errore0.InnerHtml = "";

        var connect = new SqlConnection(cs);
        var cmd = new SqlCommand("account_verify", connect);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.AddWithValue("@usname", log_uEmail.Value);
        cmd.Parameters.AddWithValue("@passwo", log_pass.Value);


        cmd.Parameters.Add("@retvalue", SqlDbType.Int).Direction = ParameterDirection.Output;
        cmd.Parameters.Add("@userType", SqlDbType.NVarChar, 50).Direction = ParameterDirection.Output;
        cmd.Parameters.Add("@id", SqlDbType.Int).Direction = ParameterDirection.Output;
        try
        {
            connect.Open();
            cmd.ExecuteNonQuery();

            int result = (int)cmd.Parameters["@retvalue"].Value;

            //int pass = ["@passwo"].Value;
            //int passrepeat = ["@passworepeat"].Value;

            if (result == 0)
            {
                errore1.InnerHtml = "مطابقت ندارد";
                errore1.Style["color"] = "red";
            }
            //else if (pass != passrepeat)
            //{
            //    error.InnerHtml = "عدم تطابق رمز ورود";
            //}
            else if (result == 1)
            {
                string userType = cmd.Parameters["@userType"].Value.ToString();
                int id = (int)cmd.Parameters["@id"].Value;

                if (Request.Cookies["user"] != null)
                {
                    Request.Cookies.Remove("user");
                }

                HttpCookie cookie = new HttpCookie("user");
                cookie.Expires = DateTime.Now.AddDays(1);
                cookie.Values["id"] = id.ToString();
                cookie.Values["userType"] = userType;
                Response.Cookies.Add(cookie);


                Session["log"] = Request.Cookies["user"]["id"];

                if (userType == "admin")
                {
                    Response.Redirect("#");
                }
                else if (userType == "user")
                {
                    Response.Redirect("~/Admin/Dashboard.aspx");
                }
            }

        }
        // catch{}
        finally
        {
            connect.Close();

        }

    }
}