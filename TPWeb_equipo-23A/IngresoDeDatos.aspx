<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="IngresoDeDatos.aspx.cs" Inherits="TPWeb_equipo_23A.IngresoDeDatos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2><%: Title %></h2>
        <h3>Ingresá tus datos.</h3>
        <div class="row">
            <div class="col-6">
                <div class="mb-3">
                    <label for="txtDni" class="form-label">DNI:</label>
                    <asp:TextBox runat="server" ID="txtDni" CssClass="form-control" />
                </div>
            </div>

            <div class="row">
                <div class="col">
                    <label for="txtNombre" class="form-label">Nombre:</label>
                    <asp:TextBox runat="server" ID="Nombre" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col">
                    <label for="txtApellido" class="form-label">Apellido:</label>
                    <asp:TextBox runat="server" ID="Apellido" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col">
                    <label for="txtMail" class="form-label">Mail:</label>
                    <asp:TextBox runat="server" ID="Mail" CssClass="form-control"></asp:TextBox>
                </div>
            </div>

            <div class="row">
                <div class="col">
                    <label for="txtDireccion" class="form-label">Direccion:</label>
                    <asp:TextBox runat="server" ID="Direccion" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col">
                    <label for="txtCiudad" class="form-label">Ciudad:</label>
                    <asp:TextBox runat="server" ID="Ciudad" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col">
                    <label for="txtCp" class="form-label">CP:</label>
                    <asp:TextBox runat="server" ID="Cp" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div>
                <asp:CheckBox runat="server" ID="terminosYCond" Text="Acepto los términos y condiciones" CssClass="form-check" />
            </div>

        </div>

    </main>
</asp:Content>
