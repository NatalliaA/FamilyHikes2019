using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FamilyHikes2019
{
    public partial class Videos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //make invisible search option
            TextBox searchMaster = (TextBox)Master.FindControl("tbx_search");
            Button buttonMaster = (Button)Master.FindControl("btn_search");
            searchMaster.Visible = false;
            buttonMaster.Visible = false;
        }
    }
}