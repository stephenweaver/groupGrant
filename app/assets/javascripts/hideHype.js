hide = function() {
	$('.hideHype').click(function() {
      var temp = $(this)
      temp.clearQueue();
      temp.stop();
		temp.slideToggle()
	});
}

$(window).load(function() {
   hide();
});
$(document).on('page:load', hide);