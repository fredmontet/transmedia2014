$(document).ready(function(){
	
	init();

});//$(document).ready END


$(window).load(function(){

	menu();


	//Initialisation et management de l'affichage de la map
	/************************************************************/

	//A titre informatif
	var screenWidth = $(window).width();
	var screenHeight = $(window).height();
	console.log("width = "+screenWidth+"  height = "+screenHeight);

	//Initialisation de la carte
	var panZoomTiger = svgPanZoom('#map')

	//Variables de positionnement de la carte
	var svgPosX = Math.floor(($(window).width()/100)*40);
	var svgPosY = Math.floor(($(window).height()/100)*55);

	//Paramètres d'affichage de la carte
	panZoomTiger.setMaxZoom(17);
	panZoomTiger.setMinZoom(1);
	panZoomTiger.zoomAtPointBy(4, {x: svgPosX, y: svgPosY});


	//Interactions avec la map
	/************************************************************/

	//Préparation pour pouvoir appeler les éléments de la carte dans
	//le DOM SVG en jQuery sans confusions.
	//var map = document.getElementById("map");
	//console.log(map);

	//hover sur un projet
	$(".project").mouseover(function(){
		var initialRadius = $(this).attr("r");
		console.log(initialRadius);
		$(this).attr("r","20");
		return initialRadius;
	});

	$(".project").mouseleave(function(initialRadius){
		console.log(initialRadius);
		$(this).attr("r",initialRadius);
	});

	




});//$(window).load END



//Functions
/************************************************************/

function init(){
	$("#menu").hide();
}

function menu(){
	$("#toggleMenu").click(function(){
		$("#menu").slideToggle();
	});
}







