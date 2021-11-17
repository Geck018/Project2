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
	public partial class Create : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

        protected void Button2_Click(object sender, EventArgs e)
        {
			Response.Redirect("Login.aspx");
        }
        public string generateHash(byte[] stuffToHash, byte[] salt)
        {
            var byteRes = new Rfc2898DeriveBytes(stuffToHash, salt, 10000);
            return Convert.ToBase64String(byteRes.GetBytes(12));
        }
        public string generateSalt()
        {
            var bytes = new byte[128 / 8];
            var rng = new RNGCryptoServiceProvider();
            rng.GetBytes(bytes);
            return Convert.ToBase64String(bytes);
        }

        protected void btnFinalise_Click(object sender, EventArgs e)
        {
            string username = txtUsrName.Text;
            string fname = txtFname.Text;
            string lname = txtLname.Text;
            string mail = txtMail.Text;
            string pw = txtPW.Text;
            var newSalt = generateSalt();
            var hashedPW = generateHash(Encoding.UTF8.GetBytes(pw), Encoding.UTF8.GetBytes(newSalt));
            var qstring = hashedPW;
            string constr = SqlDataSource1.ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                string query1 = "INSERT INTO USERDETAILS VALUES ('" + username + "','"+qstring+"','"+fname+"','"+lname+"','"+mail+"')";
                string query2 = "INSERT INTO USERPW (Salt) VALUES ('"+ newSalt +"') SELECT IDENT_CURRENT(' dbo.USERDETAILS')";
                using (SqlCommand cmd = new SqlCommand(query1))
                {
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
                using (SqlCommand cmd = new SqlCommand(query2))
                {
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }
    }
}