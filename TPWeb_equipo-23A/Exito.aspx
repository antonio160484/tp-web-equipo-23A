<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Exito.aspx.cs" Inherits="TPWeb_equipo_23A.Exito" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Participación exitosa!!</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
</head>

<body class="container px-4 py-4 my-3 text-center bg-light">
    <form id="form1" runat="server">
        <div class="row justify-content-center">
            <div class="col-12 col-sm-10 col-md-8 col-lg-6">
                <div class="card shadow-lg rounded-4 border-0" 
                     style="background: linear-gradient(135deg, #f8fafc 80%, #e9ecef 100%);">
                    <div class="card-body py-5">
                        <h2 class="text-success mb-4">🎉 ¡Tu participación fue registrada con éxito!</h2>

                        <p class="lead mb-2">
                            Gracias por participar, 
                            <strong><asp:Label ID="lblNombre" runat="server" /></strong>.
                        </p>

                        <p>
                            Código del voucher: 
                            <strong><asp:Label ID="lblCodigo" runat="server" /></strong><br />
                            Fecha del canje: 
                            <strong><asp:Label ID="lblFecha" runat="server" /></strong>
                        </p>

                        <hr class="my-4" />

                        <h4>Premio elegido</h4>
                        <p class="mb-3">
                            <strong><asp:Label ID="lblPremio" runat="server" /></strong>
                        </p>

                        <asp:Image ID="imgPremio" runat="server" CssClass="img-fluid rounded shadow-sm mb-4" 
                                   Style="max-height: 250px; object-fit: contain;" />

                        <a href="Default.aspx" class="btn btn-primary btn-lg shadow-sm">Volver al inicio</a>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>

