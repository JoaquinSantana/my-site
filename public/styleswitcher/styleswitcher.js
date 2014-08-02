$(document).ready(function($) {

	$(".orange" ).click(function()		{ $("#colors" ).attr("href", "colors/orange.css" ); });
	$(".blue" ).click(function()			{ $("#colors" ).attr("href", "colors/blue.css" );	});
	$(".green" ).click(function()			{ $("#colors" ).attr("href", "colors/green.css" ); });
	$(".red" ).click(function()		{ $("#colors" ).attr("href", "colors/red.css" ); });
	$(".violet" ).click(function()			{ $("#colors" ).attr("href", "colors/violet.css" ); });
	$(".yellow" ).click(function()		{ $("#colors" ).attr("href", "colors/yellow.css" ); });
	
	$('.color-switcher li a').click(function(e){
		e.preventDefault();
		$(this).parent().parent().find('a').removeClass('active');
		$(this).addClass('active');
	})
	
	$('.nav-switcher .ss-nav-white').click(function(){
		$('header').removeClass('nav-black').addClass('nav-white');
		$(this).parent().parent().find('a').removeClass('active');
		$(this).addClass('active');
	})
	
	$('.nav-switcher .ss-nav-black').click(function(){
		$('header').removeClass('nav-white').addClass('nav-black');
		$(this).parent().parent().find('a').removeClass('active');
		$(this).addClass('active');
	})
	
	$('#style-selector').animate({
		right: '-205px'
	});

	$('#style-switcher a.ss-close').click(function(e){
		e.preventDefault();
		var div = $('#style-switcher');
		if (div.css('right') === '-220px') {
			$('#style-switcher').animate({
				right: '0'
			});
			$(this).toggleClass('active');
		} else {
			$('#style-switcher').animate({
				right: '-220px'
			});
			$(this).toggleClass('active');
		}
	})
	
})