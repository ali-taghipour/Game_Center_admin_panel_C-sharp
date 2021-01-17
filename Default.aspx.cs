using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

public partial class _Default : System.Web.UI.Page
{

    [WebMethod]
    public static int get_length()
    {
        return games.Count;
    }

    [WebMethod]
    public static List<game> getAll(string st, string cu)
    {
        int s = Convert.ToInt32(st);
        int c = Convert.ToInt32(cu);

        if (s + c > games.Count)
        {
            c = games.Count - s;
        }

        return games.GetRange(s, c);
    }
    public class game
    {
        public string name;
        public string pic;
        public double star;
        public int price;

        public game(string name, string pic, double star, int price)
        {
            this.name = name;
            this.pic = pic;
            this.star = star;
            this.price = price;
        }
    }
    public static List<game> games = new List<game>();
    protected void Page_Load(object sender, EventArgs e)
    {
        games.Clear();

        games.Add(new game("Ac collection", "Ac collection.jpg", 3, 80));
        games.Add(new game("Ac", "Ac.jpg", 2.5, 50));
        games.Add(new game("bache bazi", "bache bazi.jpg", 1.5, 10));
        games.Add(new game("Batman", "Batman.jpg", 3.2, 120));
        games.Add(new game("Battelfield 2", "Battelfield 2.jpg", 4.6, 150));
        games.Add(new game("Battelfield", "Battelfield.jpg", 2.2, 104));
        games.Add(new game("Black ops", "Black ops.jpg", 2.8, 42));
        games.Add(new game("Btf 3", "Btf 3.jpg", 3.7, 94));
        games.Add(new game("Collection", "Collection.jpg", 4.4, 147));
        games.Add(new game("Crisis 2", "Crisis 2.jpg", 2.8, 52));
        games.Add(new game("Crisis 3", "Crisis 3.jpg", 2.1, 84));
        games.Add(new game("Crisis", "Crisis.jpg", 3.4, 67));
        games.Add(new game("Division", "Division.jpg", 3.8, 72));
        games.Add(new game("Driver", "Driver.jpg", 4.1, 145));
        games.Add(new game("God of war 2", "God of war 2.jpg", 3.8, 95));
        games.Add(new game("God of war", "God of war.jpg", 2.5, 64));
        games.Add(new game("Ironman", "Ironman.jpg", 3.6, 128));
        games.Add(new game("khale tarsnak", "khale tarsnak.jpg", 4, 75));
        games.Add(new game("mozakhraf", "mozakhraf.jpg", 4.2, 170));
        games.Add(new game("MW3", "MW3.jpg", 4.4, 134));
        games.Add(new game("nadombe", "nadombe.jpg", 2.1, 84));
        games.Add(new game("Need for speed 2", "Need for speed 2.jpg", 2.1, 84));
        games.Add(new game("Need for speed", "Need for speed.jpg", 2.1, 84));
        games.Add(new game("Nfs rivals", "Nfs rivals.jpg", 2.1, 84));
        games.Add(new game("Nfs run", "Nfs run.jpg", 2.1, 84));
        games.Add(new game("Quantum break", "Quantum break.jpg", 2.1, 84));
        games.Add(new game("Scary", "Scary.jpg", 2.1, 84));
        games.Add(new game("Star games", "Star games.jpg", 2.1, 84));


        games.Add(new game("Ac collection", "Ac collection.jpg", 3, 80));
        games.Add(new game("Ac", "Ac.jpg", 2.5, 50));
        games.Add(new game("bache bazi", "bache bazi.jpg", 1.5, 10));
        games.Add(new game("Batman", "Batman.jpg", 3.2, 120));
        games.Add(new game("Battelfield 2", "Battelfield 2.jpg", 4.6, 150));
        games.Add(new game("Battelfield", "Battelfield.jpg", 2.2, 104));
        games.Add(new game("Black ops", "Black ops.jpg", 2.8, 42));
        games.Add(new game("Btf 3", "Btf 3.jpg", 3.7, 94));
        games.Add(new game("Collection", "Collection.jpg", 4.4, 147));
        games.Add(new game("Crisis 2", "Crisis 2.jpg", 2.8, 52));
        games.Add(new game("Crisis 3", "Crisis 3.jpg", 2.1, 84));
        games.Add(new game("Crisis", "Crisis.jpg", 3.4, 67));
        games.Add(new game("Division", "Division.jpg", 3.8, 72));
        games.Add(new game("Driver", "Driver.jpg", 4.1, 145));
        games.Add(new game("God of war 2", "God of war 2.jpg", 3.8, 95));
        games.Add(new game("God of war", "God of war.jpg", 2.5, 64));
        games.Add(new game("Ironman", "Ironman.jpg", 3.6, 128));
        games.Add(new game("khale tarsnak", "khale tarsnak.jpg", 4, 75));
        games.Add(new game("mozakhraf", "mozakhraf.jpg", 4.2, 170));
        games.Add(new game("MW3", "MW3.jpg", 4.4, 134));
        games.Add(new game("nadombe", "nadombe.jpg", 2.1, 84));
        games.Add(new game("Need for speed 2", "Need for speed 2.jpg", 2.1, 84));
        games.Add(new game("Need for speed", "Need for speed.jpg", 2.1, 84));
        games.Add(new game("Nfs rivals", "Nfs rivals.jpg", 2.1, 84));
        games.Add(new game("Nfs run", "Nfs run.jpg", 2.1, 84));
        games.Add(new game("Quantum break", "Quantum break.jpg", 2.1, 84));
        games.Add(new game("Scary", "Scary.jpg", 2.1, 84));
        games.Add(new game("Star games", "Star games.jpg", 2.1, 84));

        games.Add(new game("Ac collection", "Ac collection.jpg", 3, 80));
        games.Add(new game("Ac", "Ac.jpg", 2.5, 50));
        games.Add(new game("bache bazi", "bache bazi.jpg", 1.5, 10));
        games.Add(new game("Batman", "Batman.jpg", 3.2, 120));
        games.Add(new game("Battelfield 2", "Battelfield 2.jpg", 4.6, 150));
        games.Add(new game("Battelfield", "Battelfield.jpg", 2.2, 104));
        games.Add(new game("Black ops", "Black ops.jpg", 2.8, 42));
        games.Add(new game("Btf 3", "Btf 3.jpg", 3.7, 94));
        games.Add(new game("Collection", "Collection.jpg", 4.4, 147));
        games.Add(new game("Crisis 2", "Crisis 2.jpg", 2.8, 52));
        games.Add(new game("Crisis 3", "Crisis 3.jpg", 2.1, 84));
        games.Add(new game("Crisis", "Crisis.jpg", 3.4, 67));
        games.Add(new game("Division", "Division.jpg", 3.8, 72));
        games.Add(new game("Driver", "Driver.jpg", 4.1, 145));
        games.Add(new game("God of war 2", "God of war 2.jpg", 3.8, 95));
        games.Add(new game("God of war", "God of war.jpg", 2.5, 64));
        games.Add(new game("Ironman", "Ironman.jpg", 3.6, 128));
        games.Add(new game("khale tarsnak", "khale tarsnak.jpg", 4, 75));
        games.Add(new game("mozakhraf", "mozakhraf.jpg", 4.2, 170));
        games.Add(new game("MW3", "MW3.jpg", 4.4, 134));
        games.Add(new game("nadombe", "nadombe.jpg", 2.1, 84));
        games.Add(new game("Need for speed 2", "Need for speed 2.jpg", 2.1, 84));
        games.Add(new game("Need for speed", "Need for speed.jpg", 2.1, 84));
        games.Add(new game("Nfs rivals", "Nfs rivals.jpg", 2.1, 84));
        games.Add(new game("Nfs run", "Nfs run.jpg", 2.1, 84));
        games.Add(new game("Quantum break", "Quantum break.jpg", 2.1, 84));
        games.Add(new game("Scary", "Scary.jpg", 2.1, 84));
        games.Add(new game("Star games", "Star games.jpg", 2.1, 84));

    }
}