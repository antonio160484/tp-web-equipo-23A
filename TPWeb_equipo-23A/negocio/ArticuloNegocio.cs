using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio;

namespace negocio
{
	public class ArticuloNegocio
	{
		public List<Articulo> listar()
		{
			List<Articulo> lista = new List<Articulo>();
			AccesoDatos datos = new AccesoDatos();

			try
			{
				datos.setearConsulta("select distinct A.Id, A.nombre, A.Descripcion  from ARTICULOS A");
				datos.ejecutarLectura();

				while (datos.Lector.Read())
				{
					Articulo aux = new Articulo();

					aux.Id = (int)datos.Lector["Id"];
					aux.Nombre = (string)datos.Lector["Nombre"];
					aux.Descripcion = (string)datos.Lector["Descripcion"];
					
					ImagenNegocio negocioImagen = new ImagenNegocio();
					aux.listaImagenes = negocioImagen.lista(aux.Id);
					lista.Add(aux);
				}

				return lista;
			}
			catch (Exception )
			{
				throw ;
			}
			finally
			{
				datos.cerrarConexion();
			}
		}
	}
}
