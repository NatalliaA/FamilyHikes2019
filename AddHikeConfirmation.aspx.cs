using System;
using System.Web.UI.WebControls;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;


namespace FamilyHikes2019
{
    public partial class AddHikeConfirmation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            //make invisible search option
            TextBox searchMaster = (TextBox)Master.FindControl("tbx_search");
            Button buttonMaster = (Button)Master.FindControl("btn_search");
            searchMaster.Visible = false;
            buttonMaster.Visible = false;
        }

        //protected void ValidateTagsList(object source, ServerValidateEventArgs args)

        //{
        //    int count = 0;
        //    foreach (ListItem item in chbxl_tags.Items)
        //    {
        //        if (item.Selected)
        //        {
        //            count++;
        //            break;
        //        }
        //    }

        //    if (count > 0)
        //        args.IsValid = true;
        //    else
        //        args.IsValid = false;
        //}

        
        protected void btn_tagHike_Click(object sender, EventArgs e)
        {
           
            string scon = ConfigurationManager.ConnectionStrings["Hikes2019ConnectionString"].ConnectionString;
            OleDbConnection oleDbConn = new OleDbConnection(scon);
            oleDbConn.Open();

            //get trail id
            Label hikeId = (Label)DataListTrail.Items[0].FindControl("hike_ID");
            //hike id from db
            int hike = Int32.Parse(hikeId.Text);
            //to insert selected tag value from checkboxlist into db
            string tagSql = "INSERT INTO TrailTagJunction(Trail_fkid,Tag_fkid) Values (@f1,@f2)";
            foreach (ListItem tag in chbxl_tags.Items)
            {
                if (tag.Selected)
                {
                    OleDbCommand tagCmd = new OleDbCommand(tagSql, oleDbConn);
                    tagCmd.CommandType = CommandType.Text;
                    tagCmd.Parameters.AddWithValue("@f1", hike);
                    tagCmd.Parameters.AddWithValue("@f2", tag.Value);
                    tagCmd.ExecuteNonQuery();
                }
            }            
            //thankyou.Visible = true;
            //tags_form.Visible = false;
            Response.Redirect("~/TrailDetail.aspx?ID="+hike);
        }
    }
}