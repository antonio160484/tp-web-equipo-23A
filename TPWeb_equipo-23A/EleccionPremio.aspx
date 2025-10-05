<%@ Page Title="Promo Gana" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EleccionPremio.aspx.cs" Inherits="TPWeb_equipo_23A.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container my-5">
        <div class="row justify-content-center">
            <div class="col-lg-10 col-md-12">
                <div class="card shadow rounded bg-light border-0">
                    <div class="card-body py-4">
                        <h2 class="mb-3"><%: Title %></h2>
                        <h3 class="mb-4">Elegí tu premio.</h3>
                        
                        <div class="row row-cols-1 row-cols-md-3 g-4 justify-content-center">
                            
                            <%
                            foreach (dominio.Articulo art in ListaArticulo)
                            { %>
                                <div class="col">
                                    <div class="card h-100">
                                        <div id="carousel<%: art.Id %>" class="carousel slide" data-bs-ride="carousel">
                                            <div class="carousel-inner">
                                                <% 
                                                    bool primera = true;
                                                    foreach (var img in art.listaImagenes)
                                                    { %>
                                                        <div class="carousel-item <%: primera ? "active" : "" %>">
                                                            <img src="<%: img.ImagenUrl %>" class="d-block w-100 bg-white" alt="<%: art.Nombre %>" style="max-height:250px; width:100%; object-fit:contain;">
                                                        </div>
                                                    <% 
                                                        primera = false;
                                                    } %>
                                            </div>
                                            <button class="carousel-control-prev" type="button" data-bs-target="#carousel<%: art.Id %>" data-bs-slide="prev">
                                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                                <span class="visually-hidden">Anterior</span>
                                            </button>
                                            <button class="carousel-control-next" type="button" data-bs-target="#carousel<%: art.Id %>" data-bs-slide="next">
                                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                                <span class="visually-hidden">Siguiente</span>
                                            </button>
                                        </div>

                                        <div class="card-body">
                                            <h5 class="card-title"><%: art.Nombre %></h5>
                                            <p class="card-text"><%: art.Descripcion %></p>
                                            
                                            <a href="IngresoDeDatos.aspx?idArticulo=<%: art.Id %>" class="btn btn-primary btn-sm">Quiero este</a>
                                        </div>
                                    </div>
                                </div>
                            <% } %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>