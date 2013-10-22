$(".item").first().addClass('active');
$('.carousel').carousel();



$("#charityThumb").click(function() {
   $(document).trigger("add-alerts", [
      {
         'message': "You are not a charity.",
         'priority': 'error'
      }
   ]);
   console.log("asdfasdf");
});

$("#businessThumb").click(function() {
   $(document).trigger("add-alerts", [
      {
         'message': "You might want to be a business.",
         'priority': 'warning'
      }
   ]);
});

$("#donorThumb").click(function() {
   $(document).trigger("add-alerts", [
      {
         'message': "You are a doner.",
         'priority': 'info',
         'titles': '<em>Info!</em>'
      }
   ]);
});


$(function() {
   $("#messages").bsAlerts({'titles': {'warning': '<em>Warning!</em>', 'info':'<em>Info</em>', 'error':'Error!', 'success':'Success!'}, 'fade':'3000'});
});

