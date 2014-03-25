charity_ellipsis = function() {
   var a = $('.ellipsis_charity_description div');
   while (a.outerHeight()>$('.ellipsis_charity_description').height()) {
      a.text(function (index, text) {
         return text.replace(/\W*\s(\S)*$/, '...');
      });
   }
};


hover_charity = function() {
   $('.description').hide();   
   
   $( ".user_about_block" ).hover(function() {
      console.log($( this ).children());
      $( this ).children().children('.description').stop().slideToggle("easing");
   });
}


$(document).ready(charity_ellipsis);
$(document).ready(hover_charity);
hover_charity
$(document).on('page:load', charity_ellipsis);
$(document).on('page:load', hover_charity);