using System;
using System.Data.OleDb;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;

namespace FamilyHikes2019
{
    public partial class AddHike : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
           //show different content depending on login status
            if (!Request.IsAuthenticated)
            {
                lbl_loginFirst.Visible = true;
                addHike_form.Visible = false;
                
            }
            else
            { lbl_loginFirst.Visible = false;
                addHike_form.Visible = true;
                
            }
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

        protected void btn_addHike_Click(object sender, EventArgs e)
        {
            //randomizing image file name,  unique identifier GUID
            System.Guid myGUID = Guid.NewGuid();
            String newFileName = myGUID.ToString() + ".jpg";

            if (fup_picture.HasFile)
            {
                fup_picture.SaveAs(Request.MapPath("pictures") + "/" + newFileName);
            }
            if ((tbx_trailName.Text).Length != 0
                 && ddl_state.SelectedIndex > 0
                   && fup_picture.HasFile == true
                     && (tbx_location.Text).Length != 0
                      && (tbx_trailFeatures.Text).Length != 0 
                     
                && (tbx_length.Text).Length != 0
                 && (tbx_time.Text).Length != 0
                   && (rbt_difficulty.SelectedValue).Length != 0
                && (tbx_description.Text).Length != 0               
                && (tbx_tipps.Text).Length != 0
                && (tbx_tipps.Text).Length != 0)
                
            {
                //make a connection with database using OleDbConnection class
                string scon = ConfigurationManager.ConnectionStrings["Hikes2019ConnectionString"].ConnectionString;
                OleDbConnection oleDbConn = new OleDbConnection(scon);

                //creating a string with temporary values for security 'injection attacks'
                String SqlString = "INSERT INTO " +
                    "HikesList(TrailName,State,Pictures,Location,TrailFeatures,Length,Duration,Difficulty,Description,Tipps,Author,AddingDay)" +
                    " Values (@f1,@f2,@f3,@f4,@f5,@f6,@f7, @f8, @f9, @f10, @f11, @f12)";

                //prepare command using OleDbCommand class 
                OleDbCommand cmd = new OleDbCommand(SqlString, oleDbConn);
                cmd.CommandType = CommandType.Text;
                oleDbConn.Open();
                cmd.Parameters.AddWithValue("@f1", tbx_trailName.Text);
                cmd.Parameters.AddWithValue("@f2", ddl_state.SelectedValue);
                cmd.Parameters.AddWithValue("@f3", "pictures/" + newFileName);
                cmd.Parameters.AddWithValue("@f4", tbx_location.Text);
                cmd.Parameters.AddWithValue("@f5", tbx_trailFeatures.Text);
                cmd.Parameters.AddWithValue("@f6", tbx_length.Text);
                cmd.Parameters.AddWithValue("@f7", tbx_time.Text);
                cmd.Parameters.AddWithValue("@f8", rbt_difficulty.SelectedValue);
                cmd.Parameters.AddWithValue("@f9", tbx_description.Text);
                cmd.Parameters.AddWithValue("@f10", tbx_tipps.Text);
                cmd.Parameters.AddWithValue("@f11", User.Identity.Name);
                cmd.Parameters.AddWithValue("@f12", DateTime.Today);

                //execute command
                cmd.ExecuteNonQuery();
                oleDbConn.Close();

                Response.Redirect("~/AddHikeConfirmation.aspx");
            }
            else

            { lbl_checkInput.Text = "* Please fill in all fields.";
                lbl_checkInput.Visible = true;
            }
        }
    }
}