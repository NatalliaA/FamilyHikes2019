using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FamilyHikes2019.Controls
{
    public partial class AddhikeBanner : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.IsAuthenticated)
            {
                lbl_LoginSignup.Visible = false;
            }
            else { lbl_LoginSignup.Visible = true; }
        }

        protected void btn_search_Click(object sender, EventArgs e)
        {
             Response.Redirect("~/AddHike.aspx");            
        }
    }
}