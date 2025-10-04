using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPWeb_equipo_23A
{
	public partial class About : Page
	{
        protected TextBox txtCodigoVoucher;
        protected Button btnRegistrarVoucher;
        protected Label lblVoucherMensaje;

		protected void Page_Load(object sender, EventArgs e)
		{
			Title = "Promo Gana";
		}

        protected void btnRegistrarVoucher_Click(object sender, EventArgs e)
        {
            string codigo = txtCodigoVoucher.Text;
            VoucherNegocio negocio = new VoucherNegocio();

            if (negocio.EsValido(codigo))
            {
                Session["voucher"] = negocio.BuscarPorCodigo(codigo);
                Session["CodigoVoucherCanjeo"] = codigo;
                Response.Redirect("EleccionPremio.aspx");
            }
            else
            {
                Response.Redirect("Error.aspx");
            }
        }
    }
}