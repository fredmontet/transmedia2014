// @codekit-prepend "vendor/jquery-2.1.1.js"
//https://github.com/timmywil/jquery.panzoom

$(document).ready(function() {

    //Initialisation     
    var $panzoom = $(".panzoom").panzoom();

	//Set des variables
	$(".panzoom").panzoom("option", {

		disableZoom: false,
		increment: 10,
		rangeStep: 10,
		minScale: 7,
		maxScale: 10,
		duration: 0,
		startTransform: "matrix(7, 0, 0, 7, 0, 0)",
		easing: "ease-in-out"

	});

	//$(".panzoom").panzoom("option", {});
	//$(".panzoom").panzoom("setMatrix", [ 1, 0, 0, -1, 0, 0 ]);


	//Check des matrices
	console.log("matrix = "+$(".panzoom").panzoom("getMatrix"));
	console.log("transform = "+$(".panzoom").panzoom("getTransform"));


	//ScrollHandler
	$panzoom.parent().on('mousewheel.focal', function( e ) {
		e.preventDefault();
		var delta = e.delta || e.originalEvent.wheelDelta;
		var zoomOut = delta ? delta < 0 : e.originalEvent.deltaY > 0;
		$panzoom.panzoom('zoom', zoomOut, {
			increment: 0.1,
			animate: false,
			focal: e,
		});
	});
});





 