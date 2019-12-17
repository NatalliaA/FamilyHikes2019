using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FamilyHikes2019
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //search
            if (Page.Master.FindControl("tbx_search") != null)
            {
                //get input value from master page control
                TextBox searchInput = (TextBox)Page.Master.FindControl("tbx_search");
                String inputStr = searchInput.Text;
                tbx_hiddenSearch.Text = inputStr;
                lb_filter.Text = inputStr;
                searchInput.Text = string.Empty;
            }
        }
    }
}