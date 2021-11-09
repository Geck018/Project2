using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;


namespace Project2
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ViewAllinTable();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            MultiView1.SetActiveView(viewAll);
        }

        protected void MultiView1_ActiveViewChanged(object sender, EventArgs e)
        {
            ViewAllinTable();
        }

        protected void btnDel_Click(object sender, EventArgs e)
        {
            MultiView1.SetActiveView(viewAddDel);
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
            using (Stream fs = FileUpload1.PostedFile.InputStream)
            {
                using (BinaryReader br = new BinaryReader(fs))
                {
                    byte[] bytes = br.ReadBytes((Int32)fs.Length);
                    string constr = "Data Source=tcp:project2picsdb.database.windows.net,1433;Initial Catalog=project2picsdb;User Id=Marnus@project2picsdb;Password=Just1013#";
                    using (SqlConnection con = new SqlConnection(constr))
                    {
                        string query = "INSERT INTO PICS VALUES (@FILENAME, @Data)";
                        using (SqlCommand cmd = new SqlCommand(query))
                        {
                            cmd.Connection = con;
                            cmd.Parameters.AddWithValue("@FILENAME", filename);
                            cmd.Parameters.AddWithValue("@Data", bytes);
                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();
                        }
                    }
                }
            }
            ViewAllinTable();
            
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string qstring = boxDel.Text;

            string constr = "Data Source=tcp:project2picsdb.database.windows.net,1433;Initial Catalog=project2picsdb;User Id=Marnus@project2picsdb;Password=Just1013#";
            using (SqlConnection con = new SqlConnection(constr))
            {
                string query = "DELETE FROM PICS WHERE FILENAME = '" + qstring + "'";
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    
                }
            }
            ViewAllinTable();

        }
        protected void ViewAllinTable()
        {
            string constr = "Data Source=tcp:project2picsdb.database.windows.net,1433;Initial Catalog=project2picsdb;User Id=Marnus@project2picsdb;Password=Just1013#";
            using (SqlConnection con = new SqlConnection(constr))
            {
                string query = "SELECT * FROM PICS";
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                }
            }
            GridView1.DataBind();
        }

    }
}