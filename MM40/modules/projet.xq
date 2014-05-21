xquery version "3.0";

module namespace projet="http://mm40.comem.ch/projet";

declare namespace TM = "http://ns.comem.ch/cours/TM";
declare boundary-space preserve;
import module namespace templates="http://exist-db.org/xquery/templates" ;
import module namespace Functions='Functions' at 'functions.xq';

declare default element namespace "http://www.w3.org/1999/xhtml";

declare %templates:default("id", "eb005e-2014") function projet:this($node as node(), $model as map(*), $id as xs:string) as 
map(*) {
    let $projets := collection("/db/apps/MM40/data/projets")
    let $projet := $projets//TM:projet[contains(@id, $id)]
    let $profiles := collection("/db/apps/MM40/data/profile")/TM:profile
    return
        map { "projets" := $projets, "projet" := $projet, "profiles" := $profiles, "test" := "Jonas"}
};

declare %templates:wrap function projet:nom($node as node(), $model as map(*))
{
    $model("projet")/TM:nom/text()
};


declare function projet:next($node as node(), $model as map(*))
{
    let $next := $model("projets")/TM:projet[contains(@id, $model("projet")/@next)]
    return
        <a id="right" href="projet.html?id={$next/@id}" />
};

declare function projet:prev($node as node(), $model as map(*))
{
    let $prev := $model("projets")/TM:projet[contains(@next, $model("projet")/@id)]
    return
        <a id="left" href="projet.html?id={$prev/@id}" />
};




declare %templates:wrap function projet:video($node as node(), $model as map(*))
{
    <div class="player">
        <iframe id="ytplayer" type="text/html" width="100%" height="100%" src="{$model("projet")//TM:video/@url}" frameborder="0"/>
    </div>
};

declare function projet:description($node as node(), $model as map(*))
{
    <section class="content">
        <h1>Description</h1>
        {$model("projet")//TM:description/TM:p}
        <p class="button">
            <a href="{$model("projet")/@url}">Lien du projet</a>
        </p>
    </section>
};


declare  function projet:temoignage($node as node(), $model as map(*))
{
    <article class="testimony">
        <section class="content">
        <h1>Temoignages</h1>
               { for $temoin in $model("profiles")[contains(@id, data($model("projet")//TM:temoignage//@id))]
                    return
                <div>
                    <section class="left">
                        <img src="{$temoin//TM:photo[@genre eq 'base']/@url}"/>
                    </section><section class="right">
                        <p class="quotes">{$model("projet")//TM:temoignage[contains(TM:personne/@id, $temoin/@id)]}</p>
                        <p class="button">
                            <a href="profile.html?id={$temoin/@id}">{$temoin//TM:prenom} {$temoin//TM:nom}</a>
                        </p>
                    </section>
                </div>
                }
            </section>     
        </article>
};

declare function projet:domaines($node as node(), $model as map(*))
{
   <article class="characteristic">
     <section class="content">
        { for $domaine in $model("projet")//TM:domaine
           return 
            <article>
            <h1>{data($domaine/@nom)}</h1>
            <section class="points">
                { for $i in 1 to 5 
                    let $num := number($domaine/@poids)
                    let $res :=
                        if( $i <= $num) then
                            <div class="on"></div>
                        else
                            <div class="off"></div>
                    return $res
                
                }
            </section>
            <section class="details">
                <article class="left">
                    <h1>Processus</h1>
                    <ul>
                        { for $tache in $domaine//TM:tache
                            return
                                <li>{data($tache)}</li>
                        }
                    </ul>
                </article>
                <article class="right">
                    <h1>Outils</h1>
                    <ul>
                        { for $outil in $domaine//TM:outil
                            return
                                <li>{data($outil)}</li>
                        }
                    </ul>
                </article>
            </section>
        </article>
        }
     </section>
    </article>

};


declare function projet:team($node as node(), $model as map(*))
{
            <article class="team">
            <section class="content">
            <h1>Team du projet</h1>
                { for $member in $model("profiles")[contains(@id, data($model("projet")//TM:team/TM:personne/@id))]
                   return 
                       <a href="profile.html?id={data($member/@id)}">
                            <img src="{data($member//TM:photo[@genre eq 'base']/@url)}"/>
                        </a>
                }
            </section>
            </article>
};

declare function projet:superviseur($node as node(), $model as map(*))
{
    let $superviseur := $model("projet")//TM:superviseur
    return
    <article class="principalTestimony">
        <section class="content">
            <h1>Témoignage du mandant</h1>
            <section class="left">
                <img src="{data($superviseur//TM:logo/@url)}" />
            </section><section class="right">
                <h2>
                    {data($superviseur//TM:prenom)}    {data($superviseur//TM:nom)} – {data($superviseur//TM:role)}</h2>
                {data($superviseur//TM:commentaire)}
                <p class="button"><a href="{data($superviseur//TM:organisation/@url)}">{data($superviseur//TM:organisation)}</a></p>
            </section>
        </section>
    </article>
};