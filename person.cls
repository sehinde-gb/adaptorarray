/// A demo person class
Class Demo.Person Extends (%Persistent, %Library.Populate)
{

Property Name As %String [ Required ];

/// Description
Property Phone As %String;

/// Description
Property Age As %Integer;

ClassMethod Sum(A As %Integer = 0, B As %Integer = 0) As %Integer
{
    set result = A + B
    return result
}

/// Description
Method Print() As %Status
{
    write !, "This person is named ", ..Name,"."
    write !, ..Name, "'s phone number is", ..Phone,""
    write !, ..Name, " is ",..Age, " years old."
}

Parameter PLANET = "EARTH";

/// Description
Storage Default
{
<Data name="PersonDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>PropertyName</Value>
</Value>
<Value name="3">
<Value>Name</Value>
</Value>
<Value name="4">
<Value>Phone</Value>
</Value>
<Value name="5">
<Value>Age</Value>
</Value>
</Data>
<DataLocation>^Demo.PersonD</DataLocation>
<DefaultData>PersonDefaultData</DefaultData>
<Description>
<![CDATA[Description]]></Description>
<IdLocation>^Demo.PersonD</IdLocation>
<IndexLocation>^Demo.PersonI</IndexLocation>
<StreamLocation>^Demo.PersonS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
