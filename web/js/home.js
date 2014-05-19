$(document).ready(function(){
	init();


});

$(window).load(function(){
	menu();

//Map
/************************************************************/

var panZoomTiger = svgPanZoom('#map')
console.log(panZoomTiger.isZoomEnabled());
panZoomTiger.zoomAtPointBy(7, {x: 950, y: 450});
console.log(panZoomTiger.getZoom());



	
});


//Functions
/************************************************************/

function init(){
	$("#menu").hide();
}

function menu(){
	$("#toggleMenu").click(function(){
		$("#menu").slideToggle('slow');
	});
}







