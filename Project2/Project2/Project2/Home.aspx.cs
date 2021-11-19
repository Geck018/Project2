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
            GridView2.Visible = true;
            GridView1.Visible = false;

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
                    string constr = DataSource1.ConnectionString;
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
        protected void ViewAllinTable()
        {
            GridView1.DataBind();
            GridView2.DataBind();
            DropDownList1.DataBind();
            DropDownList2.DataBind();

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView1.Visible = true;
            GridView2.Visible = false;
            string qstring = DropDownList1.SelectedValue;
            QueryProcessor("SELECT FILENAME FROM PICS WHERE FILENAME LIKE '" + qstring + "'");
            string id = DropDownList1.SelectedItem.Value;
            displayImage.Visible = id != "0";
            if (id != "0")
            {
                byte[] bytes = (byte[])QueryProcessor("SELECT DATA FROM PICS WHERE ID =" + id).Rows[0]["DATA"];
                string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                displayImage.ImageUrl = "data:image/jpg;base64," + base64String;
            }
        }

        protected DataTable QueryProcessor (string query)
        {
            DataTable dt = new DataTable();
            string constr = DataSource1.ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                        sda.SelectCommand = cmd;
                        sda.Fill(dt);
                        return dt;
                    }

                }
            }
            
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            string qstring = DropDownList2.SelectedValue;
            QueryProcessor("DELETE FROM PICS WHERE FILENAME = '" + qstring + "'");
            ViewAllinTable();

        }
        protected void FetchPic(object sender, EventArgs e)
        {
            string id = DropDownList1.SelectedValue;
            displayImage.Visible = id != "0";
            if (id != "0")
            {
                byte[] bytes = (byte[])QueryProcessor("SELECT DATA FROM PICS WHERE FILENAME =" + id).Rows[0]["DATA"];
                string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                displayImage.ImageUrl = "data:image/jpg;base64," + base64String;
            }
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}