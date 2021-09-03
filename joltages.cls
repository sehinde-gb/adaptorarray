/// Class definition to find the maximum differences for the adaptor voltages
Class Missing.Joltages Extends %ArrayOfDataTypes
{

/// Set up the joltages array that will hold the hold the lines that are available for us
ClassMethod SetArray(element, key As %String) As %Status
{
    set joltages=##class(%ArrayOfDataTypes).%New()
        do joltages.SetAt("39","1")
        do joltages.SetAt("3","2")
        do joltages.SetAt("77","3")
        do joltages.SetAt("85","4")
        do joltages.SetAt("103","5")
        
    do ..Verification(.joltages)
}

/// Verify that we have the correct Joltages in the number format
ClassMethod Verification(ByRef joltages As %ArrayOfDataTypes) As %Status
{

    // We iter over the joltages to find out if the numbers are of a valid type and to determine the maximum joltages within the array     
    for i=1:1:5 { 
        write !, "Is valid number? (1 is Yes 0 is No): ",$ISVALIDNUM(joltages.GetAt(i))
        set key = joltages.Find("103","")
        write *32 ,!
        write "key is: ", key ,!
        write "Maximum value is ", joltages.GetAt(5) ,!
        // set up the built in joltage
        set bij = joltages.GetAt(key)+3
        write !, "Joltages",joltages.GetAt(i)
        // work out a variable to store the built in joltage so that we can pass it in to the partOne method
        set joltages(i)=joltages.GetAt(i)
        write "Joltages again= ",joltages(i) ,!
        do joltages.SetAt(bij, "6")
        
    }

    do ..partOne(.joltages,.bij)
}

/// Pass through the joltages and see if the ratings are correct
ClassMethod partOne(ByRef joltages As %ArrayOfDataTypes, ByRef bij As %Integer) As %Status
{
    // set my variables
    set oneJolt= 0
    set threeJolt=0
    set rating = 0
    set count = 1
    set builtInJoltage = bij

    // write out the built in joltage that has been passed in to this method
    write "BIJ: " ,builtInJoltage ,!

    // We pass in the joltages and increase the jolts and the ratings depending on the resulting value
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

    do ..partTwo(.joltages)
}

ClassMethod partTwo(ByRef joltages As %ArrayOfDataTypes) As %Status
{
    write *32 ,!
    write "Part Two:",!
    
    // set the variables that we will use in the subtraction in a future iterator
    set differences1 = 1
	set differences2 = 2
	set differences3 = 3
	set count =1
	         

    // set up an iterator to subtract the differences from the joltage values and then set the new joltages within the array     
	for i=1:1:5 { 
	    write *32 ,!
	    write *10,!
	    set jodif(count) = joltages(count) - differences1
        set jodif(count) = joltages(count) - differences2
        set jodif(count) = joltages(count) - differences3
	    set joltages(count) = joltages(count) + jodif(count)
        
	    write "joltages(count)= ",joltages(count) ,!
        // output the maximum joltage to the screen
        write "maximum joltage= ",joltages(5) ,!
	    
	    set count = $INCREMENT(count)

        
	}
}

Storage Default
{
<Data name="AdaptorDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Phone</Value>
</Value>
<Value name="3">
<Value>Bul</Value>
</Value>
<Value name="4">
<Value>builtInJoltage</Value>
</Value>
</Data>
<DataLocation>^Missing.AdaptorD</DataLocation>
<DefaultData>AdaptorDefaultData</DefaultData>
<IdLocation>^Missing.AdaptorD</IdLocation>
<IndexLocation>^Missing.AdaptorI</IndexLocation>
<StreamLocation>^Missing.AdaptorS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

Storage Custom
{
<Type>%Library.CompleteCustomStorage</Type>
}

}
