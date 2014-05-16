// @codekit-prepend "vendor/jquery-2.1.1.js"

$(window).load(

//main function


	function (){
			
		var map = document.getElementById("map").getSVGDocument();
		console.log(map);	

		mouseHandler();

/*
*	functions 
*/


		function mousePos() {

			window.onmousemove = handleMouseMove;
			handleMouseMove();

			function handleMouseMove(event) {
        	event = event || window.event; // IE-ism
        	// event.clientX and event.clientY contain the mouse position
        	var x = event.clientX;
        	var y = event.clientY;
        	console.log("x = "+event.clientX+" y = "+event.clientY);
        	}
		}

		function scrollHandler(){

		}

		function mouseHandler(){
			$("#viewport", map)
				.mouseup(function() {
				    console.log("mouse up");
				    mousePos();
				  })
				.mousedown(function() {
				    console.log("mouse down");
				    mousePos();
				  });
		}
	}
);







 