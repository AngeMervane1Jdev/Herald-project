
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





// $.fn.serializeObject = function() {
//   var values = {}
//   $("#form1 input, #form1 select, #form1 textarea").each( function(){
//      values[this.name] = $(this).val();
//   });
  
//   return values;
// }
// function validateEmail(email) {
//    const re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
//    return re.test(email);
//  }



// function submit() {

//      $(".loader").css("display","block"); 
//      var valid=true;

//        $("input").prop("disabled",true);
//       setTimeout(()=>{
//       $('#loader').css("display","none");
    

//      var user_info = $(this).serializeObject();
      
//      alert('ddddddddddddddd'); 
     
//      alert(JSON.stringify(user_info));

     
//      if(!validateEmail(user_info['user[email]'])){
//         $(".error_email").css("display","block")
//         valid=false;
//         alert('email');
//      }

//      if(validateEmail(user_info['user[email]'])) {
//       $.post('/checkemail?email='+user_info['user[email]'],function(data){
//          if (!data.email_exists) {
//             $(".error_email_unique").css("display","block")
//              valid=false;
//              alert('email 2');
//          }
//       });
//      }

//      if(user_info['user[name]'].length<3){
//          $(".error_name").css("display","block")
//         valid=false;
//         alert('name');
//      }

//      if(user_info['user[surname]'].length<3){
//         $(".error_surname").css("display","block")
//         valid=false;
//         alert('surname');

//      }
     
   
//      if(user_info['user[tel]'].length<8){
//         $(".error_tel").css("display","block")
//         valid=false;
//         alert('tel');
//      }
//      if(user_info['user[position]'].length<10){
//         $(".error_position").css("display","block")
//         valid=false;
//         alert('position');
//      }
//      if(user_info['user[password]'].length<6){
//       $(".error_password").css("display","block")
//       valid=false;
//      }
//      if(user_info['user[password]'].length>6 && user_info['user[password]']!=user_info['user[password_confirmation]']){
//       $(".error_password_confirmation").css("display","block")
//       valid=false;
//      }

//      if(valid) {
//         alert('salut')
//          $.ajax({
//                   type: "POST",
//                   url: "http://localhost:3000/users",
//                   data: user_info,
//                   success: function(json){
//                      alert("-------------------->"+json);
//                      $("input").prop("disabled",false);
//                      if (!$("#second").hasClass('show')){
//                         $("#first").attr("class", "wizard-fieldset");
//                         $("#second").attr("class","wizard-fieldset show");
//                         $('li').last().addClass("active");
//                      }
                       
                    
//                   },
//                    error: function(data) {
//                       console.log("-------------------->"+data);
//                    },
//                      dataType: "json"
//             });
//      }

//    },2000);
//    $("input").prop("disabled",false);
    
  
// }