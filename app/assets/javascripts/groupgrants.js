ellipsis = function() {
   var a = $('.ellipsis_gg_title div');
   console.log("test");
   while (a.outerHeight()>$('.ellipsis_gg_title').height()) {
      a.text(function (index, text) {
         return text.replace(/\W*\s(\S)*$/, '...');
      });
   }

   a = $('.ellipsis_gg_about div');
   while (a.outerHeight()>$('.ellipsis_gg_about').height()) {
      a.text(function (index, text) {
         return text.replace(/\W*\s(\S)*$/, '...');
      });
   }
};


$(document).ready(ellipsis);
$(document).on('page:load', ellipsis);