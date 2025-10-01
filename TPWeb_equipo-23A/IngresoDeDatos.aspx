<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="IngresoDeDatos.aspx.cs" Inherits="TPWeb_equipo_23A.IngresoDeDatos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title"><%: Title %></h2>
        <h3>Ingresá tus datos.</h3>
        
        <asp:Label ID="lblError" runat="server" ForeColor="Red" />
        
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
            ShowErrorsBefore_The_PostBack="True" 
            HeaderText="Por favor, corrige los siguientes errores de formato:" 
            CssClass="alert alert-danger" 
            ValidationGroup="RegistroGroup" />

        <div class="col-6">
            <div class="mb-3">
                <label for="txtDni" class="form-label">DNI:</label>
        
                <asp:TextBox runat="server" ID="txtDni" CssClass="form-control" 
                AutoPostBack="True" 
                OnTextChanged="txtDni_TextChanged" />
            
                <asp:RegularExpressionValidator runat="server" ControlToValidate="txtDni" 
                ValidationExpression="^[0-9]+$" 
                ErrorMessage="El DNI debe contener solo números." 
                CssClass="text-danger" 
                ValidationGroup="RegistroGroup" />
            </div>
        </div>

            <div class="row">
                <div class="col">
                    <label for="Nombre" class="form-label">Nombre:</label>
                    <asp:TextBox runat="server" ID="Nombre" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col">
                    <label for="Apellido" class="form-label">Apellido:</label>
                    <asp:TextBox runat="server" ID="Apellido" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col">
                    <label for="Mail" class="form-label">Mail:</label>
                    <asp:TextBox runat="server" ID="Mail" CssClass="form-control"></asp:TextBox>
                    
                    <asp:RegularExpressionValidator ID="regexEmailValidator" runat="server" 
                        ControlToValidate="Mail" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                        ErrorMessage="Formato de email incorrecto." 
                        CssClass="text-danger" 
                        ValidationGroup="RegistroGroup" />
                </div>
            </div>

            <div class="row">
                <div class="col">
                    <label for="Direccion" class="form-label">Direccion:</label>
                    <asp:TextBox runat="server" ID="Direccion" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col">
                    <label for="Ciudad" class="form-label">Ciudad:</label>
                    <asp:TextBox runat="server" ID="Ciudad" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col">
                    <label for="Cp" class="form-label">CP:</label>
                    <asp:TextBox runat="server" ID="Cp" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            
            <div class="my-3">
                <asp:CheckBox runat="server" ID="terminosYCond" Text="Acepto los términos y condiciones" CssClass="form-check-input" />
                <asp:Label runat="server" ID="lblTerminosError" Text="Debe aceptar los términos y condiciones." CssClass="text-danger d-block" Visible="false" />
            </div>

            <div class="my-4">
                <asp:Button ID="btnParticipar" runat="server" Text="¡Participar!" 
                    CssClass="btn btn-success btn-lg" 
                    OnClick="btnParticipar_Click" 
                    ValidationGroup="RegistroGroup" />
            </div>
    </main>
</asp:Content>
