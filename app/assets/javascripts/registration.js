$(document).ready(function(){
  $("#formgroup2").hide();
   
  $("#next_button").click(function(){
  	$("#formgroup1").hide();
  	$("#formgroup2").show();
  });

  $("#previous_button").click(function(){
  	$("#formgroup1").show();
  	$("#formgroup2").hide();
  });
});