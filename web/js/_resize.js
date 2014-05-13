$(document).ready( function() {
	resize();
	
	// If the window is resised
	$(window).resize(function() {
        resize();
	});
});

function resize() {
    
    $(".player").each( function() {
        var playerWidth = $(this).width();
        $(this).css("height", playerWidth*9/16);
    });
    
}