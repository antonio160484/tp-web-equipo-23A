<%@ Page Title="Promo Gana" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegistroVoucher.aspx.cs" Inherits="TPWeb_equipo_23A.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container px-4 py-4 my-3 text-center">
        <div class="row justify-content-center">
            <div class="col-12 col-sm-10 col-md-8 col-lg-6">
                <div class="card shadow rounded bg-light border-0">
                    <div class="card-body py-4">
                        <h2 class="mb-3"> <%: Title %></h2>
                        <h3 class="mb-4">Registra tu voucher.</h3>
                        <form>
                            <div class="mb-3">
                                <label for="txtCodigoVoucher" class="form-label">Codigo del voucher:</label>
                                <div class="d-flex justify-content-center">
                                    <asp:TextBox runat="server" ID="txtCodigoVoucher" CssClass="form-control w-50 mx-auto" />
                                </div>
                            </div>
                            <div class="mb-3">
                                <asp:Button Text="Aceptar" ID="btnRegistrarVoucher" CssClass="btn btn-primary btn-lg" OnClick="btnRegistrarVoucher_Click" runat="server" />
                                <asp:Label runat="server" ID="lblVoucherMensaje" ForeColor="Red" />
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
