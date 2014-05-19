$(document).ready( function() {
	//resize();
	
	timer = setInterval(function() {
        resize();
        clearInterval(timer);
    }, 100);
    
	// If the window is resised
	$(window).resize(function() {
        resize();
	});
});

function resize() {
    var windowWidth = $(window).width();
    var windowHeight = $(window).height();
    
    $(".player").each( function() {
        var playerWidth = $(this).width();
        $(this).css("height", playerWidth*9/16);
        $("iframe", this).attr("width", playerWidth);
        $("iframe", this).attr("height", playerWidth*9/16);
    });
    
    $(".content .right").each( function() {
        var right = $(this);
        var content = $(this).parent();
        var left = $(".left", content);
        
        var leftHeight = $(left).height();
        var rightHeight = $(right).height();
        
        if(rightHeight > leftHeight) {
            $(right).addClass("bigger");
            $(left).addClass("smaller");
        } else {
            $(right).removeClass("bigger");
            $(left).removeClass("smaller");
        }
        
    });
    
    $("#coulure").each( function() {
        var contentWidth = $(".content").width();
        var coulureWidth = (windowWidth - contentWidth)/2;
        
        $(".left", this).css("width", coulureWidth);
        $(".right", this).css("width", coulureWidth);
        
    });
    
    
    $("article.video").each( function() {
        var videoPos = $(".player", this).position();
        var videoHeight = $(".player", this).height();
        var videoWidth = $(".player", this).width();
        
        $("#left, #right", this).css("height", videoHeight);
        
        var arrowHeight = $("#left", this).height();
        
        var arrowTop = videoPos.top + videoHeight/2 - arrowHeight/2;
        var arrowWidth = (windowWidth - videoWidth) /2;
        
        $("#left", this).css("left", 0);
        $("#right", this).css("right", 0);
        $("#left, #right", this).css("top", arrowTop);
        $("#left, #right", this).css("width", arrowWidth);
        
        $("#container > header").addClass("has_a_video");
        
    });
}