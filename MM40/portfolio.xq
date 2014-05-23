xquery version "3.0" encoding "UTF-8";
declare namespace TM = "http://ns.comem.ch/cours/TM";
declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare namespace request = "http://exist-db.org/xquery/request";
declare namespace fo="http://www.w3.org/1999/XSL/Format";
declare namespace xslfo="http://exist-db.org/xquery/xslfo";
declare namespace xsl="http://www.w3.org/1999/XSL/Transform";

let $id := request:get-parameter("id", "")
let $p := collection("/db/apps/MM40/data/profile")/TM:profile[contains(@id, $id)]
let $servRoot := "http://tifelek02.heig-vd.ch:8080/exist/apps/MM40/"
let $fo :=  <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">

     <fo:layout-master-set>
		<fo:simple-page-master master-name="coverPage" page-width="21cm" page-height="29.7cm">
			<fo:region-body background-color="white" margin-right="1cm" margin-left="1cm" margin-top="1cm" font-family="calibri"/>
		</fo:simple-page-master>
		
		<fo:simple-page-master master-name="resumePage" page-width="21cm" page-height="29.7cm">
			<fo:region-body background-color="white" margin-right="1cm" margin-left="1cm" margin-top="1cm" font-family="calibri"/>
		</fo:simple-page-master>

		<fo:simple-page-master master-name="projectPage" page-width="21cm" page-height="29.7cm" margin="1cm">
			<fo:region-body/>
		</fo:simple-page-master>
	</fo:layout-master-set>
	
	<fo:page-sequence master-reference="coverPage">
		<fo:flow flow-name="xsl-region-body">
			<fo:block background-image="http://www.olfraime.com/testTrans/backgroundCover_portfolio.svg" background-repeat="no-repeat">
				<fo:block text-align="left" font-size="51pt" margin-top="3cm" color="rgb(0,0,0)">{$p/TM:prenom/text()}</fo:block>
				<fo:block text-align="left" font-size="51pt" color="rgb(0,0,0)">{$p/TM:nom/text()}</fo:block>
				<fo:block text-align="center" margin-top="1.6cm" margin-left="0.45cm">
					<fo:external-graphic  src="{concat($servRoot,$p//TM:photo[@genre eq "avatar"]/@url)}" content-height="scale-to-fit" height="7.5cm"  content-width="7.5cm" scaling="uniform"/>
				</fo:block>
				<fo:block background-color="white" text-align="center" margin-top="2.5cm" font-size="23pt" color="rgb(0,0,0)">Ingénieur en Gestion des Médias</fo:block>
				<fo:block text-align="left" margin-left="12.0cm" margin-top="7.5cm" font-size="12pt" color="rgb(0,0,0)">
					<fo:basic-link external-destination="url('{concat($servRoot,"profile.html?id=",$p/@id)}')">{concat($servRoot,$p/TM:prenom,".",$p/TM:nom)}</fo:basic-link>
				</fo:block>
			</fo:block>
		</fo:flow>
	</fo:page-sequence>


	<fo:page-sequence master-reference="resumePage">
		<fo:flow flow-name="xsl-region-body">
			<fo:block>
				<fo:block text-align="left">
						{if ($p//TM:photo[@genre eq "portfolio"]) 
						then <fo:external-graphic  src="{concat($servRoot,$p//TM:photo[@genre eq "portfolio"]/@url)}" content-height="scale-to-fit" height="13.4cm"  content-width="13.4cm" scaling="uniform"/>
						else ()
						}
				</fo:block>
				<fo:block text-align="left" font-size="35pt" margin-top="0.5cm" color="rgb(0,0,0)">{concat($p/TM:prenom/text(), " ", $p/TM:nom/text())}</fo:block>
				<fo:block text-align="left" font-size="14pt" color="rgb(0,0,0)">« {$p/TM:usp/text()} »</fo:block>
				<fo:block text-align="justify" font-size="12pt" margin-top="0.5cm" color="rgb(0,0,0)">
				{for $para in $p//TM:p
				return $para/text()}
				</fo:block>
				<fo:block text-align="left" font-size="12pt" margin-top="2cm" color="rgb(0,0,0)">
					<fo:basic-link external-destination="url('mailto:{$p/@mail_print}')">{data($p/@mail_print)}</fo:basic-link>
					<fo:list-block margin-top="0.5cm">
						<fo:list-item>
						  <fo:list-item-label>
							<fo:block></fo:block>
						  </fo:list-item-label>
						  <fo:list-item-body>
						  {
						  for $lien in $p/TM:liens/TM:lien
						  return
						  if ($lien[@genre eq "mail"]) then ()
						  else (
						  <fo:block>
							  <fo:basic-link external-destination="url('{$lien/@url}')">
								  {concat($lien/text(),": ",$lien/@url)}
							  </fo:basic-link>
						  </fo:block>
						  )
							}
						  </fo:list-item-body>
						</fo:list-item>
					</fo:list-block>
				</fo:block>
			</fo:block>
		</fo:flow>
	</fo:page-sequence>
	{for $proj in $p/TM:projets/TM:projet
	let $projet:=collection("/db/apps/MM40/data/projets")/TM:projet[contains(@id, $proj/@id)]
	return
	<fo:page-sequence master-reference="projectPage">
		<fo:flow flow-name="xsl-region-body">
			<fo:block>
				<fo:block text-align="center" margin-bottom="0.5cm">
					<fo:external-graphic  src="{concat($servRoot,$projet/TM:image/@url)}"   width="15.075cm"  scaling="non-uniform"/>
				</fo:block>
				<fo:block font-size="35pt" color="rgb(0,0,0)">{$projet/TM:nom/text()}</fo:block>
					{for $paragraph in $projet/TM:description/TM:p
					return
					<fo:block text-align="justify" font-size="12pt" margin-top="0.5cm" color="rgb(0,0,0)">{$paragraph/text()}</fo:block>
				}
				<fo:block text-align="left" margin-top="1cm" font-size="10pt" color="rgb(0,0,0)">
					<fo:basic-link external-destination="url('{$projet/@url}')">{data($projet/@url)}</fo:basic-link>
				</fo:block>
			</fo:block>
			
				{for $dom in $p/TM:domaine
				let $rose:= concat($servRoot,"images/niveauRose.svg")
				let $gris:= concat($servRoot,"images/niveauGris.svg")
				let $numRose:=$dom/@poids
				let $numGris:=5-$numRose
				return
			<fo:table margin-top="0.7cm">
				<fo:table-body>
					<fo:table-row height="0.4cm">
						<fo:table-cell width="6.5cm">
							<fo:block text-align="left" font-size="18pt" color="rgb(0,0,0)" margin-bottom="0.5cm">
								{data($dom/@nom)}
							</fo:block>
						</fo:table-cell>
						{for $i in (1 to $numRose)
						return 
						<fo:table-cell width="2.8cm">
							<fo:block text-align="left">
								<fo:external-graphic  src="{$rose}"   width="0.4cm"  scaling="uniform"/>
							</fo:block>
						</fo:table-cell>
						}
						
						{for $i in (1 to $numGris)
						return 
						<fo:table-cell width="2.8cm">
							<fo:block text-align="left">
								<fo:external-graphic  src="{$gris}"   width="0.4cm"  scaling="uniform"/>
							</fo:block>
						</fo:table-cell>
						}
					</fo:table-row>
				</fo:table-body>
			</fo:table>
	}
		</fo:flow>
	</fo:page-sequence>

	}
</fo:root>


let $pdf := xslfo:render($fo, "application/pdf", ())
(:return $fo:)
return response:stream-binary($pdf, "application/pdf", concat("portofolio_",$id,".pdf"))
