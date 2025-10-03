<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="TPWeb_equipo_23A.Error" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Error - Voucher inválido</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
</head>
<body class="container px-4 py-4 my-3 text-center bg-light">
    <div class="row justify-content-center">
        <div class="col-12 col-sm-10 col-md-8 col-lg-6">
            <div class="card shadow-lg rounded-4 border-0" style="background: linear-gradient(135deg, #f8fafc 80%, #e9ecef 100%);">
                <div class="card-body py-5">
                    <div class="mb-3">
                        <span style="font-size:3rem;" aria-label="Advertencia">⚠️</span>
                    </div>
                    <h2 class="text-danger mb-4">El voucher ingresado no es válido o ya fue utilizado.</h2>
                    <a href="RegistroVoucher.aspx" class="btn btn-primary btn-lg shadow-sm">Volver al inicio</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>