xquery version "3.0";

module namespace projet="http://mm40.comem.ch/projet";

declare namespace TM = "http://ns.comem.ch/cours/TM";
import module namespace templates="http://exist-db.org/xquery/templates" ;
import module namespace Functions='Functions' at 'functions.xq';

declare default element namespace "http://www.w3.org/1999/xhtml";

declare %templates:default("id", "stalker") function projet:this($node as node(), $model as map(*), $id as xs:string) as 
map(*) {
    let $projet := collection("/db/apps/MM40/data/projets")//TM:projet[contains(@id, $id)]
    (:let $temoins := collection("/db/apps/MM40/data/profile")/TM:profile[@id eq $projet//TM:temoignage/TM:personne/@id]:)

    return
        map { "projet" := $projet}
};

declare %templates:wrap function projet:nom($node as node(), $model as map(*))
{
    $model("projet")/TM:nom/text()
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
                <h1>Temoignage</h1>
                <section class="left">
                    <img src="images/portrait.jpg"/>
                </section>
                <section class="right">
                    <p class="quotes">{$model("projet")//TM:temoignage/TM:p}</p>
                    <p class="button">
                        <a href="profile.html?id={$model("projet")//TM:temoignage/TM:profile/@id}">Marine Lemonis</a>
                    </p>
                </section>
            </section>
        </article>
};
