xquery version "3.0";

module namespace Functions = "Functions";
declare namespace AA = "http://ns.comem.ch/cours/XML/AdVehicle";
declare namespace l = "local";


declare function Functions:getParams() {
    <l:params>
          <l:id>{request:get-parameter("id", "")}</l:id>
      </l:params>  
};

declare function Functions:Requete($params) {
    let $search :=
            if ($params//l:query != "")
            then "collection('/db/comem/Data/PAAutos')//AA:Ad[contains(lower-case(.), lower-case($params//l:query))]"
            else "collection('/db/comem/Data/PAAutos')//AA:Ad"
        
        let $search :=
            if ($params//l:marque != "")
            then concat($search, "[contains(lower-case(.//AA:Make), lower-case($params//l:marque))]")
            else $search

        let $search :=
            if ($params//l:modele != "")
            then concat($search, "[contains(lower-case(.//AA:Model), lower-case($params//l:modele))]")
            else $search

        let $search :=
            if ($params//l:price-min != "")
            then concat($search, "[number(.//AA:Amount) >= number($params//l:price-min)]")
            else $search
            
        let $search :=
            if ($params//l:price-max != "")
            then concat($search, "[number(.//AA:Amount) <= number($params//l:price-max)]")
            else $search

        let $search :=
            if ($params//l:km-min != "")
            then concat($search, "[number(.//AA:Km) >= number($params//l:km-min)]")
            else $search
            
        let $search :=
            if ($params//l:km-max != "")
            then concat($search, "[number(.//AA:Km) <= number($params//l:km-max)]")
            else $search
        
        let $search :=
            if ($params//l:year-min != "")
            then concat($search, "[number(.//AA:FirstCirculation/@Year) >= number($params//l:year-min)]")
            else $search
        
        let $search :=
            if ($params//l:year-max != "")
            then concat($search, "[number(.//AA:FirstCirculation/@Year) <= number($params//l:year-max)]")
            else $search
            
        let $search :=
            if ($params//l:fuel != "")
            then concat($search, "[contains(lower-case(.//AA:Fuel/@type), lower-case($params//l:fuel))]")
            else $search
        
        return $search
};
