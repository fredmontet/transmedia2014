xquery version "3.0";

module namespace projet="http://mm40.comem.ch/projet";

declare namespace TM = "http://ns.comem.ch/cours/TM";
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
        <h1>Temoignage</h1>
               { for $temoin in $model("profiles")[contains(@id, data($model("projet")//TM:temoignage//@id))]
                    return
                <div>
                    <section class="left">
                        <img src="{$temoin//TM:photo[@genre eq 'base']/@url}"/>
                    </section>
                    <section class="right">
                        <p class="quotes">{$model("projet")//TM:temoignage/TM:p}</p>
                        <p class="button">
                            <a href="profile.html?id={$model("projet")//TM:temoignage/TM:profile/@id}">{$temoin//TM:prenom} {$temoin//TM:nom}</a>
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
                       <a href="">
                            <img src="{$member//TM:photo[@genre eq 'base']/@url}"/>
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
                <h2>{data($superviseur//TM:prenom)} {data($superviseur//TM:nom)} – {data($superviseur//TM:role)}</h2>
                {data($superviseur//TM:commentaire)}
                <p class="button"><a href="{data($superviseur//TM:organisation/@url)}">{data($superviseur//TM:organisation)}</a></p>
            </section>
        </section>
    </article>
};

declare function projet:base() {
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title data-template="config:app-title">EB005E</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <meta data-template="config:app-meta"/>
        <link rel="stylesheet" href="css/style.css" type="text/css"/>
        <script type="text/javascript" src="js/main.js"/>
    </head>
    <body>
        <section id="container" class="newsroom-2014">
            <header>
                <section class="content">
                    <a id="simpleLogo" class="logo"/>
                    <a id="burger"/>
                    <nav>
                        <ul>
                            <li>
                                <a href="">Home</a>
                            </li>
                            <li>
                                <a class="active" href="">Projets</a>
                            </li>
                            <li>
                                <a href="">Profils</a>
                            </li>
                            <li>
                                <a href="">Infos</a>
                            </li>
                        </ul>
                    </nav>
                </section>
            </header>
            <div id="content" data-template="projet:this">
                <article class="video">
                    <section class="content">
                        <h1 data-template="projet:nom"/>
                        <a id="left" href="" data-template="projet:prev"/>
                        <div class="player" data-template="projet:video">
                            <iframe id="ytplayer" type="text/html" width="100%" height="100%" src="" frameborder="0"/>
                        </div>
                        <a id="right" href="" data-template="projet:next"/>
                    </section>
                </article>
                <h1 class="{jonas}">Helllo</h1>
                <article class="centered">
                    <section class="content" data-template="projet:description">
                        <h1>{Description}</h1>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                        <p class="button">
                            <a href="">Lien du projet</a>
                        </p>
                    </section>
                </article>
                <article class="testimony" data-template="projet:temoignage">
                    <section class="content">
                        <h1>
                            <a href="{root}">a</a>
                        </h1>
                        <section class="left">
                            <img src="images/portrait.jpg"/>
                        </section>
                        <section class="right">
                            <p class="quotes">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                            <p class="button">
                                <a href="profile.html?id=marine-lemonis">Marine Lemonis</a>
                            </p>
                        </section>
                    </section>
                </article>
                <article class="characteristic" data-template="projet:domaines">
                    <section class="content">
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                    </section>
                </article>
                <article class="team" data-template="projet:team">
                    <section class="content">
                        <h1>Team du projet</h1>
                        <a href="">
                            <img src="images/portrait.jpg"/>
                        </a>
                        <a href="">
                            <img src="images/portrait.jpg"/>
                        </a>
                        <a href="">
                            <img src="images/portrait.jpg"/>
                        </a>
                        <a href="">
                            <img src="images/portrait.jpg"/>
                        </a>
                        <a href="">
                            <img src="images/portrait.jpg"/>
                        </a>
                        <a href="">
                            <img src="images/portrait.jpg"/>
                        </a>
                        <a href="">
                            <img src="images/portrait.jpg"/>
                        </a>
                        <a href="">
                            <img src="images/portrait.jpg"/>
                        </a>
                        <a href="">
                            <img src="images/portrait.jpg"/>
                        </a>
                        <a href="">
                            <img src="images/portrait.jpg"/>
                        </a>
                        <a href="">
                            <img src="images/portrait.jpg"/>
                        </a>
                        <a href="">
                            <img src="images/portrait.jpg"/>
                        </a>
                        <a href="">
                            <img src="images/portrait.jpg"/>
                        </a>
                        <a href="">
                            <img src="images/portrait.jpg"/>
                        </a>
                        <a href="">
                            <img src="images/portrait.jpg"/>
                        </a>
                        <a href="">
                            <img src="images/portrait.jpg"/>
                        </a>
                        <a href="">
                            <img src="images/portrait.jpg"/>
                        </a>
                    </section>
                </article>
                <article class="principalTestimony" data-template="projet:superviseur">
                    <section class="content">
                        <h1>Témoignage du mandant</h1>
                        <section class="left">
                            <img src="../images/logo_ma.svg"/>
                        </section>
                        <section class="right">
                            <h2>Marc Atala Directeur</h2>
                            <p class="quotes">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                            <p class="button">
                                <a href="">La maison d'ailleurs</a>
                            </p>
                        </section>
                    </section>
                </article>
            </div>
            <article class="offerProject">
                <section class="content">
                    <h1>Proposer un projet</h1>
                    <p>Vous souhaitez collaborer avec les étudiants en ingénierie des médias de la HEIG-VD ? Alors rédigez vos voeux en utilisant le bouton “proposer ici”. Après étude par la direction du département COMEM, ceux-ci feront peut-être l’objet d’un prochain projet dans le cadre d’un cours.</p>
                    <p class="button">
                        <a href="">Proposez ici</a>
                    </p>
                </section>
            </article>
            <footer>
                <section class="content">
                    <section class="top">
                        <nav>
                            <ul>
                                <li>
                                    <a href="">Home</a>
                                </li>
                                <li>
                                    <a class="active" href="">Projets</a>
                                </li>
                                <li>
                                    <a href="">Profils</a>
                                </li>
                                <li>
                                    <a href="">Infos</a>
                                </li>
                            </ul>
                        </nav>
                        <p class="copyright">Copyright 2014 - MM40</p>
                    </section>
                    <section class="bottom">
                        <p class="school">
                            <a target="_blank" href="http://www.comem.ch/fr/accueil.aspx">Comem+</a> | <a target="_blank" href="http://www.heig-vd.ch/">Heig-vd</a>
                        </p>
                        <article class="social">
                            <a id="facebook" target="_blank" href="https://www.facebook.com/EB005E"/>
                            <a id="twitter" target="_blank" href="https://twitter.com/eb005e"/>
                            <a id="instagram" target="_blank" href="http://instagram.com/eb005e"/>
                            <a id="linkedin" target="_blank" href="#"/>
                            <a id="youtube" target="_blank" href="#"/>
                        </article>
                    </section>
                </section>
            </footer>
        </section>
    </body>
</html>
};