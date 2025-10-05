using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio;
using static System.Net.WebRequestMethods;

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
                datos.setearConsulta("SELECT A.Id,A.Codigo,A.Nombre,A.Descripcion,A.Precio,M.Descripcion AS Marca,C.Descripcion AS Categoria FROM ARTICULOS A LEFT JOIN MARCAS M ON M.Id = A.IdMarca LEFT JOIN CATEGORIAS C ON C.Id = A.IdCategoria");

                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Articulo aux = new Articulo();

                    aux.Id = (int)datos.Lector["Id"];
                    aux.Codigo = (string)datos.Lector["Codigo"];

                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.Descripcion = (string)datos.Lector["Descripcion"];

                    ImagenNegocio negocioImagen = new ImagenNegocio();
                    try
                    {
                        aux.listaImagenes = negocioImagen.lista(aux.Id);
                        if (aux.listaImagenes == null || aux.listaImagenes.Count == 0)
                        {
                            aux.listaImagenes = new List<Imagen>
                            {
                                new Imagen { ImagenUrl = "https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png" }
                            };
                        }

                    }
                    catch (Exception)
                    {
                        throw;


                    }
                    lista.Add(aux);
                }

                return lista;
            }
            catch (Exception ex)
            {
                throw new Exception("Error al listar artículos desde la capa de negocio.", ex);
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
    }
}
