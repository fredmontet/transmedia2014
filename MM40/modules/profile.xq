xquery version "3.0";

module namespace profile="http://mm40.comem.ch/profile";

import module namespace templates="http://exist-db.org/xquery/templates" ;
declare namespace TM = "http://ns.comem.ch/cours/TM";
import module namespace Functions='Functions' at 'functions.xq';

declare default element namespace "http://www.w3.org/1999/xhtml";

declare function profile:all($node as node(), $model as map(*), $id as xs:string?) {
let $profiles := collection("/db/apps/MM40/data/profiles")//TM:profile[contains(@id, $id)]
return
    <p>{$profiles}</p>
};

