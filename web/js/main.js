// @codekit-prepend "vendor/jquery-2.1.1.js"
// @codekit-append "_resize.js"

var burgerActive = false;

$(document).ready( function() {
	
	$("header").on('click', '#burger', function() {
    	if(burgerActive) {
        	closeBurger();
    	} else {
        	openBurger();
    	}
	});
	
	$('html').click(function() {
		if(burgerActive) {
			closeBurger();
		}
	});
	
});


function openBurger() {
    console.log("openBurger()");
    
    var navHeight = $("header nav").height();
    var navTop = -navHeight - 55;
    $("header nav").css("top", navTop);
    
    $("header nav").show();
    
    $("header nav").animate({
        top: 55
	}, 300, function() {
    	burgerActive = true;
	});
    
    $("header nav").css("position", "fixed");
    $("header").css("position", "fixed");
    $("header").next().css("margin-top", "55px");
    
}

function closeBurger() {
    console.log("closeBurger()");
    
    var navHeight = $("header nav").height();
    var navTop = -navHeight - 55;
    
    $("header nav").animate({
        top: navTop
	}, 300, function() {
    	burgerActive = false;
    	$("header nav").hide();
    	$("header nav").css("position", "absolute");
        $("header").css("position", "relative");
        $("header").next().css("margin-top", 0);
	});
    
    
    
}