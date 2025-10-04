using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace negocio
{
    public class VoucherNegocio
    {
        public bool EsValido(string codigo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("SELECT CodigoVoucher, IdCliente, FechaCanje, IdArticulo FROM Vouchers WHERE CodigoVoucher = @codigo");
                datos.setearParametro("@codigo", codigo);
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    bool disponible = datos.Lector["IdCliente"] == DBNull.Value
                                      && datos.Lector["FechaCanje"] == DBNull.Value
                                      && datos.Lector["IdArticulo"] == DBNull.Value;
                    return disponible;
                }

                return false;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public Voucher BuscarPorCodigo(string codigo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("SELECT CodigoVoucher, IdCliente, FechaCanje, IdArticulo FROM Vouchers WHERE CodigoVoucher = @codigo");
                datos.setearParametro("@codigo", codigo);
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    Voucher v = new Voucher();

                    v.CodigoVoucher = (string)datos.Lector["CodigoVoucher"];

                    if (datos.Lector["IdCliente"] != DBNull.Value)
                    {
                        v.Cliente = new Cliente { IdCliente = (int)datos.Lector["IdCliente"] };
                    }
                    else
                    {
                        v.Cliente = null;
                    }

                    if (datos.Lector["IdArticulo"] != DBNull.Value)
                    {
                        v.Articulo = new Articulo { Id = (int)datos.Lector["IdArticulo"] };
                    }
                    else
                    {
                        v.Articulo = null;
                    }

                    if (datos.Lector["FechaCanje"] != DBNull.Value)
                    {
                        v.FechaCanje = (DateTime)datos.Lector["FechaCanje"];
                    }
                    else
                    {
                        v.FechaCanje = null;
                    }

                    return v;
                }

                return null;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public void CanjearVoucher(string codigoVoucher, int idCliente, int idArticulo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta(
                    "UPDATE Vouchers " +
                    "SET IdCliente = @idCliente, " +
                    "    IdArticulo = @idArticulo, " +
                    "    FechaCanje = GETDATE() " +
                    "WHERE CodigoVoucher = @codigo"
                );

                datos.setearParametro("@idCliente", idCliente);
                datos.setearParametro("@idArticulo", idArticulo);
                datos.setearParametro("@codigo", codigoVoucher);

                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw new Exception("Error al intentar canjear el voucher: " + ex.Message, ex);
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

    }
}
