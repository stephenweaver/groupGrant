$(document).ready(function(){

	if (true)
	{
		console.log("this area is working")
	}
	else
	{
	  $("#formgroup2").hide();
	   
	  $("#next_button").click(function(){
	  	$("#formgroup1").hide("fast", "swing");
	  	$("#formgroup2").show();
	  });

	  $("#previous_button").click(function(){
	  	$("#formgroup1").show("fast", "swing");
	  	$("#formgroup2").hide();
	  });
	}
});







// Work In Progress ---------------------------------------------------------
// $("#formgroup1").animate({right:'999px'}, 1000).fadeOut("slow").dequeue();