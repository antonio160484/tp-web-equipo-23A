<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TPWeb_equipo_23A._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container px-4 py-4 my-3 text-center">
        <div class="row justify-content-center">
            <div class="col-12 col-sm-10 col-md-8 col-lg-6">
                <div class="card shadow rounded bg-light border-0">
                    <div class="card-body py-4">
                        <h1 id="aspnetTitle" class="mb-3">PROMO WEB</h1>
                        <p class="lead mb-4">PROMO WEB es la promoción que te permite participar por los mejores y más originales premios!!</p>
                        <h2 id="Comencemos" class="mb-3">Comencemos</h2>
                        <p>Para comenzar hacé click acá o en la pestaña "Registrar voucher".</p>
                        <p><a href="RegistroVoucher" class="btn btn-primary btn-lg">Registrar Voucher</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
