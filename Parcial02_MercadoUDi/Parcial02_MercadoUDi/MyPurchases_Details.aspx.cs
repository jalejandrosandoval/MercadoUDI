﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Parcial02_MercadoUDi
{
    public partial class MyPurchases_Details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Btn_Accept_Click(object sender, EventArgs e)
        {
            Response.Redirect("MyPurchases.aspx");
        }
    }
}