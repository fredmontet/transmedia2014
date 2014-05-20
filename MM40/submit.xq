xquery version "3.0";

import module namespace xmldb="http://exist-db.org/xquery/xmldb";
import module namespace request="http://exist-db.org/xquery/request";


declare default element namespace "http://www.w3.org/1999/xhtml";
declare option exist:serialize "method=xhtml media-type=text/html omit-xml-declaration=yes encoding=iso-8859-15 indent=yes doctype-public=-//W3C//DTD&#160;XHTML&#160;1.0&#160;Strict//EN doctype-system=http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd";

let $log-in := xmldb:login("/db", "admin", "admin")
let $create-collection := xmldb:create-collection("/db/apps/MM40/data", "feedback")

let $name := request:get-parameter("name", "Pinkvader")
let $firstname := request:get-parameter("firstname", "Mister")
let $company := request:get-parameter("company", "MM40")
let $email := request:get-parameter("email", "pinkvader@heig-vd.ch")
let $type := request:get-parameter("type", "transmedia")
let $message := request:get-parameter("message", "Hello World")
let $date := fn:current-dateTime()
let $dateString := fn:format-dateTime($date, "[Y0001][M01][D01]")

let $content := 
    <feedback>
        <name>{$name}</name>
        <firstname>{$firstname}</firstname>
        <company>{$company}</company>
        <email>{$email}</email>
        <type>{$type}</type>
        <message>{$message}</message>
    </feedback>
let $res := xmldb:store("/db/apps/MM40/data/feedback", concat($company, "-", $name, "-", $dateString, ".xml"), 
$content)
return 
<html lang="fr">
    <head>
    <meta charset="utf-8" />
        <title>Merci!</title>
        <meta name="viewport" content="initial-scale=1, minimum-scale=1, user-scalable=no, maximum-scale=1, width=device-width, minimal-ui" />
        <meta http-equiv="refresh" content="2; url=index.html" />
        <link rel="stylesheet" href="css/merci.css" type="text/css" />
    </head>
    <body>
	    <h1>Merci</h1>
	    <article class="social">
            <a id="facebook"    target="_blank" href="https://www.facebook.com/EB005E">
                <svg version="1.1" id="Calque_1" xmlns:sketch="http://www.bohemiancoding.com/sketch/ns"
                	 xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="50px" height="50px"
                	 viewBox="0 0 50 50" enable-background="new 0 0 50 50" xml:space="preserve">
                    <title></title>
                    <circle fill="none" stroke="#ffffff" stroke-width="2" stroke-miterlimit="10" cx="25" cy="25" r="23"/>
                    <path fill="#ffffff" d="M26.669,35.12V24.999h2.994l0.396-3.488h-3.391l0.006-1.745c0-0.91,0.093-1.397,1.491-1.397h1.872V14.88
                	h-2.993c-3.598,0-4.864,1.692-4.864,4.538v2.094H19.94v3.488h2.242V35.12H26.669z"/>
                </svg>
            </a>
            <a id="twitter"     target="_blank" href="https://twitter.com/eb005e">
                <svg version="1.1" id="Calque_1" xmlns:sketch="http://www.bohemiancoding.com/sketch/ns"
                	 xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="50px" height="50px"
                	 viewBox="0 0 50 50" enable-background="new 0 0 50 50" xml:space="preserve">
                <title></title>
                <g>
                	<path fill="#ffffff" d="M25,3.84c11.669,0,21.16,9.493,21.16,21.16c0,11.669-9.491,21.16-21.16,21.16
                		C13.333,46.16,3.84,36.67,3.84,25C3.84,13.333,13.333,3.84,25,3.84 M25,2C12.297,2,2,12.298,2,25s10.297,23,23,23
                		c12.702,0,23-10.297,23-23S37.702,2,25,2L25,2z"/>
                </g>
                <path fill="#ffffff" d="M24.708,20.91l0.044,0.756l-0.731-0.093c-2.662-0.354-4.986-1.558-6.96-3.58l-0.965-1.003l-0.249,0.741
                	c-0.526,1.651-0.19,3.394,0.907,4.567c0.585,0.649,0.453,0.741-0.556,0.355c-0.351-0.124-0.658-0.216-0.688-0.169
                	c-0.102,0.107,0.249,1.513,0.526,2.067c0.38,0.771,1.156,1.528,2.004,1.976l0.716,0.354l-0.848,0.018
                	c-0.819,0-0.848,0.016-0.761,0.34c0.292,1.002,1.448,2.066,2.735,2.529l0.906,0.324l-0.789,0.494
                	c-1.169,0.709-2.545,1.109-3.919,1.141c-0.659,0.016-1.2,0.076-1.2,0.123c0,0.154,1.784,1.018,2.823,1.359
                	c3.115,1.002,6.815,0.57,9.594-1.143c1.975-1.219,3.948-3.641,4.869-5.986c0.498-1.25,0.994-3.534,0.994-4.63
                	c0-0.709,0.044-0.802,0.863-1.65c0.481-0.494,0.937-1.034,1.022-1.188c0.146-0.293,0.134-0.293-0.613-0.031
                	c-1.244,0.463-1.42,0.401-0.805-0.293c0.452-0.494,0.994-1.389,0.994-1.651c0-0.046-0.219,0.031-0.468,0.17
                	c-0.264,0.154-0.85,0.386-1.287,0.525l-0.789,0.262l-0.716-0.509c-0.395-0.278-0.951-0.586-1.243-0.679
                	c-0.747-0.217-1.887-0.186-2.56,0.062C25.731,17.161,24.576,18.95,24.708,20.91C24.708,20.91,24.576,18.95,24.708,20.91z"/>
                </svg>
            </a>
            <a id="instagram"   target="_blank" href="http://instagram.com/eb005e">
                <svg version="1.1" id="Calque_1" xmlns:sketch="http://www.bohemiancoding.com/sketch/ns"
                	 xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="50px" height="50px"
                	 viewBox="0 0 50 50" enable-background="new 0 0 50 50" xml:space="preserve">
                <title></title>
                <circle class="" fill="none" stroke="#ffffff" stroke-width="2" stroke-miterlimit="10" cx="25" cy="25" r="23"/>
                <path class="arround" fill="none" stroke="#ffffff" stroke-width="2" stroke-miterlimit="10" d="M35.075,33.749c0.018-0.094,0.03-0.188,0.045-0.284
                	v-16.93c-0.015-0.093-0.027-0.186-0.043-0.279c-0.178-0.949-0.926-1.685-1.845-1.816c-0.039-0.005-0.075-0.014-0.113-0.021H16.881
                	c-0.099,0.019-0.197,0.032-0.293,0.055c-0.897,0.213-1.561,0.969-1.688,1.918c-0.006,0.04-0.014,0.078-0.02,0.118v16.977
                	c0.019,0.107,0.033,0.216,0.057,0.323c0.198,0.917,0.946,1.628,1.837,1.747c0.043,0.005,0.087,0.015,0.13,0.021h16.193
                	c0.106-0.019,0.211-0.034,0.315-0.059C34.237,35.339,34.913,34.619,35.075,33.749z"/>
                <path class="down" fill="#ffffff" d="M17.069,32.451c0,0.449,0.373,0.838,0.804,0.838c4.75,0,9.5,0,14.25,0c0.435,0,0.806-0.387,0.806-0.841
                	c0.001-3.127,0-6.255,0-9.382v-0.065h-1.933c0.273,0.912,0.357,1.839,0.249,2.784c-0.108,0.944-0.399,1.824-0.873,2.636
                	c-0.475,0.814-1.092,1.488-1.844,2.023c-1.953,1.391-4.525,1.515-6.599,0.298c-1.048-0.614-1.87-1.471-2.444-2.574
                	c-0.855-1.647-0.993-3.376-0.49-5.169c-0.642,0-1.28,0-1.927,0v0.057C17.069,26.188,17.069,29.319,17.069,32.451z"/>
                <path class="round" fill="#ffffff" d="M24.906,29.285c2.291,0.052,4.144-1.863,4.193-4.191c0.05-2.4-1.803-4.384-4.1-4.382
                	c-2.244-0.002-4.068,1.887-4.102,4.223C20.866,27.334,22.703,29.235,24.906,29.285z"/>
                <path class="mini-round" fill="#ffffff" d="M32.928,19.002c0.001-0.668,0.001-1.336,0-2.004c0-0.479-0.363-0.861-0.819-0.861
                	c-0.638,0-1.275-0.001-1.912,0c-0.458,0-0.822,0.383-0.822,0.862c0,0.662-0.001,1.325,0.002,1.987
                	c0.001,0.098,0.02,0.202,0.05,0.295c0.115,0.353,0.424,0.568,0.802,0.571c0.307,0,0.616,0,0.923,0
                	c0.332-0.004,0.667,0.002,0.999-0.006C32.579,19.836,32.928,19.451,32.928,19.002z"/>
                </svg>
            </a>
        </article>
    </body>
</html>
