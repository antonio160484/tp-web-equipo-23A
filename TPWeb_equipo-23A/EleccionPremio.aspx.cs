using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace TPWeb_equipo_23A
{
	public partial class WebForm1 : System.Web.UI.Page
	{
		public List<Articulo> ListaArticulo { get; set; }

		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				ArticuloNegocio nuevo = new ArticuloNegocio();
				List<Articulo> todosLosArticulos = nuevo.listar();
				ListaArticulo = todosLosArticulos
					.GroupBy(art => art.Codigo)
					.Select(grupo => grupo.First())
					.ToList();
			}
		}
	}
}