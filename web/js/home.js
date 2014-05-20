// @codekit-prepend "vendor/jquery-2.1.1.js"
// @codekit-prepend "vendor/svg-pan-zoom.js"
// @codekit-prepend "vendor/snap.svg.js"

$(document).ready(function(){
	
	init();

	//Interactions avec la map
	/************************************************************/
	
	//Initialisation des action pour les différents projets
	$(".project").mouseenter(function(){
		var project = "\#"+$(this).attr("id");
		Snap.select(project).animate({fill: 'red'}, 100, mina.ease);
		
	});

	$(".project").mouseleave(function(){
		var project = "\#"+$(this).attr("id");
		Snap.select(project).animate({fill: '#010102'}, 100, mina.ease);

	});

	$(".ligne").mouseover(function(){
		var ligne = "\#"+$(this).attr("id")
	});

	$(".pole").mouseover(function(){
		var ligne = "\#"+$(this).attr("id");
	});






	function test(){
		console.log("je tesssssssssssssssst");
	};


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
	var svgPosX = Math.floor(($(window).width()/100)*46.6);
	var svgPosY = Math.floor(($(window).height()/100)*53);

	//Paramètres d'affichage de la carte
	panZoomTiger.setMaxZoom(17);
	panZoomTiger.setMinZoom(1);
	panZoomTiger.zoomAtPointBy(11, {x: svgPosX, y: svgPosY});



	

	//Préparation pour pouvoir appeler les éléments de la carte dans
	//le DOM SVG en jQuery sans confusions.
	//var map = document.getElementById("map");
	//console.log(map);

	//var project = Snap(".project");

	


	/*
	var seminaire = Snap("#seminaire");
	var stuttgart = Snap("#stuttgart");
	var transmedia = Snap("#transmedia");
	var cinemalingua = Snap("#cinemalingua");
	var stalker = Snap("#stalker");
	var radiocomem = Snap("#radiocomem");
	var paleo = Snap("#paleo");
	*/


	


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







