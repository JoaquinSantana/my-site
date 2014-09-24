$(document).ready(function (){

	$(function() {
	  var preview = $("#contact").data('preview');
	  if (preview == true){
	    window.location = window.location.href + "#address";
	  };
	});


	$('.left carousel-control').click( function(e) {
      e.preventDefault();
      e.stopPropagation();
	});

	$('.right carousel-control').click( function(e) {
      e.preventDefault();
	});

});