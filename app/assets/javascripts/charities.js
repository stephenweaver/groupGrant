charity_ellipsis = function() {
   var a = $('.ellipsis_charity_description div');
   while (a.outerHeight()>$('.ellipsis_charity_description').height()) {
      a.text(function (index, text) {
         return text.replace(/\W*\s(\S)*$/, '...');
      });
   }
};


hover_charity = function() {   
   $( ".user_about_block" ).hover(
	  function() {
      $( this ).children().children('.description').stop().slideDown("easing");
	 }, function() {
      $( this ).children().children('.description').stop().slideUp("easing");
	  }
   );
   
   $(".user_about_block").click(function() 
	    {
		   $('.description').hide();
		}
    );
}


$(document).ready(charity_ellipsis);
$(document).ready(hover_charity);
hover_charity
$(document).on('page:load', charity_ellipsis);
$(document).on('page:load', hover_charity);