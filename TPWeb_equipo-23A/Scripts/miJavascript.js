$(document).ready(function () {
    $('.form-control').on('blur', function () {
        var input = $(this);
        var valor = input.val().trim();
        input.removeClass('is-valid is-invalid');
        if (valor.length > 0) {
            input.addClass('is-valid'); 
        } else {
            input.addClass('is-invalid');
        }
        var id = input.attr('id');
        if (id && (id.includes('txtDni') || id.includes('Cp')) && valor.length > 0) {
            if (!$.isNumeric(valor)) {
                input.removeClass('is-valid').addClass('is-invalid');
            }
        }
    });
});