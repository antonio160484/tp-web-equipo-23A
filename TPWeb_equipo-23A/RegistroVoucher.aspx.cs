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
		protected void Page_Load(object sender, EventArgs e)
		{
			Title = "Promo Gana";
		}

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            string codigoVoucher = txtId.Text.Trim();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("SELECT IdCliente, FechaCanje FROM Vouchers WHERE CodigoVoucher = @codigo");
                datos.setearParametro("@codigo", codigoVoucher);
                datos.ejecutarLectura();

                if (!datos.Lector.HasRows)
                {
                    lblMensaje.Text = "El voucher no es válido.";
                    return;
                }

                datos.Lector.Read();
                bool yaUsado = datos.Lector["IdCliente"] != DBNull.Value && datos.Lector["FechaCanje"] != DBNull.Value;

                if (yaUsado)
                {
                    lblMensaje.Text = "El voucher ya fue usado.";
                    return;
                }

                Session["CodigoVoucher"] = codigoVoucher;
                Response.Redirect("EleccionPremio.aspx", false);
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error: " + ex.Message;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
    }
}