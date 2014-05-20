// @codekit-prepend "vendor/jquery-2.1.1.js"
// @codekit-append "_resize.js"

var burgerActive = false;
var projectsActive = false;

$(document).ready( function() {

    socialColor();
    coulure();
	
	$("header").on('click', '#burger', function() {
    	if(burgerActive) {
        	closeBurger();
    	} else {
        	openBurger();
    	}
	});
	
	$("header").on('click', '#project', function() {
    	if(projectsActive) {
        	closeProject();
    	} else {
        	openProject();
    	}
	});
	
	$('html').click(function() {
		if(burgerActive) {
			closeBurger();
		}
	});
	
	$("html").on('click', '.characteristic .content > article', function() {
    	
    	$(".details", this).toggle( "slow" );
    	
	});
	
});


function coulure() {
    $("#container.transmedia .title").each( function() {
        $(this).after('<div id="coulure"><div class="left"></div><div class="right"></div></div>');
    });
}


function openProject() {
    $("header nav").animate({
        top: 55
	}, 300, function() {
    	burgerActive = true;
	});
	
	$("header nav").toggle(slow);
	
	
}


function socialColor() {
    var color = $("p.button a").css("background-color");
    
    var facebook = $(".social #facebook svg");
    var twitter = $(".social #twitter svg");
    var instagram = $(".social #instagram svg");
    var linkedin = $(".social #linkedin svg");
    var youtube = $(".social #youtube svg");
    
    $("circle", facebook).attr("stroke", color);
    $("path", facebook).attr("fill", color);
    
    $("path", twitter).attr("fill", color);
    
    $("circle", instagram).attr("stroke", color);
    $("path.arround", instagram).attr("stroke", color);
    $("path.down", instagram).attr("fill", color);
    $("path.round", instagram).attr("fill", color);
    $("path.mini-round", instagram).attr("fill", color);
    
    $("circle", linkedin).attr("stroke", color);
    $("rect", linkedin).attr("fill", color);
    $("path", linkedin).attr("fill", color);
    
    $("path.arround", youtube).attr("stroke", color);
    $("path.inside", youtube).attr("fill", color);
    
}


function openBurger() {
    
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
