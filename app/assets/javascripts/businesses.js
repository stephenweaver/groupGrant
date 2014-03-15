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

//---------------------------------------------------------
// Invite a business to join a groupgrant
// Created by Koffi
//---------------------------------------------------------
invite = function()
{
  $("#b_invite").click(function()
  {
    var groupgrantID = $("#autocomplete option:selected").val();
    var bid = $("#bid").val();
    if (bid != "")
    { 
      $.ajax({
          // the URL for the request
          url: "/groupgrant/invite_business",
       
          // the data to send (will be converted to a query string)
          data: {
              business: bid,    // Sending business ID
              gID: groupgrantID // Sending groupgrant ID
          },
          // whether this is a POST or GET request
          type: "POST",
          
          // code to run if the request succeeds;
          // the response is passed to the function
          success: function( data) {
            if (data == "true")
            {
              alert("Your request has been sent");
              location.reload(true)
            }
            else
              alert(data)
          },
      });
    }
  });
}


$(window).load(function() {
   chosen();
   invite();
});
$(document).on('page:load', chosen);
$(document).on('page:load', invite);
