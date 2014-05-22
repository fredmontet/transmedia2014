xquery version "3.0";
declare namespace TM = "http://ns.comem.ch/cours/TM";
declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare namespace request = "http://exist-db.org/xquery/request";
declare namespace fo="http://www.w3.org/1999/XSL/Format";
declare namespace xslfo="http://exist-db.org/xquery/xslfo";

let $id := request:get-parameter("id", "")
let $p := collection("/db/apps/MM40/data/profile")/TM:profile[contains(@id, $id)]
let $fo := 
<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">

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
					<fo:external-graphic  src="{$p//TM:photo[@genre eq "avatar"]}" content-height="scale-to-fit" height="7.5cm"  content-width="7.5cm" scaling="uniform"/>
				</fo:block>
				<fo:block background-color="white" text-align="center" margin-top="2.5cm" font-size="23pt" color="rgb(0,0,0)">Ing�nieur en Gestion des M�dias</fo:block>
				<fo:block text-align="left" margin-left="12.7cm" margin-top="7.5cm" font-size="12pt" color="rgb(0,0,0)">
					<fo:basic-link external-destination="url('http://mm40.comem.ch/{$p/@id}')">http://mm40.comem.ch/{$p/@id}</fo:basic-link>
				</fo:block>
			</fo:block>
		</fo:flow>
	</fo:page-sequence>
	

	<fo:page-sequence master-reference="resumePage">
		<fo:flow flow-name="xsl-region-body">
			<fo:block>
				<fo:block text-align="left">
				{ if ($p//TM:photo[@genre eq "portfolio"]) 
				then
					<fo:external-graphic  src="{$p//TM:photo[@genre eq "portfolio"]}" content-height="scale-to-fit" height="13.4cm"  content-width="13.4cm" scaling="uniform"/>
					}
				</fo:block>
				<fo:block text-align="left" font-size="35pt" margin-top="0.5cm" color="rgb(0,0,0)">{concat($p/TM:prenom/text(), " ", $p/TM:nom/text())}</fo:block>
				<fo:block text-align="left" font-size="14pt" color="rgb(0,0,0)">��{$p/TM:usp/text()}��</fo:block>
				<fo:block text-align="justify" font-size="12pt" margin-top="0.5cm" color="rgb(0,0,0)">
				{for $para in $p//TM:p
				return
				$para/text()
				
				}
				</fo:block>
				<fo:block text-align="left" font-size="12pt" margin-top="2cm" color="rgb(0,0,0)">
					<fo:basic-link external-destination="url('mailto:{$p/@mail_print}')">{$p/@mail_print}</fo:basic-link>
					<fo:list-block margin-top="0.5cm">
						<fo:list-item>
						  <fo:list-item-label>
							<fo:block></fo:block>
						  </fo:list-item-label>
						  <fo:list-item-body>
							<fo:block><fo:basic-link external-destination="url('http://www.moimeme.com/')">http://www.moimeme.com</fo:basic-link></fo:block>
						  </fo:list-item-body>
						</fo:list-item>
					</fo:list-block>
				</fo:block>
			</fo:block>
		</fo:flow>
	</fo:page-sequence>
	{for $projet in 
	<fo:page-sequence master-reference="projectPage">
		<fo:flow flow-name="xsl-region-body">
			<fo:block>
				<fo:block text-align="center" margin-bottom="0.5cm">
					<fo:external-graphic  src="http://www.olfraime.com/testTrans/projet.jpg"   width="15.075cm"  scaling="non-uniform"/>
				</fo:block>
				<fo:table>
					<fo:table-body>
						<fo:table-row width="auto">
							<fo:table-cell>
								<fo:block font-size="35pt" color="rgb(0,0,0)">Titre principal</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block font-size="28pt"  padding-top="0.2cm" color="rgb(0,0,0)">Sous-Titre</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
					</fo:table>
					<fo:block text-align="justify" font-size="12pt" margin-top="0.5cm" color="rgb(0,0,0)">
				Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ac elit eros. Phasellus a imperdiet magna, eu gravida dolor. Nulla ultrices ornare massa vitae rutrum. Etiam nisi erat, consectetur id ornare nec, imperdiet vel purus. Donec sed semper dolor. Donec at porttitor mi. Etiam gravida, turpis eget tristique commodo, mauris nisi accumsan est, id mollis sem lorem non dolor. Aenean pulvinar nibh eu viverra pharetra. Donec eu orci lectus. Integer iaculis ullamcorper nunc a sagittis. Vestibulum ornare purus non est congue vestibulum. Duis vel consequat tellus.
				</fo:block>
				<fo:block text-align="left" margin-top="1cm" font-size="10pt" color="rgb(0,0,0)">
					<fo:basic-link external-destination="url('http://unprojet.com')">http://unprojet.com</fo:basic-link>
				</fo:block>
			</fo:block>
				
			<fo:table margin-top="0.7cm">
				<fo:table-body>
					<fo:table-row height="0.4cm">
						<fo:table-cell width="6.5cm">
							<fo:block text-align="left" font-size="18pt" color="rgb(0,0,0)" margin-bottom="0.5cm">
								VIDEO
							</fo:block>
						</fo:table-cell>
						<fo:table-cell width="2.8cm">
							<fo:block text-align="left">
								<fo:external-graphic  src="http://www.olfraime.com/testTrans/niveauRose.svg"   width="0.4cm"  scaling="uniform"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell width="2.8cm">
							<fo:block text-align="left">
								<fo:external-graphic  src="http://www.olfraime.com/testTrans/niveauRose.svg"   width="0.4cm"  scaling="uniform"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell width="2.8cm">
							<fo:block text-align="left">
								<fo:external-graphic  src="http://www.olfraime.com/testTrans/niveauRose.svg"   width="0.4cm"  scaling="uniform"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell width="2.8cm">
							<fo:block text-align="left">
								<fo:external-graphic  src="http://www.olfraime.com/testTrans/niveauRose.svg"   width="0.4cm"  scaling="uniform"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell width="2.8cm">
							<fo:block text-align="left">
								<fo:external-graphic  src="http://www.olfraime.com/testTrans/niveauRose.svg"   width="0.4cm"  scaling="uniform"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row height="0.4cm">
						<fo:table-cell width="6.5cm">
							<fo:block text-align="left" font-size="18pt" color="rgb(0,0,0)" margin-bottom="0.5cm">
								AUDIO
							</fo:block>
						</fo:table-cell>
						<fo:table-cell width="2.8cm">
							<fo:block text-align="left">
								<fo:external-graphic  src="http://www.olfraime.com/testTrans/niveauRose.svg"   width="0.4cm"  scaling="uniform"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell width="2.8cm">
							<fo:block text-align="left">
								<fo:external-graphic  src="http://www.olfraime.com/testTrans/niveauRose.svg"   width="0.4cm"  scaling="uniform"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell width="2.8cm">
							<fo:block text-align="left">
								<fo:external-graphic  src="http://www.olfraime.com/testTrans/niveauRose.svg"   width="0.4cm"  scaling="uniform"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell width="2.8cm">
							<fo:block text-align="left">
								<fo:external-graphic  src="http://www.olfraime.com/testTrans/niveauRose.svg"   width="0.4cm"  scaling="uniform"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell width="2.8cm">
							<fo:block text-align="left">
								<fo:external-graphic  src="http://www.olfraime.com/testTrans/niveauRose.svg"   width="0.4cm"  scaling="uniform"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row height="0.4cm">
						<fo:table-cell width="6.5cm">
							<fo:block text-align="left" font-size="18pt" color="rgb(0,0,0)">
								WEB
							</fo:block>
						</fo:table-cell>
						<fo:table-cell width="2.8cm">
							<fo:block text-align="left" margin-bottom="0.5cm">
								<fo:external-graphic  src="http://www.olfraime.com/testTrans/niveauRose.svg"   width="0.4cm"  scaling="uniform"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell width="2.8cm">
							<fo:block text-align="left" margin-bottom="0.5cm">
								<fo:external-graphic  src="http://www.olfraime.com/testTrans/niveauRose.svg"   width="0.4cm"  scaling="uniform"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell width="2.8cm">
							<fo:block text-align="left" margin-bottom="0.5cm">
								<fo:external-graphic  src="http://www.olfraime.com/testTrans/niveauRose.svg"   width="0.4cm"  scaling="uniform"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell width="2.8cm">
							<fo:block text-align="left" margin-bottom="0.5cm">
								<fo:external-graphic  src="http://www.olfraime.com/testTrans/niveauRose.svg"   width="0.4cm"  scaling="uniform"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell width="2.8cm">
							<fo:block text-align="left" margin-bottom="0.5cm">
								<fo:external-graphic  src="http://www.olfraime.com/testTrans/niveauRose.svg"   width="0.4cm"  scaling="uniform"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row height="0.4cm">
						<fo:table-cell width="6.5cm">
							<fo:block text-align="left" font-size="18pt" color="rgb(0,0,0)">
								PRINT
							</fo:block>
						</fo:table-cell>
						<fo:table-cell width="2.8cm">
							<fo:block text-align="left" margin-bottom="0.5cm">
								<fo:external-graphic  src="http://www.olfraime.com/testTrans/niveauRose.svg"   width="0.4cm"  scaling="uniform"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell width="2.8cm">
							<fo:block text-align="left" margin-bottom="0.5cm">
								<fo:external-graphic  src="http://www.olfraime.com/testTrans/niveauRose.svg"   width="0.4cm"  scaling="uniform"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell width="2.8cm">
							<fo:block text-align="left" margin-bottom="0.5cm">
								<fo:external-graphic  src="http://www.olfraime.com/testTrans/niveauRose.svg"   width="0.4cm"  scaling="uniform"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell width="2.8cm">
							<fo:block text-align="left" margin-bottom="0.5cm">
								<fo:external-graphic  src="http://www.olfraime.com/testTrans/niveauRose.svg"   width="0.4cm"  scaling="uniform"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell width="2.8cm">
							<fo:block text-align="left" margin-bottom="0.5cm">
								<fo:external-graphic  src="http://www.olfraime.com/testTrans/niveauRose.svg"   width="0.4cm"  scaling="uniform"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
			
			
			
		</fo:flow>
	</fo:page-sequence>
</fo:root>

let $pdf := xslfo:render($fo, "application/pdf", ())
 
return response:stream-binary($pdf, "application/pdf", "output.pdf")