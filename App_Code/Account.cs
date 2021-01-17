using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Entities;
using Enums;

/// <summary>
/// Summary description for Account
/// </summary>
public class Account
{
    public Account()
    {

    }

    public int id { get; set; }
    public string userName { get; set; }
    public string userPassword { get; set; }
    public userType type { get; set; }
    public string firstName { get; set; }
    public string lastName { get; set; }
    public string fullName
    {
        get
        {
            if (!string.IsNullOrEmpty(firstName) && !string.IsNullOrEmpty(lastName))
            {
                return firstName + " " + lastName;
            }
            else
            {
                return userName;
            }
        }
    }
    public bool sex { get; set; }
    public int? age { get; set; }
    public string pic { get; set; }
    public HttpPostedFile picture { get; set; }
    public string email { get; set; }
    public string province { get; set; }
    public string city { get; set; }
    public string homeAddress { get; set; }
    public string gamerPlatform { get; set; }
    public string favoriteGendre { get; set; }
    public int? registerDate { get; set; }

}