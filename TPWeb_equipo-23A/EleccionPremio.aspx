<%@ Page Title="Promo Gana" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EleccionPremio.aspx.cs" Inherits="TPWeb_equipo_23A.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title"><%: Title %></h2>
        <h3>Elejí tu premio.</h3>


        <div class="row row-cols-1 row-cols-md-3 g-4">
            <% foreach (dominio.Articulo art in ListaArticulo)
                { %>
            <div class="col">
                <div class="card h-100">

                    <!-- Carrusel -->
                    <div id="carousel<%: art.Id %>" class="carousel slide" data-bs-ride="carousel">
                        <div class="carousel-inner">
                            <% 
                                bool primera = true;
                                foreach (var img in art.listaImagenes)
                                { %>
                                 <div class="carousel-item <%: primera ? "active" : "" %>">
                                       <img src="<%: img.ImagenUrl %>" class="d-block w-100" alt="<%: art.Nombre %>"style=height:350px; width:150%; object-fit:cover;">
                                 </div>
                              <% 
                                      primera = false;
                                  } %>
                        </div>
                        <!-- Controles del carrusel -->
                        <button class="carousel-control-prev" type="button" data-bs-target="#carousel<%: art.Id %>" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Anterior</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carousel<%: art.Id %>" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Siguiente</span>
                        </button>
                    </div>

                    <!-- Cuerpo de la tarjeta -->
                    <div class="card-body">
                        <h5 class="card-title"><%: art.Nombre %></h5>
                        <p class="card-text"><%: art.Descripcion %></p>
                        <asp:Button Text="Quiero este"  ID="btnEleccion" CssClass="btn btn-primary btn-sm" OnClick="btnEleccion_Click" runat="server" />
                    </div>
                </div>
            </div>
            <% } %>
        </div>
    </main>
</asp:Content>
