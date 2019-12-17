using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FamilyHikes2019
{
    public partial class TrailByTag : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //take the tag value from gridview and display in label
            string tag = GridView_HikeByTag.Rows[0].Cells[0].Text;
            lb_tag.Text = tag;
            //acces column Tag and hide it from page
            GridView_HikeByTag.Columns[0].Visible = false;

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