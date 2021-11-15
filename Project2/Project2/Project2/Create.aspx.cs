using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;

namespace Project2
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            pnl1.Visible = false;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {

        }

        protected void btnFinishCreate_Click(object sender, EventArgs e)
        {
            var pw = txtPWCreate.Text;
            var newSalt = GenerateSalt();
            var hashedpw = CreateHash(Encoding.UTF8.GetBytes(pw), Encoding.UTF8.GetBytes(newSalt));
  
        }

        protected string CreateHash(byte[] bytesHash, byte[] salt)
        {
            var byteresult = new Rfc2898DeriveBytes(bytesHash, salt, 15000);
            return Convert.ToBase64String(byteresult.GetBytes(24));
        }

        protected string GenerateSalt ()
        {
            var bytes = new byte[128 / 8];
            var rng = new RNGCryptoServiceProvider();
            rng.GetBytes(bytes);
            return Convert.ToBase64String(bytes);
        }

        protected void btnLoginSwitch_Click(object sender, EventArgs e)
        {
            try
            {
                pnl1.Visible = true;
                pnl2.Visible = false;
            }
            catch
            {

            }

        }
    }
}