using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio;

namespace negocio
{
	public class ClienteNegocio
	{

		public int Registrar(Cliente nuevo)
		{
			AccesoDatos datos = new AccesoDatos();

			try
			{
				datos.setearConsulta(" INSERT INTO Clientes (Documento, Nombre, Apellido, Email, Direccion, Ciudad, CP) VALUES (@Documento, @Nombre, @Apellido, @Email, @Direccion, @Ciudad, @CP); SELECT SCOPE_IDENTITY()");

				datos.setearParametro("@Documento", nuevo.Documento);
				datos.setearParametro("@Nombre", nuevo.Nombre);
				datos.setearParametro("@Apellido", nuevo.Apellido);
				datos.setearParametro("@Email", nuevo.Email);
				datos.setearParametro("@Direccion", nuevo.Direccion);
				datos.setearParametro("@Ciudad", nuevo.Ciudad);
				datos.setearParametro("@CP", nuevo.CodigoPostal);

				object resultado = datos.ejecutarScalar();
				if (resultado != null && resultado != DBNull.Value)
				{
					decimal idDecimal = Convert.ToDecimal(resultado);
					return Convert.ToInt32(idDecimal);
				}

				return -1;
			}
			catch (Exception ex)
			{
				throw new Exception("Error al intentar registrar el nuevo cliente en la BD.", ex);
			}
			finally
			{
				datos.cerrarConexion();
			}
		}

		public Cliente Buscar(string documento)
		{
			AccesoDatos datos = new AccesoDatos();
			try
			{
				datos.setearConsulta("SELECT Id, Documento, Nombre, Apellido, Email, Direccion, Ciudad, CP FROM Clientes WHERE Documento = @Documento;");

				datos.setearParametro("@Documento", documento);
				datos.ejecutarLectura();

				if (datos.Lector.Read())
				{
					Cliente cliente = new Cliente();
					cliente.IdCliente = (int)datos.Lector["Id"];
					cliente.Documento = (string)datos.Lector["Documento"];
					cliente.Nombre = (string)datos.Lector["Nombre"];
					cliente.Apellido = (string)datos.Lector["Apellido"];
					cliente.Email = (string)datos.Lector["Email"];
					cliente.Direccion = (string)datos.Lector["Direccion"];
					cliente.Ciudad = (string)datos.Lector["Ciudad"];
					cliente.CodigoPostal = (int)datos.Lector["CP"];
					return cliente;
				}
				return null;
			}
			catch (Exception ex)
			{
				throw new Exception("Error al buscar cliente por DNI", ex);
			}
			finally
			{
				datos.cerrarConexion();
			}
		}

		public void Modificar(Cliente cliente)
		{
			AccesoDatos datos = new AccesoDatos();

			try
			{
				datos.setearConsulta("UPDATE Clientes SET Documento = @Documento, Nombre = @Nombre, Apellido = @Apellido, Email = @Email, Direccion = @Direccion, Ciudad = @Ciudad, CP = @CP WHERE Id = @Id;");
				datos.setearParametro("@Id", cliente.IdCliente);
				datos.setearParametro("@Documento", cliente.Documento);
				datos.setearParametro("@Nombre", cliente.Nombre);
				datos.setearParametro("@Apellido", cliente.Apellido);
				datos.setearParametro("@Email", cliente.Email);
				datos.setearParametro("@Direccion", cliente.Direccion);
				datos.setearParametro("@Ciudad", cliente.Ciudad);
				datos.setearParametro("@CP", cliente.CodigoPostal);

				datos.ejecutarAccion();
			}
			catch (Exception ex)
			{
				throw new Exception("Error al intentar modificar los datos del cliente en la BD.", ex);
			}
			finally
			{
				datos.cerrarConexion();
			}
		}
	}
}
