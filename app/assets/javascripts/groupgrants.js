//
renderKnob = function() 
{ 
	console.log("sdfgdsdfg");
	if($(".dial").length > 0)
	{
	  $(".dial").knob({
	    'draw' : function () { 
	      $(this.i).val(this.cv + '%');
	    }
	  });
	}
};

set_amount_field = function()
{
	
	$(".amount_radio").click(function(e) {
		$("#amount_field").val($(e.target).val());
	});
};

// Send a request to a groupgrant
sendRequest = function() 
{
	$("#request").click(function() {
		var groupgrantID = $(this).data("groupgrant");
		$.ajax({
		    // the URL for the request
		    url: "/groupgrant/connect",
		 
		    // the data to send (will be converted to a query string)
		    data: {
		        id: groupgrantID
		    },
		    // whether this is a POST or GET request
		    type: "POST",
		 
		    // code to run if the request succeeds;
		    // the response is passed to the function
		    success: function( data) {
		    	if (data == "true")
		    	{
			    	$("#request").remove();
			    	$("#sponsors").append("<h3>A request has been sent.</h3>");
			    }
			    else
			    	alert(data)
		    },

		    error: function(data) {
        		alert("error " + data.name );
   			}
		});
	});
};


// Cancel a request
cancelRequest = function() 
{
	$("#cancel").click(function() 
	{
		var groupgrantID = $(this).data("groupgrant");
		$.ajax({
		    // the URL for the request
		    url: "/groupgrant/cancelRequest",
		 
		    // the data to send (will be converted to a query string)
		    data: {
		        id: groupgrantID
		    },
		    // whether this is a POST or GET request
		    type: "POST",
		    
		    // code to run if the request succeeds;
		    // the response is passed to the function
		    success: function( data) {
		    	$("#cancel").remove();
		    	$("#sponsors").append("<h3>Your request has been cancelled.</h3>");		    	
		    },

		    error: function(data) {
        		alert("error " + data.name );
   			}
		});
	});
};



$(window).load(function() {
   renderKnob();
   sendRequest();
   cancelRequest();
   set_amount_field();  
});

$(document).on('page:load', renderKnob);
$(document).on('page:load', sendRequest);
$(document).on('page:load', cancelRequest);
$(document).on('page:load', set_amount_field);



