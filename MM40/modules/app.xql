xquery version "3.0";


module namespace app="http://mm40.comem.ch/templates";


import module namespace templates = "http://exist-db.org/xquery/templates";


declare namespace TM = "http://ns.comem.ch/cours/TM";


import module namespace Functions = 'Functions' at 'functions.xq';


declare default element namespace "http://www.w3.org/1999/xhtml";

(:~
 : This is a sample templating function. It will be called by the templating module if
 : it encounters an HTML element with an attribute: data-template="app:test" or class="app:test" (deprecated). 
 : The function has to take 2 default parameters. Additional parameters are automatically mapped to
 : any matching request or function parameter.
 : 
 : @param $node the HTML node with the attribute which triggered this call
 : @param $model a map containing arbitrary data - used to pass information between template calls
 :)
declare %templates:default %templates:wrap function app:nav($node as node(), $model as map(*))
{
    let $projets := collection("/db/apps/MM40/data/projets")/TM:projet
        for $p in $projets
        return
    <li><a href="projet.html?id={$p/@id}">{$p/TM:nom_court/text()}</a></li>

};