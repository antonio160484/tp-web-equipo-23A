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
        protected void Page_Load(object sender, EventArgs e)
        {

        }

		protected void txtDni_TextChanged(object sender, EventArgs e)
		{
			lblError.Text = string.Empty;

			if (string.IsNullOrWhiteSpace(txtDni.Text) || !int.TryParse(txtDni.Text.Trim(), out _))
			{
				Nombre.Text = Apellido.Text = Mail.Text = Direccion.Text = Ciudad.Text = Cp.Text = string.Empty;
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
					Nombre.Text = clienteExistente.Nombre;
					Apellido.Text = clienteExistente.Apellido;
					Mail.Text = clienteExistente.Email;
					Direccion.Text = clienteExistente.Direccion;
					Ciudad.Text = clienteExistente.Ciudad;
					Cp.Text = clienteExistente.CodigoPostal.ToString();

					txtDni.Enabled = false;
					Session["IdClienteExistente"] = clienteExistente.IdCliente;

					lblError.Text = "¡Cliente encontrado! Revisa y modifica tus datos si es necesario.";
					lblError.ForeColor = Color.Blue;
				}
				else
				{
					Nombre.Text = Apellido.Text = Mail.Text = Direccion.Text = Ciudad.Text = Cp.Text = string.Empty;

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
			if (!terminosYCond.Checked)
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
				if (!int.TryParse(Cp.Text.Trim(), out cpValue) || !int.TryParse(txtDni.Text.Trim(), out _))
				{
					lblError.Text = "Error de formato: El DNI y el CP deben contener solo números válidos.";
					lblError.ForeColor = Color.Red;
					return;
				}
				clienteDatos.Documento = txtDni.Text.Trim();
				clienteDatos.Nombre = Nombre.Text.Trim();
				clienteDatos.Apellido = Apellido.Text.Trim();
				clienteDatos.Email = Mail.Text.Trim();
				clienteDatos.Direccion = Direccion.Text.Trim();
				clienteDatos.Ciudad = Ciudad.Text.Trim();
				clienteDatos.CodigoPostal = cpValue;
				string codigoVoucher = (string)Session["CodigoVoucherCanjeo"];
				if (Session["IdClienteExistente"] != null)
				{
					idClienteCanje = (int)Session["IdClienteExistente"];
					clienteDatos.IdCliente = idClienteCanje;
					clienteNegocio.Modificar(clienteDatos);
				}
				else
				{
					idClienteCanje = clienteNegocio.Registrar(clienteDatos);

					if (idClienteCanje <= 0)
						throw new Exception("El registro de cliente falló. Contacte al administrador.");
				}

				// Lógica de Canje la dejo comentada porque no esta implementada todavia
				// VoucherNegocio voucherNegocio = new VoucherNegocio();
				// int idArticulo = (int)Session["IdArticuloSeleccionado"];
				// voucherNegocio.Canjear(codigoVoucher, idClienteCanje, idArticulo);

				Session["CodigoVoucherCanjeo"] = null;
				Session["IdArticuloSeleccionado"] = null;
				Session["IdClienteExistente"] = null;

				Response.Redirect("Confirmacion.aspx", false);
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
				string.IsNullOrWhiteSpace(Nombre.Text) ||
				string.IsNullOrWhiteSpace(Apellido.Text) ||
				string.IsNullOrWhiteSpace(Mail.Text) ||
				string.IsNullOrWhiteSpace(Direccion.Text) ||
				string.IsNullOrWhiteSpace(Ciudad.Text) ||
				string.IsNullOrWhiteSpace(Cp.Text))
			{
				return false;
			}
			return true;
		}
	}
}