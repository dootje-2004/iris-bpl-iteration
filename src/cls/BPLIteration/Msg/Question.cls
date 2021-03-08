Class BPLIteration.Msg.Question Extends (%SerialObject, %XML.Adaptor)
{

Property Subject As %String(MAXLEN = 200);

Property Options As list Of %String;

Storage Default
{
<Data name="QuestionDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Subject</Value>
</Value>
<Value name="3">
<Value>Options</Value>
</Value>
</Data>
<Data name="QuestionState">
<Value name="1">
<Value>Subject</Value>
</Value>
<Value name="2">
<Value>Options</Value>
</Value>
</Data>
<DataLocation>^BPLIteration.Msg.QuestionD</DataLocation>
<DefaultData>QuestionDefaultData</DefaultData>
<IdLocation>^BPLIteration.Msg.QuestionD</IdLocation>
<IndexLocation>^BPLIteration.Msg.QuestionI</IndexLocation>
<State>QuestionState</State>
<StreamLocation>^BPLIteration.Msg.QuestionS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
