<%@ Page Title="Promo Gana" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegistroVoucher.aspx.cs" Inherits="TPWeb_equipo_23A.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2> <%: Title %></h2>
        <h3>Registra tu voucher.</h3>
        <div class="row">
            <div class="col-6">
                <div class="mb-3">
                    <label for="txtCodigoVoucher" class="form-label">Codigo del voucher:</label>
                    <asp:TextBox runat="server" ID="txtCodigoVoucher" CssClass="form-control" />
                </div>
                <div class="mb-3">
                    <asp:Button Text="Aceptar" ID="btnRegistrarVoucher" CssClass="btn btn-primary btn-sm" OnClick="btnRegistrarVoucher_Click" runat="server" />
                    <asp:Label runat="server" ID="lblVoucherMensaje" ForeColor="Red" />
                </div>
            </div>
        </div>
    </main>
</asp:Content>
