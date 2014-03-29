




init_form = function() {
     $(document).ready(function(){
     $("#formgroup2").hide();
      
     $("#next_button").click(function(){
      $("#formgroup1").hide("fast", "swing");
      $("#formgroup2").show();
     });

     $("#previous_button").click(function(){
      $("#formgroup1").show("fast", "swing");
      $("#formgroup2").hide();
     });
   });

}



$(window).load(function() {
   init_form();

});
$(document).on('page:load', init_form);