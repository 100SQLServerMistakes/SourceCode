using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Reflection.Emit;

namespace SQLInjection
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source=.;Initial Catalog=SQLInjection;Integrated Security=False;Uid=sa;Pwd=Pa$$w0rd");
            string qry = "SELECT * FROM Users WHERE UserName='" + Login1.UserName + "'AND UserPassword='" + Login1.Password + "' ";
            SqlDataAdapter adapter = new SqlDataAdapter(qry, con);
            DataTable datatable = new DataTable();
            adapter.Fill(datatable);
            if (datatable.Rows.Count >= 1)
            {
                Label1.Visible = false;
                Session["Parameter"] = datatable.Rows[0].Field<string>(1);
                
                Response.Redirect("Welcome.aspx");
            }
        }
    }
}


using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SQLInjection
{
    public partial class Welcome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}
