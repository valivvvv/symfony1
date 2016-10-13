$(document).ready(function() {
	
	// Mobile navigation
	mobileNavigation();
	
});
	
// Mobile navigation
function mobileNavigation() {
	$('#mobile-nav-btn').click(function() {
		$('#mobile-nav').toggle();
		$('body, html').toggleClass('no-scroll');
 
		if($('#mobile-nav').is(":visible")) {
			var mobile_nav_height = $(window).height() - $('#mobile-header').height();
			$('#mobile-nav').css('height',mobile_nav_height+'px');
		};
	});		 
};	