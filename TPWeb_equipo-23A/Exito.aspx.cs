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
    public partial class Exito : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Recuperar los datos de la sesión
                string codigoVoucher = Session["CodigoVoucherCanjeo"] as string;
                int? idArticulo = Session["IdArticuloSeleccionado"] as int?;
                int? idCliente = Session["IdClienteExistente"] as int?;

                // Validar que existan los datos requeridos
                if (string.IsNullOrEmpty(codigoVoucher) || idArticulo == null || idCliente == null)
                {
                    Response.Redirect("Error.aspx");
                    return;
                }

                try
                {
                    // Instanciar los negocios
                    ClienteNegocio clienteNegocio = new ClienteNegocio();
                    ArticuloNegocio articuloNegocio = new ArticuloNegocio();

                    // Buscar los registros en la BD
                    Articulo articulo = articuloNegocio.listar().Find(a => a.Id == idArticulo.Value);
                    Cliente cliente = new Cliente();
                    cliente.Nombre = "Cliente";
                    cliente.Apellido = "#" + idCliente.Value;

                    // Si en tu grupo implementaron BuscarPorId, podés reemplazar la línea anterior por:
                    // Cliente cliente = clienteNegocio.BuscarPorId(idCliente.Value);

                    // Mostrar en pantalla
                    lblNombre.Text = cliente.Nombre + " " + cliente.Apellido;
                    lblCodigo.Text = codigoVoucher;
                    lblFecha.Text = DateTime.Now.ToString("dd/MM/yyyy HH:mm");
                    lblPremio.Text = articulo?.Nombre ?? "Premio desconocido";

                    // Mostrar la primera imagen del premio
                    if (articulo != null && articulo.listaImagenes != null && articulo.listaImagenes.Count > 0)
                    {
                        imgPremio.ImageUrl = articulo.listaImagenes[0].ImagenUrl;
                    }

                    // Limpiar la sesión al final
                    Session["CodigoVoucherCanjeo"] = null;
                    Session["IdArticuloSeleccionado"] = null;
                    Session["IdClienteExistente"] = null;
                }
                catch (Exception)
                {
                    Response.Redirect("Error.aspx");
                }
            }
        }
    }
}