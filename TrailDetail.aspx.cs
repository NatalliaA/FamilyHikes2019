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
    public partial class TrailDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            //not showing the comment box for unlogged users
            if (!Request.IsAuthenticated)
            { comment_box.Visible = false; }

            //check user's previous url
            string urlName = Request.UrlReferrer.ToString();
            
            if(urlName.Contains("AddHikeConfirmation.aspx"))
            { lbl_before.Visible = true;}

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

            if (Request.QueryString["ID"] == "")
            { Response.Redirect("AllTrails.aspx"); }

            //if user comes from a diff page, it will show the comment table
            if (!IsPostBack)
            {
                //loading comments from db:
                CommentsBindData();
            }
        }

        protected void btn_tagHike_Click(object sender, EventArgs e)
        {
            string scon = ConfigurationManager.ConnectionStrings["Hikes2019ConnectionString"].ConnectionString;
            OleDbConnection oleDbConn = new OleDbConnection(scon);
            oleDbConn.Open();

            //to insert selected tag value from checkboxlist into db
            //string tagSql = "INSERT INTO TrailTagJunction(Trail_fkid,Tag_fkid) Values (@f1,@f2)";
            //foreach (ListItem tag in chbxl_tags.Items)
            //{
            //    if(tag.Selected)
            //    {            
            //            OleDbCommand tagCmd = new OleDbCommand(tagSql, oleDbConn);
            //            tagCmd.CommandType = CommandType.Text;
            //            tagCmd.Parameters.AddWithValue("@f1", Request.Params["ID"]);
            //            tagCmd.Parameters.AddWithValue("@f2", tag.Value);
            //            tagCmd.ExecuteNonQuery();
            //    }                                  
                        
            //}       
        }

        protected void CommentsBindData()
        {
            //loading comments from db:

            //make a connection with database using OleDbConnection class
            string scon = ConfigurationManager.ConnectionStrings["Hikes2019ConnectionString"].ConnectionString;
            OleDbConnection oleDbConn = new OleDbConnection(scon);

            //creating a string with temporary values for security 'injection attacks'
            String SqlString = "SELECT * FROM Comments WHERE Trail_fkid=@t1";

            //prepare command using OleDbCommand class 
            OleDbCommand cmd = new OleDbCommand(SqlString, oleDbConn);

            //you should use CommandType.Text when you want to execute one of CRUD[^] operation.
            //if your command is indeed sql then you don't need to set CommandType to text,
            //but it's probably better that you do for clarity(and in case they change the default).

            cmd.CommandType = CommandType.Text;

            //add parameters to command object
            cmd.Parameters.AddWithValue("@t1", Request.QueryString["ID"]);
            //open connection
            oleDbConn.Open();
            //var dataReader = cmd.ExecuteReader();

            OleDbDataAdapter dtAdapter = new OleDbDataAdapter();
            dtAdapter.SelectCommand = cmd;
            DataTable dt = new DataTable();

            dtAdapter.Fill(dt);
                GridView_comments.DataSource = dt;
                GridView_comments.DataBind();

         //DataReader doesnt work for programming Paging, using DataAdapter and DataTable intstead        
            //  GridView_comments.DataSource = dataReader;
            //  GridView_comments.DataBind();
            oleDbConn.Close();
        }

        //programming paging for comments gridview
              protected void GridView_comments_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView_comments.PageIndex = e.NewPageIndex;
            CommentsBindData();
        }

        protected void btn_addComment_Click(object sender, EventArgs e)
        {
            if (!Request.IsAuthenticated)
            { Response.Redirect("~/Login.aspx"); }
            else

            {//make a connection with database using OleDbConnection class
                string scon = ConfigurationManager.ConnectionStrings["Hikes2019ConnectionString"].ConnectionString;
                OleDbConnection oleDbConn = new OleDbConnection(scon);

                //creating a string with temporary values for security 'injection attacks'
                String SqlString = "INSERT INTO Comments(HikerName, Comment, Trail_fkid)" +
                "Values(@name,@com,@traiID)";

                //prepare command using OleDbCommand class 
                OleDbCommand cmd = new OleDbCommand(SqlString, oleDbConn);
                cmd.CommandType = CommandType.Text;
                oleDbConn.Open();

                //add parameters to command object
                cmd.Parameters.AddWithValue("@name", tbx_hiker.Text);
                cmd.Parameters.AddWithValue("@com", tbx_comment.Text);
                cmd.Parameters.AddWithValue("@traiID", Request.QueryString["ID"]);

                //execute command
                cmd.ExecuteNonQuery();
                oleDbConn.Close();

                //fill gridview with comments
                CommentsBindData();

                //empty textboxes after adding comment
                tbx_comment.Text = "";
                tbx_hiker.Text = "";
            }
        }
    }
}

