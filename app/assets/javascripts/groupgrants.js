// Needed for Facebook API
// window.fbAsyncInit = function() {
//    FB.init({
//    appId      : '603004516422329',
//    status     : true,
//    xfbml      : true
//    });
//    };

//    (function(d, s, id){
//    var js, fjs = d.getElementsByTagName(s)[0];
//    if (d.getElementById(id)) {return;}
//    js = d.createElement(s); js.id = id;
//    js.src = "//connect.facebook.net/en_US/all.js";
//    fjs.parentNode.insertBefore(js, fjs);
//    }(document, 'script', 'facebook-jssdk'));

// !function(d,s,id)
//  {
//  	 Twitter API
// 	 var js,fjs=d.getElementsByTagName(s)[0];

// 	 if(!d.getElementById(id))
// 	 {
// 	 js=d.createElement(s);
// 	 js.id=id;
// 	 js.src="https://platform.twitter.com/widgets.js";
// 	 fjs.parentNode.insertBefore(js,fjs);
// 	 }
// 	 }
// 	 (document,"script","twitter-wjs");

// 	 $(document).ready(function(){
// 	 var href = location.pathname;
// 	 var tweet = "<a href=\'http://www.groupGrant.com" + href;
// 	     tweet = tweet + "\' class=\'twitter-share-button\' data-lang=\'en\' data-count=\'none\'>Tweet</a>";
// 	 var share = "<div class=\'fb-share-button\' data-href=\'http://www.groupGrant.com" + href + "\'data-width=\'100\' data-type=\'button\'></div>";

// 	 $("#tweets").html(tweet);
// 	 $("#sharePage").html(share);
//  });

renderKnob = function() { 
  $(".dial").knob({
    'draw' : function () { 
      $(this.i).val(this.cv + '%');
    }
  });
};

// Send a request to a groupgrant
sendRequest = function() {
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
cancelRequest = function() {
	$("#cancel").click(function() {
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
   
   //renderKnob();
   sendRequest();
   cancelRequest();   
});

//$(document).on('page:load', renderKnob);
$(document).on('page:load', sendRequest);
$(document).on('page:load', cancelRequest);


