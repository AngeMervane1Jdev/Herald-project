
  jQuery('.field_with_errors').attr('class',"");
   
  jQuery(document).ready(function() {
	// click on next button
	jQuery('.form-wizard-next-btn').click(function() {
		var parentFieldset = jQuery(this).parents('.wizard-fieldset');
		var currentActiveStep = jQuery(this).parents('.form-wizard').find('.form-wizard-steps .active');
		var next = jQuery(this);
		var nextWizardStep = true;
		parentFieldset.find('.wizard-required').each(function(){
			var thisValue = jQuery(this).val();

			if( thisValue == "") {
				jQuery(this).siblings(".wizard-form-error").slideDown();
				nextWizardStep = false;
			}
			else {
				jQuery(this).siblings(".wizard-form-error").slideUp();
			}
		});
		if( nextWizardStep) {
			next.parents('.wizard-fieldset').removeClass("show","400");
			currentActiveStep.removeClass('active').addClass('activated').next().addClass('active',"400");
			next.parents('.wizard-fieldset').next('.wizard-fieldset').addClass("show","400");
			jQuery(document).find('.wizard-fieldset').each(function(){
				if(jQuery(this).hasClass('show')){
					var formAtrr = jQuery(this).attr('data-tab-content');
					jQuery(document).find('.form-wizard-steps .form-wizard-step-item').each(function(){
						if(jQuery(this).attr('data-attr') == formAtrr){
							jQuery(this).addClass('active');
							var innerWidth = jQuery(this).innerWidth();
							var position = jQuery(this).position();
							jQuery(document).find('.form-wizard-step-move').css({"left": position.left, "width": innerWidth});
						}else{
							jQuery(this).removeClass('active');
						}
					});
				}
			});
		}
	});
	//click on previous button
	
	//click on form submit button
	jQuery(document).on("click",".form-wizard .form-wizard-submit" , function(){
		var parentFieldset = jQuery(this).parents('.wizard-fieldset');
		var currentActiveStep = jQuery(this).parents('.form-wizard').find('.form-wizard-steps .active');
		parentFieldset.find('.wizard-required').each(function() {
			var thisValue = jQuery(this).val();
			if( thisValue == "" ) {
				jQuery(this).siblings(".wizard-form-error").slideDown();
			}
			else {
				jQuery(this).siblings(".wizard-form-error").slideUp();
			}
		});
	});
	// focus on input field check empty or not
	jQuery(".form-control").on('focus', function(){
		var tmpThis = jQuery(this).val();
		if(tmpThis == '' ) {
			jQuery(this).parent().addClass("focus-input");
		}
		else if(tmpThis !='' ){
			jQuery(this).parent().addClass("focus-input");
		}
	}).on('blur', function(){
		var tmpThis = jQuery(this).val();
		if(tmpThis == '' ) {
			jQuery(this).parent().removeClass("focus-input");
			jQuery(this).siblings('.wizard-form-error').slideDown("3000");
		}
		else if(tmpThis !='' ){
			jQuery(this).parent().addClass("focus-input");
			jQuery(this).siblings('.wizard-form-error').slideUp("3000");
		}
	});
  });


  var menuType = 'desktop';

  $(window).on('load resize', function() {
	  var mode = 'desktop';
	  var wrapMenu = $('#site-header-inner .wrap-inner');
	  var navExtw = $('.nav-extend.active');
	  var navExt = $('.nav-extend.active').children();

	  if ( matchMedia( 'only screen and (max-width: 991px)' ).matches )
		  mode = 'mobile';

	  if ( mode != menuType ) {
		  menuType = mode;

		  if ( mode === 'mobile' ) {
			  $('#main-nav').attr('id', 'main-nav-mobi')
				  .appendTo('#site-header')
				  .hide().children('.menu').append(navExt)
					  .find('li:has(ul)')
					  .children('ul')
						  .removeAttr('style')
						  .hide()
						  .before('<span class="arrow"></span>');
		  } else {
			  if ( $('body').is('.header-style-3') )
				  wrapMenu = $('.site-navigation-wrap .inner');

			  $('#main-nav-mobi').attr('id', 'main-nav')
				  .removeAttr('style')
				  .prependTo(wrapMenu)
				  .find('.ext').appendTo(navExtw)
				  .parent().siblings('#main-nav')
				  .find('.sub-menu')
					  .removeAttr('style')
				  .prev().remove();
					  
			  $('.mobile-button').removeClass('active');
		  }
	  }
  });

  $(document).on('click', '.mobile-button', function() {
	  $(this).toggleClass('active');
	  $('#main-nav-mobi').slideToggle();
  })

  $(document).on('click', '#main-nav-mobi .arrow', function() {
	  $(this).toggleClass('active').next().slideToggle();
  })

  var alertBox = function() {
	$(document).on('click', '.close', function(e) {
		$(this).closest('.flat-alert').remove();
		e.preventDefault();
	})     

};