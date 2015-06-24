$(document).ready(function (){
  
	"use strict";
  $('.laptop-wrapper').slick({
	  infinite: true,
	  speed: 550,
	  fade: true,
	  cssEase: 'linear',
  	autoplay: true,
  	autoplaySpeed: 3000,
  	fade: true,
  	cssEase: 'linear'
	});
	/* Setting Sizes 

	-----------------------------------------------------*/
	
	function setSizes() {
		
		/* General */
		$('.logo-content').css({'margin-top': '-'+($('.logo-content').height()/2)+'px'});
		
		/* Profile */
		$('#profile').css({'height': ($(window).height()) + 'px'});
		$('.profile-content').css({'margin-top': '-'+($('.profile-content').height()/2)+'px'});
		
		/* Portfolio */
		$('.project-info').css({'margin-top': '-'+($('.project-info').height()/2)+'px'});
		
		/* Contact */
		$('#contact, .contact-content').css({'min-height': ($(window).height()) + 'px'});
		
	}
	
	setSizes();
	$(window).resize(function() {
	  setSizes();
	  checkPhotos();
	});
	
	/* Navigation
	-----------------------------------------------------*/
	
	$('#page-content section').waypoint(function(direction) {
	  if(direction=='down') {
		  
		  var sectionName = '#'+$(this).attr('id');
		  var menuLink = $('.me-nav li').children('a').attr('href');
		  var activeLink = $('.me-nav li.active');
		  
		  var newLink = $('li.menu-item a[href="'+sectionName+'"]');
		  
		  $(activeLink).removeClass('active');
		  $(newLink).parent('li').addClass('active');
		  
	  }
	},{ offset: 1 });
	
	$('#page-content section').waypoint(function(direction) {
	  if(direction=='up') {
		  
		  var sectionName = '#'+$(this).attr('id');
		  var menuLink = $('.me-nav li').children('a').attr('href');
		  var activeLink = $('.me-nav li.active');
		  
		  var newLink = $('li.menu-item a[href="'+sectionName+'"]');
		  
		  $(activeLink).removeClass('active');
		  $(newLink).parent('li').addClass('active');
		  
	  }
	},{ offset: function() {
		  return -$(this).height()+1;
		}
	  });
	  
	
	/* Resume
	-----------------------------------------------------*/
	
	$('.dimmed-effect .resume-box').mouseenter(function(){
		$('.dimmed-effect .resume-box').not(this).each(function() {
            $(this).addClass('disable');
        });
	});
	
	$('.dimmed-effect .resume-box').mouseleave(function(){
		$('.dimmed-effect .resume-box').each(function() {
            $(this).removeClass('disable');
        });
	});
	
	/* Blog 
	-----------------------------------------------------*/
	
	// Post Carousel
	
	$(".post-carousel").owlCarousel({
		
		// Most important owl features
		items : false,
		itemsCustom : [[1600,3],[991,2],[0,1]],
		itemsDesktop : false,
		itemsDesktopSmall : false,
		itemsTabletSmall: false,
		itemsMobile : false,
		singleItem : false,
		itemsScaleUp : false,
		slideSpeed : 600,
		paginationSpeed : 800,
		rewindSpeed : 1000,
		navigation : false,
		scrollPerPage : true,
		pagination : true,
		theme : "carousel-theme"
		
	});
	
	var owl = $(".owl-carousel").data('owlCarousel');
	
	$('.post-carousel-next').click(function() {
		owl.next();
		return false;
	});
	
	$('.post-carousel-prev').click(function() {
		owl.prev();
		return false;
	});

	// Post Carousel

	$(".blog-slider").owlCarousel({
		
		// Most important owl features
		items : false,
		itemsCustom : false,
		itemsDesktop : false,
		itemsDesktopSmall : false,
		itemsTabletSmall: false,
		itemsMobile : false,
		singleItem : true,
		itemsScaleUp : false,
		slideSpeed : 600,
		paginationSpeed : 800,
		rewindSpeed : 1000,
		navigation : false,
		scrollPerPage : true,
		pagination : true,
		autoPlay: true,
		theme : "slider-theme"
		
	});
	
	/* Portfolio 
	-----------------------------------------------------*/
	
	// Ajax Project Details
	
	var toLoad;
	
	function showNewContent() {
	    $('.project-content').slideUp(700, function () { $('.project-content').slideDown(700, function () { $.waypoints('refresh') }); });
	}
	
    function loadContent() {　
	     $('.project-content').load(toLoad,showNewContent());
　 }
	
	$('.ajax-portfolio-link').click(function() {
		toLoad = $(this).attr('href');　
		loadContent();
		$('html, body').animate({scrollTop:$('.project-content').position().top}, 700);
		return false;
	});
	
	
	/* Smooth Scrolling
	-----------------------------------------------------*/
	
	$.localScroll({
	});
	
	/* Contact
	-----------------------------------------------------*/
	
	$('#contact-form-holder').addClass('form-hidden');
	$('.contact-form-trigger').click(function() {
		if($('#contact-form-holder').hasClass('form-hidden')) {
			$('#contact-form-holder').removeClass('form-hidden').addClass('form-visible');
			$('.contact-form-trigger').addClass('active');
		} else
		if($('#contact-form-holder').hasClass('form-visible')) {
			$('#contact-form-holder').removeClass('form-visible').addClass('form-hidden');
			$('.contact-form-trigger').removeClass('active');
		};
	});
	
	/* Animations
	-----------------------------------------------------*/
	
	jQuery('.animated').appear();

	$('.fade-in').appear(function() {
		jQuery(this).each(function(){ jQuery(this).addClass('fade-in-animation') });
	});
	
	$('.fade-in-left').appear(function() {
		jQuery(this).each(function(){ jQuery(this).addClass('fade-in-left-animation') });
	});
	
	$('.fade-in-right').appear(function() {
		jQuery(this).each(function(){ jQuery(this).addClass('fade-in-right-animation') });
	});
	
	$('.slide-in-left').appear(function() {
		jQuery(this).each(function(){ jQuery(this).addClass('slide-in-left-animation') });
	});
	
	$('.slide-in-right').appear(function() {
		jQuery(this).each(function(){ jQuery(this).addClass('slide-in-right-animation') });
	});
	
	$('.slide-in-top').appear(function() {
		jQuery(this).each(function(){ jQuery(this).addClass('slide-in-top-animation') });
	});
	
	$('.slide-in-bottom').appear(function() {
		jQuery(this).each(function(){ jQuery(this).addClass('slide-in-bottom-animation') });
	});
	
	$('.zoom-in').appear(function() {
		jQuery(this).each(function(){ jQuery(this).addClass('zoom-in-animation') });
	});
	
	$('.zoom-out').appear(function() {
		jQuery(this).each(function(){ jQuery(this).addClass('zoom-out-animation') });
	});
	
	$('.bounce-in').appear(function() {
		jQuery(this).each(function(){ jQuery(this).addClass('bounce-in-animation') });
	});
	 
	$('.flip-in').appear(function() {
		jQuery(this).each(function(){ jQuery(this).addClass('flip-in-animation') });
	});
	
	/* Alpha Setting
	-----------------------------------------------------*/
	
	$('.editable-alpha').css({
		'opacity': ($('.editable-alpha').attr('data-alpha')/100)
	});
	
	/* Check photos 
	-----------------------------------------------------*/
	
	function checkPhotos() {
		if($('#profile-bg img, .page-title-bg img, .blog-slide-photo img').height()<$('#profile-bg img, .page-title-bg img, .blog-slide-photo img').parent().height()) {
			$('#profile-bg img, .page-title-bg img, .blog-slide-photo img').removeClass('too-slim');
			$('#profile-bg img, .page-title-bg img, .blog-slide-photo img').addClass('too-short');
			//console.log('t1');
		}
		if($('#profile-bg img, .page-title-bg img, .blog-slide-photo img').width()<$('#profile-bg img, .page-title-bg img, .blog-slide-photo img').parent().width()) {
			$('#profile-bg img, .page-title-bg img, .blog-slide-photo img').removeClass('too-short');
			$('#profile-bg img, .page-title-bg img, .blog-slide-photo img').addClass('too-slim');
			//console.log('t2');
		}
	}

	checkPhotos();
		
	//console.log($('#profile-bg img, .page-title-bg img, .blog-slide-photo img').height()+'   '+$('#profile-bg img, .page-title-bg img, .blog-slide-photo img').parent().height());
	//console.log($('#profile-bg img, .page-title-bg img, .blog-slide-photo img').width()+'   '+$('#profile-bg img, .page-title-bg img, .blog-slide-photo img').parent().width());
	
	/* Responsive Videos
	-----------------------------------------------------*/

	$(function(){
	  $('body').fitVids();
	});
	
	/* Google Map
	-----------------------------------------------------*/
	
	function mapInitialize() {
	
	  var yourLatitude = 50.402;
	  var yourLongitude = 18.89;
	  
	  var myOptions = {
		zoom: 14,
		center: new google.maps.LatLng(yourLatitude,yourLongitude-0.01),
		mapTypeId: google.maps.MapTypeId.ROADMAP,
		mapTypeControl: false,
		panControl: false,
		zoomControl: false,
		scaleControl: false,
		streetViewControl: false,
		styles: [
					  {
						  "stylers": [
							  {
								  "hue": "#F8D25F"
							  },
							  {
								  "invert_lightness": true
							  },
							  {
								  "saturation": -65
							  },
							  {
								  "lightness": 33
							  },
							  {
								  "gamma": 0.5
							  }
						  ]
					  },
					  {
						  "featureType": "water",
						  "elementType": "geometry",
						  "stylers": [
							  {
								  "color": "#2D333C"
							  }
						  ]
					  }
				  ]
	  };
	  
	  var map = new google.maps.Map(document.getElementById('google-map'), myOptions);
	  
	  var image = 'images/my-location.png';
	  var myLatLng = new google.maps.LatLng(yourLatitude,yourLongitude);
	  var myLocation = new google.maps.Marker({
		  position: myLatLng,
		  map: map,
		  icon: image
	  });
	
	}
	
	google.maps.event.addDomListener(window, 'load', mapInitialize);

	/* Contact Form
	-----------------------------------------------------*/
	
	var $contactForm  = $('#contact-form');

    $contactForm.validate({
        rules: {
            name: {
                required    : true,
                minlength   : 1
            },
            email: {
                required    : true,
                email       : true
            },
            message: {
                required    : true,
                minlength   : 10
            }
        },
        messages: {
            name: {
                required    : "Please enter your name."
            },
            email: {
                required    : "Please enter your email address."
            },
            message: {
                required    : "Please enter a message."
            }
        }
    });

    // Send the email
    $contactForm.submit(function(){
        var $success      = '<strong>Success!</strong> Your message was sent.';
	    var $error      = '<strong>Error!</strong> Your message was not sent - try again later...';
      	var response;
        if ($contactForm.valid()){
            $.ajax({
                type: "POST",
                url: "php/contact-form.php",
                data: $(this).serialize(),
                success: function(msg) {
                    if (msg === 'SEND') {
                        response = '<div class="alert alert-success">'+ $success +'</div>';
                    }
                    else {
                        response = '<div class="alert alert-warning">'+ $error +'</div>';
                    }
                    $(".alert-error,.alert-success").remove();
                    $contactForm.prepend(response);
                }
             });
            return false;
        }
        return false;
    });

});

// Tooltip Initialize 
function tooltipIni() {
	$("[rel='tooltip']").tooltip();
}

// Popover Initialize 
function popoverIni() {
	$("[rel='popover']").popover();
}

