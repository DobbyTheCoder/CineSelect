using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.IO;

/// <summary>
/// Summary description for returnMovie
/// </summary>
public class returnMovie
{
    private static void start_get()
    {
        HttpWebRequest WebReq = (HttpWebRequest)WebRequest.Create(string.Format("http://www.omdbapi.com/?apikey=84739f5e&t=lost"));

        WebReq.Method = "GET";

        HttpWebResponse WebResp = (HttpWebResponse)WebReq.GetResponse();

        Console.WriteLine(WebResp.StatusCode);
        Console.WriteLine(WebResp.Server);

        string jsonString;
        using (Stream stream = WebResp.GetResponseStream())   //modified from your code since the using statement disposes the stream automatically when done
        {
            StreamReader reader = new StreamReader(stream, System.Text.Encoding.UTF8);
            jsonString = reader.ReadToEnd();
        }

        movies item = JsonConvert.DeserializeObject<movies>(jsonString);

        Console.WriteLine(item.imdbID);     //returns 921, the number of items on that page
    }
}

public class movies
{
    public string imdbID { set; get; }
}