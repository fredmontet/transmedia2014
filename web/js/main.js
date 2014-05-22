// @codekit-prepend "vendor/jquery-2.1.1.js"
// @codekit-append "_resize.js"

var burgerActive = false;
var projectsActive = false;
var projectProcess = false;
var projectsBottomActive = false;
var projectBottomProcess = false;

$(document).ready( function() {

    socialColor();
    coulure();
    
    $("#project_bottom ul").cleanWhitespace();
    $("#project ul").cleanWhitespace();
    $(".testimony").cleanWhitespace();
    $("body").cleanWhitespace();
    $(".principalTestimony").cleanWhitespace();
    
	
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
	
	$("footer").on('click', '#project_bottom', function() {
    	if(projectsBottomActive) {
        	closeProjectBottom();
    	} else {
        	openProjectBottom();
    	}
	});
	
	$('html').click(function() {
		if(burgerActive) {
			closeBurger();
		}
		
		if(projectsActive) {
			closeProject();
		}
		
		if(projectsBottomActive) {
			closeProjectBottom();
		}
	});
	
	$("html").on('click', '.characteristic .content > article', function() {
    	
    	$(".details", this).toggle( "slow" );
    	
	});
	
});


jQuery.fn.cleanWhitespace = function() {
    textNodes = this.contents().filter(
        function() { return (this.nodeType == 3 && !/\S/.test(this.nodeValue)); })
        .remove();
    return this;
}


function coulure() {
    $("#container.eb005e-2014 .title").each( function() {
        $(this).after('<div id="coulure"><div class="left"></div><div class="right"></div></div>');
    });
}


function openProject() {

    if(projectProcess) {
        return;
    }
    projectProcess = true;
	
    var navHeight = $("#project ul").height();
    
    $("#project ul").height(0);
    $("#project ul").show();
    
    $("#project ul").animate({
        height: navHeight
    }, 300, function() {
        projectsActive = true;
        projectProcess = false;
    });

}



function closeProject() {
    
    if($(window).width() < 500) {
        return;
    }
    
    if(projectProcess) {
        return;
    }
    projectProcess = true;
    
    var navHeight = $("#project ul").height();
    
    $("#project ul").animate({
        height: 0
    }, 300, function() {
        projectsActive = false;
        projectProcess = false;
        $("#project ul").hide();
        $("#project ul").height("inherit");
    });
	
}


function openProjectBottom() {

    if(projectBottomProcess) {
        return;
    }
    projectBottomProcess = true;
	
    var navHeight = $("#project_bottom ul").height();
    
    $("#project_bottom ul").height(0);
    $("#project_bottom ul").show();
    
    $("#project_bottom ul").animate({
        height: navHeight
    }, 300, function() {
        projectsBottomActive = true;
        projectBottomProcess = false;
    });

}


function closeProjectBottom() {
    
    if(projectBottomProcess) {
        return;
    }
    projectBottomProcess = true;
    
    var navHeight = $("#project_bottom ul").height();
    
    $("#project_bottom ul").animate({
        height: 0
    }, 300, function() {
        projectsBottomActive = false;
        projectBottomProcess = false;
        $("#project_bottom ul").hide();
        $("#project_bottom ul").height("inherit");
    });
	
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
    
    if($(window).width() > 500) {
        return;
    }
    
    $("header nav ul li ul").show();
    
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
