/// Description
Class Missing.Adaptor Extends %Persistent
{

/// Description
ClassMethod Setup()
{
           set joltages=##class(%ArrayOfDataTypes).%New()
            do joltages.SetAt("39","1")
            do joltages.SetAt("3","2")
            do joltages.SetAt("77","3")
            do joltages.SetAt("85","4")
            do joltages.SetAt("103","5")
           
            
            
            for i=1:1:joltages.Count() { 
               write !, "Is valid number: ",$ISVALIDNUM(joltages.GetAt(i))
               set key = joltages.Find("103","")
               write *32 ,!
               write "key is: ", key ,!
               set bij = joltages.GetAt(key)+3
               write !, "Joltages",joltages.GetAt(i)
               set joltages(i)=joltages.GetAt(i)
               write "Joltages again= ",joltages(i) ,!
               do joltages.SetAt(bij, "6")
               write !, joltages.GetAt(6)
            }
            
           
            
           	
           	// set my variables
            set oneJolt= 0
            set threeJolt=0
            set rating = 0
            set count = 1
            set builtInJoltage = bij
            write "BIJ: " ,builtInJoltage ,!
            
            if (rating < builtInJoltage) {
            	for i=1:1:5 { 
            		
            		write *32 ,!
            		
            		//write !, i, " = ", joltages.GetAt(i)
            		write *32 ,!
            		
            		if (joltages.GetAt(i) = rating+1) 
            		{
	            		set oneJolt= $INCREMENT(oneJolt)
	            		set rating= $INCREMENT(rating)
	            		set differences(count) = oneJolt * threeJolt
	            		
	            
	            		write "Rating= ",rating ,!
	            		write "oneJolt= ",oneJolt ,!
	            		write "p1 differences= ",differences(count) ,!
	            	}
	            	
	            	if (joltages.GetAt(i) = rating+2)  {
					
						set rating = rating+2
						set differences(count) = oneJolt * threeJolt
						
	            		
						write "p1 differences= ",differences(count) ,!
						write "Rating= ",rating ,!
					}
					
					if (joltages.GetAt(i) = rating+3)  {
						set rating = rating+3
						
	            		set difference(count) = oneJolt * threeJolt
						
						write "Rating= ",rating ,!
						write "p1 differences= ",differences(count) ,!
					}
	            
            		set count = $INCREMENT(count)
            	}
            } else {
	         	write "Error your rating is more than your built in Joltage",!   
            }
            
             write *32 ,!
             write "Part Two:",!
             set differences1 = 1
	         set differences2 = 2
	         set differences3 = 3
	         set count =1
	         
	         
	         for i=1:1:5 { 
	         	write *32 ,!
	         	write *10,!
	         	set different(count) = joltages(count) - differences1
	         	set distinct(count) = joltages(count) + different(count)
	         	write "different(count)= ",different(count)
	         	write *32 ,!
	         	write *10,!
	         	write "distinct(count)= ",distinct(count)
	         	set count = $INCREMENT(count)
	         }
}

Storage Default
{
<Data name="AdaptorDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
</Data>
<DataLocation>^Missing.AdaptorD</DataLocation>
<DefaultData>AdaptorDefaultData</DefaultData>
<IdLocation>^Missing.AdaptorD</IdLocation>
<IndexLocation>^Missing.AdaptorI</IndexLocation>
<StreamLocation>^Missing.AdaptorS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
