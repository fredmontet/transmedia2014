xquery version "3.0";

declare variable $exist:path external;
declare variable $exist:resource external;
declare variable $exist:controller external;
declare variable $exist:prefix external;
declare variable $exist:root external;



if ($exist:path eq "/") then
    (: forward root path to index.html :)
    <dispatch xmlns="http://exist.sourceforge.net/NS/exist">
        <redirect url="index.html"/>
    </dispatch>
    
    
else if (ends-with($exist:resource, ".html")) then
    (: the html page is run through view.xql to expand templates :)
    <dispatch xmlns="http://exist.sourceforge.net/NS/exist">
        <view>
            <forward url="{$exist:controller}/modules/view.xql">
                <set-attribute name="path" value="{$exist:controller}" />
            </forward>
        </view>
		<error-handler>
			<forward url="{$exist:controller}/error-page.html" method="get"/>
			<forward url="{$exist:controller}/modules/view.xql"/>
		</error-handler>
    </dispatch>
    
else if (contains($exist:path, "/$shared/")) then
    <dispatch xmlns="http://exist.sourceforge.net/NS/exist">
        <forward url="/shared-resources/{substring-after($exist:path, '/$shared/')}">
            <set-header name="Cache-Control" value="max-age=3600, must-revalidate"/>
        </forward>
    </dispatch>
    
else if (contains($exist:path, "/css/")) then
    <dispatch xmlns="http://exist.sourceforge.net/NS/exist">
        <forward url="{$exist:controller}/resources/css/{substring-after($exist:path, '/css/')}">
            <set-header name="Cache-Control" value="max-age=3600, must-revalidate"/>
        </forward>
    </dispatch>
    
else if (contains($exist:path, "/js/")) then
    <dispatch xmlns="http://exist.sourceforge.net/NS/exist">
        <forward url="{$exist:controller}/resources/js/{substring-after($exist:path, '/js/')}">
            <set-header name="Cache-Control" value="max-age=3600, must-revalidate"/>
        </forward>
    </dispatch>
    
else if (contains($exist:path, "/images/")) then
    <dispatch xmlns="http://exist.sourceforge.net/NS/exist">
        <forward url="{$exist:controller}/resources/images/{substring-after($exist:path, '/images/')}">
            <set-header name="Cache-Control" value="max-age=3600, must-revalidate"/>
        </forward>
    </dispatch>


else if ($exist:path eq "/anne.grandjean") then
    (: forward root path to index.html :)
    <dispatch xmlns="http://exist.sourceforge.net/NS/exist">
        <redirect url="profile.html?id=anne-grandjean-mm40"/>
    </dispatch> 

else if ($exist:path eq "/louisa.freymond") then
    (: forward root path to index.html :)
    <dispatch xmlns="http://exist.sourceforge.net/NS/exist">
        <redirect url="profile.html?id=louisa-freymond-mm40"/>
    </dispatch> 

else if ($exist:path eq "/marine.lemonis") then
    (: forward root path to index.html :)
    <dispatch xmlns="http://exist.sourceforge.net/NS/exist">
        <redirect url="profile.html?id=marine-lemonis-mm40"/>
    </dispatch> 

else if ($exist:path eq "/andreane.mercier") then
    (: forward root path to index.html :)
    <dispatch xmlns="http://exist.sourceforge.net/NS/exist">
        <redirect url="profile.html?id=andreane-mercier-mm40"/>
    </dispatch> 

else if ($exist:path eq "/christophe.rast") then
    (: forward root path to index.html :)
    <dispatch xmlns="http://exist.sourceforge.net/NS/exist">
        <redirect url="profile.html?id=christophe-rast-mm40"/>
    </dispatch> 

else if ($exist:path eq "/christophe.merkle") then
    (: forward root path to index.html :)
    <dispatch xmlns="http://exist.sourceforge.net/NS/exist">
        <redirect url="profile.html?id=christophe-merkle-mm40"/>
    </dispatch> 

else if ($exist:path eq "/flavien.knuchel") then
    (: forward root path to index.html :)
    <dispatch xmlns="http://exist.sourceforge.net/NS/exist">
        <redirect url="profile.html?id=flavien-knuchel-mm40"/>
    </dispatch> 

else if ($exist:path eq "/frederic.montet") then
    (: forward root path to index.html :)
    <dispatch xmlns="http://exist.sourceforge.net/NS/exist">
        <redirect url="profile.html?id=frederic-montet-mm40"/>
    </dispatch> 

else if ($exist:path eq "/jerome.clot") then
    (: forward root path to index.html :)
    <dispatch xmlns="http://exist.sourceforge.net/NS/exist">
        <redirect url="profile.html?id=jerome-clot-mm40"/>
    </dispatch> 

else if ($exist:path eq "/jonas.oesch") then
    (: forward root path to index.html :)
    <dispatch xmlns="http://exist.sourceforge.net/NS/exist">
        <redirect url="profile.html?id=jonas-oesch-mm40"/>
    </dispatch> 

else if ($exist:path eq "/louis.alleman") then
    (: forward root path to index.html :)
    <dispatch xmlns="http://exist.sourceforge.net/NS/exist">
        <redirect url="profile.html?id=louis-alleman-mm40"/>
    </dispatch> 

else if ($exist:path eq "/mickael.justo") then
    (: forward root path to index.html :)
    <dispatch xmlns="http://exist.sourceforge.net/NS/exist">
        <redirect url="profile.html?id=mickael-justo-mm40"/>
    </dispatch> 

else if ($exist:path eq "/miranda.martinet") then
    (: forward root path to index.html :)
    <dispatch xmlns="http://exist.sourceforge.net/NS/exist">
        <redirect url="profile.html?id=miranda-martinet-mm40"/>
    </dispatch> 

else if ($exist:path eq "/noemie.sandoz") then
    (: forward root path to index.html :)
    <dispatch xmlns="http://exist.sourceforge.net/NS/exist">
        <redirect url="profile.html?id=noemie-sandoz-mm40"/>
    </dispatch> 

else if ($exist:path eq "/robin.jespierre") then
    (: forward root path to index.html :)
    <dispatch xmlns="http://exist.sourceforge.net/NS/exist">
        <redirect url="profile.html?id=robin-jespierre-mit40"/>
    </dispatch> 

else if ($exist:path eq "/yoan.gern") then
    (: forward root path to index.html :)
    <dispatch xmlns="http://exist.sourceforge.net/NS/exist">
        <redirect url="profile.html?id=yoan-gern-mm40"/>
    </dispatch> 





else
    (: everything else is passed through :)
    <dispatch xmlns="http://exist.sourceforge.net/NS/exist">
        <cache-control cache="yes"/>
    </dispatch>
