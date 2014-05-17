xquery version "3.0";

module namespace projet="http://mm40.comem.ch/projet";

declare namespace TM = "http://ns.comem.ch/cours/TM";
import module namespace Functions='Functions' at 'functions.xq';

declare default element namespace "http://www.w3.org/1999/xhtml";


declare %templates:wrap
function projet:this($node as node(), $model as map(*), $query as xs:string) as 
map(*) {
    let $projets := collection("/db/apps/MM40/data/projets")//TM:projet[contains(@id, $id)]
    return
        map { "projets" := $projets }
};

declare function projet:all($node as node(), $model as map(*), $id as xs:string?) {
let $projets := collection("/db/apps/MM40/data/projets")//TM:projet[contains(@id, $id)]
return
    <p>{$projets} @@@@@@@</p>
};
