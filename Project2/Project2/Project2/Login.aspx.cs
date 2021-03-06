using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Security.Cryptography;
using System.Data.SqlClient;


namespace Project2
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            Response.Redirect("Create.aspx");
        }

        public string generateHash (byte [] stuffToHash ,byte []salt)
        {
            var byteRes = new Rfc2898DeriveBytes(stuffToHash, salt, 10000);
            return Convert.ToBase64String(byteRes.GetBytes(24));
        }
        public string generateSalt()
        {
            var bytes = new byte[128 / 8];
            var rng = new RNGCryptoServiceProvider();
            rng.GetBytes(bytes);
            return Convert.ToBase64String(bytes);
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(txtPW.Text)&&!String.IsNullOrEmpty(txtUsrName.Text))
            {
                lblErr.Visible = false;
                var pw = txtPW.Text;
                var newSalt = generateSalt();
                var hashedPW = generateHash(Encoding.UTF8.GetBytes(pw), Encoding.UTF8.GetBytes(newSalt));
                var qstring = hashedPW;
                string constr = SqlDataSource1.ConnectionString;
                using (SqlConnection con = new SqlConnection (constr))
                {
                    string query = SqlDataSource1.SelectCommand;

                    using (SqlCommand cmd = new SqlCommand(query))
                    {                        
                        cmd.Connection = con;
                        con.Open();
                        object val = cmd.ExecuteScalar();
                        var salttocheck = val.ToString();
                        var pwtocheck = generateHash(Encoding.UTF8.GetBytes(pw), Encoding.UTF8.GetBytes(salttocheck));
                        cmd.ExecuteNonQuery();
                        con.Close();
                        if (qstring == pwtocheck)
                        {
                            Response.Redirect("Home.aspx");  
                        }
                        Response.Redirect("Home.aspx");
                    }
                }
                
            }
            else
            {
                lblErr.Visible = true;
                txtPW.Text = "";
                txtUsrName.Text = "";
            }
 

        }
    }
}