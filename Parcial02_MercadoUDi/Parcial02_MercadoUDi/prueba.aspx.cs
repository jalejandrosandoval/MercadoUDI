using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Parcial02_MercadoUDi
{
    public partial class prueba : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<clase> lcl = new List<clase>();

            clase objeto = new clase();

            objeto.MyProperty = 2;
            objeto.MyProperty2 = 5;


            lcl.Add(objeto);

            objeto = new clase();

            objeto.MyProperty = 6;
            objeto.MyProperty2 = 1;


            lcl.Add(objeto);
            objeto = new clase();

            objeto.MyProperty = 8;
            objeto.MyProperty2 = 34;


            lcl.Add(objeto);
            objeto = new clase();


            GridView1.DataSource = lcl;
            GridView1.DataBind();
        }



        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string op = this.GridView1.SelectedRow.Cells[1].Text;

            Response.Redirect("login.aspx?op=" + op);

        }

        protected void CustomersGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            
        }
    }
}