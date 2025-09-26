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
				datos.setearConsulta("Select A.Id, A.Codigo, A.Nombre, A.Descripcion, M.Id AS IdMarca, M.Descripcion AS Marca, C.Id As IdCategoria, C.Descripcion AS Categoria, A.Precio FROM ARTICULOS A, MARCAS M, CATEGORIAS C WHERE M.Id = A.IdMarca AND C.Id = A.IdCategoria");
				datos.ejecutarLectura();

				while (datos.Lector.Read())
				{
					Articulo aux = new Articulo();

					aux.Id = (int)datos.Lector["Id"];
					aux.Codigo = (string)datos.Lector["Codigo"];
					aux.Nombre = (string)datos.Lector["Nombre"];
					aux.Descripcion = (string)datos.Lector["Descripcion"];

					// Mapeo de Marca
					aux.Marca = new Marca();
					aux.Marca.Id = (int)datos.Lector["IdMarca"];
					aux.Marca.Descripcion = (string)datos.Lector["Marca"];

					// Mapeo de Categoría
					aux.Categoria = new Categoria();
					aux.Categoria.Id = (int)(datos.Lector["IdCategoria"]);
					aux.Categoria.Descripcion = (string)datos.Lector["Categoria"];

					aux.Precio = (decimal)datos.Lector["Precio"];

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
