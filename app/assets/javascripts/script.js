// função para ativardo tooltip

$(function(){
	$('[data-toggle="tooltip"]').tooltip();
	});

// fade out da menssagem de alter, aparentemente só funciona por conta da alteração 
// no css que deixa display none pra o elemento flash
$(document).(function() {
  $('.alert').delay(500).fadeIn('normal', function() {
      $(this).delay(1500).fadeOut();
      });
  });

