hide = function() {
	$('.hideHype').click(function() {
		$(this).slideToggle();
	});
}

$(window).load(function() {
   hide();
});
$(document).on('page:load', hide);