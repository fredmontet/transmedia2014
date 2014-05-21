xquery version "3.0";


module namespace team="http://mm40.comem.ch/team";


import module namespace templates = "http://exist-db.org/xquery/templates";


declare namespace TM = "http://ns.comem.ch/cours/TM";


import module namespace Functions = 'Functions' at 'functions.xq';


declare default element namespace "http://www.w3.org/1999/xhtml";


declare %templates:default function team:all($node as node(), $model as map(*))
{
            <section class="content">
                <h1>Profils</h1>
    {
        let $profile := collection("/db/apps/MM40/data/profile")/TM:profile
        for $p in $profile
        return
            <a href="profile.html?id={ $p/@id }">
                    <img src="{ $p//TM:photo[@genre eq 'base'] }"/>
                    <span>{ $p/TM:nom/text() }</span>
                </a>
    }


            </section>
};


