chosen = function() { 
    setTimeout(function (){
        var config = {
        '.select_new_contact' : {}
      }
      
      for (var selector in config) {
        $(selector).chosen(config[selector]);
      }

      console.log("this worked");
    }, 500); 
   };


$(window).load(function() {
   chosen();   
});
$(document).on('page:load', chosen);
