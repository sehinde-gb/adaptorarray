/// Description
Class Missing.Adaptor Extends %Persistent
{

/// Description
ClassMethod Setup()
{
            set lines=##class(%ArrayOfDataTypes).%New()
            do lines.SetAt("39","1")
            do lines.SetAt("3","2")
            do lines.SetAt("77","3")
            do lines.SetAt("85","4")
            do lines.SetAt("103","5")
            
            for i=1:1:lines.Count() {
                write !, lines.GetAt(i)
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
