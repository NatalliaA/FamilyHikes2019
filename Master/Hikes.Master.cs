using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FamilyHikes2019.Master
{
    public partial class Hikes : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           ContentPlaceHolderSearch.Visible = false;           
        }

        protected void btn_search_Click(object sender, EventArgs e)
        {   //hide all trails list
            ContentPlaceHolder1.Visible = false;
            //show only search results
            ContentPlaceHolderSearch.Visible = true;                    
        }
    }
}