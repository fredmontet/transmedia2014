// @codekit-prepend "vendor/jquery-2.1.1.js"
// @codekit-prepend "vendor/svg-pan-zoom.js"
// @codekit-prepend "vendor/snap.svg.js"

$(document).ready(function(){
	
	init();
	menu();

	//Interactions avec la map
	/************************************************************/
	
	//Initialisation des action pour les différents projets
	$(".project").mouseenter(function(){
		var project = "\#"+$(this).attr("id");
		console.log(project);

		//Coloration de la ligne ou la souris est entrée
		switch(project){
			case "#transmedia":
				Snap.select(project).animate({fill: '#eb005e'}, 100, mina.ease);
			break;
			case "#cinemalingua":
				Snap.select(project).animate({fill: '#1B6834'}, 100, mina.ease);
			break;
			case "#stuttgart":
				Snap.select(project).animate({fill: '#AB280F'}, 100, mina.ease);
			break;
			case "#newsroom":
				Snap.select(project).animate({fill: '#652D2A'}, 100, mina.ease);
			break;
			case "#paleo":
				Snap.select(project).animate({fill: '#3A2159'}, 100, mina.ease);
			break;
			case "#radiocomem":
				Snap.select(project).animate({fill: '#007DA4'}, 100, mina.ease);
			break;
			case "#seminaire":
				Snap.select(project).animate({fill: '#336699'}, 100, mina.ease);
			break;
			case "#stalker":
				Snap.select(project).animate({fill: '#766454'}, 100, mina.ease);
			break;
			case "#tedx":
				Snap.select(project).animate({fill: '#FF2B06'}, 100, mina.ease);
			break;

		}
		
	});	

	$(".project").mouseleave(function(){
		var project = "\#"+$(this).attr("id");
		Snap.select(project).animate({fill: '#010102'}, 100, mina.ease);
	});


	//Initialisation des actions pour les lignes de metro
	$(".ligne").mouseenter(function(){
		
		var ligne = "\#"+$(this).attr("id");

		//Si le curseur rentre dans une autre ligne, on reset la couleur de toues les lignes...
		//if($(this).hasClass("active")==false){
	    Snap.select("#ligne1").animate({fill: '#CCCCCC'}, 100, mina.ease);
		Snap.select("#ligne2").animate({fill: '#B3B3B3'}, 100, mina.ease);
		Snap.select("#ligne3").animate({fill: '#666666'}, 100, mina.ease);

		//On cache toutes les infos
		$(".infoArticle").hide();

		//On enlève toutes les classes actives
		$("#ligne1 #ligne2 #ligne3").removeClass("active");

		//}

		//On set la nouvelle ligne active avec la classe active
		$(this).addClass("active");

		//Coloration de la ligne ou la souris est entrée
		switch(ligne){
			case "#ligne1":
				Snap.select(ligne).animate({fill: '#16679b'}, 100, mina.ease);
			break;
			case "#ligne2":
				Snap.select(ligne).animate({fill: '#3C97D1'}, 100, mina.ease);
			break;
			case "#ligne3":
				Snap.select(ligne).animate({fill: '#8BC5E9'}, 100, mina.ease);
			break;
		}

		

		//Affichage de l'infobox correspondante
		var infoId = ligne+"Info";
		displayInfo(infoId);
		
	});


	//Initialisation des actions pour les poles
	$(".pole").mouseenter(function(){
		var pole = "\#"+$(this).attr("id");
		console.log(pole);
		snapPole = Snap.select(pole);
		console.log(snapPole);
		snapPole.selectAll().animate({fill: '#010102'}, 100, mina.ease);
	});

	$(".pole").mouseleave(function(){
		var pole = "\#"+$(this).attr("id");
		snapPole = Snap.select(pole);
		console.log(snapPole);
		snapPole.selectAll().animate({fill: '#010102'}, 100, mina.ease);
	});

	//Initialisation des actions avec les avatars
	$(".avatar").mouseenter(function(){
		var cercle = "\#"+$(this).attr("id")+" .cercle";
		console.log(cercle);

		

		Snap.select(cercle).animate({fill: '#f4e210'}, 100, mina.ease);

		//On cache toutes les infos
		$(".infoArticle").hide();

		//On enlève toutes les classes actives
		$(".avatar").removeClass("active");

	});

	$(".avatar").mouseleave(function(){
		var cercle = "\#"+$(this).attr("id")+" .cercle";
		console.log(cercle);
		Snap.select(cercle).animate({fill: '#ffffff'}, 100, mina.ease);
	});


	//Interactions infobox
	/************************************************************/

	$("#infoButton").click(function(){
		$(".infoArticle").hide();
		$("#generalInfo").toggle();
	});



});//$(document).ready END


$(window).load(function(){

	
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
	


});//$(window).load END


//Functions
/************************************************************/

	function init(){
		$(".infoArticle").not("#generalInfo").hide();
		$("#menu").hide();
	}

	function menu(){
		$("#toggleMenu").click(function(){
			$("#menu").slideToggle();
		});
	}

	function test(){
			console.log("je tesssssssssssssssst");
	}

	function displayInfo(articleToDisplay){
		$("#generalInfo").hide();
		var articleReceived = articleToDisplay.toString();
		var articleSelector = articleReceived;
		console.log("displayInfo ArticleToDisplay function = "+articleToDisplay);
		$(articleSelector).show();	
	}
			










