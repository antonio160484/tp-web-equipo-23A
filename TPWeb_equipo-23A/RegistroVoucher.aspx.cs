using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;

namespace TPWeb_equipo_23A
{
	public partial class About : Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			Title = "Promo Gana";
		}

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
			Response.Redirect("EleccionPremio.aspx",false);
        }
    }
}