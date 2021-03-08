Class BPLIteration.Msg.MultipleQuestionsRequest Extends Ens.Request
{

Property Questions As list Of Question;

Storage Default
{
<Data name="MultipleQuestionsRequestDefaultData">
<Subscript>"MultipleQuestionsRequest"</Subscript>
<Value name="1">
<Value>Questions</Value>
</Value>
</Data>
<DefaultData>MultipleQuestionsRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
