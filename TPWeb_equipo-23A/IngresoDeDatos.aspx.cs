using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPWeb_equipo_23A
{
    public partial class IngresoDeDatos : System.Web.UI.Page
    {
        protected TextBox txtNombre;
        protected TextBox txtApellido;
        protected TextBox txtMail;
        protected TextBox txtDireccion;
        protected TextBox txtCiudad;
        protected TextBox txtCp;
        protected CheckBox chkTerminosYCond;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string idArticuloString = Request.QueryString["idArticulo"];
                if (!string.IsNullOrEmpty(idArticuloString) && int.TryParse(idArticuloString, out int idArticulo))
                {
                    Session["IdArticuloSeleccionado"] = idArticulo;
                }
                else
                {
                    lblError.Text = "No se pudo determinar el premio seleccionado.";
                    lblError.ForeColor = System.Drawing.Color.Red;
                }
            }
        }

        protected void txtDni_TextChanged(object sender, EventArgs e)
		{
			lblError.Text = string.Empty;

			if (string.IsNullOrWhiteSpace(txtDni.Text) || !int.TryParse(txtDni.Text.Trim(), out _))
			{
				txtNombre.Text = txtApellido.Text = txtMail.Text = txtDireccion.Text = txtCiudad.Text = txtCp.Text = string.Empty;
				Session["IdClienteExistente"] = null;
				txtDni.Enabled = true;
				return;
			}

			try
			{
				ClienteNegocio negocio = new ClienteNegocio();
				Cliente clienteExistente = negocio.Buscar(txtDni.Text.Trim());

				if (clienteExistente != null)
				{
					txtNombre.Text = clienteExistente.Nombre;
					txtApellido.Text = clienteExistente.Apellido;
					txtMail.Text = clienteExistente.Email;
					txtDireccion.Text = clienteExistente.Direccion;
					txtCiudad.Text = clienteExistente.Ciudad;
					txtCp.Text = clienteExistente.CodigoPostal.ToString();

					// Mantener el DNI deshabilitado para evitar cambios
					txtDni.Enabled = false;
					Session["IdClienteExistente"] = clienteExistente.IdCliente;

					lblError.Text = "¡Cliente encontrado! Revisa y modifica tus datos si es necesario.";
					lblError.ForeColor = Color.Blue;
				}
				else
				{
					txtNombre.Text = txtApellido.Text = txtMail.Text = txtDireccion.Text = txtCiudad.Text = txtCp.Text = string.Empty;

					// Mantener el DNI habilitado solo si no existe el cliente
					txtDni.Enabled = true;
					Session["IdClienteExistente"] = null;

					lblError.Text = "DNI no encontrado. Completa el formulario para registrarte y participar.";
					lblError.ForeColor = Color.Green;
				}
			}
			catch (Exception ex)
			{
				lblError.Text = "Error al buscar el cliente: " + ex.Message;
				lblError.ForeColor = Color.Red;
			}
		}

		protected void btnParticipar_Click(object sender, EventArgs e)
		{
			lblError.Text = string.Empty;
			lblTerminosError.Visible = false;

			Page.Validate("RegistroGroup");
			if (!Page.IsValid)
				return;

			if (!ValidarCamposRequeridos())
			{
				lblError.Text = "Todos los campos son requeridos para el alta. Por favor, completa la información.";
				lblError.ForeColor = Color.Red;
				return;
			}
			if (!chkTerminosYCond.Checked)
			{
				lblTerminosError.Visible = true;
				return;
			}

			ClienteNegocio clienteNegocio = new ClienteNegocio();
			Cliente clienteDatos = new Cliente();
			int idClienteCanje;

			try
			{
				int cpValue;
				if (!int.TryParse(txtCp.Text.Trim(), out cpValue) || !int.TryParse(txtDni.Text.Trim(), out _))
				{
					lblError.Text = "Error de formato: El DNI y el CP deben contener solo números válidos.";
					lblError.ForeColor = Color.Red;
					return;
				}
				clienteDatos.Documento = txtDni.Text.Trim();
				clienteDatos.Nombre = txtNombre.Text.Trim();
				clienteDatos.Apellido = txtApellido.Text.Trim();
				clienteDatos.Email = txtMail.Text.Trim();
				clienteDatos.Direccion = txtDireccion.Text.Trim();
				clienteDatos.Ciudad = txtCiudad.Text.Trim();
				clienteDatos.CodigoPostal = cpValue;
				string codigoVoucher = (string)Session["CodigoVoucherCanjeo"];
                int idArticulo = (int)Session["IdArticuloSeleccionado"];

                // Comprobación directa en la base de datos por DNI
                Cliente clienteExistente = clienteNegocio.Buscar(clienteDatos.Documento);
				if (clienteExistente != null)
				{
					// Modificar el cliente existente
					clienteDatos.IdCliente = clienteExistente.IdCliente;
					idClienteCanje = clienteExistente.IdCliente;
					clienteNegocio.Modificar(clienteDatos);
				}
				else
				{
					// Registrar nuevo cliente
					idClienteCanje = clienteNegocio.Registrar(clienteDatos);

					if (idClienteCanje <= 0)
						throw new Exception("El registro de cliente falló. Contacte al administrador.");
				}

				VoucherNegocio vn = new VoucherNegocio();
				vn.CanjearVoucher(codigoVoucher, idClienteCanje, idArticulo);

				// Limpiar la sesión solo después de la operación
				Session["CodigoVoucherCanjeo"] = null;
				Session["IdArticuloSeleccionado"] = null;
				Session["IdClienteExistente"] = null;

				//Response.Redirect("Exito.aspx", false);
			}
			catch (Exception ex)
			{
				lblError.Text = "No se pudo finalizar la participación. Error en la transacción: " + ex.Message;
				lblError.ForeColor = Color.Red;
			}
		}

		private bool ValidarCamposRequeridos()
		{
			if (string.IsNullOrWhiteSpace(txtDni.Text) ||
				string.IsNullOrWhiteSpace(txtNombre.Text) ||
				string.IsNullOrWhiteSpace(txtApellido.Text) ||
				string.IsNullOrWhiteSpace(txtMail.Text) ||
				string.IsNullOrWhiteSpace(txtDireccion.Text) ||
				string.IsNullOrWhiteSpace(txtCiudad.Text) ||
				string.IsNullOrWhiteSpace(txtCp.Text))
			{
				return false;
			}
			return true;
		}
	}
}