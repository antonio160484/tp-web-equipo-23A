<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contacto.aspx.cs" Inherits="TPWeb_equipo_23A.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container px-4 py-4 my-3 text-center">
        <div class="row justify-content-center">
            <div class="col-12 col-sm-10 col-md-8 col-lg-6">
                <div class="card shadow rounded bg-light border-0">
                    <div class="card-body py-4">
                        <h2 class="mb-3"> <%: Title %></h2>
                        <h3 class="mb-4">Your contact page.</h3>
                        <address class="mb-3">
                            One Microsoft Way<br />
                            Redmond, WA 98052-6399<br />
                            <abbr title="Phone">P:</abbr>
                            425.555.0100
                        </address>
                        <address>
                            <strong>Support:</strong>   <a href="mailto:Support@example.com">Support@example.com</a><br />
                            <strong>Marketing:</strong> <a href="mailto:Marketing@example.com">Marketing@example.com</a>
                        </address>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
