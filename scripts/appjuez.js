$(function(){
    /*Disposición de contenido - tablet*/
    $('body').addClass('container-fluid');
    $('header').addClass('h-50 d-flex justify-content-center row col-sm-12');
    $('header h1').addClass('h-auto py-sm-4 align-self-center col-sm-6 text-white text-center bg-secondary rounded-pill');
    $('section').addClass('h-40 d-flex justify-content-center align-items-start row col-sm-12');
    $('section div').addClass('d-flex justify-content-center row col-sm-8');
    $('section div form').addClass('h-75 d-flex flex-column justify-content-center align-items-center col-sm-12');
    $('select').addClass('my-sm-2 col-sm-8');
    $('button').addClass('mt-sm-5 col-sm-2');
    $('footer').addClass('h-10 d-flex justify-content-center align-items-center row col-sm-12');
    $('footer > p').addClass('col-sm-2');
    $('footer div').addClass('d-flex justify-content-end align-items-center row col-sm-8');
    $('footer > div > p').addClass('row col-sm-8 text-right');
    $('#nombreJuez').prop('disabled', true);
    $('button').prop('disabled', true);

    // $.getJSON('php/obtenerRangos.php', function(datos){
    //   console.log(datos);
    //   $.each(datos,function(){
    //     console.log('Ola2');
    //     $('#cargoJuez').append('<option>' + this.rango + '</option>');
    //   });
    // });
    $('#cargoJuez').val(0);
    $('#cargoJuez').on('change', function() {
      if ($('#cargoJuez :selected').val() != 0) {
        $('#nombreJuez').prop('disabled', false);
        $.getJSON('../php/obtenerJueces.php', {rango: $('#cargoJuez :selected').text()})
          .done(function(datos) {
            $.each(datos, function(){
              $('#nombreJuez').append('<option>' + this.nombre + ' ' + this.apellido1 + ' ' + this.apellido2 + '</option>');
            })
        })
          .fail(function(){
            alert('Error al cargar jueces.');
          });
      } else {
        $('#nombreJuez').prop('disabled', true);
      }
    });
  });