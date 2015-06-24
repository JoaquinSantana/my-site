$(document).ready(function (){
	$(function() {
	  var preview = $("#contact").data('preview');
	  if (preview == true){
	    window.location = window.location.href + "#address";
	  };
	});

	$('.carousel').carousel({
	  interval: false
	});



});