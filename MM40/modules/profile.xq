xquery version "3.0";

module namespace profile="http://mm40.comem.ch/profile";

import module namespace templates="http://exist-db.org/xquery/templates" ;
declare namespace TM = "http://ns.comem.ch/cours/TM";
import module namespace Functions='Functions' at 'functions.xq';

declare default element namespace "http://www.w3.org/1999/xhtml";

declare %templates:default("id", "marine-lemonis-mm40") function profile:all($node as node(), $model as map(*), $id as xs:string) as 
map(*) {
    let $projets := collection("/db/apps/MM40/data/projets")//TM:projet
    let $profile := collection("/db/apps/MM40/data/profile")/TM:profile[contains(@id, $id)]
    return
        map { "projets" := $projets, "profile" := $profile}
};

declare %templates:wrap function profile:nom($node as node(), $model as map(*))
{
    concat($model("profile")/TM:prenom/text(), " ", $model("profile")/TM:nom/text())
};
declare function profile:imgbase($node as node(), $model as map(*))
{
    <img src="{$model("profile")//TM:photo[@genre eq 'base']/@url}"/>
};
declare %templates:wrap function profile:usp($node as node(), $model as map(*))
{
    $model("profile")/TM:usp/text()
};
declare function profile:desc($node as node(), $model as map(*))
{
<article class="profil_desc">
            <section class="content">
            { for $p in $model("profile")//TM:p
                return (
                <p>{$p/text()}</p>
                )
            }
            </section>
        </article>
};
declare function profile:projet($node as node(), $model as map(*))
{
<article class="my_projects">
            <section class="content">
                <h1>Liste Projets Participés</h1>
                <ul>
                    { for $project in $model("profile")//TM:projet
                    return (
                    <li>
                        <a href="projet.html?id={$project/@id}">{$model("projets")[contains(@id, $project/@id )]/TM:nom}</a>
                    </li> 
                    )
                    }
                </ul>
            </section>
        </article>
};
declare function profile:contact($node as node(), $model as map(*))
{
    <article class="contact_me">
                <section class="content">
                    <h1>Me contacter</h1>
                    <ul>
                        { for $lien in $model("profile")//TM:lien
                    return
                        <li><a href="{$lien/@url}">{$lien/text()}</a></li>
                        }
                    </ul>
                </section>
            </article>
};