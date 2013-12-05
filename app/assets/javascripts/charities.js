charity_ellipsis = function() {
   var a = $('.ellipsis_charity_description div');
   while (a.outerHeight()>$('.ellipsis_charity_description').height()) {
      a.text(function (index, text) {
         return text.replace(/\W*\s(\S)*$/, '...');
      });
   }
};

$(document).ready(charity_ellipsis);
$(document).on('page:load', charity_ellipsis);