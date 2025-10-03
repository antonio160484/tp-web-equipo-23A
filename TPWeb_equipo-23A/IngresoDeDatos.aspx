<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="IngresoDeDatos.aspx.cs" Inherits="TPWeb_equipo_23A.IngresoDeDatos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container px-4 py-4 my-3 text-center">
        <div class="row justify-content-center">
            <div class="col-11">
                <div class="card shadow rounded bg-light border-0">
                    <div class="card-body py-4">
                        <h2 class="mb-3"><%: Title %></h2>
                        <h3 class="mb-4">Ingresá tus datos.</h3>
                        
                        <asp:Label ID="lblError" runat="server" ForeColor="Red" />
        
                        <asp:ValidationSummary ID="vsRegistro" runat="server" 
                            ShowErrorsBefore_The_PostBack="True" 
                            HeaderText="Por favor, corrige los siguientes errores de formato:" 
                            CssClass="alert alert-danger" 
                            ValidationGroup="RegistroGroup" />

                        <form>
                            <div class="mb-3 text-center">
                                <label for="txtDni" class="form-label">DNI:</label>
                                <div class="d-flex justify-content-center">
                                    <div style="width:320px;">
                                        <asp:TextBox runat="server" ID="txtDni" CssClass="form-control" 
                                        AutoPostBack="True" 
                                        OnTextChanged="txtDni_TextChanged" />
                                    </div>
                                </div>
                                <div class="valid-feedback">¡DNI listo!</div>
                                <div class="invalid-feedback">Falta DNI o formato incorrecto.</div>
        
                                <asp:RegularExpressionValidator runat="server" ID="valDni" ControlToValidate="txtDni" 
                                ValidationExpression="^[0-9]+$" 
                                ErrorMessage="El DNI debe contener solo números." 
                                CssClass="text-danger" 
                                ValidationGroup="RegistroGroup" />
                            </div>

                            <div class="row">
                                <div class="col mb-3">
                                    <label for="txtNombre" class="form-label">Nombre:</label>
                                    <div class="d-flex justify-content-center">
                                        <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control w-90"></asp:TextBox>
                                    </div>
                                    <div class="valid-feedback">¡Ok!</div>
                                    <div class="invalid-feedback">Falta nombre.</div>
                                </div>
                                
                                <div class="col mb-3">
                                    <label for="txtApellido" class="form-label">Apellido:</label>
                                    <div class="d-flex justify-content-center">
                                        <asp:TextBox runat="server" ID="txtApellido" CssClass="form-control w-90"></asp:TextBox>
                                    </div>
                                    <div class="valid-feedback">¡Ok!</div>
                                    <div class="invalid-feedback">Falta apellido.</div>
                                </div>
                                
                                <div class="col mb-3">
                                    <label for="txtMail" class="form-label">Mail:</label>
                                    <div class="d-flex justify-content-center">
                                        <asp:TextBox runat="server" ID="txtMail" CssClass="form-control w-90"></asp:TextBox>
                                    </div>
                                    
                                    <div class="valid-feedback">¡Ok!</div>
                                    <div class="invalid-feedback">Falta email o el formato es incorrecto.</div>
                                    
                                    <asp:RegularExpressionValidator ID="valMail" runat="server" 
                                        ControlToValidate="txtMail" 
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                        ErrorMessage="Formato de email incorrecto." 
                                        CssClass="text-danger" 
                                        ValidationGroup="RegistroGroup" />
                                </div>
                            </div>

                            <div class="row">
                                <div class="col mb-3">
                                    <label for="txtDireccion" class="form-label">Direccion:</label>
                                    <div class="d-flex justify-content-center">
                                        <asp:TextBox runat="server" ID="txtDireccion" CssClass="form-control w-90"></asp:TextBox>
                                    </div>
                                    <div class="valid-feedback">¡Ok!</div>
                                    <div class="invalid-feedback">Falta dirección.</div>
                                </div>
                                
                                <div class="col mb-3">
                                    <label for="txtCiudad" class="form-label">Ciudad:</label>
                                    <div class="d-flex justify-content-center">
                                        <asp:TextBox runat="server" ID="txtCiudad" CssClass="form-control w-90"></asp:TextBox>
                                    </div>
                                    <div class="valid-feedback">¡Ok!</div>
                                    <div class="invalid-feedback">Falta ciudad.</div>
                                </div>
                                
                                <div class="col mb-3">
                                    <label for="txtCp" class="form-label">Codigo Postal:</label>
                                    <div class="d-flex justify-content-center">
                                        <asp:TextBox runat="server" ID="txtCp" CssClass="form-control w-90"></asp:TextBox>
                                    </div>
                                    <div class="valid-feedback">¡Ok!</div>
                                    <div class="invalid-feedback">Falta CP o formato incorrecto.</div>
                                </div>
                            </div>
                            
                            <div class="my-3">
                                <asp:CheckBox runat="server" ID="chkTerminosYCond" Text="Acepto los términos y condiciones" CssClass="form-check-input" />
                                <asp:Label runat="server" ID="lblTerminosError" Text="Debe aceptar los términos y condiciones." CssClass="text-danger d-block" Visible="false" />
                            </div>

                            <div class="my-4">
                                <asp:Button ID="btnParticipar" runat="server" Text="¡Participar!" 
                                    CssClass="btn btn-success btn-lg" 
                                    OnClick="btnParticipar_Click" 
                                    ValidationGroup="RegistroGroup" />
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
